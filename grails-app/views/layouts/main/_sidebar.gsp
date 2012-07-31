<div class="well sidebar-nav">
  <ul class="nav nav-list">
    <li class="active"><g:link uri="/">Home</g:link></li>
  
  
    <li class="nav-header">Account Management</li>
    <li><g:link controller="account" action="add">Add Account</g:link></li>
    <li><g:link controller="account" action="list">List Accounts</g:link></li>
  
    <li class="nav-header">Accounts</li>
    
    <g:each var="account" in="${me.d19.nineteen.Account.findAll(sort: "title")}">
      <li><g:link controller="account" action="view" params="${[id: account.name]}">${account.title}</g:link></li>
    </g:each>
  </ul>
</div><!--/.well -->