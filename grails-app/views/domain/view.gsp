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
      
      <label for="java">Java Context Path: (usually blank)</label>
      <input type="text" name="java" class="span3" placeholder="/Nineteen/" value="${domain.javaContext == null ? "" : domain.javaContext}" />
      
      
      <label for="www" class="checkbox"><input type="checkbox" id="www" name="www" ${domain.useWWW ? "checked=\"checked\"" : ""}" /> Use "www" before domain name (usually no)</label>
      <label for="auth" class="checkbox"><input type="checkbox" id="auth" name="auth" ${domain.useAuth ? "checked=\"checked\"" : ""}" /> Use manual authentication</label>
      <label for="ssl" class="checkbox"><input type="checkbox" id="ssl" name="ssl" ${domain.sslCert != null ? "checked=\"checked\"" : ""}" /> Use manual SSL configuration</label>
      
      <button type="submit" class="btn" name="update" value="Update">Update</button>
    </form>
    
    <h3>SSL Configuration</h3>
    <form class="well">
      <p>SSL isn't configurable yet (must be manually configured).</p>
    </form>
  </body>
</html>