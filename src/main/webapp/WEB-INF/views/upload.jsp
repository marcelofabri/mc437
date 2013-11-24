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
				$("#inputPlanilha").change(function() {
				    if ($(this).val() != "") {
				    	$("#btnSubmit").removeAttr('disabled');
				    }
				});
				
				<c:if test="${updated != null and updated.booleanValue()}">
					setTimeout(function(){ 
						$(".alert").fadeOut();
					}, 10000);
				</c:if>
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
				<h1>Atualiza&ccedil;&atilde;o de planilha</h1>
			</div>
			
			<c:if test="${updated != null}">
				<c:choose>
					<c:when test="${updated.booleanValue()}">
		        		<div class="alert alert-success alert-dismissable">
						  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						  Planilha atualizada com sucesso!
						</div>
		   			 </c:when>
					<c:otherwise>
						<div class="alert alert-danger alert-dismissable">
						  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						  N&atilde;o foi poss&iacute;vel atualizar a planilha. Que tal tentar novamente?
						</div>
		    		</c:otherwise>
				</c:choose>
			</c:if>
			
			

			<form method="post" action="uploadArquivo" enctype="multipart/form-data" class="form-inline" role="form">
				<div class="form-group">
					<input type="file" id="inputPlanilha" name="file" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"></input>
				</div>
				<input type="submit" id="btnSubmit" value="Enviar" class="btn btn-primary" disabled="disabled"></input>
				
			</form>
		</div>
	</body>
</html>
