<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.unip.models.Usuario"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%	
		Usuario usuario = new Usuario();
		if (session.getAttribute("usuario") == null){
			response.sendRedirect("Login.jsp");
		} else {
			usuario = (Usuario) session.getAttribute("usuario");
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		
	%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Meu Perfil</title>
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
		<h4>Meus dados</h4>
		<form action="EditarUsuarioServlet?modo=alterar" method="post">
			<input type="hidden" value="<%= usuario.getId()%>" name="txtId">
			<div class="row">
				<div class="input-field col s12 m3">
					<label for="nome">Nome:</label>
					<input type="text" class="form-control" name="nome" value="<%= usuario.getNome()%>">
				</div>
				<div class="input-field col s12 m3">
					<label for="sobrenome">Sobremome:</label>
					<input type="text" class="form-control" name="sobrenome" value="<%= usuario.getSobrenome()%>">
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m6">
					<label for="email">E-mail:</label>
					<input type="email" class="form-control" name="email" value="<%= usuario.getEmail()%>">
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m3">
					<label for="cidade">Cidade:</label>
					<input type="text" class="form-control" name="cidade" value="<%= usuario.getCidade()%>">
				</div>
				<div class="input-field col s12 m3">
					<label for="estado">Estado:</label>
					<input type="text" class="form-control" name="estado" value="<%= usuario.getEstado()%>">
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m6">
					<label for="data_nascimento">Data Nasc.:</label>
					<input type="date" class="form-control" name="data_nascimento" value="<%= usuario.getDtNasc()%>">
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12 m3">
					<label for="celular">Celular:</label>
					<input type="tel" class="form-control" name="celular" value="<%= usuario.getCelular()%>">
				</div>
			</div>

			<div class="row">
				<div class="col s12 m2">
					<a href="Home.jsp" style="width:100%;" class="btn grey">Cancelar</a>
				</div>
				<div class="col s12 m3">
					<a href="AlterarSenha.jsp" style="width:100%;" class="btn orange">Alterar Senha</a>
				</div>
				<div class="col s12 m2">
					<button type="submit" style="width:100%;" class="btn green">Salvar</button>
				</div>

			</div>

		</form>
	</main>
	<%@ include file="rodape.html" %>

</body>
<% } %>

</html>