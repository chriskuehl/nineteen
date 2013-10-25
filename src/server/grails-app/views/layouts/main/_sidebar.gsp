<div class="well sidebar-nav">
  <ul class="nav nav-list">
    <li class="active"><g:link uri="/">Home</g:link></li>
  
  
    <li class="nav-header">Account Management</li>
    <li><g:link controller="account" action="add">Add Account</g:link></li>
    <li><g:link controller="account" action="list">List Accounts</g:link></li>
  
    <li class="nav-header">Accounts</li>
    
    <g:each var="account" in="${me.d19.nineteen.Account.findAll()}">
      <li><g:link controller="account" action="view" params="${[id: account.name]}">${account.title}</g:link></li>
    </g:each>
    
    <li class="nav-header">Server</li>
    <li><g:link controller="server" action="stats">View Stats</g:link></li>
    <li><g:link controller="server" action="update">Force Update</g:link></li>
    <li><g:link controller="server" action="reboot">Reboot</g:link></li>
    
    <li class="nav-header">Tools</li>
    <li><a href="https://phpmyadmin.d19.me/">phpMyAdmin</a></li>
  </ul>
</div><!--/.well -->
