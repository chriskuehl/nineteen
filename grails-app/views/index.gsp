<!doctype html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Control Panel</title>
  </head>

  <body>
    <p>Welcome to <strong>Nineteen</strong>, the hosting manager developed for use by Design19.</p>
    
    <g:set var="sections" value="${[
      // accounts section
      [
        title: "Accounts",
        links: [
          [title: "List Accounts", url: [controller: "account", action: "list"]],
          [title: "Add Account", url: [controller: "account", action: "add"]],
          [title: "Remove Account", url: [controller: "account", action: "remove"]]
        ]
      ],

      // server sections
      [
        title: "Server",
        links: [
          [title: "View Stats", url: [controller: "server", action: "stats"]],
          [title: "Manual Update", url: [controller: "server", action: "update"]],
          [title: "Reboot", url: [controller: "server", action: "reboot"]]
        ]
      ]
    ]}" />
    
    <g:each var="section" in="${sections}">
      <h6>${section.title}</h6>
      
      <p>
        <g:each var="link" in="${section.links}">
          <g:link url="${link.url}" class="btn">${link.title}</g:link>
        </g:each>
      </p>
    </g:each>
    
    <p style="color: rgba(0, 0, 0, 0.5); font-size: 12px;">Icons by <a href="http://www.iconfinder.com/search/?q=iconset%3Afatcow">FatCow Web Hosting</a>.</p>
  </body>
</html>