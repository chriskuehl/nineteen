<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>${account.title} &ndash; Modify Account</title>
  </head>

  <body>
    <h2>Modify Account: ${account.title}</h2>
    
    <div class="well">
      <label for="name">Name:</label>
      <input type="text" name="name" class="span3" disabled="disabled" value="${account.name}" />

	  <form method="POST">
		  <label for="name">SFTP Username:</label>
		  <input type="text" name="sftpUsername" class="span3" disabled="disabled" value="${account.name}" />
		  
		  <label for="name">SFTP Password:</label>

		  <input style="float: left; font-family: 'Courier New', Courier, monospace;" type="text" name="sftpPassword" class="span3" disabled="disabled" value="${account.sftpPassword}" />
		  <button style="float: left; margin-left: 10px; " type="submit" class="btn" name="sftpRegen" id="sftpRegen" value="Reset"><i class="icon-refresh"></i></button>
	  </form>
	  
      <div style="clear: both"></div>

	  <form method="POST">
		  <label for="name">MySQL Username:</label>
		  <input type="text" name="mysqlUsername" class="span3" disabled="disabled" value="${account.name.substring(0, Math.min(account.name.length(), 16))}" />
		  
		  <label for="name">MySQL Password:</label>
		  
		  <input style="float: left; font-family: 'Courier New', Courier, monospace;" type="text" name="mysqlPassword" class="span3" disabled="disabled" value="${account.mysqlPassword}" />
		  <button style="float: left; margin-left: 10px; " type="submit" class="btn" name="mysqlRegen" id="mysqlRegen" value="Reset"><i class="icon-refresh"></i></button>
	  </form>
      
      <script>
        $(document).ready(function() {
          $("#mysqlRegen, #sftpRegen").click(function(e) {
            if (! confirm("Are you ABSOLUTELY SURE you want to do this? This will probably break existing sites.")) {
              e.preventDefault();
              return false;
            }
            
            return true;
          });
        });
      </script>
      
      <div style="clear: both"></div>
      
      
	  <form method="POST">
		  <label for="name">Title:</label>
		  <input type="text" name="title" class="span3" placeholder="Last Tango" value="${account.title}" />

		  <button type="submit" class="btn" name="update" value="Update">Update</button>
	  </form>
    </div>
    
    <hr />
    
    <h3>Stats</h3>
    <ul>
      <li><strong>Disk Usage:</strong> ${formatBytes([bytes: account.diskUsage])}</li>
      <li><strong>Database Usage:</strong> ${formatBytes([bytes: account.databaseUsage])}</li>
  </ul>
  <p>Stats are cached and only updated every 24 hours.</p>
    
    <hr />
    
    <h3>Domains</h3>
    <table class="table table-striped">
      <tr>
        <th>Domain Name</th>
        <th>Root Name</th>
        <th>Use WWW?</th>
        <th>Use SSL?</th>
        <th>Use Auth?</th>
        <th>Java Path</th>
      </tr>
      
      <g:each var="domain" in="${account.domains.sort {it.name}}">
        <tr>
          <td><g:link controller="domain" action="view" params="${[id: domain.name]}">${domain.name}</g:link></td>
          <td>${domain.root}</td>
          <td>${domain.useWWW ? "Yes" : "No"}</td>
          <td>${domain.sslCert != null ? "Yes" : "No"}</td>
          <td>${domain.useAuth ? "Yes" : "No"}</td>
          <td>${domain.javaContext != null ? domain.javaContext : ""}</td>
        </tr>
      </g:each>
    </table>
    
    <g:link controller="domain" action="add" params="${[id: account.name]}" class="btn">
      <g:img dir="img" file="layout_add.png" />
      Add Domain
  </g:link>

  <hr />

  <h3>Account Management</h3>
    <g:link controller="account" action="delete" params="${[id: account.name]}" class="btn">
      <g:img dir="img" file="group_delete.png" />
      Delete Account
  </g:link>
  </body>
</html>
