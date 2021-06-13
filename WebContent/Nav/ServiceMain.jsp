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

.navbar {
	font-size: 20px;
	text-align: center;
}

.sign {
	text-align: right;
}

.navbar-brand {
	margin-left: 75px;
}

.nav-item {
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
			<%
			if (session.getAttribute("USER_ID") == null) {
			%>
			<a href="../Session/Login.jsp">LogIn</a>
			<%
			} else {
			%>
			<a href="../Session/Logout.jsp">LogOut</a>
			<%
			}
			%>
			&nbsp;&nbsp;&nbsp; <a href="../Session/SignUp.jsp">SignUp</a>
		</div>
		<h1>My First Shop Webpage</h1>
		<p>Resize this responsive page to see the effect</p>
	</div>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<a class="navbar-brand" href="../index.jsp">HOME</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="../Nav/CategoryMain.jsp">CATEGORY</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../Nav/ServiceMain.jsp">SERVICE</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../mvcboard/list.do">REVIEW</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../08Board/ListSimple.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>
	<h2 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">Event</h2>
	<a href="Event01.jsp"><img src=../images/bannerImage0.jpg
		style="display: block; width: 1000px; height: 150px; margin-left: auto; margin-right: auto;" /></a>
	<a href="Event02.jsp"><img src=../images/bannerImage1.jpg
		style="display: block; width: 1000px; height: 150px; margin-left: auto; margin-right: auto;" /></a>
	<a href="Event03.jsp"><img src=../images/bannerImage2.jpg
		style="display: block; width: 1000px; height: 150px; margin-left: auto; margin-right: auto;" /></a>

	<h3 style="text-align: center; margin-top: 75px">오프라인매장 위치안내</h3>
	<div id="map"
		style="width: 1000px; height: 700px; margin: 0px auto; margin-top: 50px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c71156ad522b7967d279b56c0de80de"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(37.63170291442223,
					126.82673692751383),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);

		var markerPosition = new kakao.maps.LatLng(37.63170291442223,
				126.82673692751383);

		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		marker.setMap(map);
	</script>
	<h5 style="text-align: center; margin-top: 50px;">상세주소 : 경기도 고양시
		덕양구 화신로 311</h5>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>