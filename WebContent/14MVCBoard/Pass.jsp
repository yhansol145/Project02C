<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
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

.navbar-brand {
	margin-left: 75px;
}

.nav-item {
	margin-left: 75px;
}
</style>
<script type="text/javascript">
	function formValidate(f) {
		if (f.pass.value == "") {
			alert("비밀번호를 입력하세요");
			f.pass.focus();
			return false;
		}
	}
</script>
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
		<!-- 		<img src="images/706389.jpg" alt="" /> -->
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
				<li class="nav-item"><a class="nav-link" href="./list.do">REVIEW</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../08Board/ListSimple.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>
	<h2 style="margin-top: 50px; text-align: center; margin-bottom: 50px;">Insert
		PassWord</h2>
	<!--  
	파일 첨부가 없는 페이지에서는 enctype을 제거하는것이 좋다. 
	만약 enctype 속성이 있다면 request객체를 통해 폼값을 받을수 없다. 
-->
	<form name="writeFrm" method="post" action="../mvcboard/pass.do"
		onsubmit="return formValidate(this);">
		<!--  
	idx : 게시물의 일련번호
	mode : 게시물의 수정 혹은 삭제를 위한 구분값
	※hidden입력상자는 화면상에서는 보이지 않으므로 값이 입력되었는지
	확인하기 위해 소스보기 혹은 개발자모드를 사용해야 한다. 
	특히 EL을 사용하는 경우에는 에러가 발생하지 않으므로 값이 있는지
	반드시 확인해야 한다. 
-->
		<input type="hidden" name="idx" value="${param.idx }" /> <input
			type="hidden" name="mode" value="${mode }" />
		<table border="5" width="70%"
			style="margin-right: auto; margin-left: auto;">
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" style="width: 100px;" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">확인</button>
					<button type="reset">RESET</button>
					<button type="button"
						onclick="location.href='../mvcboard/list.do';">리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>