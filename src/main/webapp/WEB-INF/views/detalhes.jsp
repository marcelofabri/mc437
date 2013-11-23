<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.unicamp.mc437.model.Patrimonio"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/ico"
	href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
<title>Sistema de Controle de Patrimônio - Instituto de
	Computação</title>

<style type="text/css" title="currentStyle">
@import "media/css/demo_page.css";

@import "media/css/jquery.dataTables.css";
</style>

<style>
#header {
	width: 100%;
	margin: 0;
	background-color: #4E6CB7;
	text-align: left;
	color: #FFFFFF;
	padding: 12px;
	text-shadow: none;
	font-size: 20px;
}

#header a {
	color: #FFFFFF
}

div.name label {
	width: 100%;
	margin: 0;
	text-align: left;
	text-shadow: none;
	font-size: 12px;
	font-weight: bold;
	font: 900;
}

div.element label {
	width: 100%;
	margin: 0;
	text-align: left;
	text-shadow: none;
	font-size: 12px;
}

div.item {
	margin: 10px;
}

#wrap {
	float: left;
	width: 1200px;
	margin: 0 auto;
	background: #E0E2FF;
}

.historico {
	float: left;
	width: 1200px;
	margin-top: 10px;
	background: #E0E2FF;
	clear: both;
}

#main {
	float: left;
	text-align: left;
	width: 330px auto;
	padding: 10px;
}

#sidebar {
	float: right;
	text-align: left;
	width: 640px;
	padding: 10px;
}

#footer {
	clear: both;
	padding: 5px 10px;
}
</style>
<script type="text/javascript" language="javascript"
	src="media/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript"
	src="media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" language="javascript"
	src="media/js/jquery-1.10.2.js"></script>
</head>

<body id="dt_example">

	<!-- MENU -->
	<jsp:include page="menu.jsp"></jsp:include>
	<!-- MENU -->

	<div id="container">
		<div class="full_width big">Sistema de Controle de
			Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o</div>
		<div>
			<h1>Detalhes do bem ${pventry.chapinha}</h1>
		</div>
		<form method="POST" style="height: auto;">
			<div id="wrap">
				<div id="main">
					<div class="item">
						<div class="name">
							<label>Órgão:</label>
						</div>
						<div class="element">
							<label>${pventry.orgao}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Número PI:</label>
						</div>
						<div class="element">
							<label>${pventry.chapinha}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Número Processo:</label>
						</div>
						<div class="element">
							<label>${pventry.processo}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Número Série:</label>
						</div>
						<div class="element">
							<label>${pventry.numeroSerie}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Documento Fiscal:</label>
						</div>
						<div class="element">
							<label>${pventry.documentoFiscal}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Data Aquisição:</label>
						</div>
						<div class="element">
							<label><fmt:formatDate value="${pventry.dataAquisicao}"
									pattern="dd/MM/yyyy HH:mm" /></label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Data Fim:</label>
						</div>
						<div class="element">
							<label><fmt:formatDate value="${pventry.dataFim}"
									pattern="dd/MM/yyyy HH:mm" /></label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Valor Corrigido:</label>
						</div>
						<div class="element">
							<label>R$ ${pventry.valorCorrigido}</label>
						</div>
					</div>
				</div>
				<div id="sidebar">
					<div class="item">
						<div class="name">
							<label>Descrição:</label>
						</div>
						<div class="element">
							<label>${pventry.descricao}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Marca:</label>
						</div>
						<div class="element">
							<label>${pventry.marca}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Modelo:</label>
						</div>
						<div class="element">
							<label>${pventry.modelo}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Imóvel:</label>
						</div>
						<div class="element">
							<label>${pventry.localizacao.imovel}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Andar:</label>
						</div>
						<div class="element">
							<label>${pventry.localizacao.andar}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Complemento:</label>
						</div>
						<div class="element">
							<label>${pventry.localizacao.complemento}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Situação:</label>
						</div>
						<div class="element">
							<label>${pventry.situacao}</label>
						</div>
					</div>
					<div class="item">
						<div class="name">
							<label>Tipo:</label>
						</div>
						<div class="element">
							<label>${pventry.tipo}</label>
						</div>
					</div>
				</div>
			</div>
		</form>
		<c:if test="${hist.size() > 0}">
			<div class="historico">
				<table cellpadding="0" cellspacing="0" border="0"
					class="display dataTable" id="example" width="100%">
					<thead>
						<tr>
							<th rowspan="2">Data Cria&ccedil;&atilde;o</th>
							<th rowspan="2">Data Revis&atilde;o</th>
							<th rowspan="2">Status</th>
							<th rowspan="2">Sugerido por</th>
							<th rowspan="2">Revisado por</th>
							<th rowspan="1" colspan="3">Localiza&ccedil;&atilde;o Antiga</th>
							<th rowspan="1" colspan="3">Localiza&ccedil;&atilde;o
								Sugerida</th>
						</tr>
						<tr>

							<th rowspan="1">Imóvel</th>
							<th rowspan="1">Andar</th>
							<th rowspan="1">Complemento</th>
							<th rowspan="1">Imóvel</th>
							<th rowspan="1">Andar</th>
							<th rowspan="1">Complemento</th>
						</tr>

					</thead>
					<tbody>
						<c:forEach var="alter" items="${hist}">
							<tr>
								<td><fmt:formatDate value="${alter.dataCriacao}"
										pattern="dd/MM/yyyy HH:mm" /></td>
								<td><fmt:formatDate value="${alter.dataRevisao}"
										pattern="dd/MM/yyyy HH:mm" /></td>
								<td>${alter.status}</td>
								<td>${alter.usuarioCriacao}</td>
								<td>${alter.usuarioRevisao}</td>
								<td>${alter.localizacaoAntiga.imovel}</td>
								<td>${alter.localizacaoAntiga.andar}</td>
								<td>${alter.localizacaoAntiga.complemento}</td>
								<td>${alter.localizacaoNova.imovel}</td>
								<td>${alter.localizacaoNova.andar}</td>
								<td>${alter.localizacaoNova.complemento}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		<div id="footer">
			<table>
				<tbody>
					<tr>
						<td><a class="voltar" href="busca">Voltar </a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
