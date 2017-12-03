<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- this page should allow the user to update an item
		assume that when the user is sent here, they have permission to update an item
		the item object is named "itemToUpdate"
		form action should direct to processUpdateItem.do
	 -->
	<%@ include file="footer.jsp"%>
</body>
</html>