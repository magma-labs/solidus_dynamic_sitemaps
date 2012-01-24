SUMMARY
=======

This Spree extension generates dynamic, seo-friendly sitemaps on the fly in html, xml and txt formats.

This extension is compatible with the [static_content][1] extension and will check for content in the Page table.

In order to avoid an seo penalty for duplicate content, products are only listed once at /product/_productName_

for rails 3 and spree >= 1.0.0rc2

INSTALLATION
------------

1. Install the extension

	gem 'dynamic_sitemaps', :git => 'git://github.com/romul/spree_dynamic_sitemaps.git'
	bundle install

2. Add link to sitemap to a view
    
    `<%= link_to 'Sitemap', '/sitemap' %>`

The sitemaps are accessible at www.your_domain.com/sitemap.html, www.your_domain.com/sitemap.xml, and www.your_domain.com/sitemap.txt

Hat tip [stephp][2] for doing all the heavy lifting with her [spree-sitemaps][3] extension.

[1]: http://ext.spreecommerce.com/extensions/2-static-content
[2]: http://github.com/stephp
[3]: http://ext.spreecommerce.com/extensions/3-spree-sitemaps
