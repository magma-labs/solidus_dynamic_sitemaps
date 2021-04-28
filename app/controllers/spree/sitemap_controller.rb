# frozen_string_literal: true

module Spree
  class SitemapController < Spree::BaseController
    before_action :public_url, only: :index
    before_action :products, only: :index
    before_action :taxonomies, only: :index
    before_action :taxons, only: :index
    before_action :pages, only: :index

    def index
      respond_to do |format|
        format.html
        format.xml { render xml: build_xml, layout: false }
        format.text { render layout: false }
      end
    end

    private

    def public_url
      @public_url ||= root_url
    end

    def products
      if gem_available?('solidus_multi_domain')
        @products = Spree::Product.available.by_store(current_store)
      end

      @products ||= Spree::Product.available
    end

    def taxonomies
      if gem_available?('solidus_multi_domain')
        @taxonomies = Spree::Taxonomy.where(store: current_store)
      end

      @taxonomies ||= Spree::Taxonomy.all
    end

    def taxons
      if gem_available?('solidus_multi_domain')
        @taxons = Spree::Taxon.where(store: current_store)
      end

      @taxons ||= Spree::Taxon.all
    end

    def pages
      @pages ||= select_static_pages
    end

    def nav
      nav = build_taxon_hash
      nav = build_pages_hash(nav)
      nav = add_products_to_tax(nav, false)

      @nav ||= nav
    end

    def build_xml
      xml = Builder::XmlMarkup.new(target: output, indent: 2)
      xml.instruct! :xml, version: '1.0', encoding: 'UTF-8'
      xml.urlset(xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' ) {
        xml.url {
          xml.loc @public_url
          xml.lastmod Time.zone.today
          xml.changefreq 'daily'
          xml.priority '1.0'
        }
        nav.each do |_k, v|
          xml.url {
            xml.loc @public_url + v['link']
            xml.lastmod v['updated'].xmlschema
            xml.changefreq 'weekly'
            xml.priority '0.8'
          }
        end
      }
    end

    def build_taxon_hash
      @taxons.each do |taxon|
        {}.tap do |h|
          h['name'] = taxon.name
          h['depth'] = taxon.permalink.split('/').size
          h['link'] = "t/#{taxon.permalink}"
          h['updated'] = taxon.updated_at
          nav[taxon.permalink] = h
        end
      end
    end

    def add_products_to_tax(nav, _multiples_allowed)
      @products.each do |product|
        {}.tap do |h|
          h['name'] = product.name
          h['link'] = "products/#{product.permalink}"
          h['updated'] = product.updated_at
          nav[h['link']] = h
        end
      end
    end

    def build_pages_hash(nav)
      return nav if @pages.empty?

      @pages.each do |page|
        nav[page.slug] = { name: page.title,
                           link: page.slug.gsub(%r/^\//, ''),
                           updated: page.updated_at }
      end

      nav
    end

    def select_static_pages
      pages = []

      if defined?(Spree::Page)
        slugs_to_reject = ['/on-main-page']

        Spree::Page.visible.each do |page|
          pages << page unless slugs_to_reject.include?(page.slug)
        end
      end

      pages
    end
  end
end
