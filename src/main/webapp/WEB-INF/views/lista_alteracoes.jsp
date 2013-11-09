<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.unicamp.mc437.model.Patrimonio"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/ico"
	href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
<title>Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o</title>

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

table tbody tr.clickable:hover td {
   cursor: pointer;
   background-color:#a9d0f5 !important;
}

</style>

<script type="text/javascript" language="javascript" src="media/js/jquery-1.10.2.js"></script>
<script type="text/javascript" language="javascript" src="media/js/complete.js"></script>
<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').dataTable(
								{
									"sPaginationType" : "full_numbers",
									"iDisplayLength" : 25,
									"aLengthMenu" : [
											[ 10, 25, 50, 100, 250 ],
											[ 10, 25, 50, 100, 250 ] ],
									"oLanguage" : {
										"oPaginate" : {
											"sFirst" : "Primeira",
											"sLast" : "Última",
											"sNext" : "Próxima",
											"sPrevious" : "Anterior"
										},
										"sEmptyTable" : "Não há dados disponíveis",
										"sInfo" : "Mostrando _START_ a _END_ de _TOTAL_ itens",
										"sInfoEmpty" : "Mostrando 0 a 0 de 0 itens",
										"sInfoFiltered" : "(filtrados de _MAX_ itens)",
										"sInfoThousands" : ".",
										"sLengthMenu" : "Mostrar _MENU_ itens",
										"sLoadingRecords" : "Carregando...",
										"sProcessing" : "Processando...",
										"sSearch" : "Busca:",
										"sZeroRecords" : "Nenhum resultado encontrado"
									},
									 "aoColumns": [
										  null,
										  null,
										  null,
										  null,
										  null,
										  null,
										  null,
										  null,
										  null,
										  { "bSortable": false }
									] 
		}).columnFilter();
	});
</script>
</head>

<body id="dt_example">

        <!-- MENU -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- MENU -->

	<div id="container">
		<div class="full_width big">Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o</div>
		<div>
			<h1>Aprovar Altera&ccedil;&ocirc;es</h1>
		</div>
		<div id="demo">
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
				<thead>
				 	<tr>
				 		<th rowspan="2">N&uacute;mero PI</th>
						<th colspan="3">Localiza&ccedil;&atilde;o Antiga</th>
						<th colspan="3">Nova Localiza&ccedil;&atilde;o</th>
						<th rowspan="2">Usu&aacute;rio</th>
						<th rowspan="2">Data de Pedido</th>
						<th rowspan="2">A&ccedil;&otilde;es</th>
					</tr>
					<tr>
						<th>Im&oacute;vel</th>
						<th>Andar</th>
						<th>Complemento</th>
						<th>Im&oacute;vel</th>
						<th>Andar</th>
						<th>Complemento</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="entry" items="${lista}">
						<tr>
							<td>${entry.patrimonio.chapinha}</td>
							<td>${entry.localizacaoAntiga.imovel}</td>
							<td>${entry.localizacaoAntiga.andar}</td>
							<td>${entry.localizacaoAntiga.complemento}</td>
							<td>${entry.localizacaoNova.imovel}</td>
							<td>${entry.localizacaoNova.andar}</td>
							<td>${entry.localizacaoNova.complemento}</td>
							<td>${entry.usuarioCriacao}</td>
							<td><fmt:formatDate value="${entry.dataCriacao}" pattern="dd/MM/yyyy HH:mm" /></td>
							<td>
								<a href="#" title="Aprovar"><img src="media/images/icon-approve.png" width="32" height="32" /></a>
								<a href="#" title="Reprovar"><img src="media/images/icon-disapprove.png" width="32" height="32" /></a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
</body>
</html>