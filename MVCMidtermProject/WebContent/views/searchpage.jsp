<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Borrow</title>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="css/search.css">
<style>

</style>
</head>
<body id="body-search">
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3 searchBoxSearch">
				<form action="/MVCMidtermProject/searchResults.do" method="GET">
					<input type="text" name="EquipmentType" value="${item.title}"
						placeholder="Equipment Type" required><br> <br>
					<input type="text" name="EquipmentZip" placeholder="zip code (optional)"
						value="${address.zip}"><br> <br> <input
						type="submit" value="submit">
				</form>
			</div>
			<div class="col-md-8 searchBoxSearch searchResultsSearch">
				<c:if test="${not empty addresses}">
					<c:forEach var="address" items="${addresses}">
     						<div class="markers" data-address="${address}"></div>
					</c:forEach>
   					<div id="googleMap"></div> <!-- API Key: AIzaSyAgD9VxSl5snVT8lXakoJXCifrmguQT43o -->
   				</c:if>
				<c:if test="${not empty searchResults}">
					<c:forEach items="${searchResults}" var="item">
						<div class="card w-50 mx-auto my-3">
							<ul class="list-group">
								<li class="list-group-item">
									<span class="title">Item: ${item.title }</span>
								</li>
								<li class="list-group-item">
									<span class="title">Description: ${item.description } </span>
								</li>
								<c:choose>
									<c:when test="${authUser.permissionLevel > 0}">
										<li class="list-group-item">
											<span class="title">Contact:  ${item.owner.firstName} ${item.owner.lastName} </span>
										</li>
										<li class="list-group-item">
											<span class="title">Email: ${item.owner.email} </span>
										</li>
										<li class="list-group-item">
											<span class="title">Phone: ${item.owner.phone } </span>
										</li>
										<c:if test="${not empty addresses}">
											<li class="list-group-item">
												<span class="title">Address: ${item.owner.address.street}, ${item.owner.address.city} ${item.owner.address.zip} </span>
											</li>
										</c:if>
									</c:when>
									<c:otherwise>
										<li class="list-group-item">
											<span class="title">Contact: ${item.owner.firstName}</span>
										</li>
									</c:otherwise>
								</c:choose>
								<li class="list-group-item">
									<c:if test="${authUser.permissionLevel > 0}">
										<a class="btn btn-success d-block w-75 mx-auto" href="processRequest.do?itemId=${item.id}">Borrow Item</a>
									</c:if>
								</li>
							</ul>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	
					    	<script>
					      function initMap() {
					    	  
					    	 	var infoWin = new google.maps.InfoWindow();
					    	 	console.log(infoWin)
					    	  
					    	  	var addresses = document.getElementsByClassName("markers");
					    	  	console.log(addresses)
					
					        var geocoder = new google.maps.Geocoder();
					    	  	console.log(geocoder)
					
					        var map = new google.maps.Map(document.getElementById('googleMap'), {
					          center: {lat: 39.7392, lng: -104.9903},
					          zoom: 10
					        });
					        
					        console.log(map)
					
					        for (var i = 0 ; i < addresses.length ; i++) {
					        	console.log(addresses[i].getAttribute("data-address"));
					          geocoder.geocode( { 'address': addresses[i].getAttribute("data-address")}, function(results, status) {
					            if (status == 'OK') {
					            	var location = { 
					                	  	lat : results[0].geometry.location.lat(), 
					                	  	lng : results[0].geometry.location.lng(),
					                  };
					            		console.log(results[0]);
					              map.setCenter(location);
					              var marker = new google.maps.Marker({
					                  map: map,
					                  position: location,
					                  // Any information you want to display in the info window
					                  dataLabel : results[0].formatted_address
					              });
					                 google.maps.event.addListener(marker, 'click', function(evt) {
					                	 console.log(marker);
					                    infoWin.setContent(marker.dataLabel);
					                    infoWin.open(map, marker); 
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
</body>
</html>