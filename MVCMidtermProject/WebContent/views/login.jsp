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

	<div row="container row">
		<div row="col-sm-12">
			<div class="buttonMiddle">
				<button
					onclick="document.getElementById('id01').style.display='block'"
					style="width: auto;">Login</button>
			</div>
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
				<label><b>Your email</b></label> 
				<input type="text" value="${user.userEmail}" placeholder="Enter Email" name="userEmail" required> 
				<label><b>Password</b></label> 
				<input type="password" value="${user.pwd}" placeholder="Enter Password" name="userPass" required>

				<button type="submit">Login</button>
				<input type="checkbox" checked="checked"> Remember me
				<!-- Make this do something -->

			</div>
			<span id="login_failed">Login Failed. Please try again.</span>
			<!-- create a third box that's hidden that can show the above error on error generation -->
			<div class="container" style="background-color: #f1f1f1">
				<button type="button"
					onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>

			</div>
		</form>

		<!-- <script>
		function check(){
			   if(${user.userEmail}.value = ${user.userEmail} && ${user.pwd}.value = ${user.pwd}) {
			   /* document.getElementById("victory").value == "victory") { */
			        return true;
			   }
			   else {    
			        alert("wrong keyword entry");
			        return false;
			   }
			 }
		</script> -->
	</div>

	<script type="text/javascript">
		var login_success = false; /* set this to true if the login was a success */

		if (login_success == false) {
			document.getElementById("login_failed").innerHTML = "Login Failed.";
		} else {
			window.location = "HomePage";
		}
	</script>


	<%@ include file="footer.jsp"%>
</body>
</html>