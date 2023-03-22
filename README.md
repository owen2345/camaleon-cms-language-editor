# Camaleon CMS - Translations Editor
This is a Camaleon CMS plugin which permit to verify, overwrite and complete missing translations. Also it is used to create another clean language.
![Alt text](screenshot.png?raw=true)

## Installation
* Add to your gemfile
    ```
    gem 'cama_language_editor'
    ```
  * _Note:_ you can add this gem to the development group, if you don't need it in production and test groups:
    ```
    gem 'cama_language_editor', groups: [:development]
    ```
* bundle install
* If the main app is using Sprockets 4.x, add these to lines either to the main manifest.js file,
    ```
    # config/manifest.js
    
    //= link plugins/cama_language_editor/admin.css
    //= link plugins/cama_language_editor/admin.js
    
    ```
  * If you specified in the Gemfile the gem to be added only to `development` group, you have to create a separate
   manifest file:
    ```
    # config/manifest_dev.js
    
    //= link plugins/cama_language_editor/admin.css
    //= link plugins/cama_language_editor/admin.js    
    
    ```
    and add it to the assets initializer to be precompiled only in the `development` environment:
    ```
    Rails.application.config.assets.precompile += %w( manifest_dev.js ) if Rails.env.development?

    ```
* Restart server
* Active the plugin on admin -> Plugins -> Cama Language Editor

## How to Use
* Go to "Access to Editor" on plugin links
* Select the languages which you want to compare
* The prefix field permit to filter translations by prefix, like: camaleon_cms, camaleon_cms:admin, plugins:ecommerce
* Submit by clicking on "Load translations"
* Edit your changes and click on "Copy Mode"
* Copy and paste the text in your custom locale: config/locales/my_locale.yml

Note: If you want to add a new language, follow these additional steps:
http://camaleon.tuzitio.com/documentation/category/40757-developer-docs/how-to-add-new-admin-language.html
