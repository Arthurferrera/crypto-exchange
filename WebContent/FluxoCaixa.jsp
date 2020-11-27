<%@page import="br.unip.models.Extrato"%>
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
		
		ArrayList<Extrato> lista = new ArrayList<>();
		InvestimentoDAO contatoDao = new InvestimentoDAO();
		lista = contatoDao.getExtrato(usuario.getId());
		
		
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<title>Crypto Exchange | Fluxo de caixa</title>
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="./css/materialize.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="./css/meusInvestimentos.css">
	<link href="./css/index.css" rel="stylesheet" type="text/css">
	<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
	</head>
<body>
    <%@include file="sidenav.jsp" %>
	<main>
		<div class="content-exchanges">
			<h4>Fluxo de caixa</h4>
			<div class="row center">
				<div class="col s12">
					<h5>Extrato geral</h5>
				</div>
			</div>
			
			<div class="row center">
				<style>
					.row-title {
						font-size: 16px;
						font-weight: 900;
						border-bottom: 1px solid #007e92;
						padding: 10px;
					}
					.item-extrato {
						background-color: #FFF;
						border: 1px solid #007e92;
					}
					.resgate {
						color: #bf1900;
					}
					.aporte {
						color: #00ba03;
					}
				</style>
				<div class="col-md-8 col-md-offset-2 item-extrato">
					<div class="row row-title">
						<div class="col-md-6">
							<strong>Data e Hora da transação</strong>
						</div>
						<div class="col-md-6">
							<strong>Valor (R$)</strong>
						</div>
					</div>
					<%
							for(Extrato e : lista) {
								String classe = "resgate";
								String sinal = "";
								if(e.getResgatado() == 0) {
									classe = "aporte";
								} else {
									sinal = "-";
								}
								String item = "<div class='row'>"+
												"<div class='col-md-6'>"+
													e.getData_criacao()+""+
												"</div>"+
												"<div class='col-md-6 "+classe+"'>"+
													sinal + " R$ " +e.getValor()+ "" +
												"</div>"+
											"</div>";
								out.print(item);
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