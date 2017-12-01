<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Borrow</title>
	<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
<div class="container">	
	<div class="container">
	<div class="row">
	<div class="col-lg-12"></div>
	</div>
	</div>
	<div class="container mainBox">
		<div class="row">
			<div class="col-md-4 searchBox">
				<form action="select.do" method="post">
				<input type="text" name="EquipmentType" value="${item.title}" placeholder="Equipment Type"><br>
				<br>
				<input type="location" name="EquipmentCity" value="${address.city}" placeholder="Equipment City"><br>
				<br>
				<input type="submit" value="submit">
				</form>
				 </div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-sm-6">
					<img src=" " alt="image of equipment">
					</div>
					<div class="col-sm-6">
					
					
					<!--  <img src="https://maps.googleapis.com/maps/api/staticmap?center=${},${}&zoom=12&size=400x400&key=AIzaSyAgD9VxSl5snVT8lXakoJXCifrmguQT43o" />
					-->
					</div>
				</div>
				<div class="row">
					<div class="col">
						<c:if test="${not empty searchResults}">
							<c:forEach>
							
							
							</c:forEach>
						
						</c:if>
					
					</div>
				</div>
				
				
			</div>
		</div>

	</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>