<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>index.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}
\
.navbar {
	font-size: 20px;
	text-align: center;
}

.sign {
	text-align: right;
}

.navbar-brand{
	margin-left: 75px;
}

.nav-item{
	margin-left: 75px;
}


</style>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">
	
		<div style="text-align: right;">
			<% if(session.getAttribute("USER_ID")==null){ %>
				<a href="Session/Login.jsp">LogIn</a>
			<% }
			else{ %>
				<a href="Session/Logout.jsp">LogOut</a>
			<% } %>
			&nbsp;&nbsp;&nbsp;
			<a href="./Session/SignUp.jsp">SignUp</a>
		</div>
	
		<h1>My First Shop Webpage</h1>
<!-- 		<img src="images/706389.jpg" alt="" /> -->
		<p>Resize this responsive page to see the effect</p>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="#">HOME</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button> 
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./Nav/CategoryMain.jsp">CATEGORY</a></li>
				<li class="nav-item"><a class="nav-link" href="./Nav/ServiceMain.jsp">SERVICE</a></li>
				<li class="nav-item"><a class="nav-link" href="./Nav/ReviewMain.jsp">REVIEW</a></li>
				<li class="nav-item"><a class="nav-link" href="./Nav/QnaMain.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>
	<img src="images/MainImage.png" style="display: block; margin: 0px auto; margin-top:50px;" /> 
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>