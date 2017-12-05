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
	
	<%--  <c:if test="${receivedRequest != null }">
        <div>${receivedRequest.userId.id }</div>
    </c:if> --%>
	
	 </form> 
	 
	 <c:choose>
	 	<c:when test="${not empty receivedRequests}">
	 	<%-- <c:forEach items = "${receivedRequests }" var = "user"> --%>
	 	
	 	<div>
	 	${receivedRequests}
	 	</div>
	<%--  	<div>
	 	${receivedRequests.id}
	 	</div> --%>
	 
	 	
	<%--  </c:forEach> --%>
	 </c:when>
	 </c:choose>
<%-- 	<div class="container">
	<div class="row">
		<form action="getRequestsSentToUser.do" method="get">
	
 	<c:if test="${receivedRequest != null }">
	<c:forEach items = "" var = "">
	</c:forEach> 
	
		<div>
			User Id: ${receivedRequest.id} <br>
			User Info: <br>
			
			${receivedRequest.firstName} ${receivedRequest.lastName} <br>
			${receivedRequest.phone} ${receivedRequest.email} <br>
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
	
	</div>
	
	</div> --%>
	
				<div class="container">
			  <div class="row">
			
			    <div class="col-sm">
			
			   
			    
			      One of three columns
			      User Id: ${receivedRequest.userId.id} <br>
						User Info: <br>
						
						${receivedRequest.firstName} ${receivedRequest.lastName} <br>
						${receivedRequest.phone} ${receivedRequest.email} <br>
					
			    </div>
			    
			    
			    <div class="col-sm">
			      One of three columns
			    </div>
			    <div class="col-sm">
			      One of three columns
			    </div>
			    
			
			    
			  </div>
			 </div>

	
	
<%@ include file="footer.jsp"%>
</body>
</html>