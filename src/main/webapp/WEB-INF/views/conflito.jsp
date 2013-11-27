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
		
		span.item {
			display: block;
		}
		
		.conflito {
			color: red;
		}
		
		span.item.conflito strong {
			color: #333;
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
				
				$("#btnSelecionarTodosBD").click(function (){
					$("input[type='radio'][value='BD']").prop('checked', true);
					verificarStatusBotaoSalvar();
				});
				
				$("#btnSelecionarTodosPlanilha").click(function (){
					$("input[type='radio'][value='PLANILHA']").prop('checked', true);
					verificarStatusBotaoSalvar();
				});
				
				$("input[type='radio']").click(function() {
					verificarStatusBotaoSalvar();
				});
				
				$("#example tbody tr").each(function(){
					var cols = $(this).find("td");
					var antigo = cols[0];
					var novo = cols[1];
					
					$(antigo).find(".item").each(function(idx) {
						var html = $(this).html();
						var itemNovo = $(novo).find(".item:eq(" + idx + ")");
						
						if (html != itemNovo.html()) {
							$(this).addClass("conflito");
							itemNovo.addClass("conflito");	
						}
						 
					});
				});
			});
			
			function verificarStatusBotaoSalvar() {
				var empty = false;
		        $('form input').each(function() {
		            if ($(this).val() == '') {
		                empty = true;
		            }
		        });

		        if (empty) {
		            $('#btnSalvar').attr('disabled', 'disabled');
		        } else {
		            $('#btnSalvar').removeAttr('disabled');
		        }
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

			<div class="alert alert-warning">
			  <span style="display: block;"><strong>Os dados da planilha s&atilde;o diferentes do que temos guardado!</strong></span> 
			  Escolha que informa&ccedil;&otilde;es est&atilde;o certas para continuar. Ah, lembre-se de atualizar os dados no sistema da Unicamp.
			</div>
			
			<div id="demo">
				<form method="post" action="resolverConflitos">
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
											<input type="radio" name="conflito_${entry.patrimonioAntigo.chapinha}" value="BD" style="float:left; width:20px" />
											<div style="margin-left:35px; min-height:120px;">
						                        <span class="item"><strong>PI:</strong> ${entry.patrimonioAntigo.chapinha}</span>
						                        <span class="item"><strong>&Oacute;rg&atilde;o:</strong> ${entry.patrimonioAntigo.orgao}</span>
						                        <span class="item"><strong>Processo:</strong> ${entry.patrimonioAntigo.processo}</span>
						                        <span class="item"><strong>Número de S&eacute;rie:</strong> ${entry.patrimonioAntigo.numeroSerie}</span>
						                        <span class="item"><strong>Documento Fiscal:</strong> ${entry.patrimonioAntigo.documentoFiscal}</span>
						                        <span class="item"><strong>Data Aquisi&ccedil;&atilde;o:</strong> <fmt:formatDate value="${entry.patrimonioAntigo.dataAquisicao}" pattern="dd/MM/yyyy" /></span>
						                        <span class="item"><strong>Data Fim:</strong> <fmt:formatDate value="${entry.patrimonioAntigo.dataFim}" pattern="dd/MM/yyyy" /></span>
						                        <span class="item"><strong>Valor Corrigido:</strong> ${entry.patrimonioAntigo.valorCorrigido}</span>
						                        <span class="item"><strong>Descri&ccedil;&atilde;o:</strong> ${entry.patrimonioAntigo.descricao}</span>
						                        <span class="item"><strong>Marca:</strong> ${entry.patrimonioAntigo.marca}</span>
						                        <span class="item"><strong>Modelo:</strong> ${entry.patrimonioAntigo.modelo}</span>
						                        <span class="item"><strong>Im&oacute;vel:</strong> ${entry.patrimonioAntigo.localizacao.imovel}</span>
						                        <span class="item"><strong>Andar:</strong> ${entry.patrimonioAntigo.localizacao.andar}</span>
						                        <span class="item"><strong>Complemento:</strong> ${entry.patrimonioAntigo.localizacao.complemento}</span>
						                        <span class="item"><strong>Situa&ccedil;&atilde;o:</strong> ${entry.patrimonioAntigo.situacao.toString()}</span>
						                        <span class="item"><strong>Tipo:</strong> ${entry.patrimonioAntigo.tipo.toString()}</span>
											</div>
										</td>
										<td style="vertical-align:top;">
											<input type="radio" name="conflito_${entry.patrimonioNovo.chapinha}" value="PLANILHA" style="float:left; width:20px" />
											<div style="margin-left:35px; min-height:120px;">
												<span class="item"><strong>PI:</strong> ${entry.patrimonioNovo.chapinha}</span>
												<span class="item"><strong>&Oacute;rg&atilde;o:</strong> ${entry.patrimonioNovo.orgao}</span>
						                        <span class="item"><strong>Processo:</strong> ${entry.patrimonioNovo.processo}</span>
						                        <span class="item"><strong>Número de S&eacute;rie:</strong> ${entry.patrimonioNovo.numeroSerie}</span>
						                        <span class="item"><strong>Documento Fiscal:</strong> ${entry.patrimonioNovo.documentoFiscal}</span>
						                        <span class="item"><strong>Data Aquisi&ccedil;&atilde;o:</strong> <fmt:formatDate value="${entry.patrimonioNovo.dataAquisicao}" pattern="dd/MM/yyyy" /></span>
						                        <span class="item"><strong>Data Fim:</strong> <fmt:formatDate value="${entry.patrimonioNovo.dataFim}" pattern="dd/MM/yyyy" /></span>
						                        <span class="item"><strong>Valor Corrigido:</strong> ${entry.patrimonioNovo.valorCorrigido}</span>
						                        <span class="item"><strong>Descri&ccedil;&atilde;o:</strong> ${entry.patrimonioNovo.descricao}</span>
						                        <span class="item"><strong>Marca:</strong> ${entry.patrimonioNovo.marca}</span>
						                        <span class="item"><strong>Modelo:</strong> ${entry.patrimonioNovo.modelo}</span>
						                        <span class="item"><strong>Im&oacute;vel:</strong> ${entry.patrimonioNovo.localizacao.imovel}</span>
						                        <span class="item"><strong>Andar:</strong> ${entry.patrimonioNovo.localizacao.andar}</span>
						                        <span class="item"><strong>Complemento:</strong> ${entry.patrimonioNovo.localizacao.complemento}</span>
						                        <span class="item"><strong>Situa&ccedil;&atilde;o:</strong> ${entry.patrimonioNovo.situacao.toString()}</span>
						                        <span class="item"><strong>Tipo:</strong> ${entry.patrimonioNovo.tipo.toString()}</span>
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
					<button type="button" class="btn btn-default" id="btnSelecionarTodosBD" style="margin-top: 20px;">Selecionar todos anteriores</button>
					<button type="button" class="btn btn-default" id="btnSelecionarTodosPlanilha" style="position: absolute; left: 50%; margin-top: 20px;">Selecionar todos novos</button>
					
					<button type="submit" class="btn btn-primary css_right" id="btnSalvar" style="margin-top: 20px; margin-right: 5px;" disabled="disabled">Salvar</button>
				</form>
			</div>
        </div>
		
	</body>
	
</html>