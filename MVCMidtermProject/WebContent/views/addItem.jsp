<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Item</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- this page should display a form for a user to add a new item -->

<!-- ==== This is just an attempt to see how the info in the controller is related to the jsp.=======  -->
	<div class="container">
		<h3>Enter information about the item you'd like to add.</h3>
		
		
		<form action="showAddItem.do" method="get">
				Title: <input type="text" name="title">
			<br>
				Description: <input type="text" name="description">
			<br>
				Owner: <input type="text" name="ownerId">
			<br>
				Want Back?: <input type="text" name="isSupply">
			<br>
				Available?: <input type="text" name="isAvailable">
			<br>
			<br>
			<input class="btn btn-default" type="submit" value="Add Item">
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>