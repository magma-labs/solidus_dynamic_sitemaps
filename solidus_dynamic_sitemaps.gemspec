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

  s.add_dependency 'solidus', ['>= 2.0', '< 3']
  s.add_dependency 'solidus_support'

  s.add_runtime_dependency 'sitemap_generator'

  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'poltergeist'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'solidus_dev_support'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
