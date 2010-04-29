SUMMARY
=======

This Spree extension generates dynamic, seo-friendly sitemaps on the fly in html, xml and txt formats.

This extension is compatible with the [static_content][1] extension and will check for content in the Page table.

In order to avoid an seo penalty for duplicate content, products are only listed once at /product/_productName_

INSTALLATION
------------

1. Install the extension

      script/extension install git@github.com:polomasta/dynamic-spree-sitemaps.git

2. Rename the directory to sitemaps
    
    mv vendor/extensions/dynamic-spree-sitemaps vendor/extensions/sitemaps

3. Add link to sitemap to a view
    <%= link_to 'Sitemap', '/sitemap' %>

The sitemaps are accessible at public_domain/sitemap.html, public_domain/sitemap.xml, and public_domain/sitemap.txt

Hat tip [stephp][2] for doing all the heavy lifting with her [spree-sitemaps][3] extension.

[1]: http://ext.spreecommerce.com/extensions/2-static-content
[2]: http://github.com/stephp
[3]: http://ext.spreecommerce.com/extensions/3-spree-sitemaps
