<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
	
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
						$('form input, form textarea').keyup(function() {
					        var empty = false;
					        $('form input, form textarea').each(function() {
					            if ($(this).val() == '') {
					                empty = true;
					            }
					        });
	
					        if (empty) {
					            $('#enviar').attr('disabled', 'disabled'); 
					        } else {
					            $('#enviar').removeAttr('disabled'); 
					        }
					    });
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
                        
                        <h1>Contato</h1>
                        
                        <strong>Telefone:</strong> (19) 3521-5885 <br />
                        <strong>Email:</strong> <a href="mailto:patrimonio@ic.unicamp.br">patrimonio@ic.unicamp.br</a>
                        
                        <sec:authorize access="hasRole('ROLE_USER')">
                        
	                        <div id="demo">
	                        	<h1>Fale Conosco</h1>
	                        	
	                        	<c:if test="${updated != null}">
									<c:choose>
										<c:when test="${updated.booleanValue()}">
							        		<div class="alert alert-success alert-dismissable fade in">
							        			<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
							        			Mensagem enviada com sucesso!
							        		</div>
							   			 </c:when>
										<c:otherwise>
											<div class="alert alert-danger alert-dismissable fade in">
												<a class="close" data-dismiss="alert" href="#" aria-hidden="true">&times;</a>
							        			N&atilde;o foi poss&iacute;vel enviar a mensagem.
							        		</div>
							    		</c:otherwise>
									</c:choose>
								</c:if>
				
								<form class="form-horizontal" style="max-width: 50%;" role="form" name='f' 
									  action="contato" method='POST' accept-charset="UTF-8">
									  
								  <div class="form-group">
								    <label for="inputNome" class="col-sm-2 control-label">Nome</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" placeholder="Nome" autofocus="autofocus" name="nome" id="inputNome">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
								    <div class="col-sm-10">
								      <input type="email" class="form-control" placeholder="Email" name="email" id="inputEmail">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputAssunto" class="col-sm-2 control-label">Assunto</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" placeholder="Assunto" name="assunto" id="inputAssunto">
								    </div>
								  </div>
								  <div class="form-group">
								    <label for="inputMensagem" class="col-sm-2 control-label">Mensagem</label>
								    <div class="col-sm-10">
								      <textarea class="form-control" rows="5" name="mensagem" id="inputMensagem" placeholder="Mensagem"></textarea>
								    </div>
								  </div>
								  <div class="form-group">
								    <div class="col-sm-offset-2 col-sm-10">
								      <input type="submit" id="enviar" value="Enviar" class="btn btn-primary css_right" disabled="disabled" />
								    </div>
								  </div>
								</form>
							</div>
						</sec:authorize>
                </div>
        </body>
</html>
