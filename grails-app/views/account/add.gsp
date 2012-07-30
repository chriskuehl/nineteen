<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Add Account</title>
  </head>

  <body>
    <h2>Add Account</h2>
    
    <form class="well" method="POST">
      <label for="name">Name:</label>
      <input type="text" name="name" class="span3" placeholder="last-tango" value="${params.name}" />
      
      <label for="name">Title:</label>
      <input type="text" name="title" class="span3" placeholder="Last Tango" value="${params.title}" />
      
      <button type="submit" class="btn" name="add" value="Create">Create</button>
    </form>
  </body>
</html>