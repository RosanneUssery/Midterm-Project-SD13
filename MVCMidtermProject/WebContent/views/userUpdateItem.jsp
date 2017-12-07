<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%@ include file="header.jsp"%>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-8 mx-auto">
				<div class="card p-3">
					<c:if test="${userItem != null}">
						<h3 class="align-self-center">Editing "${userItem.title}"</h3>
						<form:form action="processUserUpdateItem.do" method="post" modelAttribute="userItem">
							<form:hidden path="id" />
							Name:
							<form:input path="title" />
							Description:
							<form:input path="description" />
							<div class="m-1">
								<form:checkbox path = "isSupply" />
								Is this an expendable item? (Example: seeds)
							</div>
							<div class="m-1">
								<form:checkbox path = "isAvailable" />
								Is this item available for others to request?
							</div>
							<input class="d-block mx-auto my-3" type="submit" value="Update Item">
						</form:form>
					</c:if>
				</div>
			</div>		
		</div>
	</div>
		
	
	<%@ include file="footer.jsp"%>
</body>
</html>