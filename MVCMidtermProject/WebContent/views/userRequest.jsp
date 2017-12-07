<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User Request</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/requests.css">
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row justify-content-around">
			<div class="col">
				<div class="card p-3 h-100">
					<h3>User Borrows</h3>
					<c:choose>
					 	<c:when test="${not empty userBorrows}">
					 		<table class="table-sm">
					 			<thead>
					 				<th>Item</th>
					 				<th>Owner</th>
					 				<th>Date Borrowed</th>
					 				<th>Due Date</th>
					 				<th>Returned?</th>
					 			</thead>
								<c:forEach items = "${userBorrows}" var = "borrow">
									<tr>
										<td>${borrow.item.title}</td>
										<td>${borrow.item.owner.firstName} ${borrow.item.owner.lastName}</td>
										<td>${borrow.dateLent}</td>
										<td>${borrow.dueDate}</td>
										<c:choose>
											<c:when test="${borrow.isReturned == false}">
												<td class="table-warning">
													No
												</td>
											</c:when>
											<c:otherwise>
												<td class="table-success">
													Yes
												</td>
											</c:otherwise>
										</c:choose>
									</tr>				 		
					 			</c:forEach>
					 		</table>
						 </c:when>
					 </c:choose>
				 </div>
			</div>		
			<div class="col">
				<div class="card p-3 h-100">
					<h3>User Lends</h3>
					<c:choose>
					 	<c:when test="${not empty userLends}">
					 		<table class="table-sm">
					 			<thead>
					 				<th>Borrower</th>
					 				<th>Item</th>
					 				<th>Date Borrowed</th>
					 				<th>Due Date</th>
					 				<th>Returned?</th>
					 				<th>Action</th>
					 			</thead>
					 			<c:forEach items = "${userLends}" var = "lend">	
									<tr>
										<td>${lend.borrower.firstName} ${lend.borrower.lastName}</td>
										<td>${lend.item.title}</td>
										<td>${lend.dateLent}</td>
										<td>${lend.dueDate}</td>
										
										<c:choose>
											<c:when test="${lend.isReturned == false}">
												<td>No</td>
											</c:when>
											<c:otherwise>
												<td>Yes</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${lend.dateLent == null}">
												<td class="table-warning">
													<a href="processConfirm.do?activityId=${lend.id}">Confirm Lend</a>
												</td>
											</c:when>
											<c:when test="${lend.isReturned == false}">
												<td class="table-info">
													<a href="processReturn.do?activityId=${lend.id}">Confirm Return</a>
												</td>
											</c:when>
											<c:otherwise>
												<td class="table-success">
													All done!
												</td>
											</c:otherwise>
										</c:choose>
										
					 			</c:forEach>
							</table>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
	
<%-- 	 	
<!-- <ul class="list-group"> -->
<!--  <li class="list-group-item active"> -->${requests.item.title}<br>
<!--  <li class="list-group-item active"> -->${requests.borrower.firstName} ${requests.borrower.lastName}<br>

	<input type="submit" value="Confirm Request" onclick ="" /> --%>
 
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