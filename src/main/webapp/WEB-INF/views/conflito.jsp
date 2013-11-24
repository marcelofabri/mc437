<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.unicamp.mc437.model.Patrimonio"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>

	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/ico" href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
        <title>Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o</title>
        
        <style type="text/css" title="currentStyle">
			@import "../media/css/demo_page.css";
			@import "../media/css/jquery.dataTables.css";
			@import "../media/css/bootstrap.css";
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
		<script type="text/javascript" language="javascript" src="../media/js/jquery-1.10.2.js"></script>
		<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.columnFilter.js"></script>
		<script type="text/javascript" language="javascript" src="../media/js/bootstrap.js"></script>
		<script type="text/javascript" language="javascript" src="../media/js/bootbox.js"></script>

		<script type="text/javascript" charset="utf-8">
			$(document).ready(function() {
				$('#example').dataTable(
				{
					"bPaginate": false,
			        "bLengthChange": false,
			        "bFilter": false,
			        "bSort": false,
			        "bInfo": false,
			        "bAutoWidth": false,
					"oLanguage" : {
						"oPaginate" : {
							"sFirst" : "Primeira",
							"sLast" : "Última",
							"sNext" : "Pr&oacute;xima",
							"sPrevious" : "Anterior"
						},
						"sEmptyTable" : "N&atilde;o há dados disponíveis",
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
				
				$("input[type='radio'][name='radioFoot']").click(function() {
					if ($(this).is(":checked")) {
						$("input[type='radio'][value='" + $(this).val() + "']").not($(this)).prop('checked', true);
					}
				});
			});
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
		
			<div class="alert alert-warning">
			  <strong>Os dados da planilha s&atilde;o diferentes do que temos guardado!</strong> <br /> 
			  Escolha que informa&ccedil;&otilde;es est&atilde;o certas para continuar. Ah, lembre-se de atualizar os dados no sistema da Unicamp.
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
											<input type="radio" name="${entry.patrimonioAntigo.chapinha}" value="BD" style="float:left; width:20px" />
											<div style="margin-left:35px; width:500px; min-height:120px;">
												<strong>&Oacute;rg&atilde;o:</strong> ${entry.patrimonioAntigo.orgao} <br />
						                        <strong>PI:</strong> ${entry.patrimonioAntigo.chapinha} <br />
						                        <strong>Processo:</strong> ${entry.patrimonioAntigo.processo} <br />
						                        <strong>Número de S&eacute;rie:</strong> ${entry.patrimonioAntigo.numeroSerie} <br />
						                        <strong>Documento Fiscal:</strong> ${entry.patrimonioAntigo.documentoFiscal} <br />
						                        <strong>Data Aquisi&ccedil;&atilde;o:</strong> <fmt:formatDate value="${entry.patrimonioAntigo.dataAquisicao}" pattern="dd/MM/yyyy" /> <br />
						                        <strong>Data Fim:</strong> <fmt:formatDate value="${entry.patrimonioAntigo.dataFim}" pattern="dd/MM/yyyy" /> <br />
						                        <strong>Valor Corrigido:</strong> ${entry.patrimonioAntigo.valorCorrigido} <br />
						                        <strong>Descri&ccedil;&atilde;o:</strong> ${entry.patrimonioAntigo.descricao} <br />
						                        <strong>Marca:</strong> ${entry.patrimonioAntigo.marca} <br />
						                        <strong>Modelo:</strong> ${entry.patrimonioAntigo.modelo} <br />
						                        <strong>Im&oacute;vel:</strong> ${entry.patrimonioAntigo.localizacao.imovel} <br />
						                        <strong>Andar:</strong> ${entry.patrimonioAntigo.localizacao.andar} <br />
						                        <strong>Complemento:</strong> ${entry.patrimonioAntigo.localizacao.complemento} <br />
						                        <strong>Situa&ccedil;&atilde;o:</strong> ${entry.patrimonioAntigo.situacao} <br />
						                        <strong>Tipo:</strong> ${entry.patrimonioAntigo.tipo}
											</div>
										</td>
										<td style="vertical-align:top;">
											<input type="radio" name="${entry.patrimonioNovo.chapinha}" value="PLANILHA" style="float:left; width:20px" />
											<div style="margin-left:35px; width:500px; min-height:120px;">
												<strong>&Oacute;rg&atilde;o:</strong> ${entry.patrimonioNovo.orgao} <br />
						                        <strong>PI:</strong> ${entry.patrimonioNovo.chapinha} <br />
						                        <strong>Processo:</strong> ${entry.patrimonioNovo.processo} <br />
						                        <strong>Número de S&eacute;rie:</strong> ${entry.patrimonioNovo.numeroSerie} <br />
						                        <strong>Documento Fiscal:</strong> ${entry.patrimonioNovo.documentoFiscal} <br />
						                        <strong>Data Aquisi&ccedil;&atilde;o:</strong> <fmt:formatDate value="${entry.patrimonioNovo.dataAquisicao}" pattern="dd/MM/yyyy" /> <br />
						                        <strong>Data Fim:</strong> <fmt:formatDate value="${entry.patrimonioNovo.dataFim}" pattern="dd/MM/yyyy" /> <br />
						                        <strong>Valor Corrigido:</strong> ${entry.patrimonioNovo.valorCorrigido} <br />
						                        <strong>Descri&ccedil;&atilde;o:</strong> ${entry.patrimonioNovo.descricao} <br />
						                        <strong>Marca:</strong> ${entry.patrimonioNovo.marca} <br />
						                        <strong>Modelo:</strong> ${entry.patrimonioNovo.modelo} <br />
						                        <strong>Im&oacute;vel:</strong> ${entry.patrimonioNovo.localizacao.imovel} <br />
						                        <strong>Andar:</strong> ${entry.patrimonioNovo.localizacao.andar} <br />
						                        <strong>Complemento:</strong> ${entry.patrimonioNovo.localizacao.complemento} <br />
						                        <strong>Situa&ccedil;&atilde;o:</strong> ${entry.patrimonioNovo.situacao} <br />
						                        <strong>Tipo:</strong> ${entry.patrimonioNovo.tipo}
											</div>
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
					<input type="radio" name="radioFoot" value="BD"/> Selecionar todos
					<input type="radio" name="radioFoot" value="PLANILHA" style="margin-left:500px" /> Selecionar todos
				</form>
			</div>
        </div>
		
	</body>
	
</html>