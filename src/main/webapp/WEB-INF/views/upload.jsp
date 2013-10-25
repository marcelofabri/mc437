<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
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
		<script type="text/javascript" charset="utf-8">
			$(document).ready(function()
			{
				$('#example').dataTable(
				{
					"sPaginationType": "full_numbers",
					"iDisplayLength": 25,
					"aLengthMenu": [[10, 25, 50, 100, 250], [10, 25, 50, 100, 250]],
					"oLanguage":
					{
						"oPaginate":
						{
							"sFirst": "Primeira",
							"sLast": "Última",
							"sNext": "Próxima",
							"sPrevious": "Anterior"
						},
						"sEmptyTable": "Não há dados disponíveis",
						"sInfo": "Mostrando _START_ a _END_ de _TOTAL_ itens",
						"sInfoEmpty": "Mostrando 0 a 0 de 0 itens",
						"sInfoFiltered": "(filtrados de _MAX_ itens)",
						"sInfoThousands": ".",
						"sLengthMenu": "Mostrar _MENU_ itens",
						"sLoadingRecords": "Carregando...",
						"sProcessing": "Processando...",
						"sSearch": "Busca:",
						"sZeroRecords": "Nenhum resultado encontrado"
					}
				});
			} );
		</script>
	</head>
	
	<body id="dt_example">
		
	<div id="header">
			<a href="home2" style="margin-left: 5%">Home</a>
			<a href="busca" style="margin-left: 5%">Lista de Bens</a>
			<a href="upload" style="margin-left: 5%">Enviar arquivo</a>
			<a href="home" style="margin-left: 5%">Logout</a>
		</div>
		
		<div id="container">
			<div class="full_width big">
				Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o
			</div>
			
			<div>
				<h1>Atualiza&ccedil;&atilde;o de planilha</h1>
			</div>
			<form method="post" action="uploadArquivo" enctype="multipart/form-data">
				<input type="file" name="file" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"></input>
				<input type="submit" value="Enviar"></input>
			</form>

			<c:if test="${updated != null}">
				<c:choose>
					<c:when test="${updated.booleanValue()}">
		        		<h2>Planilha atualizada com sucesso!</h2>
		   			 </c:when>
					<c:otherwise>
		        		<h2>Erro ao atualizar a planilha.</h2>
		    		</c:otherwise>
				</c:choose>
			</c:if>

		</div>
	</body>
</html>
