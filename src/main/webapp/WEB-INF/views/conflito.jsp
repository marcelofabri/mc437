<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.unicamp.mc437.model.Patrimonio"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<html>

	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/ico" href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
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
		</style>
		<script type="text/javascript" language="javascript" src="media/js/jquery-1.10.2.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.columnFilter.js"></script>
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable(
				{
					"bDeferRender" : true,
					"bFilter": false,
					"bSort" : false,
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
				});
			});
		</script>
		<script type="text/javascript">
			function selectAll(check)
			{
				var radio, i=0;
				while (radio=check.form.elements[i++])
					if (radio.type=="radio" && radio.value==check.value)
						radio.checked = true;
			}
		</script>
	</head>
	
	<body id="dt_example">
	
	    <!-- MENU -->
		<jsp:include page="menu.jsp"></jsp:include>
		<!-- MENU -->
			
		<div id="container">
           	<div class="full_width big">
               	Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o
               </div>
               <div>
               	<h1>Conflitos</h1>
               </div>
		
			<div id="demo">
				<form>
					<table cellpadding="0" cellspacing="0" border="0" class="display"
						id="example" width="100%">
						<thead>
							<tr>
								<th>Anterior</th>
								<th>Novo</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="entry" items="${lista}">
									<tr>
										<td style="vertical-align:top;">
											<input type="radio" name="${entry.id}" value="0" style="float:left; width:20px">
											<div style="margin-left:35px; width:500px; min-height:120px; border:1px solid blue;">
												${entry.antigo}
											</div>
											</input>
										</td>
										<td style="vertical-align:top;">
											<input type="radio" name="${entry.id}" value="1" style="float:left; width:20px">
											<div style="margin-left:35px; width:500px; min-height:120px; border:1px solid blue;">
												${entry.novo}
											</div>
											</input>
										</td>
									</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Anterior</th>
								<th>Novo</th>
							</tr>
						</tfoot>
					</table>
					<input type="radio" name="radioFoot" value="0" onclick="selectAll(this)"> Selecionar todos </input>
					<input type="radio" name="radioFoot" value="1" onclick="selectAll(this)" style="margin-left:500px"> Selecionar todos </input>
				</form>
			</div>
        </div>
		
	</body>
	
</html>