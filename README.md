# Camaleon CMS - Translations Editor
This is a Camaleon CMS plugin which permit to verify and complete missing translations. Also it is used to create another clean language.
![Alt text](/screenshot.png?raw=true)

## Installation
* Add to your gemfile
```
gem 'cama_language_editor'
```
* bunble install
* Restart server
* Active the plugin on admin -> Plugins -> Cama Language Editor

## How to Use
* Go to "Access to Editor" on plugin links
* Select two (left and right) languages which compare
* The prefix field permit to filter translations by prefix, like: camaleon_cms, camaleon_cms:admin, plugins:ecommerce
* Submit by clicking on "Load translations"
* Edit your changes and click on "Copy Mode"
* Copy and paste the text in your custom locale: config/locales/my_locale.yml

Note: If you want to add a new language, follow this steps:
http://camaleon.tuzitio.com/documentation/category/40757-developer-docs/how-to-add-new-admin-language.html