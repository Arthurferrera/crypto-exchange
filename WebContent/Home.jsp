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
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Crypto Exchange | Home</title>
		<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
		<link href="./css/home.css" rel="stylesheet" type="text/css">
		<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
		
	</head>
	<body>
		<%
			Usuario usuario = (Usuario) session.getAttribute("usuario");
			DashboardInvestimentos dados = new DashboardInvestimentos();
			//dados.setAportesMes("0,00");
			
			
			if(usuario == null) {
				response.sendRedirect("Login.jsp");
			}
			
			UsuarioDAO usuarioDao = new UsuarioDAO();
			
			dados = usuarioDao.pegarValoresInvestimento(usuario.getId());
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			
			dados.setAportesMes(nf.format(new BigDecimal(dados.getAportesMes())));
			dados.setInvestido(nf.format(new BigDecimal(dados.getInvestido())));
			
			
		%>
		<div class="container">
			<%@include file="cabecalho.html" %>
			
			<!-- TODO: PEGAR DADOS DE VALORES DE INVESTIMENTO DO BANCO DE DADOS -->
			
			
			  <div class="row">
			  	<div class="col-md-8">
					<div class="row">
					  	<div class="box-dashboard box-margin-left jumbotron col-sm-5 col-md-5 col-lg-5">
					  		<div style="width: 30%">
						  		<img alt="Carteira" src="./imagens/carteira.png" width="40" height="40">
					  		</div>
					  		<div style="width: 70%">
						    	<h4>Total Carteira</h4>
						    	<h5>R$ 1.560,09</h5>
					  		</div>
					    </div>
					    <div class="box-dashboard jumbotron col-sm-5 col-md-5 col-lg-5">
					    	<div style="width: 30%">
						    	<img alt="Investido" src="./imagens/investido.png" width="40" height="40">
					    	</div>
				    		<div style="width: 70%">
						    	<h4>Investido</h4>
						    	<h5><%= dados.getInvestido() %></h5>
				    		</div>
				    	</div>
					    <!-- <div class="w-100"></div> -->
					    <div class="box-dashboard box-margin-left jumbotron col-sm-5 col-md-5 col-lg-5">
					    	<div style="width: 30%">
						    	<img alt="Caixa" src="./imagens/money.png" width="40" height="40">
					    	</div>
					    	<div style="width: 70%">
						    	<h4>Caixa</h4>
						    	<h5>R$ 1.560,09</h5>
					    	</div>
					    </div>
					    <div class="box-dashboard jumbotron col-sm-5 col-md-5 col-lg-5">
					    	<div style="width: 30%">
						    	<img alt="Aportes" src="./imagens/deposito.png" width="40" height="40">
					    	</div>
					    	<div style="width: 70%">
						    	<h4>Aportes no mes</h4>
						    	<h5><%= dados.getAportesMes() %></h5>
					    	</div>
					    </div>
					</div>			  	
			  	</div>
			  	<div class="col-md-4">
			  		<div class="row">
			  			<div class="jumbotron col-sm-12 col-md-12 col-lg-12">
			  				<div class="row">
			  					<div class="col-sm-12 col-md-12 col-lg-12" style="display: flex; align-items: center">
			  					
					  				<div style="width: 70%">
						  				<h3>Meus Dados</h3>
					  				</div>
					  				
					  				<div style="width: 30%; text-align: right;">
						  				<img alt="Aportes" src="./imagens/perfil.png" width="40" height="40">
					  				</div>
			  					</div>
		  					</div>
			  				
			  				<p>Nome: <%= usuario.getNome() +" "+ usuario.getSobrenome() %></p>
			  				<p>Email: <%= usuario.getEmail() %></p>
			  				
			  				<a class="link-perfil" href="EditarDados.jsp">Editar dados</a>
			  			</div>
			  		</div>
			  	</div>
			    
			  </div>
			<%@ include file="rodape.html" %>
		</div>
	</body>
</html>