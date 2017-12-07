<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<%@ include file="header.jsp"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="css/login.css">
</head>
<body id="body-login">
	<%@ include file="navbar.jsp"%>
	<div class="movingStuff">
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-xl-5"></div>
			<div class="col-xl-1 buttonMiddle">
				<button
					onclick="document.getElementById('id01').style.display='block'"
					style="width: auto;">Login</button>
			</div>
			<div class="col-xl-3"></div>
		</div>
	</div>
	<div id="id01" class="modal">

		<form class="modal-content animate" action="completeLogin.do" method="post">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="images/rabbits.jpg" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label><b>Your email</b></label> <input type="text"
					value="${user.userEmail}" placeholder="Enter Email"
					name="userEmail" required> <label><b>Password</b></label> <input
					type="password" value="${user.pwd}" placeholder="Enter Password"
					name="userPass" required>

				<button type="submit">Login</button>


			</div>
			<!-- create a third box that's hidden that can show the above error on error generation -->
			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
				<!-- <span class="psw">Forgot <a href="#">password?</a></span> -->

			</div>
		</form>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>