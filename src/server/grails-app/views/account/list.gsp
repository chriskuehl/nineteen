<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>List Accounts</title>
  </head>

  <body>
    <h2>List Accounts</h2>
    
    <table class="table table-striped">
      <tr>
        <th>Name</th>
        <th>Title</th>
        <th>Disk Usage</th>
        <th>Database Usage</th>
        <th>Domains</th>
      </tr>
      
      <g:each var="account" in="${g.getAccounts()}">
        <tr>
          <td><g:link action="view" params="${[id: account.name]}">${account.name}</g:link></td>
          <td>${account.title}</td>
          <td>${formatBytes([bytes: account.diskUsage])}</td>
          <td>${formatBytes([bytes: account.databaseUsage])}</td>
          <td>${account.domains.size()}</td>
        </tr>
      </g:each>
    </table>
    
    <g:link action="add" class="btn">
      <g:img dir="img" file="group_add.png" />
      Add Account
    </g:link>
  </body>
</html>
