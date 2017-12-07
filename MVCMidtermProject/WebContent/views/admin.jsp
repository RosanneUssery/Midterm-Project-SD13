<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator Page</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/requests.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- should show links to actions admins can take on lists of items, users (and associated logins and addresses) 
		update user info by id
		update item by id
		update item by user
	-->
	<c:if test="${not empty allUsers}">
		<br>
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
	<br>
		<h2> Items </h2>
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
	<c:if test="${not empty allActivity}">
		<br>
		<h2> Activity </h2>
		<table>
			<thead>
				<th>ID</th>		
				<th>Borrower</th>		
				<th>Owner</th>		
				<th>Item</th>		
				<th>Date Lent</th>		
				<th>Due Date</th>		
				<th>Returned?</th>		
				<th>Detail</th>
			</thead>
			<c:forEach items="${allActivity}" var="activity">
				<tr>
					<td>${activity.id}</td>			
					<td>${activity.borrower.firstName} ${activity.borrower.lastName}</td>			
					<td>${activity.item.owner.firstName} ${activity.item.owner.lastName}</td>			
					<td>${activity.item.title}</td>			
					<td>${activity.dateLent}</td>			
					<td>${activity.dueDate}</td>			
					<td>${activity.isReturned}</td>			
					<td><a href="showAdminUpdateActivity.do?activityId=${activity.id}">View Detail</a></td>			
				</tr>
			</c:forEach>
		</table>
	</c:if>
	<%@ include file="footer.jsp"%>
</body>
</html>