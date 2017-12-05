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
<!-- MAP STUFF HERE -->					
						<c:forEach var="address" items="${addresses}">
      						<div class="markers" data-address="${address}"></div>
						</c:forEach>

    <!-- THIS IS WHERE THE MAP IS ADDED -->
    						<div id="map"></div>
    
					    	<script>
					      function initMap() {
					        var addresses = document.getElementsByClassName("markers");
					
					        var geocoder = new google.maps.Geocoder();
					
					        var map = new google.maps.Map(document.getElementById('map'), {
					          center: {lat: -34.397, lng: 150.644},
					          zoom: 10
					        });
					
					        for (var i = 0 ; i < addresses.length ; i++) {
					          geocoder.geocode( { 'address': addresses[i].getAttribute("data-address")}, function(results, status) {
					            if (status == 'OK') {
					              map.setCenter(results[0].geometry.location);
					              var marker = new google.maps.Marker({
					                  map: map,
					                  position: results[0].geometry.location
					              });
					            } else {
					              alert('Geocode was not successful for the following reason: ' + status);
					            }
					          });
					        }
					        // Create a map object and specify the DOM element for display.
					
					      }
					
					    </script>
					    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgD9VxSl5snVT8lXakoJXCifrmguQT43o&callback=initMap"
					    async defer></script>
<!-- END MAP STUFF -->
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