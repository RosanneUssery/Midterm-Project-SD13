<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Administrator Update Activity</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<a href="showAdminPage.do">Return to Administrator Page</a>
	
	
	<c:if test="${requestedActivity != null}">
		<form:form action="processAdminUpdateActivity.do" method="post" modelAttribute="requestedActivity">
			<form:hidden path="id" />
			<table>
				<thead>
					<th>Borrower Name</th>
					<th>Owner Name</th>
					<th>Item</th>
					<th>Date Lent</th>
					<th>Due Date</th>
					<th>Returned?</th>
				</thead>	
				<tr>
					<td><a href="showAdminUpdateUser.do?userId=${requestedActivity.borrower.id}">${requestedActivity.borrower.firstName} ${requestedActivity.borrower.lastName}</a></td>			
					<td><a href="showAdminUpdateUser.do?userId=${requestedActivity.item.owner.id}">${requestedActivity.item.owner.firstName} ${requestedActivity.item.owner.lastName}</a></td>			
					<td><a href="showAdminUpdateItem.do?itemId=${requestedActivity.item.id}">${requestedActivity.item.title}</a></td>			
					<td><form:input path="dateLent" /></td>			
					<td><form:input path="dueDate" /></td>			
					<td><form:checkbox path="isReturned" /></td>			
				</tr>
			</table>
			<input type="submit" value="Update Record">
		</form:form>
	</c:if>	
	<%@ include file="footer.jsp"%>
</body>
</html>