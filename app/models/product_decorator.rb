Spree::Product.class_eval do
  scope :last_updated, -> { available.order(updated_at: :asc).first }
end