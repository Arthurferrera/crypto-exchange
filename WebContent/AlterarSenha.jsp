<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.unip.models.Usuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Usuario u = new Usuario();
	if (session.getAttribute("usuario") == null){
		response.sendRedirect("Login.jsp");
	} else {		
		u = (Usuario)session.getAttribute("usuario");
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	}
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Alterar Senha</title>
		<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
		<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
	</head>
	<body>
		<div class="container" style="box-shadow: 3px 3px 5px 5px gray; border-radius:6px; border:3px inset;">		
			
			<%@include file="cabecalho.html" %>	
			
			<div class="row">			
				<div class="col-md-10 col-md-offset-1">
					<div class="panel panel-success">
						<div class="panel-heading">Alterar Senha</div>
						<div class="panel-body">
						<form action="EditarUsuarioServlet?modo=alterarSenha" method="post">
							<input type="hidden" value="<%= u.getId()%>" name="txtId">
							
							<div class="form-group">
						    	<label for="senha">Senha Atual:</label>
						    	<input type="password" class="form-control" name="senha">
						  	</div>
						  	
						  	
							<div class="form-group">
						    	<label for="novaSenha">Nova Senha:</label>
						    	<input type="password" class="form-control" name="novaSenha">
						  	</div>
						  	<!-- APLICAR HASH NAS SENHAS  -->
						  	
						  	<!-- TODO: SOLICITAR SENHA ATUAL E VALIDAR NO BANCO  -->
						  	
							<button type="submit" class="btn btn-success">Atualizar</button>		
							<a href="EditarDados.jsp" class="btn btn-warning">Cancelar</a> 
						</form>
						</div>
					</div>
				</div>
			</div>
			
			<%@ include file="rodape.html" %>
			
		</div>	
	</body>
</html>