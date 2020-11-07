<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.unip.models.Usuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%	
		Usuario u = new Usuario();
		if (session.getAttribute("usuario") == null){
			response.sendRedirect("Login.jsp");
		} else {
			u = (Usuario) session.getAttribute("usuario");
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
	%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Meu Perfil</title>
		<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
		<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
	</head>
	<body>
		<div class="container" style="box-shadow: 3px 3px 5px 5px gray; border-radius:6px; border:3px inset;">		
			
					<%@include file="cabecalho.html" %>	
					
					<div class="row">			
						<div class="col-md-8 col-sm-12 col-lg-8 col-lg-offset-2 col-md-offset-2 ">
							<div class="panel panel-success">
								<div class="panel-heading">Dados Usuário</div>
								<div class="panel-body">
								<form action="EditarUsuarioServlet?modo=alterar" method="post">
									<input type="hidden" value="<%= u.getId()%>" name="txtId">
									<div class="form-group">
								    	<label for="nome">Nome:</label>
								    	<input type="text" class="form-control" name="nome" value="<%= u.getNome()%>">
								  	</div>
								  	<div class="form-group">
								    	<label for="sobrenome">Sobremome:</label>
								    	<input type="text" class="form-control" name="sobrenome" value="<%= u.getSobrenome()%>">
								  	</div>
									<div class="form-group">
								    	<label for="email">E-mail:</label>
								    	<input type="email" class="form-control" name="email" value="<%= u.getEmail()%>">
								  	</div>
									<div class="form-row">
									  	<div style="padding:0;" class="form-group col-md-6">
									    	<label for="cidade">Cidade:</label>
											<input type="text" class="form-control" name="cidade" value="<%= u.getCidade()%>">
										</div>
										<div class="form-group col-md-6">
										    <label for="data_nascimento">Data Nasc.:</label>
											<input type="date" class="form-control" name="data_nascimento" value="<%= u.getDtNasc()%>">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group col-md-6" style="padding:0px;">
									    	<label for="celular">Celular:</label>
									    	<input type="tel" class="form-control" name="celular" value="<%= u.getCelular()%>">
									  	</div>
										<div class="form-group col-md-6">
									    	<label for="estado">Estado:</label>
									    	<input type="text" class="form-control" name="estado" value="<%= u.getEstado()%>">
									  	</div>
								  	</div>
								  	
								  	<div class="form-row text-right">
										<button type="submit" class="btn btn-success">Atualizar</button>		
										<a href="Home.jsp" class="btn btn-warning">Cancelar</a> 
										<a href="AlterarSenha.jsp" class="btn btn-succes">Alterar Senha</a>
								  	</div>
						  	
								</form>
								</div>
							</div>
						</div>
					</div>
					
					<%@ include file="rodape.html" %>
					
				</div>
	</body>
	<% } %>
</html>