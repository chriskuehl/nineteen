<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>${account.title} &ndash; Modify Account</title>
  </head>

  <body>
    <h2>Modify Account: ${account.title}</h2>
    
    <form class="well" method="POST">
      <label for="name">Name:</label>
      <input type="text" name="name" class="span3" placeholder="last-tango" disabled="disabled" value="${account.name}" />
      
      <label for="name">Title:</label>
      <input type="text" name="title" class="span3" placeholder="Last Tango" value="${account.title}" />
      
      <button type="submit" class="btn" name="update" value="Update">Update</button>
    </form>
    
    <hr />
    
    <h3>Stats</h3>
    <ul>
      <li><strong>Disk Usage:</strong> ${formatBytes([bytes: account.cacheDiskUsage])}</li>
      <li><strong>Database Usage:</strong> ${formatBytes([bytes: account.cacheDatabaseUsage])}</li>
    </ul>
    
    <hr />
    
    <h3>Domains</h3>
    
  </body>
</html>