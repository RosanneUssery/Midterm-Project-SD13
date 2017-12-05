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
	
	<div class="container">
		<div class="row">
			<div class="col">
				<h3>User Borrows</h3>
				<!-- list of borrows -->
				<c:choose>
				 	<c:when test="${not empty userBorrows}">
					 	<c:forEach items = "${userBorrows}" var = "borrow"> 
							${borrow.id}
						</c:forEach> 
					 </c:when>
				 </c:choose>
			</div>		
			<div class="col">
				<h3>User Lends</h3>
				<!-- list of lends -->
					<c:choose>
				 	<c:when test="${not empty userLends}">
					 	<c:forEach items = "${userLends }" var = "lend"> 
							${lend.id}
						</c:forEach> 
					 </c:when>
				 </c:choose>
			</div>
		</div>
	</div>
	
	
	 	
<!-- <ul class="list-group"> -->
<!--  <li class="list-group-item active"> -->${requests.item.title}<br>
<!--  <li class="list-group-item active"> -->${requests.borrower.firstName} ${requests.borrower.lastName}<br>

	<input type="submit" value="Confirm Request" onclick ="" />
 
<!--  
 </li>

</ul> -->
	
	 	

	 
	 </div>
	 
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