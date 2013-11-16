<!doctype html>
<html>
	<head>
		<title>Nineteen Error</title>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir: 'grails-default/css', file: 'errors.css')}" type="text/css">
	</head>
	<body>
		<g:renderException exception="${exception}" />
	</body>
</html>
