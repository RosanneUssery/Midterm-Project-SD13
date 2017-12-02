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
<body id="body-search">
	<%@ include file="navbar.jsp"%>

		<div class="container mainBox">
			<div class="row">
				<div class="col-md-4 searchBox">
					<form action="/MVCMidtermProject/searchResults.do" method="GET">
						<input type="text" name="EquipmentType" value="${item.title}"
							placeholder="Equipment Type" required><br> <br> 
						
						<%-- <input type="location" name="EquipmentCity" value="${address.city}"
							placeholder="Equipment City"><br> <br> --%> 
						<input type="submit" value="submit">
					</form>
				</div>
				<div class="col-md-8">
					<div class="row">
						<c:if test="${not empty searchResults}">
							<c:forEach items="${searchResults}" var="searchResults">
								<div class="col-sm-6">
									<img src=" " alt="image of equipment">
								</div>
								<div class="col-sm-6">


		<%-- <img src="https://maps.googleapis.com/maps/api/staticmap?center=${},${}&zoom=12&size=400x400&key=AIzaSyAgD9VxSl5snVT8lXakoJXCifrmguQT43o" />
							 --%>	</div>
								<div class="row">
									<div class="col-sm-12"></div>
								</div>
							</c:forEach>
						
						</c:if>
						<c:if test="${empty searchResults }">
							<div class="row container">
							<div class="col-sm-4"></div>
							<div class="col-sm-8 match">
							<h3>No Match</h3>
							</div>
							</div>
						</c:if>
					</div>

				</div>
			</div>


		</div>
	<%@ include file="footer.jsp"%>
</body>
</html>