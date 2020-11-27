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
					<%
							for(Investimento i : lista) {
								String resgate = "Não";
								if(i.getResgatado() == 1){
									resgate = "Sim";
								}
								
								String item = "<div class='col s8' id='investimento"+i.getId()+"'>"+
								"<div class='row box-details'>"+
										"<div class='col s6 center'>"+
										"	<h6 class='label-investimento'>Código do Ativo</h6>"+
										"	<p>"+i.getCodigoAtivo()+"</p>"+
										"</div> "+
										"<div class='col s6 center'>"+
											"<h6 class='label-investimento'>Nome do Ativo</h6>"+
											"<p>"+i.getNomeAtivo()+"</p>"+
										"</div> "+
										"<div class='col s6 center'>"+
											"<h6 class='label-investimento'>Data do primeiro investimento</h6>"+
											"<p>"+i.getData_criacao()+"</p>"+
										"</div> "+
										"<div class='col s6 center'>"+
											"<h6 class='label-investimento'>Data do último investimento</h6>"+
											"<p>"+i.getData_atualizacao()+"</p>"+
										"</div> "+
										"<div class='col s4 center'>"+
											"<h6 class='label-investimento'>Resgatado</h6>"+
											"<p>"+resgate+"</p>"+
										"</div> "+
										"<div class='col s4 center'>"+
											"<h6 class='label-investimento'>Qtd. Posições</h6>"+
											"<p>"+i.getQuantidade()+" un.</p>"+
										"</div> "+
										"<div class='col s4 center'>"+
											"<h6 class='label-investimento'>Valor Corrente</h6>"+
											"<p>R$ "+i.getValor_corrente()+",00</p>"+
										"</div> "+
									"</div> "+
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