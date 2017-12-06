<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Items</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
		<table>
		<thead>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Item Description</th>
			<th>Supply?</th>
			<th>Available?</th>
		</thead>
		<c:if test="${not empty userItems}">
			<c:forEach items="${userItems}" var="item">
				<tr>
					<td>${item.id}</td>
					<td>${item.title}</td>
					<td>${item.description}</td>
					<td>${item.isSupply}</td>
					<td>${item.isAvailable}</td>
					<td><a href="showUserUpdateItem.do?itemId=${item.id}">Update Item</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
		
	<%@ include file="footer.jsp"%>
</body>
</html>