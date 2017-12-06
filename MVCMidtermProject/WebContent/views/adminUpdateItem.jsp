<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Update Item</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${requestedItem != null}">
		<h3>${requestedItem.id}</h3>
		<form:form action="adminUpdateItem.do" method="post" modelAttribute="requestedItem">
			<form:hidden path="id" />
			<%-- <form:hidden path="owner" /> --%>
			Name:
			<form:input path="title" />
			Description:
			<form:input path="description" />
			Supply?:
			<form:checkbox path="isSupply" />
			Available?:
			<form:checkbox path="isAvailable" />
			<input type="submit" value="Update Item">
		</form:form>
	</c:if>
	<%@ include file="footer.jsp"%>
</body>
</html>