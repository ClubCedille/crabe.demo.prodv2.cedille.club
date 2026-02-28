#!/bin/sh
mkdir -p /var/www/html/user/plugins
mkdir -p /var/www/html/user/themes
mkdir -p /var/www/html/user/accounts
mkdir -p /var/www/html/user/config
mkdir -p /var/www/html/user/data

# clone repo content
if [ -n "$CONTENT_REPO" ] && [ ! -d "/var/www/html/user/pages" ]; then
  echo "Downloading content from: $CONTENT_REPO"
  git clone "$CONTENT_REPO" /tmp/content
  # Copy only the content we need
  cp -r /tmp/content/pages /var/www/html/user/ 2>/dev/null || true
  cp -r /tmp/content/plugins/* /var/www/html/user/plugins/ 2>/dev/null || true  
  cp -r /tmp/content/themes/* /var/www/html/user/themes/ 2>/dev/null || true
  cp -r /tmp/content/config/* /var/www/html/user/config/ 2>/dev/null || true
  rm -rf /tmp/content
  echo "Content downloaded successfully"
fi

  # Create admin user
if [ ! -f "/var/www/html/user/accounts/admin.yaml" ]; then
  echo "Creating local admin user..."
  cat <<EOL > /var/www/html/user/accounts/admin.yaml
state: enabled
email: admin@localhost
username: admin
fullname: Local Admin
title: Administrator
access:
  admin:
    login: true
    super: true
  site:
    login: true
password: "admin123"
EOL

echo "Local admin user created (admin/admin123)"
fi

chown -R www-data:www-data /var/www/html/user
chmod -R 777 /var/www/html/user

# Clear Grav cache
cd /var/www/html/
bin/grav cache
echo "Local development ready."

apache2-foreground