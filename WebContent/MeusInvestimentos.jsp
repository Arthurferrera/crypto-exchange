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
	<link rel="stylesheet" type="text/css" href="./css/meusInvestimentos.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.15/jquery.mask.js"></script>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<title>Meus Investimentos</title>
	</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-investimentos">
	  <div class="container">
	    <a class="navbar-brand" href="#">Meus Investimentos</a>
	  </div>
	</nav>
	
    <div class="container">
	    <div class="row">
	    	<div class="col-md-5">
				<div class="list-group" id="myList" role="tablist">
					<%
						for(Investimento i : lista){
							out.print("<a class='list-group-item list-group-item-action' data-toggle='list' href='#investimento"+i.getId()+"' role='tab'>");
							out.print(i.getAtivo_id());
							out.print("</a>");
						}
					%>
				</div>
	    	</div>

			<div class="col-md-5">
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
    </div>
</body>
<% } %>
</html>