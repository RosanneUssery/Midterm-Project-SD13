<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Join the Group</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/join.css">
</head>
<body id="body-join">
	<%@ include file="navbar.jsp"%>

	<!-- This page should allow the anon user to create an account and log in -->
	<!-- Empty user object is passed in as modelUser -->
	<div class="modal fade" id="joinModal" tabindex="-1"
		role="dialog" aria-labelledby="joinMSModal"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="joinMSModal">Join the Groups</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<c:choose>

						<c:when test="${newUserDTO != null }">
							<form:form class="modal-body" action="processJoin.do"
								method="post" modelAttribute="newUserDTO">

								<label>Email:</label>
								<form:input path="email" />
								<label>Password:</label>
								<form:password path="pwd" />
								<label>First Name:</label>
								<form:input path="firstName" />
								<label>Last Name:</label>
								<form:input path="lastName" />
								<label>Phone:</label>
								<form:input path="phone" />
								<label>Street</label>
								<form:input path="street" />
								<label>City</label>
								<form:input path="city" />
								<label>State</label>
								<form:input path="state" />
								<label>Zip</label>
								<form:input path="zip" />

								<input type="submit" value="Submit">

							</form:form>



						</c:when>

					</c:choose>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(function(){
    // Show the Modal on load
    $("#myModal").modal("show");
    
    // Hide the Modal
    $("#myBtn").click(function(){
        $("#myModal").modal("hide");
    });
});
</script>
	<%@ include file="footer.jsp"%>
</html>