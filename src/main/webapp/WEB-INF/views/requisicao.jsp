<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" type="image/ico" href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o</title>
<script type="text/javascript" language="javascript" src="media/js/jquery-1.10.2.js"></script>
<script type="text/javascript" language="javascript" src="media/js/bootstrap.js"></script>
<script type="text/javascript" language="javascript" src="media/js/bootbox.js"></script>
<script type="text/javascript">

<c:if test="${updated != null and updated.booleanValue()}">
	setTimeout(function(){ 
		$(".alert").fadeOut();
	}, 2000);
</c:if>
</script>
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
		
<script type="text/javascript">
function alerta(campo)
{
	var c = document.getElementById(campo);
	var a = document.getElementById("valErro");
	if (c.value == "")
		a.style.visibility = "visible";
	else
		a.style.visibility = "hidden";
}

function verifica()
{
	if (document.getElementById("j_pi").value == "" ||
			document.getElementById("j_imovel").value == "" ||
			document.getElementById("j_andar").value == "" ||
			document.getElementById("j_complemento").value == "")
	{
		document.getElementById("valErro").style.visibility = "visible";
		return false;
	}
	document.getElementById("valErro").style.visibility = "hidden";
	return true;
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
				<h1>Fazer requisi&ccedil;&atilde;o</h1>
			</div>
			<div id="demo">
			<c:if test="${updated != null}">
				<c:choose>
					<c:when test="${updated.booleanValue()}">
		        		<div class="alert alert-success alert-dismissable fade in">
		        			<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		        			Requisi&ccedil;&atilde;o realizada com sucesso!
		        		</div>
		   			 </c:when>
					<c:otherwise>
						<div class="alert alert-danger alert-dismissable fade in">
							<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		        			N&atilde;o foi poss&iacute;vel realizar a requisi&ccedil;&atilde;o.
		        		</div>
		    		</c:otherwise>
				</c:choose>
			</c:if>
			<div class="alert alert-danger alert-dismissable fade in" id="valErro" style="visibility: hidden;">
				<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
		      			Todos os campos devem ser preenchidos.
		   	</div>
		     
			<form name='f' action="executaAlteracao" method="post" onsubmit="return verifica();">
				<table>
					<tr>
						<td>Número PI do item</td>
						<td><input type="text" id="j_pi" name="j_pi" class="form-control long" placeholder="Número PI do item" onblur="alerta('j_pi');" /></td>
					</tr>
					<tr>
						<td colspan="2"><h2>Destino</h2></td>
					</tr>
					<tr>
						<td>Imóvel</td>
						<td><input type="text" id="j_imovel" name="j_imovel" class="form-control long" placeholder="Imóvel"  onblur="alerta('j_imovel');" /></td>
					</tr>
					<tr>
						<td>Andar</td>
						<td><input type="text" id="j_andar" name="j_andar" class="form-control long" placeholder="Andar"  onblur="alerta('j_andar');" /></td>
					</tr>
					<tr>
						<td>Complemento</td>
						<td><input type="text" id="j_complemento" name="j_complemento" class="form-control long" placeholder="Complemento"  onblur="alerta('j_complemento');" /></td>
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