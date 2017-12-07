<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Item</title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<!-- this page should display a form for a user to add a new item -->

	<div class="container">
		<div class="row">
			<div class="col-8 mx-auto">
				<div class="card p-3">
					<h3>Enter information about the item you'd like to add.</h3>
					<form:form action = "processAddItem.do" method = "post" modelAttribute = "modelItem">
						Name of item:
						<form:input path="title" />
						Description of item:
						<form:input path="description" />
						<div class="m-1">
							<form:checkbox path = "isSupply" />
							Is this an expendable item? (Example: seeds)
						</div>
						<div class="m-1">
							<form:checkbox path = "isAvailable" />
							Is this item available for others to request?
						</div>
						<input class="d-block mx-auto my-3" type="submit" value="Submit">
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>