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
	
		<form action="" method="get">
	
 	<c:if test="${itemDetail != null }">
	<%-- <c:forEach items = "" var = "">
	</c:forEach>  --%>
	
	<div>
			Item Id: ${itemDetail.id}
		</div>
		<div>
			Item Title: ${itemDetail.title }
		</div>
		<div>
			Item Description: ${itemDetail.description }
		</div>
	
	
 	</c:if> 
	
	
		</form>
	
	
	
	
<%@ include file="footer.jsp"%>
</body>
</html>