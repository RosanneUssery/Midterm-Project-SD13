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
	<div class="container">
		<div class="row">
			<div class="column">
				<br> <br>
			</div>
		</div>

	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-3 searchBoxSearch">
				<form action="/MVCMidtermProject/searchResults.do" method="GET">
					<input type="text" name="EquipmentType" value="${item.title}"
						placeholder="Equipment Type" required><br> <br>
					<input type="text" name="EquipmentZip" placeholder="zip code"
						value="${address.zip}"><br> <br> <input
						type="submit" value="submit">
				</form>
			</div>
			<!-- <div class="col-md-1"></div> -->
			<div class="col-md-8 searchBoxSearch searchResultsSearch">
				<div class="row">
					<div class="col-md-12">
						<iframe width="100%" height="300" frameborder="0"
							style="border: 0"
							src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAgD9VxSl5snVT8lXakoJXCifrmguQT43o
									    &q=${map}+in+colorado"
							allowfullscreen> </iframe>
						<c:if test="${not empty searchResults}">
							<c:forEach items="${searchResults}" var="item">

								<!-- API Key: AIzaSyAgD9VxSl5snVT8lXakoJXCifrmguQT43o -->
					
								<span class="title">Item:</span> ${item.title } <br>
								<span class="title">Description:</span> ${item.description } <br>
								<span class="title">Contact:</span> <br>
								${item.owner.firstName} ${item.owner.lastName}<br>
								${item.owner.email} <br>
								${item.owner.phone }<br>
								${item.owner.address.street} <br>
								${item.owner.address.city}
								
								<br>
								<br>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>