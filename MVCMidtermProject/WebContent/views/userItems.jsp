<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Items</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-9 mx-auto align-items-center">
				<div class="card p-3 align-items-center">
					<h3 class="pb-2">My Items</h3>
					<table>
						<thead>
							<th>ID</th>
							<th>Item Name</th>
							<th>Item Description</th>
							<th>Supply?</th>
							<th>Available?</th>
							<th>Update Item</th>
						</thead>
						<c:if test="${not empty userItems}">
							<c:forEach items="${userItems}" var="item">
								<tr>
									<td>${item.id}</td>
									<td>${item.title}</td>
									<td>${item.description}</td>
									<c:choose>
										<c:when test="${item.isSupply == true}">
											<td>Yes</td>
										</c:when>
										<c:otherwise>
											<td>No</td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${item.isAvailable == true}">
											<td>Yes</td>
										</c:when>
										<c:otherwise>
											<td>No</td>
										</c:otherwise>
									</c:choose>
									<td><a href="showUserUpdateItem.do?itemId=${item.id}">Update Item</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>