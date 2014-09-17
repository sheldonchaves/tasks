<%@attribute name="id" required="true" %>
<%@attribute name="value" required="false" %>


<input id="${id}" name="${id}" value="${value}"></input>

<script>
	$("#${id}").datepicker({dateFormat:'dd/mm/yy'});
</script>