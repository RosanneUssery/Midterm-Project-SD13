<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Item Detail</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- this page should display an item's info 
		the item object is named "requestedItem"
		if the user has adequate permissions, a user object corresponding to the item's owner is added; it is named "itemOwner"
		if the user is the owner of the item, a boolean is added to the model to indicate that; it is named "authUserIsItemOwner" and it will be set to true
		
	 -->
	 <%@ include file="footer.jsp"%>
</body>
</html>