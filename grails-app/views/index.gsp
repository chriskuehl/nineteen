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
          [title: "List Accounts", url: [controller: "account", action: "list"], icon: "group.png"],
          [title: "Add Account", url: [controller: "account", action: "add"], icon: "group_add.png"]
        ]
      ],

      // server sections
      [
        title: "Server",
        links: [
          [title: "View Stats", url: [controller: "server", action: "stats"], icon: "stats.png"],
          [title: "Force Update", url: [controller: "server", action: "update"], icon: "update.png"],
          [title: "Reboot", url: [controller: "server", action: "reboot"], icon: "reboot.png"]
        ]
      ]
    ]}" />
    
    <g:each var="section" in="${sections}">
      <h6>${section.title}</h6>
      
      <p>
        <g:each var="link" in="${section.links}">
          <g:link url="${link.url}" class="btn">
            <g:img dir="img" file="${link.icon}" />
            ${link.title}
          </g:link>
        </g:each>
      </p>
    </g:each>
    
    <p style="color: rgba(0, 0, 0, 0.5); font-size: 12px;">Icons by <a href="http://www.iconfinder.com/search/?q=iconset%3Afatcow">FatCow Web Hosting</a>.</p>
  </body>
</html>