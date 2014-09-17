<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<jsp:include page="/includes/includes.jsp"></jsp:include>
</head>
	<jsp:include page="/includes/header.jsp"></jsp:include>
	<body>
	
		<script type="text/javascript">
			function finaliza(id) {
				$.post("finaliza", {"id":id}, function() {
					$("#t_" + id).html("Finalizado!");
				});
			}
		</script>
	
		<h3>Tarefas</h3>
		
		<table>
			<tr>
				<th>Id</th>
				<th>Descricao</th>
				<th>Finalizado</th>
				<th>Data Finalizado</th>
				<th>Ações</th>
			</tr>
			
			<c:forEach items="${tarefas}" var="tarefa">
				<tr>
					<td>${tarefa.id}</td>
					<td>${tarefa.descricao}</td>
					
					<c:if test="${tarefa.finalizado eq false}">
						<td>Não finalizado</td>
					</c:if>
					
					<c:if test="${tarefa.finalizado eq true}">
						<td>Finalizado</td>
					</c:if>
					
					<td>
						<fmt:formatDate value="${tarefa.dataFinalizacao.time}" pattern="dd/MM/yyyy"/>
					</td>
					<td>
						<a href="edita?id=${tarefa.id}">Editar</a> | 
						<a href="remove?id=${tarefa.id}">Remover</a> | 
						
						<c:if test="${tarefa.finalizado eq true}">
							Finalizado!
						</c:if>
						
						<c:if test="${tarefa.finalizado eq false}">
							<a href="#" onclick="finaliza(${tarefa.id})" id="t_${tarefa.id}">Finaliza Agora</a>
						</c:if>
						
						
						
					</td>
				</tr>
			</c:forEach>
		</table>
	
	
	
	<jsp:include page="/includes/footer.jsp"></jsp:include>
	
	</body>
</html>
