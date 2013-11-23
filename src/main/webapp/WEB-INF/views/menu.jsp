<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="header">
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/mc437/home2" style="margin-left: 5%">Tela Inicial</a>
	<a href="/mc437/busca" style="margin-left: 5%">Lista de Bens</a>
	<a href="/mc437/admin/upload" style="margin-left: 5%">Enviar arquivo</a>
	<a href="/mc437/admin/listaAlteracoes" style="margin-left: 5%">Aprovar Alterações</a>
	<a href="/mc437/contato" style="margin-left: 5%">Contato</a>
	<a href="/mc437/j_spring_security_logout" style="margin-left: 5%">Sair</a>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_USER')">
	<a href="/mc437/home2" style="margin-left: 5%">Tela Inicial</a>
	<a href="/mc437/busca" style="margin-left: 5%">Lista de Bens</a>
	<a href="/mc437/aluno/requisicao" style="margin-left: 5%">Sugerir Alteração</a>
	<a href="/mc437/contato" style="margin-left: 5%">Contato</a>
	<a href="/mc437/j_spring_security_logout" style="margin-left: 5%">Sair</a>
</sec:authorize>

<sec:authorize access="isAnonymous()">
	<a href="/mc437/home" style="margin-left: 5%">Tela Inicial</a>
	<a href="/mc437/contato" style="margin-left: 5%">Contato</a>
	<a href="/mc437/login" style="margin-left: 5%">Entrar</a>
</sec:authorize>
</div>