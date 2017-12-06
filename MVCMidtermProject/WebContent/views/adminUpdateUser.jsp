<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Update User</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${requestedUserDTO != null}">
		<form:form action="processAdminUpdateUser.do" method="post" modelAttribute="requestedUserDTO">
			<form:hidden path="userId" />
			Email:
			<form:input path="email" />
			Password:
			<form:input path="pwd" />
			Permission Level:
			<form:input path="permissionLevel" />
			First Name:
			<form:input path="firstName" />
			Last Name:
			<form:input path="lastName" />
			Phone Number:
			<form:input path="phone" />
			Street Address:
			<form:input path="street" />
			City:
			<form:input path="city" />
			State:
			<form:input path="state" />
			Zip Code:
			<form:input path="zip" />
			<input type="submit" value="Update User">
		</form:form>
	</c:if>
	<table>
		<thead>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Item Description</th>
			<th>Supply?</th>
			<th>Available?</th>
		</thead>
		<c:if test="${not empty requestedUserItems}">
			<c:forEach items="${requestedUserItems}" var="item">
				<tr>
					<td>${item.id}</td>
					<td>${item.title}</td>
					<td>${item.description}</td>
					<td>${item.isSupply}</td>
					<td>${item.isAvailable}</td>
					<td><a href="showAdminUpdateItem.do?itemId=${item.id}">Update Item</a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<%@ include file="footer.jsp"%>
</body>
</html>