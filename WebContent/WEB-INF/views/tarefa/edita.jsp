<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<html>
	<head>
	<jsp:include page="/includes/includes.jsp"></jsp:include>
	<jsp:include page="/includes/header.jsp"></jsp:include>
	<style>
		.error {
			color: #ff0000;
		}
		
		.errorblock{
			color: #000;
			background-color: #ffEEEE;
			border: 3px solid #ff0000;
			padding:8px;
			margin:16px;
		}
	</style>
	</head>
	<body>
		<h3>Editar Tarefa ${tarefa.id}</h3>
		
		<form:errors path="tarefa.descricao" cssClass="errorblock" element="div" />
		
		<form action="altera" method="post">
			<input type="hidden" name="id" value="${tarefa.id }">
			Descrição: <br/>
			<textarea name="descricao"rows="5" cols="100">${tarefa.descricao }</textarea> <br/>
			<br/>
			Finalizado <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado? 'checked':''}/>
			<br/>
			Data de finalização:<br/>
			<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy" var="f"/>
			<caelum:campoData id="dataFinalizacao" value="${f}"></caelum:campoData>
			
			<br/>
			
			<input type="submit" value="Alterar"> 
		</form>
		

	<jsp:include page="/includes/footer.jsp"></jsp:include>
	</body>
</html>