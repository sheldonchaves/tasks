<html>
<head>
<title>Login</title>
<jsp:include page="/includes/includes.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/includes/header.jsp"></jsp:include>
		<h2>Login</h2>
		<form action="efetuaLogin" method="post">
			Login:<input type="text" name="login"/><br/>
			Senha:<input type="password" name="senha"/><br/>
			<input type="submit" value="Entrar">
		</form>
	<jsp:include page="/includes/footer.jsp"></jsp:include>
</body>
</html>