<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="br.unip.models.DashboardInvestimentos"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="br.unip.dao.UsuarioDAO"%>
<%@page import="br.unip.models.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<ul id="slide-out" class="sidenav sidenav-fixed">
	<li>
		<div class="card-user">
			<img alt="Aportes" src="./imagens/perfil.png" width="40" height="40">
			<h6><%= usuario.getNome() +" "+ usuario.getSobrenome() %></h6>
			<p><%= usuario.getEmail() %></p>
			<a class="link-perfil" href="EditarDados.jsp">Editar dados</a>
		</div>
	</li>
	<li><a href="Home.jsp">Home</a></li>
	<li><a href="MeusInvestimentos.jsp">Meus Investimentos</a></li>
	<li><a href="FluxoCaixa.jsp">Fluxo de Caixa</a></li>
	<li><a href="Deslogar.jsp" style="color: #007e92">Sair</a></li>
</ul>
<a href="#" data-target="slide-out" class="sidenav-trigger"><i class="material-icons">menu</i></a>