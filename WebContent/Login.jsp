<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Crypto Exchange | Login</title>
		<link href="./css/login.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="container">
	    	<div class="titulo-page">
	    		<img class="logo-login" alt="logo" width="65" height="65" src="imagens/logo-pim.png">
					<!-- <span style="margin-left: 20px">
						<strong>Crypto Exchange</strong>
					</span> -->
	    		Crypto Exchange
	    	</div>
	    	
		    <div class="content">      
		      <!--FORMULÁRIO DE LOGIN-->
		      <div id="login">
		        <form action="LoginServlet" method="post"> 
		          <h2>Login</h2> 
		          <p> 
		            <label for="email">Seu e-mail</label>
		            <input id="email" name="email" type="text" placeholder=""/>
		          </p>
		          
		          <p> 
		          <!-- required="required" -->
		            <label for="senha">Sua senha</label>
		            <input id="senha" name="senha"  type="password" placeholder="" /> 
		          </p>
		          
		          <p> 
		            <input class="btn-login" type="submit" value="Logar" /> 
		          </p>
		          
		        </form>
		        <%
		        	String email = request.getParameter("email");
            		String senha = request.getParameter("senha");
		            		
            		if(email != null && senha != null 
            			&& !email.isEmpty() && !senha.isEmpty()) {
            			
            			session.setAttribute("usuario", email);
            			response.sendRedirect("Home.jsp");
            		}
		        %>
		      </div>
		    </div>
	  	</div> 
	</body>
</html>