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
@import "../media/css/demo_page.css";
@import "../media/css/bootstrap.css";
@import "../media/css/jquery.dataTables.css";
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

<script type="text/javascript" language="javascript" src="../media/js/jquery-1.10.2.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.columnFilter.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/bootstrap.js"></script>
<script type="text/javascript" language="javascript" src="../media/js/bootbox.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').dataTable(
								{
									"bDeferRender" : true,
									"bPaginate": false,
							        "bLengthChange": false,
							        "bFilter": false,
							        "bSort": true,
							        "bInfo": false,
							        "bAutoWidth": false,
									"oLanguage" : {
										"sEmptyTable" : "Não há dados disponíveis",
										"sInfoEmpty" : "Mostrando 0 a 0 de 0 itens",
										"sInfoThousands" : ".",
										"sLoadingRecords" : "Carregando...",
										"sProcessing" : "Processando...",
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
										  { "bSortable": false },
										  { "bSortable": false }
									] 
		}).columnFilter();
		
		$(".exclusive-checkbox").change(function() {
			if ($(this).is(':checked')) {
				$(this).closest("tr").find(".exclusive-checkbox").not($(this)).removeAttr('checked');
			}
		});
		
		<c:if test="${updated != null and updated.booleanValue()}">
			setTimeout(function(){ 
				$(".alert").fadeOut();
			}, 2000);
		</c:if>
		
		$("#btnSalvar").click(function() {
			
			bootbox.dialog({
				  message: "Voc&ecirc; tem certeza que deseja salvar as altera&ccedil;&otilde;es?",
				  title: "Aten&ccedil;&atilde;o!",
				  buttons: {
				    danger: {
				      label: "Cancelar",
				      className: "btn-danger"
				    },
				    main: {
				      label: "OK",
				      className: "btn-primary",
				      callback: function() {
				   		$("#formAlteracoes").submit();
				      }
				    }
				  }
			});
		});
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
			<h1>Aprovar Altera&ccedil;&otilde;es</h1>
		</div>
		<div id="demo">
			<c:if test="${updated != null}">
				<c:choose>
					<c:when test="${updated.booleanValue()}">
		        		<div class="alert alert-success alert-dismissable fade in">
		        			<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		        			Altera&ccedil;&otilde;es realizadas com sucesso!
		        		</div>
		   			 </c:when>
					<c:otherwise>
						<div class="alert alert-danger alert-dismissable fade in">
							<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		        			N&atilde;o foi poss&iacute;vel realizar as altera&ccedil;&otilde;es.
		        		</div>
		    		</c:otherwise>
				</c:choose>
			</c:if>
			
			<form method="POST" action="processarAlteracoes" id="formAlteracoes">
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" width="100%">
					<thead>
					 	<tr>
					 		<th rowspan="2">N&uacute;mero PI</th>
							<th colspan="3">Localiza&ccedil;&atilde;o Atual</th>
							<th colspan="3">Localiza&ccedil;&atilde;o Sugerida</th>
							<th rowspan="2">Usu&aacute;rio</th>
							<th rowspan="2">Data de Pedido</th>
							<th rowspan="2">Aprovar</th>
							<th rowspan="2">Recusar</th>
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
								<td>${entry.patrimonio.localizacao.imovel}</td>
								<td>${entry.patrimonio.localizacao.andar}</td>
								<td>${entry.patrimonio.localizacao.complemento}</td>
								<td>${entry.localizacaoNova.imovel}</td>
								<td>${entry.localizacaoNova.andar}</td>
								<td>${entry.localizacaoNova.complemento}</td>
								<td>${entry.usuarioCriacao}</td>
								<td><fmt:formatDate value="${entry.dataCriacao}" pattern="dd/MM/yyyy HH:mm" /></td>
								<td style="text-align: center;">
									<input type="checkbox" name="alteracao_${entry.id}" value="APROVADA" class="exclusive-checkbox" />
								</td>
								<td style="text-align: center;">
									<input type="checkbox" name="alteracao_${entry.id}" value="RECUSADA" class="exclusive-checkbox"/>
								</td>
							</tr>
						</c:forEach>
	
					</tbody>
				</table>
				<button type="button" class="btn btn-primary css_right" id="btnSalvar" style="margin-top: 20px; margin-right: 5px;">Salvar</button>
			</form>
		</div>
	</div>
</body>
</html>