<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>${domain.name} &ndash; Modify Domain</title>
  </head>

  <body>
    <g:link controller="account" action="view" params="${[id: domain.account.name]}">&laquo; Back to ${domain.account.title}</g:link>
    
    <h2>Modify Domain: ${domain.name}</h2>
    
    <form class="well" method="POST">
      <label for="name">Name:</label>
      <input type="text" name="name" class="span3" disabled="disabled" value="${domain.name}" />
      
      <label for="name">Account:</label>
      <input type="text" name="account" class="span3" disabled="disabled" value="${domain.account.name}" />
      
      <label for="name">Root: (usually just the domain name)</label>
      <input type="text" name="root" class="span3" placeholder="${domain.name}" value="${domain.root}" />
      
      
      <label for="www" class="checkbox"><input type="checkbox" id="www" name="www" ${domain.useWWW ? "checked=\"checked\"" : ""}" /> Use "www" before domain name (usually no)</label>
      
      <button type="submit" class="btn" name="update" value="Update">Update</button>
    </form>
    
    <h3>SSL Configuration</h3>
    <form class="well">
      <p>SSL isn't available yet.</p>
    </form>
  </body>
</html>