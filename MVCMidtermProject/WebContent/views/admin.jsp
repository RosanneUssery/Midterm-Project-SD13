<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator Page</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- should show links to actions admins can take on lists of items, users (and associated logins and addresses) 
		update user info by id
		update item by id
		update item by user
	-->
	<c:if test="${not empty allUsers}">
		<form action="showAdminUpdateUser.do" method="get">
			<select name="userId">
				<c:forEach items="${allUsers}" var="user">
					<option value="${user.id}" label="${user.firstName} ${user.lastName}">
				</c:forEach>
			</select>
			<input type="submit" value="Show User Info">
		</form>
	</c:if>
	<c:if test="${not empty allItems}">
	<table>
		<thead>
			<th>Item ID</th>
			<th>Owner</th>
			<th>Item Name</th>
			<th>Item Description</th>
			<th>Supply?</th>
			<th>Available?</th>
		</thead>
		<c:forEach items="${allItems}" var="item">
			<tr>
				<td>${item.id}</td>
				<td>${item.owner.firstName} ${item.owner.lastName}</td>
				<td>${item.title}</td>
				<td>${item.description}</td>
				<td>${item.isSupply}</td>
				<td>${item.isAvailable}</td>
				<td><a href="showAdminUpdateItem.do?itemId=${item.id}">Update Item</a></td>
			</tr>
		</c:forEach>
	</table>
	</c:if>
	<%@ include file="footer.jsp"%>
</body>
</html>