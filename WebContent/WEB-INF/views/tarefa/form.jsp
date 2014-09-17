<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
	<jsp:include page="/includes/includes.jsp"></jsp:include>
</head>

	<jsp:include page="/includes/header.jsp"></jsp:include>
	
	<body>
		<h3>Adiciona Tarefa</h3>
		
		<form:errors path="tarefa.descricao" cssClass="errorblock" element="div" />
		
		<form action="adiciona" method="post">
			Descrição: <br/>
			<textarea name="descricao"rows="5" cols="100"></textarea> <br/>
			<input type="submit" value="Adicionar"> 
		</form>
		

		
	</body>
	
	<jsp:include page="/includes/footer.jsp"></jsp:include>
	
</html>