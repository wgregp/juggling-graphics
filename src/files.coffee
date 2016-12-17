index = (context, config) ->  
  htmltag = if context.isDev then "<html>" else '<html manifest="/cache.manifest">'
  """<!doctype html>
  #{htmltag}
  <head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=yes"/>
  <meta name="apple-mobile-web-app-title" content="j•graphics">
  <link rel="apple-touch-icon" href="/juggling-graphics.png">
  <title>#{config.title}</title>
  <link rel="stylesheet" href="#{config.publicPath}#{context.css}"/>
  </head>
  <body>
  <div id="root">
  </div>
  <script src="#{config.publicPath}#{context.main}">
  </script>
  </body>
  </html>
  """

manifest = (context) -> 
  """CACHE MANIFEST
  #{context.css}
  #{context.main}
  favicon.ico
  juggling-graphics.png
  # hash (for cache-busting): #{context.stats.chunks[0].hash}
  """

htaccess = (context) -> 
  """AddType text/cache-manifest .manifest
  RewriteEngine On  
  RewriteCond %{HTTPS} !=on  
  RewriteRule ^/?(.*) https://%{SERVER_NAME}/$1 [R,L]  
  Options -Indexes
  <Files cache.manifest>
  FileETag None
  Header unset ETag
  Header set Cache-Control "max-age=0, no-cache, no-store, must-revalidate"
  Header set Pragma "no-cache"
  Header set Expires "Wed, 11 Jan 1984 05:00:00 GMT"
  </Files>
  """

module.exports =
  htaccess: htaccess
  manifest: manifest
  index: index
