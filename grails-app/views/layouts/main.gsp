<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title><g:layoutTitle default="" /> &ndash; Nineteen</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="Chris Kuehl / Design19" />
    
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-responsive.min.css')}" />
    
    <style type="text/css">
      body {
        padding-top: 60px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
      footer {
        background-color: rgb(230, 230, 220);
        color: rgba(0, 0, 0, 0.3) !important;
        padding: 15px;
      }
    </style>
    
    <g:layoutHead />
    <r:layoutResources />
  </head>
  
  <body>
    <g:javascript library="application" />
    <r:layoutResources />
    
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="${createLink(uri: "/")}">Nineteen</a>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span2">
          <g:render template="sidebar" contextPath="/layouts/main/" />
        </div><!--/span-->
        <div class="span10">
          <g:each var="error" in="${params.errors}">
            <div class="alert alert-error">${error}</div>
          </g:each>
          
          <g:each var="error" in="${flash.errors}">
            <div class="alert alert-error">${error}</div>
          </g:each>
          
          <g:layoutBody />
        </div><!--/span-->
      </div><!--/row-->

      <hr>
    </div><!--/.fluid-container-->
    
    <footer>
      <p style="margin: 0px;">Nineteen hosting manager developed by Chris Kuehl for Design19. Icons by FatCow Web Hosting.</p>
    </footer>
  </body>
</html>