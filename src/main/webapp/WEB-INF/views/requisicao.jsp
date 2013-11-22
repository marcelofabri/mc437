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
			@import "media/css/bootstrap.css";
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
				
			
			td, tr {
				font-weight: bold;
				padding: 5px;
			}
			
			.long {
				width: 330px;			
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
				<h1>Fazer requisi&ccedil;&atilde;o</h1>
			</div>
			<div id="demo">
			<form name='f' action="executaAlteracao" method="post">
				<table>
					<tr>
						<td>Número PI do item</td>
						<td><input type="text" name="j_pi" class="form-control long" placeholder="Número PI do item" /></td>
					</tr>
					<tr>
						<td colspan="2"><h2>Destino</h2></td>
					</tr>
					<tr>
						<td>Imóvel</td>
						<td><input type="text" name="j_imovel" class="form-control long" placeholder="Imóvel" /></td>
					</tr>
					<tr>
						<td>Andar</td>
						<td><input type="text" name="j_andar" class="form-control long" placeholder="Andar" /></td>
					</tr>
					<tr>
						<td>Complemento</td>
						<td><input type="text" name="j_complemento" class="form-control long" placeholder="Complemento" /></td>
					</tr>
						
					<tr>
						<td colspan="2" style="text-align: right;">
							<input type="button" id="cancelar" value="Cancelar" class="btn btn-default" />&nbsp;
							<input type="submit" id="enviar" value="Enviar" class="btn btn-primary" />
						</td>
					</tr>
				</table>
				
			</form>
			
			</div>
		</div>

</body>
</html>