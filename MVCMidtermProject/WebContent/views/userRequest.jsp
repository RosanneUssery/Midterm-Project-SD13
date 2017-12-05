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
	
	<h1>User Requests</h1>
	
	<form action="getRequestsSentToUser.do" method="get">
	 </form> 
	 
	 <div class="container userRequest">
	 <c:choose>
	 	<c:when test="${not empty receivedRequests}">
	 	<c:forEach items = "${receivedRequests }" var = "requests"> 
	 	
<ul class="list-group">
 <li class="list-group-item active">${requests.item.title}<br>
 <li class="list-group-item active">${requests.borrower.firstName} ${requests.borrower.lastName}<br>
 
 
 </li>

</ul>
	
	 	
	</c:forEach> 
	 </c:when>
	 </c:choose>
	 
</div>
		 
	
<%@ include file="footer.jsp"%>
</body>
</html>
	 	<!-- 	<div class="container"> -->
			<!--   <div class="row"> -->
			
<%-- 			    <div class="container userRequest">
	 	<div>
	 	${requests.dateLent}<br>
	 	${requests.item}<br>
	 	${requests.borrower}<br>
	 	${requests.borrower.firstName} ${requests.borrower.lastName}<br>
	 	${requests.borrower.firstName} ${requests.borrower.lastName}<br>
	 	${requests.borrower.firstName} ${requests.borrower.lastName}<br>
	 	</div>
	 	</div> --%>
	 	
	 	   
			<%--     <div class="col-sm">
			      One of three columns
			      ${requests.item.id}
			    </div>
			    <div class="col-sm">
			      One of three columns
			    </div>
			    <div class="col-sm">
			      One of three columns
			    </div> --%>
	 	
			<!--  </div> -->