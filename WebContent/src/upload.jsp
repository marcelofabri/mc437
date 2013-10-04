<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="br.unicamp.mc437.Database" %>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="shortcut icon" type="image/ico" href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
		<title>Sistema de Controle de Patrimônio - Instituto de Computação</title>
		
		<style type="text/css" title="currentStyle">
			@import "../media/css/demo_page.css";
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
		</style>
		
		<script type="text/javascript" language="javascript" src="../media/js/jquery-1.10.2.js"></script>
		<script type="text/javascript" language="javascript" src="../media/js/jquery.dataTables.js"></script>
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
			<a href="home.html" style="margin-left: 5%">Home</a>
		</div>
		
		<div id="container">
			<div class="full_width big">
				Sistema de Controle de Patrimônio - Instituto de Computação
			</div>
			
			<div>
				<h1>Atualização de planilha</h1>
			</div>
			<form method="post" action="upload">
				<input type="file" name="filePath" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"></input>
				<input type="submit" value="Enviar"></input>
			</form>
		</div>
	</body>
</html>