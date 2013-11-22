<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/ico" href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			#title {
					text-align: center;
					color: #000000;
					padding: 12px;
					text-shadow: none;
					font-size: 40px;
				}
		</style>
		
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
				<h1>Entrar</h1>
			</div>
			<div id="demo">
			<form name='f' action="executaAlteracao" method="post">
				<table style="border-width: 0;">
					<tr>
						<td>Número PI do item:</td>
						<td><input type="text" name="j_pi" /></td>
					</tr>
					<tr>
						<th colspan="2">Destino:</th>
					</tr>
					<tr>
						<td>Imóvel:</td>
						<td><input type="text" name="j_imovel" /></td>
					</tr>
					<tr>
						<td>Andar:</td>
						<td><input type="text" name="j_andar" /></td>
					</tr>
					<tr>
						<td>Complemento:</td>
						<td><input type="text" name="j_complemento" /></td>
					</tr>
						
				</table>
				<input type="submit" id="enviar" value="Enviar" />
				<input type="button" id="cancelar" value="Cancelar" />
			</form>
			
			</div>
		</div>

</body>
</html>