$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'hid_ui/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'hid_ui'
  spec.version     = HidUi::VERSION
  spec.authors     = ['Benjamin Cavileer']
  spec.email       = ['bcavileer@holmanauto.com']
  spec.homepage    = ''
  spec.summary     = 'Summary of HidUi.'
  spec.description = 'Description of HidUi.'

  spec.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']

  spec.add_dependency 'rails', '~> 3.2.21'
  spec.add_dependency 'hid_core'

  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec-rails'
end
