<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Microsanctuary Equipment Exchange</title>
<%@ include file="header.jsp"%>

<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> 
		<a class="navbar-brand" href="views/HomePage.jsp" target="_blank"> 
			<img src="images/chickenicon.jpeg" width="30" height="30" class="d-inline-block align-top" alt="microsanctuary logo">
			Microsanctuary Equipment Exchange
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="index.do">Home</a>
				</li>
	
	
				<!-- when a loggin process has been completed hide these buttons -->
				<!-- <div hiddenloggedIn class="login-user state-hidden"> -->
				<li>
					<a href="showSearchPage.do">
						<span class="glyphicon glyphicon-user"></span>
						Borrow
					</a>
				</li>
				<li>
					<a href="#">Lend</a>
				</li>
				<li>
					<a href="">Requests</a>
				</li>
	
				<!-- </div> -->
				<!-- request button requires a boolean value -->
	
			</ul>
			<ul class="nav navbar-nav navbar-right">
	
				<!-- when a a sign up and loggin is successful use a process to hide sign up and toggle log in to log out-->
				
				<c:if test="${sessionScope.loggedIn == false}">
					<li>
						<a href="getNewUser.do">
							<span class="glyphicon glyphicon-user"></span> 
							Sign Up
						</a>
					</li>
					<li>
						<a href="showLogin.do">
							<span class="glyphicon glyphicon-log-in"></span> 
							Login
						</a>
					</li>
				</c:if>
	
	
	
			</ul>
			<a class="btn btn-social btn-facebook" href="https://www.facebook.com/Microsanctuary/" target="_blank" title="Colorado Microsanctuary Network Facebook"> 
				<span class="fa fa-facebook"></span> 
				Microsanctuary FB
			</a>
		</div>

	</nav>





</body>
</html>

