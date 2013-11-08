<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
	
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
                                <h1>Contato</h1>
                        </div>
                        
                        <strong>Telefone:</strong> (19) 3521-5885 <br />
                        <strong>Email:</strong> <a href="mailto:patrimonio@ic.unicamp.br">patrimonio@ic.unicamp.br</a>
                </div>
        </body>
</html>
