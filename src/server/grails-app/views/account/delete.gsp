<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>${account.title} &ndash; Delete Account</title>
	</head>

	<body>
		<h2>Delete Account: ${account.title}</h2>
		<p>Are you sure you want to delete the account ${account.title}?</p>
		<g:form controller="account" action="delete" params="${[id: account.name]}">
			<button type="submit" name="delete" value="submit" class="btn">
				<g:img dir="img" file="group_delete.png" />
				Delete Account
			</button>
		</g:form>
	  <p>Please note: Deleting a user can take 10-15 seconds, so please don't refresh or click the button again.</p>
	</body>
</html>
