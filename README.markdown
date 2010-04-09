SUMMARY
=======

This extension creates sitemaps in .html, .txt, and .xml (google sitemap) formats.

INSTALLATION
------------

1. Clone the git repo to SPREE_ROOT/vendor/extensions/sitemaps

      git clone git://github.com/stephp/spree-sitemaps.git sitemaps

2. Add link to sitemap to shared element on frontend or to a view via a hook. For example, I have add '<p><%= link_to 'Sitemap', '/sitemap.html' %></p>' to shared/_footer.html.erb.

The sitemaps are accessible at public_domain/sitemap.html, public_domain/sitemap.xml, and public_domain/sitemap.txt

Development of this extension is sponsored by [End Point][1].

[1]: http://www.endpoint.com/
