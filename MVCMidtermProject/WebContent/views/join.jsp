<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Join the Group</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body id="body-join">
	<%@ include file="navbar.jsp"%>

	<!-- This page should allow the anon user to create an account and log in -->
	<!-- Empty user object is passed in as modelUser -->



<div id ="id02" class="container">
<h2>User Sign Up</h2>
<br>
<br>
	<c:choose>

		<c:when test="${newUserDTO != null }">
			<form:form action="processJoin.do" method="post"
				modelAttribute="newUserDTO">

				<div class="form-row">
					<div class="form-group col-md-12">
						<label>Email:</label>
						<form:input path="email" />
						<label>Password:</label>
						<form:password path="pwd" />
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-12">
						<label>First Name:</label>
						<form:input path="firstName" />
						<label>Last Name:</label>
						<form:input path="lastName" />
						<label>Phone:</label>
						<form:input path="phone" />
					</div>
				</div>
				<div class="form-group col-md-12">
				<label>Street</label>
				<form:input path="street" />
				<label>City</label>
				<form:input path="city" />
				<label>State</label>
				<form:input path="state" />
				<label>Zip</label>
				<form:input path="zip" />
				</div>
				<input type="submit" value="Submit">

			</form:form>



		</c:when>

	</c:choose>
</div>

	
	
 

	
	


	<%@ include file="footer.jsp"%>
</body>
</html>