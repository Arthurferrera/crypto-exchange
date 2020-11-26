<%@page import="br.unip.models.Investimento"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.unip.dao.InvestimentoDAO"%>
<%@page import="br.unip.models.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Usuario usuario = (Usuario) session.getAttribute("usuario");
			
			
	if(usuario == null) {
		response.sendRedirect("Login.jsp");
	} else {
		
		ArrayList<Investimento> lista = new ArrayList<>();
		InvestimentoDAO contatoDao = new InvestimentoDAO();
		lista = contatoDao.listaInvestimentos(usuario.getId());
		
		
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<title>Crypto Exchange | Meus Investimentos</title>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="./css/materialize.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="./css/meusInvestimentos.css">
	<!-- <link href="./css/home.css" rel="stylesheet" type="text/css"> -->
	<link href="./css/index.css" rel="stylesheet" type="text/css">
	<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
	</head>
<body>
	<%-- <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-investimentos">
	  <div class="container">
	  	<img alt="logo" width="65" height="65" src="imagens/logo-pim.png">
	    <a class="navbar-brand" style="float: none; margin-left: 20px;" href="#">Meus Investimentos</a>
	  </div>
	</nav>
	
    <div class="container">
	    <div class="row">
	    	<div class="col-md-4">
				<div class="list-group" id="myList" role="tablist">
					<%
						for(Investimento i : lista){
							out.print("<a class='list-group-item list-group-item-action' data-toggle='list' href='#investimento"+i.getId()+"' role='tab'>");
							out.print("<b>"+i.getCodigoAtivo() +"</b> - " +i.getNomeAtivo());
							out.print("</a>");
						}
					%>
				</div>
	    	</div>

			<div class="col-md-8">
				<div class="tab-content">
					<%
						for(Investimento i : lista) {
							out.print("<div class='tab-pane' id='investimento"+i.getId()+"' role='tabpanel'>");
							out.print(i.getValor_corrente());
							out.print("</div>");
						}
					%>
				</div>
			</div>
		</div>
    </div> --%>
    <%@include file="sidenav.jsp" %>
	<main>
		<div class="content-exchanges">
			<h4>Meus investimentos</h4>
			<div class="my-exchanges">
				<div class="row">
					<div class="col s4">
						<ul class="tabs">
							<%
									for(Investimento i : lista){
										out.print("<li class='tab col s12'><a href='#investimento"+i.getId()+"'>");
										out.print("<b>"+i.getCodigoAtivo() +"</b> - " +i.getNomeAtivo());
										out.print("</a></li>");
									}
								%>
						</ul>
					</div>
					<!-- <div class='col s8' id='1'>
						<div class="row box-details">
							<div class="col s6 center">
								<h6 class="label-investimento">Código do Ativo</h6>
								<p>LTC</p>
							</div>
							<div class="col s6 center">
								<h6 class="label-investimento">Nome do Ativo</h6>
								<p>LitCoin</p>
							</div>
							<div class="col s6 center">
								<h6 class="label-investimento">Data do primeiro investimento</h6>
								<p>10/11/2020</p>
							</div>
							<div class="col s6 center">
								<h6 class="label-investimento">Data do último investimento</h6>
								<p>10/11/2020</p>
							</div>
							<div class="col s4 center">
								<h6 class="label-investimento">Resgatado</h6>
								<p>Sim</p>
							</div>
							<div class="col s4 center">
								<h6 class="label-investimento">Qtd. Posições</h6>
								<p>30 un.</p>
							</div>
							<div class="col s4 center">
								<h6 class="label-investimento">Valor Corrente</h6>
								<p>R$ 7,00</p>
							</div>
						</div>		
					</div> -->
					<%
							for(Investimento i : lista) {
								include page="rodape.html";
							/* 	out.print("<div class='col s8' id='investimento"+i.getId()+"'>");
								out.print(i.getValor_corrente());
								out.print("</div>"); */
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