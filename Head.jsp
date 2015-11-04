<html lang="pt-br">


	<head>
		<%@ page import="sismovies.entities.*, sismovies.controllers.*, sismovies.daoclasses.*, servlets.*, java.io.*, java.util.*, 
		java.sql.*, java.lang.*"%>
		<link rel="stylesheet" href="js_css/jquery-ui.css">
  <script src="js_css/jquery.js"></script>
  <script src="js_css/jquery-ui.js"></script>
  <script src="js_css/cadastroFilme.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
  <link href='https://fonts.googleapis.com/css?family=Poiret+One|Dosis|Oxygen|Alegreya+Sans' rel='stylesheet' type='text/css'>
  <script>
  $(function() {
    $( "#inputBirthDate" ).datepicker({
    	dateFormat: "yy-mm-dd",
    	changeYear: true	
    });
  });
  </script>


  	<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="js_css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="js_css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="js_css/bootstrap.min.js"></script>

<link rel="stylesheet" href="js_css/sismovie.css">
<link rel="stylesheet" href="js_css/filmes.css">
<link rel="stylesheet" href="js_css/detalhefilme.css">
<link rel="stylesheet" href="js_css/userdetails.css">
<link rel="stylesheet" href="js_css/notificacoes.css">
	</head>

	<body class="container"> 
		<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
		<%@page contentType="text/html;charset=UTF-8"%>
		
		<%
			CentralFacade centralFacade = (CentralFacade) request.getSession().getAttribute("centralfacade");
			
			if(centralFacade == null){
				%>
				<h1>facade nulo</h1>
				<%

			}

			

		%>


		<% 
			if(centralFacade.getLoggedUser() == null){
				%>
					<%@ include file="login_cadastro.jsp" %>
				<%
			}
			else{
				%>
					<%@ include file="perfil.jsp" %>
				<%
			}

		%>

		