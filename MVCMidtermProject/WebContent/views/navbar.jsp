<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Microsanctuary Equipment Exchange</title>
</head>
<body>
	<!-- Referenced http://getbootstrap.com/docs/4.0/components/navbar/ on 9/28/17 -->
	<nav class="navbar navbar-expand-xl navbar-dark bg-dark"> <!-- Below is where the logo will go -->
	<a class="navbar-brand" href="views/HomePage.jsp" target="_blank">
		<img src="images/chickenicon.jpeg" width="30" height="30"
		class="d-inline-block align-top" alt="microsanctuary logo">
		Microsanctuary Equipment Exchange
	</a>
	<div class="navbar">
		<div class="btn-group btn-group-justified">
			<div class="row">
				<div class="column navbtn">
					<a href="views/HomePage.jsp" class="btn btn-primary btn-lg">Home</a>
				</div>
				<div class="column space"></div>
				<div class="column navbtn">
					<a href="showSearchPage.do" class="btn btn-primary btn-lg"
						style="padding-left: -15px;">Borrow</a>
				</div>
				<div class="column space"></div>
				<div class="column navbtn">
					<a href="#" class="btn btn-primary btn-lg">Lend</a>
				</div>
				<div class="column space"></div>
				<div class="column navbtn">
					<a href="#" class="btn btn-primary btn-lg">Requests</a>
				</div>
				<div class="column space"></div>
				<!--need to find a way to hide/show login if they are logged in  -->
					<!-- <script type="text/javascript">
						function hideLogout() {
							document.getElementById('logout').style.visibility = 'hidden';
						}
						function hideLogin() {
							document.getElementById('login').style.visibility = 'hidden';
						}
					</script>

    {!IF((ISPICKVAL($User.UserType,'Guest')),'<script>
					hideLogout();
				</script>','<script>
					hideLogin();
				</script>')} -->
				<div class="column navbtn">
						<a href="#" class="btn btn-primary btn-lg">Join</a>
					</div>
				
				<div class="column space"></div>
			</div>
		</div>
	</div>

	<a class="btn btn-social btn-facebook"
		href="https://www.facebook.com/Microsanctuary/" target="_blank"
		title="Colorado Microsanctuary Network Facebook"> <span
		class="fa fa-facebook"></span> Microsanctuary FB
	</a> </nav>
</body>
</html>