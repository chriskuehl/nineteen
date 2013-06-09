<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Add Domain</title>
  </head>

  <body>
    <h2>Add Domain</h2>
    
    <form class="well" method="POST">
      <label for="name">Name:</label>
      <input type="text" name="name" class="span3" placeholder="google.com" value="${params.name}" />
      
      <label for="name">Account:</label>
      <input type="text" name="account" class="span3" disabled="disabled" value="${account.name}" />
      
      <label for="name">Root: (usually just the domain name)</label>
      <input type="text" name="root" class="span3" placeholder="google.com" value="${params.root}" />
      
      <label for="www" class="checkbox"><input type="checkbox" id="www" name="www" ${params.www ? "checked=\"checked\"" : ""}" /> Use "www" before domain name (usually no)</label>
      
      <p>SSL and other options can be configured after creation.</p>
      
      <button type="submit" class="btn" name="add" value="Add">Add</button>
    </form>
  </body>
</html>