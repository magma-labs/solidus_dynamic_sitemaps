# frozen_string_literal: true

RSpec.describe SolidusDynamicSitemaps::Defaults do
  let!(:subject) { SitemapGenerator::Interpreter.include(described_class).new }

  describe 'Interpreter' do
    %w( add_login
        add_signup
        add_account
        add_password_reset
        add_products
        add_product
        add_pages
        add_taxons
        add_taxons ).each do |method|
      it "inherit included method #{method.to_sym}" do
        expect(subject.respond_to?(method.to_sym)).to be(true)
      end
    end
  end

  describe '.default_url_options' do
    it 'returns a hash' do
      expect(subject.default_url_options).to be_a Hash
    end
  end

  describe '.gem_available?' do
    it 'verifies that gem is available' do
      allow_any_instance_of(SitemapGenerator::Interpreter).
        to receive(:gem_available?).with('solidus_auth_devise').and_return(true)
      expect(subject.gem_available?('solidus_auth_devise')).to be_truthy
    end

    context 'when there is no such gem' do
      it 'returns false' do
        expect(subject.gem_available?('solidus_static_content')).to be false
      end
    end
  end

  describe '.main_app' do
    context 'returns the url helpers module for the application' do
      it { expect(subject).to respond_to(:url_for, :spree_path, :_routes) }
    end
  end

  skip '.add_login(options = {})'
  skip '.add_signup(options = {})'
  skip '.add_account(options = {})'
  skip '.add_password_reset(options = {})'
  skip '.add_products(options = {})'
  skip '.add_product(product, options = {})'
  skip '.add_pages(options = {})'
  skip '.add_taxons(options = {})'
  skip '.add_taxon(taxon, options = {})'
end
