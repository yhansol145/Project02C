<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.fakeimg {
	height: 200px;
	background: #aaa;
}

.navbar {
	font-size: 20px;
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
	<%@ include file="../common/CommonLink.jsp"%>

	<%
	if (session.getAttribute("USER_ID") == null) {
	%>
	<script>
		//로그인 폼의 입력값을 검증하는 JS함수 정의
		function loginValidate(fn) {
			if (!fn.user_id.value) {
				alert("아이디를 입력하세요");
				fn.user_id.focus();
				return false;
			}
			if (fn.user_pw.value == "") {
				alert("패스워드를 입력하세요");
				fn.user_pw.focus();
				return false;
			}
		}
	</script>

	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<div style="text-align: right;">
			<% if(session.getAttribute("USER_ID")==null){ %>
				<a href="Login.jsp">LogIn</a>
			<% }
			else{ %>
				<a href="Logout.jsp">LogOut</a>
			<% } %>
			&nbsp;&nbsp;&nbsp;
			<a href="SignUp.jsp">SignUp</a>
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
					href="../Nav/QnaMain.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>

	<h2 style="text-align: center; margin-top: 75px;">LogIn</h2>
	<form action="LoginProcessMap.jsp" method="post" name="loginFrm"
		onsubmit="return loginValidate(this);">
		<table border="5" style="margin: 0px auto; margin-top: 50px;">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" tabindex="1"
					placeholder="ID를 입력하세요." /></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="user_pw" tabindex="2"
					placeholder="비밀번호를 입력하세요." /></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input
					type="submit" value="로그인하기" tabindex="4" /></td>
			</tr>
		</table>
	</form>
	<div style="text-align:center; margin-top:50px;">
		<a href="FindAccount.jsp">아이디 찾기</a>&nbsp&nbsp&nbsp&nbsp
		<a href="FindPassword.jsp">비밀번호 찾기</a>
	</div>
	<%
	} else {
	%>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<div style="text-align: right;">
			<% if(session.getAttribute("USER_ID")==null){ %>
				<a href="Login.jsp">LogIn</a>
			<% }
			else{ %>
				<a href="Logout.jsp">LogOut</a>
			<% } %>
			&nbsp;&nbsp;&nbsp;
			<a href="SignUp.jsp">SignUp</a>
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
					href="../Nav/QnaMain.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>
	
	<table border='5' 
		style="margin-right: auto; margin-left: auto; margin-top: 75px;">
		<tr>
			<td style="text-align: center;"><%=session.getAttribute("USER_NAME")%>
				회원님, 로그인 하셨습니다. <br /> 즐거운 시간 보내세요 ^^* <br /> <a href="../index.jsp">[쇼핑하러 가기]</a></td>
		</tr>
	</table>
	<%
	}
	%>
	<h3 style="color: black; text-align: center; margin-top: 50px;">
		<%=request.getAttribute("ERROR_MSG") == null ? "" : request.getAttribute("ERROR_MSG")%></h3>
	</div>
	
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>
