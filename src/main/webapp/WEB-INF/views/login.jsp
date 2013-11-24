<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="shortcut icon" type="image/ico" href="http://www.ic.unicamp.br/themes/siteictheme/logo.png" />
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
			
			
		</style>
		
		<script type="text/javascript" language="javascript" src="media/js/jquery-1.10.2.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/jquery.dataTables.columnFilter.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/bootstrap.js"></script>
		<script type="text/javascript" language="javascript" src="media/js/bootbox.js"></script>
		
		<script>
			$(document).ready(function() {
				$("#inputUsuario").focus();
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
				<h1>Entrar</h1>
			</div>
			
			<c:if test="${erro != null && erro.booleanValue()}">
				<div class="alert alert-danger alert-dismissable fade in">
					<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
        			Combina&ccedil;&atilde;o incorreta. Por favor, verifique usu&aacute;rio e senha.
        		</div>
			</c:if>
			
			<div id="demo">
				<form class="form-horizontal" style="max-width: 30%;" role="form" name='f' 
					  action="j_spring_security_check" method='POST'>
					  
				  <div class="form-group">
				    <label for="inputUsuario" class="col-sm-2 control-label">Usuário</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" placeholder="Usuário" autofocus="autofocus" name="j_username" id="inputUsuario">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputSenha" class="col-sm-2 control-label">Senha</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" placeholder="Senha" name="j_password" id="inputSenha">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				      <input type="submit" id="enviar" value="Entrar" class="btn btn-primary css_right" />
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</body>
</html>
