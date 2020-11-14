<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.unip.models.Usuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Usuario usuario = new Usuario();
	if (session.getAttribute("usuario") == null){
		response.sendRedirect("Login.jsp");
	} else {		
		usuario = (Usuario)session.getAttribute("usuario");
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Alterar Senha</title>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="./css/materialize.css" rel="stylesheet" type="text/css">
	<link href="./css/home.css" rel="stylesheet" type="text/css">
	<link href="./css/index.css" rel="stylesheet" type="text/css">
	<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
</head>

<body>
	<%@include file="sidenav.jsp" %>
	<main>
		<h4>Alterar senha</h4>
		<div class="panel-body">
			<form action="EditarUsuarioServlet?modo=alterarSenha" method="post">
				<input type="hidden" value="<%= usuario.getId()%>" name="txtId">
				<div class="row">
					<div class="input-field col s12 m6">
						<label for="senha">Senha Atual:</label>
						<input type="password" class="form-control" name="senha">
					</div>
				</div>

				<div class="row">
					<div class="input-field col s12 m6">
						<label for="novaSenha">Nova Senha:</label>
						<input type="password" class="form-control" name="novaSenha">
					</div>
				</div>
				<!-- APLICAR HASH NAS SENHAS  -->

				<!-- TODO: SOLICITAR SENHA ATUAL E VALIDAR NO BANCO  -->
				<div class="row">
					<div class="col s12 m2">
						<a href="EditarDados.jsp" class="btn grey">Cancelar</a>
					</div>
					<div class="col s12 m2">
						<button type="submit" class="btn green">Atualizar</button>
					</div>
				</div>
			</form>
		</div>
	</main>
	<%@ include file="rodape.html" %>

</body>
<% } %>

</html>