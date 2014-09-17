<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	
	.user{
		float:right;
		color: #fff;
	}
</style>

<nav id="menu">
	<ul>
		<li>
			<a href="/tarefas/tarefas/nova">Adicionar Tarefa</a>
		</li>
		<li>
			<a href="/tarefas/tarefas/lista">Listar Tarefas</a>
		</li>
		
		<div class="user">
			<c:if test="${usuarioLogado != null}">
				${usuarioLogado.login}
				
				<li>
					<a href="/tarefas/logout">Sair</a>
				</li>
				
			</c:if>
			
			<c:if test="${usuarioLogado == null}">
				<li>
					<a href="/tarefas/loginForm">Login</a>
				</li>
				
			</c:if>
		</div>
		
	</ul>
</nav>