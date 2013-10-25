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
                                
                        } );
                </script>
        </head>
        
        <body id="dt_example">
                
        <div id="header">
                        <a href="home2" style="margin-left: 5%">Tela Inicial</a>
                        <a href="busca" style="margin-left: 5%">Lista de Bens</a>
                        <a href="upload" style="margin-left: 5%">Enviar arquivo</a>
                        <a href="home" style="margin-left: 5%">Sair</a>
                </div>
                
                <div id="container">
                        <div class="full_width big">
                                Sistema de Controle de Patrim&ocirc;nio - Instituto de Computa&ccedil;&atilde;o
                        </div>
                        
                        <div>
                                <h1>Contato</h1>
                        </div>
                        <form method="post" action="uploadArquivo" enctype="multipart/form-data">
                                
                                Nome: <input type="text" name="name"></input>
                                Email: <input type="text" name="email"></input>
                                Assunto: <input type="text" name="subject"></input>
                                Mensagem: <input type="text" name="message"></input>
                                
                                <input type="submit" value="Enviar"></input>
                        </form>

                        <c:if test="${sent != null}">
                                <c:choose>
                                        <c:when test="${sent.booleanValue()}">
                                 <h2>Mensagem enviada com sucesso!</h2>
                                          </c:when>
                                        <c:otherwise>
                                 <h2>Erro ao enviar sua mensagem.</h2>
                                 </c:otherwise>
                                </c:choose>
                        </c:if>

                </div>
        </body>
</html>
