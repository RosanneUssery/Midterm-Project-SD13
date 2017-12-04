<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/viv.css">
</head>
<body id="body-login">
	<%@ include file="navbar.jsp"%>

<div row="row">
<div row="col-sm-12">
<div class="buttonMiddle">
	<button onclick="document.getElementById('id01').style.display='block'"
		style="width: auto;">Login</button>
</div>
</div>
</div>
	<div id="id01" class="modal">

		<form class="modal-content animate" action="SOME_RESPONSE.do">
			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="images/rabbits.jpg" alt="Avatar" class="avatar">
			</div>

			<div class="container">
				<label><b>Your email</b></label> <input type="text"  value="${user.userEmail}"
					placeholder="Enter Email" name="userEmail" required> 
				<label><b>Password</b></label>
				<input type="password" value="${user.pwd}" placeholder="Enter Password" name="userPass"
					required>

				<button type="submit">Login</button>
				<input type="checkbox" checked="checked"> Remember me <!-- Make this do something -->
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>
	</div>

	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<%-- <main class="container">

	<div class="row">
		<div class="col-md-6">
			<div class="loginForm">
				<form action="completeLogin.do" method="POST">
					Your email: <input type="text" name="userEmail"
						value="${user.userEmail}" placeholder="email" required> <br>
					<br> Your password: <input type="password" name="userPass"
						value="${user.pwd}" placeholder="password" required> <br>
					<br> <input type="submit" value="Login">

				</form>
				<br>
				<button type="button" class="cancelbtn">Cancel</button>
				<br> <br> <span class="psw"><a href="#">Forgot
						password?</a></span>
			</div>
		</div>

		<div class="col-md-6"></div>
	</div>
	</main> --%>
	<%@ include file="footer.jsp"%>
</body>
</html>