<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./isLogin.jsp"%>
<!-- 로그인 확인 -->
<%
//파라미터 받기
String num = request.getParameter("num");
//DAO객체 생성 후 게시물 조회
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
//작성자 본인만 수정하기 페이지에 들어올 수 있다.
String session_id = (String)session.getAttribute("USER_ID");
if(!session_id.equals(dto.getId())){
	//작성자가 아니라면 경고창을 띄우고 뒤로 이동한다.
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
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
<script type="text/javascript">
	
	function checkValidate(f){
		if(f.title.value==""){
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if(f.content.value==""){
			alert("내용을 입력하세요");
			f.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">

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

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
		style="text-align: center;">
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
					href="./ListSimple.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>
	<h2 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">Edit</h2>
	<form name="writeFrm" method="post" action="EditProcess.jsp"
		onsubmit="return checkValidate(this);">

		<!-- 
		특정 게시물 하나를 수정해야 하므로 수정폼을 전송할때
		반드시 게시물의 일련번호도 전달되어야 한다.
		따라서 화면상에서는 보이지 않는 hidden입력상자를 사용한다.
	-->
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />

		<table border="5" width="70%" style="display: table; margin-right: auto; margin-left: auto;">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%;"
					value="<%=dto.getTitle() %>" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width: 90%; height: 100px;"><%=dto.getContent() %></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">RESET</button>
					<button type="button" onclick="location.href='ListSimple.jsp';">
						리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>