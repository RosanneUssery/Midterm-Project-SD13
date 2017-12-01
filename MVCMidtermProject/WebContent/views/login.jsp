<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>

	<%@ include file="header.jsp"%>
</head>
<body id="body-login">
	<%@ include file="navbar.jsp"%>

		<main class="container">

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
		</main>
	<%@ include file="footer.jsp"%>
</body>
</html>