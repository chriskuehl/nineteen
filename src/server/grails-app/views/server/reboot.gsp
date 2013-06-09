<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Reboot Server</title>
  </head>

  <body>
    <h2>Reboot Server</h2>
    <p><strong>WARNING:</strong> The server should never need to be rebooted from this panel. Rebooting <em>will</em> cause downtime and should only be used as a last resort.</p>
    
    <form method="post">
      <input type="submit" class="btn" id="reboot" name="reboot" value="Reboot Server" />
      
      <script>
        $(document).ready(function() {
          $("#reboot").click(function(e) {
            if (! confirm("Are you SURE you want to reboot?")) {
              e.preventDefault();
              return false;
            }
          });
        });
      </script>
    </form>
  </body>
</html>