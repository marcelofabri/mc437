<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div id="header">
<sec:authorize access="isAuthenticated()">
	<a href="home2" style="margin-left: 5%">Tela Inicial</a>
	<a href="busca" style="margin-left: 5%">Lista de Bens</a>
	<a href="upload" style="margin-left: 5%">Enviar arquivo</a>
	<a href="contato" style="margin-left: 5%">Contato</a>
	<a href="j_spring_security_logout" style="margin-left: 5%">Sair</a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<a href="home" style="margin-left: 5%">Tela Inicial</a>
	<a href="contato" style="margin-left: 5%">Contato</a>
	<a href="login" style="margin-left: 5%">Entrar</a>
</sec:authorize>
</div>