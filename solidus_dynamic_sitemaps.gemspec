# encoding: UTF-8

$:.push File.expand_path('../lib', __FILE__)
require 'solidus_dynamic_sitemaps/version'

Gem::Specification.new do |s|
  s.name        = 'solidus_dynamic_sitemaps'
  s.version     = SolidusDynamicSitemaps::VERSION
  s.author      = 'Jonathan Tapia'
  s.email       = 'jonathan.tapia@magmalabs.io'
  s.homepage    = 'https://github.com/magma-labs/solidus_dynamic_sitemaps'
  s.summary     = 'Solidus Engine for sitemaps'
  s.description = 'Solidus Engine for sitemaps'

  s.files = Dir['{app,config,models,db,lib}/**/*'] + %w(MIT-LICENSE Rakefile README.md)

  solidus_version = ['>= 1.2.0', '< 3']
  s.add_dependency 'solidus_core', solidus_version
  s.add_dependency 'solidus_support'

  s.add_runtime_dependency 'sitemap_generator'

  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rubocop', '~> 0.49.0'
  s.add_development_dependency 'rubocop-rspec', '1.4.0'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3', '~> 1.3.6'
end
