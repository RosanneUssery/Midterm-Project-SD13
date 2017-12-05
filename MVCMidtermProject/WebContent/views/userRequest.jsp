<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Request</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	
		<form action="getRequestsSentToUser.do" method="get">
	
 	<c:if test="${receivedRequest != null }">
	<%-- <c:forEach items = "" var = "">
	</c:forEach>  --%>
	
		<div>
			User Id: ${receivedRequest.userId.id} <br>
			User Info: <br>
			
			${receivedRequest.userId.firstName} ${receivedRequest.userId.lastName} <br>
			${receivedRequest.userId.phone} ${receivedRequest.userId.email} <br>
		</div>
	
	<div>
			Item Id: ${receivedRequest.id}
		</div>
		<div>
			Item Title: ${receivedRequest.title }
		</div>
		<div>
			Item Description: ${receivedRequest.description }
		</div>
		
	
	
 	</c:if> 
	
	
		</form>
	
	
	
	
<%@ include file="footer.jsp"%>
</body>
</html>