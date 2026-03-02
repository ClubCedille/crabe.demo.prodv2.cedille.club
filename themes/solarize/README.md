# Solarize Theme

The **Solarize** Theme is for [Grav CMS](http://github.com/getgrav/grav). It's a port of [Solarize](https://templated.co/solarize) by Templated under its [CCA 3.0 license](https://templated.co/license).

The Grav port includes an additional [Elements page](_demo/pages/90.elements/default.md) as per many Templated themes, to allow you to identify gaps in the theme's styling. There are a few.

![Solarize](screenshot.jpg)

# Installation

Installing the Solarize theme can be done in one of two ways. Our GPM (Grav Package Manager) installation method enables you to quickly and easily install the theme with a simple terminal command, while the manual method enables you to do so via a zip file.

## GPM Installation (Preferred)

The simplest way to install this theme is via the [Grav Package Manager (GPM)](http://learn.getgrav.org/advanced/grav-gpm) through your system's Terminal (also called the command line).  From the root of your Grav install type:

    bin/gpm install solarize

This will install the Solarize theme into your `/user/themes` directory within Grav. Its files can be found under `/your/site/grav/user/themes/solarize`.

>> This method will copy the sample pages provided in the `_demo/pages` folder to your `user/pages` folder so that the theme will work out of the box with placeholder content. The content is the same _Ipsum lorem_ content provided in the original [Templated theme](https://templated.co/solarize).

## Manual Installation

To install this theme, just download the zip version of this repository and unzip it under `/your/site/grav/user/themes`. Then, rename the folder to `solarize`. You can find these files either on [GitHub](https://github.com/hughbris/grav-theme-solarize) or via [GetGrav.org](http://getgrav.org/downloads/themes).

You should now have all the theme files under

    /your/site/grav/user/themes/solarize

>> NOTE: If you want to use and adapt the default _Ipsum lorem_ content provided with the original theme, move the contents of `_demo/pages` into your grav installations's `user/pages` directory. This will ensure that the theme templates work out of the box.

# Updating

As development for the Solarize theme continues, new versions may become available that add additional features and functionality, improve compatibility with newer Grav releases, and generally provide a better user experience. Updating Solarize is easy, and can be done through Grav's GPM system, as well as manually.

## GPM Update (Preferred)

The simplest way to update this theme is via the [Grav Package Manager (GPM)](http://learn.getgrav.org/advanced/grav-gpm). You can do this with this by navigating to the root directory of your Grav install using your system's Terminal (also called command line) and typing the following:

    bin/gpm update solarize

This command will check your Grav install to see if your Solarize theme is due for an update. If a newer release is found, you will be asked whether or not you wish to update. To continue, type `y` and hit enter. The theme will automatically update and clear Grav's cache.

## Manual Update

Manually updating Solarize is pretty simple. Here is what you will need to do to get this done:

* Delete the `your/site/user/themes/solarize` directory.
* Download the new version of the Solarize theme from either [GitHub](https://github.com/hughbris/grav-plugin-solarize) or [GetGrav.org](http://getgrav.org/downloads/themes#extras).
* Unzip the zip file in `your/site/user/themes` and rename the resulting folder to `solarize`.
* Clear the Grav cache. The simplest way to do this is by going to the root Grav directory in terminal and typing `bin/grav clear-cache`.

> Note: Any changes you have made to any of the files listed under this directory will also be removed and replaced by the new set. Any files located elsewhere (for example a YAML settings file placed in `user/config/themes`) will remain intact.

### Supported Page Templates

* [Sample homepage view template](templates/home.html.twig)
* [Left sidebar two-column template](templates/left-sidebar.html.twig)
* [Right sidebar two-column template](templates/right-sidebar.html.twig)
* [Single column template](templates/default.html.twig)

## Deferred assets block support

[Deferred blocks were introduced in Grav 1.5.10](https://getgrav.org/blog/important-theme-updates) and **are now impemented in this theme**.
# Configuring

## Custom styles

The theme is bundled with an empty CSS file at `css/custom.css`. As the name suggests, this is where you can add any additional styles for your implementation of the theme. If your site uses a theme that inherits Landed, you can add this file and your customisations at the same relative location in your own theme.

## Menu Features

### Dropdown Menu

You can enable **dropdown menu** support by enabling it in the `solarize.yaml` configuration file. As per usual, copy this file to your `user/config/themes/` folder (create if required) and edit there.

```yaml
dropdown:
  enabled: true
```

This will ensure that sub-pages show up as sub-menus in the navigation.

### Menu Text & Icons

Each page shows up in the menu using the title by default, however you can set what displays in the menu directly by setting an explicit `menu:` option in the page header:

```yaml
menu: My Menu
```

You can also provide an icon to show up in front of the menu item by providing an `icon:` option.  You need to use name of the FontAwesome icon without the `fa-` prefix.  Check out the full [list of current FontAwesome 4.2 icons](http://fortawesome.github.io/Font-Awesome/icons/):

```yaml
icon: bar-chart-o
```

#### Custom Menu Items

By default, Grav generates the menu from the page structure.  However, there are times when you may want to add custom menu items to the end of the menu.  This is now supported in Solarize by creating a menu list in your `site.yaml` file.  An example of this is as follows:

```yaml
menu:
    - text: Source
      url: https://github.com/getgrav/grav
    - icon: twitter
      url: http://twitter.com/getgrav
```

The `url:` option is required, but you can provide **either** or **both** `text:` and/or `icon:`

## Source theme conformance

Thanks to some weird workarounds that hopefully don't bring me technical debt (sorry future self!), and not wanting to break any existing implementations, I've added a conformance frontmatter property to contain settings for potentially anything that might be a departure from the source HTML5UP theme.

```yaml
# theme elements that should match the source theme rather than an improved one offered in this Grav theme
conformance:
    jquery: true # note that setting this to false produces a JS console error: refer https://github.com/hughbris/grav-theme-solarize/issues/15
```

### jQuery library

The theme is bundled with a [minified jQuery source file](https://github.com/hughbris/grav-theme-solarize/blob/develop/js/jquery.min.js), which is out of date but works, and which you may prefer to use instead of the [much later version still bundled as an asset group by Grav core](https://github.com/getgrav/grav/blob/afb5b02e5750f0f9c0bcc73de5d3f62947881722/system/config/system.yaml#L139).

> For the moment your site will keep working as it has been if you don't change any settings. This might change BTW, slowly slowly.

There have been some dependabot alerts about the old jQuery bundled with the source theme and with this Grav theme. I am not an expert and have not looked closely, but I _suspect_ this theme is _not vulnerable_ to these exploits. _This is not advice. Also not an invitation to anyone with nefarious intent._

> **You will see a Javascript error in your browser console if you set this option `false`** unless you create a custom Twig block or template: see **[Updating jQuery throws JS errors](https://github.com/hughbris/grav-theme-solarize/issues/15)**.

If you know how to work around this error (please contribute your solution!), this theme provides **two options** to load whatever you like for your jQuery. The jQuery asset can be added:

* in a partial template at `templates/partials/asset-jquery.html.twig` that _you can easily override in a custom theme_;
* within a Twig block called `jquery` that _you can extend inside another template_.

## Setup

If you want to set Solarize as the default theme, you can do so by following these steps:

* Navigate to `/your/site/grav/user/config`.
* Open the **system.yaml** file.
* Change the `theme:` setting to `theme: solarize`.
* Save your changes.
* Clear the Grav cache. The simplest way to do this is by going to the root Grav directory in Terminal and typing `bin/grav clear-cache`.

Once this is done, you should be able to see the new theme on the frontend. Keep in mind any customizations made to the previous theme will not be reflected as all of the theme and templating information is now being pulled from the **solarize** folder.

# Examples in the wild

* [Official demo](https://behold.metamotive.co.nz/solarize)

There's only one contrived one now :(

Please let me know if you want yours included (hey, it's free publicity).

## See also

* [Oxygen theme for Grav](https://kittyfishfrommars.github.io/grav/grav-theme-oxygen/) by [kittyfishfrommars](https://github.com/kittyfishfrommars) is based on this theme and arguably much better :)

# Credits and Licensing

* Header image by [Jonas Wimmerström](https://cupcake.nilssonlee.se/) under the [Creative Commons CC0 1.0 Universal License](https://creativecommons.org/publicdomain/zero/1.0/). Also, thanks to [@kittyfishfrommars](https://github.com/kittyfishfrommars) for the research tracking this down.
* Source template [Solarize](https://templated.co/solarize) by Templated uses [CCA 3.0 license](https://templated.co/license).
* The underlying source code used here to port the theme to Grav CMS is licensed under the [MIT license](LICENSE).
