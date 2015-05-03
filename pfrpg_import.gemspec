$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pfrpg_import/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pfrpg_import"
  s.version     = PfrpgImport::VERSION
  s.authors     = ["Jordan OMara"]
  s.email       = ["jordan@herosheets.com"]
  s.homepage    = "http://herosheets.com"
  s.summary     = "PFRPG Importer"
  s.description = "Import pfrpg modules suitable for herosheets"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.7"
end
