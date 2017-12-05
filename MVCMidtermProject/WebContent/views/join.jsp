<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Join the Group</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/Main.css">
</head>
<body id="body-join">
<%@ include file="navbar.jsp"%>

	<!-- This page should allow the anon user to create an account and log in -->
	<!-- Empty user object is passed in as modelUser -->
	


				 
	<c:choose>
	
		<c:when test="${newUserDTO != null }">
			<form:form action="processJoin.do" method="post" modelAttribute="newUserDTO">
				 <div class="form-row">
    				<div class="form-group col-md-6">			
				<label>Email:</label>
				<form:input path="email"/>
				<label>Password:</label>
				<form:password path="pwd"/>
				</div>
				</div>
				 <div class="form-row">
    				<div class="form-group col-md-8">
				<label>First Name:</label>
				<form:input path="firstName"/>
				<label>Last Name:</label>
				<form:input path="lastName"/>
				<label>Phone:</label>
				<form:input path="phone"/>
				</div>
				</div>
				<label>Street</label>
				<form:input path="street"/>
				<label>City</label>
				<form:input path="city"/>
				<label>State</label>
				<form:input path="state"/>
				<label>Zip</label>
				<form:input path="zip"/>
				
				<input type="submit" value="Submit">
			</form:form>
			
			
			
		</c:when>
		
		</c:choose>
		
		
<%-- 		<c:when test="${modelUser != null}">
			
			<form:form action="processJoinUser.do" method="post" modelAttribute="modelUser">
			${session.userLogin.userEmail}
				<form:hidden path="id"/>
				<form:hidden path="email"/>
				<form:hidden path="address"/>
				<form:hidden path="permissionLevel"/>
				<form:hidden path="items"/>
				<input type="submit" value="Next">
			</form:form>
			
			
		</c:when>
		
		<c:when test="${modelAddress != null}">
			
			<form:form action="processJoinAddress.do" method="post" modelAttribute="modelAddress">
				<form:hidden path="id"/>
				
				<input type="submit" value="Submit">
			</form:form>
			
			
		</c:when>
	
 --%>	
	
	
	
	<%-- 
	<form>
  <div class="form-row">
    <div class="form-group col-sm-5">
      <label for="inputEmail4">Email</label>
      <input type="email" class="form-control" id="inputEmail4" placeholder="Email">
    </div>
    <div class="form-group col-sm-5">
      <label for="inputPassword4">Password</label>
      <input type="password" class="form-control" id="inputPassword4" placeholder="Password">
    </div>
  </div>
  
  
  
  
  
  
  <div class="form-group col-lg-10">
    <label for="inputAddress">Address</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
  </div>
  <div class="form-group col-lg-10">
    <label for="inputAddress2">Address 2</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
  </div>
  <div class="form-row">
    <div class="form-group col-sm-4">
      <label for="inputCity">City</label>
      <input type="text" class="form-control" id="inputCity">
    </div>
    <div class="form-group col-sm-4">
      <label for="inputState">State</label>
      <select id="inputState" class="form-control">
        <option selected>Choose...</option>
        <option>Colorado</option>
      </select>
    </div>
    <div class="form-group col-sm-2">
      <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip">
    </div>
  </div>
  <div class="form-group col-md-3">
    <div class="submit-user">
      
  <button type="submit" class="btn btn-primary">Sign in</button>
   </div>
  </div>
</form>--%>
	

	
	
	
	<%@ include file="footer.jsp"%>
</body>
</html>