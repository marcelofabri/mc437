<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<head>
<script type="text/javascript" language="javascript"
	src="media/js/bootstrap.js"></script>
<script type="text/javascript" language="javascript"
	src="media/js/bootbox.js"></script>
<style type="text/css" title="currentStyle">
@import "media/css/bootstrap.css";
</style>
</head>
<div id="header">
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<a href="/mc437/home2" style="margin-left: 5%">In&iacute;cio</a>
		<a href="/mc437/busca" style="margin-left: 5%">Lista de Bens</a>
		<a href="/mc437/admin/upload" style="margin-left: 5%">Enviar
			Planilha</a>
		<a href="/mc437/requisicao" style="margin-left: 5%">Sugerir
			Alteração</a>
		<a href="/mc437/admin/listaAlteracoes" style="margin-left: 5%">Aprovar Altera&ccedil;&otilde;es</a>
		<c:if test="${pendentes != null && pendentes > 0}">
			<span class="badge badge-menu">${pendentes}</span>
		</c:if> 
		<a href="/mc437/j_spring_security_logout" style="margin-left: 5%">Sair</a>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_USER')">
		<a href="/mc437/home2" style="margin-left: 5%">In&iacute;cio</a>
		<a href="/mc437/busca" style="margin-left: 5%">Lista de Bens</a>
		<a href="/mc437/requisicao" style="margin-left: 5%">Sugerir
			Alteração</a>
		<a href="/mc437/contato" style="margin-left: 5%">Contato</a>
		<a href="/mc437/j_spring_security_logout" style="margin-left: 5%">Sair</a>
	</sec:authorize>

	<sec:authorize access="isAnonymous()">
		<a href="/mc437/home" style="margin-left: 5%">In&iacute;cio</a>
		<a href="/mc437/contato" style="margin-left: 5%">Contato</a>
		<a href="/mc437/login" style="margin-left: 5%">Entrar</a>
	</sec:authorize>
</div>