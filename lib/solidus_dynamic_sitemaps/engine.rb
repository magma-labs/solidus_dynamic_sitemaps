# frozen_string_literal: true

require 'solidus_dynamic_sitemaps'

module SolidusDynamicSitemaps
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_dynamic_sitemaps'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      SitemapGenerator::Interpreter.include(SolidusDynamicSitemaps::Defaults)
      return unless defined?(SitemapGenerator::LinkSet)

      SitemapGenerator::LinkSet.include(SolidusDynamicSitemaps::Defaults)
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
