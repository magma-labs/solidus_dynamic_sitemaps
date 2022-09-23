# frozen_string_literal: true

module Solidus
  module ProductDecorator
    def self.prepended(base)
      base.class_eval do
        scope :last_updated, -> { available.order(updated_at: :asc).first }
      end
    end

    ::Spree::Product.prepend(self)
  end
end
