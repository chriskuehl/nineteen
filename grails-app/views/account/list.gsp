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
      
      <g:each var="account" in="${me.d19.nineteen.Account.findAll(sort: "name")}">
        <tr>
          <td><g:link action="view" params="${[id: account.name]}">${account.name}</g:link></td>
          <td>${account.title}</td>
          <td>${formatBytes([bytes: account.cacheDiskUsage])}</td>
          <td>${formatBytes([bytes: account.cacheDatabaseUsage])}</td>
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