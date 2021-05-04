# frozen_string_literal: true

require 'spree/core'

module SolidusDynamicSitemaps
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace SolidusDynamicSitemaps

    engine_name 'solidus_dynamic_sitemaps'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
