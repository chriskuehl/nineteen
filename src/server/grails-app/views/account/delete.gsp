<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${account.title} &ndash; Delete Account</title>
	</head>

	<body>
		<h2>Delete Account: ${account.title}</h2>
		
		<g:form controller="account" action="delete" params="${[id: account.name]}">
			<button type="submit" name="delete" value="submit" class="btn">
				<g:img dir="img" file="group_delete.png" />
				Delete Account
			</button>
		</g:form>
	</body>
</html>
