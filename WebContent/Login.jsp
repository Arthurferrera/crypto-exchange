<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Crypto Exchange | Login</title>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="./css/materialize.css" rel="stylesheet" type="text/css">
	<link href="./css/login.css" rel="stylesheet" type="text/css">
	<link href="./css/index.css" rel="stylesheet" type="text/css">
	<link rel="icon" type="image/png" href="./imagens/logo-pim.png">
</head>

<body>
	<div class="container-center">
		<div class="titulo-page">
			<img class="logo-login" alt="logo" width="65" height="65" src="imagens/logo-pim.png">
			<p>Crypto Exchange</p>
		</div>
		<!--FORMULÁRIO DE LOGIN-->
		<form class="container container-form" action="LoginServlet" method="post">
			<h2>Login</h2>
			<div class="row">
				<div class="input-field col s12">
					<label for="email">Seu e-mail</label>
					<input required="required" id="email" name="email" type="text" placeholder="" />
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<label for="senha">Sua senha</label>
					<input required="required" id="senha" name="senha" type="password" placeholder="" />
				</div>
			</div>
			<input class="waves-effect waves-light btn btn-login" type="submit" value="Logar" />
		</form>
	</div>
	<script type="text/javascript" src="./js/materialize.min.js"></script>
</body>

</html>