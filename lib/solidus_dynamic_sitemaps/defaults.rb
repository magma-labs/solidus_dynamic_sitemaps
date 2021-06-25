# frozen_string_literal: true

module SolidusDynamicSitemaps
  module Defaults
    include ::Spree::Core::Engine.routes.url_helpers

    def default_url_options
      { host: SitemapGenerator::Sitemap.default_host }
    end

    def add_login(options = {})
      add(login_path, options)
    end

    def add_signup(options = {})
      add(signup_path, options)
    end

    def add_account(options = {})
      add(account_path, options)
    end

    def add_password_reset(options = {})
      add(new_spree_user_password_path, options)
    end

    def add_products(options = {})
      available_products = Spree::Product.available.distinct
      options.merge(lastmod: available_products.last_updated) if available_products.present?

      add(products_path, options)

      available_products.each do |product|
        add_product(product, options)
      end
    end

    def add_product(product, options = {})
      opts = options.merge(lastmod: product.updated_at)
      add(product_path(product), opts)
    end

    def add_pages(options = {})
      return unless gem_available?('solidus_static_content')

      Spree::Page.visible.each do |page|
        add(page.slug, options.merge(lastmod: page.updated_at))
      end
    end

    def add_taxons(options = {})
      Spree::Taxon.roots.each { |taxon| add_taxon(taxon, options) }
    end

    def add_taxon(taxon, options = {})
      if taxon.permalink.present?
        options.merge(lastmod: taxon.products.last_updated) if taxon.products.present?
        add(nested_taxons_path(taxon.permalink), options)
      end

      taxon.children.each { |child| add_taxon(child, options) }
    end

    def gem_available?(name)
      defined?("#{name.camelize}::Engine".constantize) == 'constant'
    rescue StandardError
      false
    end

    private

    ##
    # Multiple videos of the same ID can exist, but all videos linked in the sitemap should be inique
    #
    # Required video fields:
    # http://www.seomoz.org/blog/video-sitemap-guide-for-vimeo-and-youtube
    #
    # YouTube thumbnail images:
    # http://www.reelseo.com/youtube-thumbnail-image/
    #
    # NOTE title should match the page title, however the title generation isn't self-contained
    # although not a future proof solution, the best (+ easiest) solution is to mimic the title for product pages
    #   https://github.com/solidusio/solidus/blob/1-3-stable/core/lib/spree/core/controller_helpers/common.rb#L39
    #   https://github.com/solidusio/solidus/blob/1-3-stable/core/app/controllers/spree/products_controller.rb#L41
    #
    def video_options(youtube_id, object: false)
      {}.tap do |h|
        h[:description] = meta_data(object)[:description] || {}
        h[:title] = [SolidusSupport.site_name, object.name].join(' - ') || {}
        h[:thumbnail_loc] = "http://img.youtube.com/vi/#{youtube_id}/0.jpg"
        h[:player_loc] = "http://www.youtube.com/v/#{youtube_id}"
        h[:autoplay] = 'ap=1'
      end
    end
  end
end
