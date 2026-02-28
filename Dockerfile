FROM php:8.3.20-apache-bullseye



# Enable Apache Rewrite + Expires Module
RUN a2enmod rewrite expires && \
    sed -i 's/ServerTokens OS/ServerTokens ProductOnly/g' \
    /etc/apache2/conf-available/security.conf

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    unzip \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libyaml-dev \
    libzip4 \
    libzip-dev \
    zlib1g-dev \
    libicu-dev \
    g++ \
    git \
    cron \
    vim \
    wget \
    rsync \
    && docker-php-ext-install opcache \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
    echo 'opcache.enable=0'; \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=2'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
    echo 'upload_max_filesize=128M'; \
    echo 'post_max_size=128M'; \
    echo 'expose_php=off'; \
    echo 'memory_limit=2048M'; \
    } > /usr/local/etc/php/conf.d/php-recommended.ini

RUN pecl channel-update pecl.php.net

RUN pecl install apcu \
    && pecl install yaml \
    && docker-php-ext-enable apcu yaml

# Set ServerName to localhost to avoid FQDN warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
# Apache default port should match the exposed port in docker-compose
RUN echo "Listen 80" > /etc/apache2/ports.conf


ARG GRAV_VERSION=1.7.45

ARG GRAV_SKELETON_URL=https://github.com/getgrav/grav/releases/download/$GRAV_VERSION/grav-admin-v$GRAV_VERSION.zip
ARG GRAV_SKELETON_FOLDER=grav-admin
# Example alternative skeletons:
# https://github.com/getgrav/grav-skeleton-deliver-site/releases/download/1.2.1/grav-skeleton-deliver-site+admin-1.2.1.zip
# When using alternative skeletons, also set the folder name:
# For Deliver: ARG GRAV_SKELETON_FOLDER=grav-skeleton-deliver-site+admin

RUN chown www-data:www-data /var/www

RUN mkdir -p /test && echo 'enabled: false' > /test/git-sync.yaml

# Set ownership and permissions
RUN chown www-data:www-data /test/git-sync.yaml
# Set user to www-data
USER www-data

# Init operations
RUN cd /var/www/html/ && \
    wget $GRAV_SKELETON_URL -O skeleton.zip && \
    unzip skeleton.zip && \
    mv $GRAV_SKELETON_FOLDER/* . && mv $GRAV_SKELETON_FOLDER/.* . 2>/dev/null; true && \
    mkdir -p /var/www/html/user/themes

# Copy init scripts with appropriate permissions
USER root
COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh



ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]