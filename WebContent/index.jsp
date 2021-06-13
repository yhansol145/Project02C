<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HansolShop</title>
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
	<form id="headerSearchForm" method="post" action="/product?cmd=search">
		<input style="width: 20%;" name="keyword" 
			placeholder="상품명 또는 브랜드명으로 검색" class="headerSearchForm-input">
		<button class="headerSearchForm-btn">
			<i class="tiny material-icons">search</i>
		</button>
	</form>
	
	
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
	
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark" style="text-align: center;">
		<a class="navbar-brand" href="#">HOME</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button> 
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./Nav/CategoryMain.jsp">CATEGORY</a></li>
				<li class="nav-item"><a class="nav-link" href="./Nav/ServiceMain.jsp">SERVICE</a></li>
				<li class="nav-item"><a class="nav-link" href="./mvcboard/list.do">REVIEW</a></li>
				<li class="nav-item"><a class="nav-link" href="./08Board/ListSimple.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>
	
	
<div id="demo" class="carousel slide" data-ride="carousel">
	
	<!-- Indicatorst -->
	<ul class="carousel-indicators">
		<li data-target="#demo" data-slide-to="0" class="active"></li>
		<li data-target="#demo" data-slide-to="1"></li>
		<li data-target="#demo" data-slide-to="2"></li>
	</ul>
	
	<!-- The slideshow -->
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="images/bannerImage0.jpg" style="width: inherit; max-width: 100%; height: auto;" />
		</div>
		<div class="carousel-item">
			<img src="images/bannerImage1.jpg" style="width: inherit; max-width: 100%; height: auto;" />
		</div>
		<div class="carousel-item">
			<img src="images/bannerImage2.jpg" style="width: inherit; max-width: 100%; height: auto;" />
		</div>
	</div>
	
	<!-- Left and right controls -->
	<a class="carousel-control-prev" href="#demo" data-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</a>
	<a class="carousel-control-next" href="#demo" data-slide="next">
		<span class="carousel-control-next-icon"></span>
	</a>
</div>

	<h2 style="text-align: center; margin-top: 50px;">Today's Best</h2>
	
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>