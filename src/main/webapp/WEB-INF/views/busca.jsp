<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.unicamp.mc437.model.Patrimonio"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/ico"
	href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
<title>Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o</title>

<style type="text/css" title="currentStyle">
@import "media/css/demo_page.css";
@import "media/css/bootstrap.css";
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
<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" language="javascript" src="media/js/bootstrap.js"></script>
<script type="text/javascript" language="javascript" src="media/js/bootbox.js"></script>
		
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').dataTable(
								{
									"bDeferRender" : true,
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
									}
		}).columnFilter();
		
		$("table tbody tr.clickable").click(function() {
			var chapinha = $(this).find(".chapinha").html();
			console.info(chapinha);
			location.href = 'detalhes?bem=' + chapinha; 
		});
	});
</script>
</head>

<body id="dt_example">

        <!-- MENU -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- MENU -->

	<div id="container">
		<div class="full_width big">Sistema de Controle de Patrimônio - Instituto de Computação</div>
		<div>
			<h1>Busca</h1>
		</div>
		<div id="demo">
			<table cellpadding="0" cellspacing="0" border="0" class="display"
				id="example" width="100%">
				<thead>
					<tr>
						<th>N&uacute;mero PI</th>
						<th>N&uacute;mero do processo</th>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Descri&ccedil;&atilde;o</th>
						<th>Complemento</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="entry" items="${lista}">
						<tr class="clickable">
							<td class="chapinha">${entry.chapinha}</td>
							<td>${entry.processo}</td>
							<td>${entry.marca}</td>
							<td>${entry.modelo}</td>
							<td>${entry.descricao}</td>
							<td>${entry.localizacao.complemento}</td>
						</tr>
					</c:forEach>

				</tbody>
				<tfoot>
					<tr>
						<th>N&uacute;mero PI</th>
						<th>N&uacute;mero do processo</th>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Descri&ccedil;&atilde;o</th>
						<th>Complemento</th>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
</body>
</html>
