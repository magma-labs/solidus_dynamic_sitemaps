# frozen_string_literal: true

module Spree
  module ProductDecorator
    def self.prepended(klass)
      klass.scope :last_updated, -> { available.order(updated_at: :asc).first }
    end

    ::Spree::Product.prepend(self)
  end
end
