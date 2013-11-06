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
	  <p>Please note: Creating a new user can take 10-15 seconds, so please don't refresh or click the button again.</p>
    </form>
  </body>
</html>
