<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				  <a class="list-group-item list-group-item-action active" data-toggle="list" href="#home" role="tab">Home</a>
				  <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Profile</a>
				  <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Messages</a>
				  <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Settings</a>
				</div>
	    	</div>

			<div class="col-md-5">
				<div class="tab-content">
	  				<div class="tab-pane active" id="home" role="tabpanel">.a.</div>
	  				<div class="tab-pane" id="profile" role="tabpanel">.s.</div>
	  				<div class="tab-pane" id="messages" role="tabpanel">v..</div>
	  				<div class="tab-pane" id="settings" role="tabpanel">.g.</div>
				</div>
			</div>
		</div>
    </div>
</body>
</html>