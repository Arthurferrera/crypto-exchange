<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="br.unip.models.DashboardInvestimentos"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="br.unip.dao.UsuarioDAO"%>
<%@page import="br.unip.models.Usuario"%>
<%@page import="br.unip.models.Investimento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.unip.dao.InvestimentoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<title>Crypto Exchange | Home</title>
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
	<%
			Usuario usuario = (Usuario) session.getAttribute("usuario");
			DashboardInvestimentos dados = new DashboardInvestimentos();
			//dados.setAportesMes("0,00");
			
			
			if(usuario == null) {
				response.sendRedirect("Login.jsp");
			} else {
			
				UsuarioDAO usuarioDao = new UsuarioDAO();
				
				dados = usuarioDao.pegarValoresInvestimento(usuario.getId());
				NumberFormat nf = NumberFormat.getCurrencyInstance();
				
				dados.setAportesMes(nf.format(new BigDecimal(dados.getAportesMes())));
				dados.setInvestido(nf.format(new BigDecimal(dados.getInvestido())));
				dados.setCaixa(nf.format(new BigDecimal(dados.getCaixa())));
				dados.setTotal(nf.format(new BigDecimal(dados.getTotal())));
			
				ArrayList<Investimento> lista = new ArrayList<>();
				InvestimentoDAO contatoDao = new InvestimentoDAO();
				lista = contatoDao.listaInvestimentos(usuario.getId());
		%>
	<%@include file="sidenav.jsp" %>
	<main>
		<div class="content">
			<div class="row shadow-row">
				<div class="col s12 m3">
					<div class="box-dashboard">
						<h6>Total da Carteira</h6>
						<h5><%= dados.getTotal() %></h5>
					</div>
				</div>
				<div class="col s12 m3">
					<div class="box-dashboard">
						<h6>Investido</h6>
						<h5><%= dados.getInvestido() %></h5>
					</div>
				</div>
				<div class="col s12 m3">
					<div class="box-dashboard">
						<h6>Caixa</h6>
						<h5><%= dados.getCaixa() %></h5>
					</div>
				</div>
				<div class="col s12 m3">
					<div class="box-dashboard">
						<h6>Aportes no mês</h6>
						<h5><%= dados.getAportesMes() %></h5>
					</div>
				</div>
			</div>
		</div>
		<div class="content-exchanges">
			<h4>Meus investimentos</h4>
			<div class="my-exchanges">
				<div class="row">
					<div class="col s12">
						<ul>
							<%
									for(Investimento i : lista){
										out.print("<li class='tab col s3'><a href='#investimento"+i.getId()+"'>");
										out.print("<b>"+i.getCodigoAtivo() +"</b> - " +i.getNomeAtivo());
										out.print("</a></li>");
									}
								%>
						</ul>
					</div>
					<%
							for(Investimento i : lista) {
								out.print("<div class='col s12' id='investimento"+i.getId()+"'>");
								out.print(i.getValor_corrente());
								out.print("</div>");
							}
						%>
				</div>
			</div>
		</div>
		</div>
	</main>
	<%@ include file="rodape.html" %>
</body>
<% } %>

</html>