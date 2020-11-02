<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Crypto Exchange | Login</title>
		<link href="./css/login.css" rel="stylesheet" type="text/css">
		<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
		<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
	</head>
	<body>
    	<div class="titulo-page">
    		<img class="logo-login" alt="logo" width="65" height="65" src="imagens/logo-pim.png">
    		Crypto Exchange
    	</div>
		<div class="container">
	    	
		    <div class="content">
		      <!--FORMULÁRIO DE LOGIN-->
		      	<div id="login">
			      	<form action="LoginServlet" method="post"> 
			        	<h2>Login</h2> 
			          	<p>
			        		<label for="email">Seu e-mail</label>
				            <input required="required" id="email" name="email" type="text" placeholder=""/>
			          	</p>
				          
			        	 <p>
				            <label for="senha">Sua senha</label>
				            <input required="required" id="senha" name="senha"  type="password" placeholder="" /> 
				         </p>
				          
				         <p> 
				            <input class="btn-login" type="submit" value="Logar" /> 
				         </p>
			        </form>
			        <% 
			        	
			        %>
     			</div>
	   	  	</div>
	  	</div> 
	</body>
</html>