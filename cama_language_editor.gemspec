$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cama_language_editor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cama_language_editor"
  s.version     = CamaLanguageEditor::VERSION
  s.authors     = ["Owen Peredo"]
  s.email       = ["owenperedo@gmail.com"]
  s.homepage    = ""
  s.summary     = "This plugin permit to verify and complete missing translations. Also it is used to create another clean language."
  s.description = "This plugin permit to verify and complete missing translations. Also it is used to create another clean language."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_development_dependency "sqlite3"
end
