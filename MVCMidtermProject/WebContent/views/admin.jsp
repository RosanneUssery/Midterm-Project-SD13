<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- should show links to actions admins can take on lists of items, users (and associated logins and addresses) 
		update user info by id
		update item by id
		update item by user
	-->
	<c:if test="${allUsers not empty}">
		<form action="showAdminUpdateUser.do" method="get">
			<select>
				<c:forEach items="${allUsers}" var="user">
					<option value="${user.id}" label="${user.firstName} ${user.lastName}">
				</c:forEach>
			</select>
		</form>
	</c:if>
	
</body>
</html>