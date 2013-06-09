<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Flush Varnish</title>
  </head>

  <body>
    <h2>Flush Varnish</h2>
    <p>If you're updating files and they don't change, they may be cached. Flushing Varnish can fix this. If you're developing, to avoid flushing Varnish continually, try accessing the site on port 8080 instead, and flush when finished (for example, http://d19.me:8080/index.html instead of http://d19.me/index.html.)</p>
    
    <form method="post">
      <input type="submit" class="btn" id="flush" name="flush" value="Flush Varnish" />
    </form>
  </body>
</html>