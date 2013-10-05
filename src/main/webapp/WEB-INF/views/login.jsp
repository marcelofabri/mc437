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
		<script>
		$(function($){
			 
		    // No id #enviar assim que clicar executa a função
		    $('#form').submit(function(event){
		 
		    	event.preventDefault();
		    /* veja que eu criei variáveis para guardar os item
		     * e só precisei usar a função val() para
		     * retornar o valor dos campo para a várivel
		     */
		        var nome = $('#username').val();
		        var senha = $('#password').val();
		        if (nome == "geronimo" && senha == "mc437"){
		        	window.location.replace("./home2.html");
		        } else {
		        	window.location.replace("./erro.html");
		        }
		        return false;
		    });
		});
		</script>
		
	</head>
	
	<body id="dt_example">
		
		<div id="header">
			<a href="home.html" style="margin-left: 5%">Home</a>
			<a href="login.jsp" style="margin-left: 5%">Login</a>
		</div>
		
		<div id="container">
			<div class="full_width big">
				Sistema de Controle de Patrimônio - Instituto de Computação
			</div>
			<div>
				<h1>Login</h1>
			</div>
			<div id="demo">
			<form id="form">
				<table style="border-width: 0;">
					<tr>
						<td>Login:</td>
						<td><input type="text" id="username" /></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type="password" id="password" /></td>
					</tr>	
				</table>
				<input type="submit" id="enviar" value="Entrar" />
			</form>
			
			</div>
		</div>
	</body>
</html>