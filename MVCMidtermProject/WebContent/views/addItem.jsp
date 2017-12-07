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

	<div class="container">
		<h3>Enter information about the item you'd like to add.</h3>
		
		<form:form action = "processAddItem.do" method = "post" modelAttribute = "modelItem">
			Name of item:
			<form:input path="title" />
			Description of item:
			<form:input path="description" />
			Is this item a supply of an expendable item? (Example: seed, medicine)
			<form:checkbox path = "isSupply" />
			<br>
			Is this item available for others to request?
			<form:checkbox path = "isAvailable" />
			<br>
			<input type="submit" value="Submit">
		</form:form>
		
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>