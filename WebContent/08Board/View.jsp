<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp"%>
<%
//파라미터 받기
String num = request.getParameter("num"); //일련번호
String searchField = request.getParameter("searchField"); //검색필드
String searchWord = request.getParameter("searchWord"); //검색어

String queryStr = "";
if (searchWord != null) {
	//검색 파라미터 추가하기
	queryStr = "searchField=" + searchField + "&searchWord=" + searchWord;
}

BoardDAO dao = new BoardDAO(application);

//조회수 증가
dao.updateVisitCount(num);

//파라미터로 전달된 일련번호를 조회
BoardDTO dto = dao.selectView(num);
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
<script>
	/*
	 JavaScript를 통한 폼값 전송으로 삭제처리
	 */
	function isDelete() {
		var c = confirm("정말로 삭제하시겠습니까?");
		if (c) {
			var f = document.writeFrm;
			f.method = "post";
			f.action = "DeleteProcess.jsp";
			f.submit();
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
	<h2 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">Detail View</h2>
	<!--  
		회원제 게시판에서 게시물 삭제를 위해 상세보기에
		게시물의 일련번호를 hidden 입력상자로 삽입한다.
	-->
	<form name="writeFrm">
		<input type="hidden" name="num" value="<%=num%>" />
		<table border="5" width="70%" style="display: table; margin-right: auto; margin-left: auto;">
			<tr>
				<td>번호</td>
				<td><%=dto.getNum()%></td>
				<td>작성자</td>
				<td><%=dto.getName()%></td>
			</tr>

			<tr>
				<td>작성일</td>
				<td><%=dto.getRegidate()%></td>
				<td>작성자</td>
				<td><%=dto.getVisitcount()%></td>
			</tr>

			<tr>
				<td>내용</td>
				<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>")%></td>
				<!-- 
				<textarea> 에서 줄바꿈을 위해 Enter키를 누르면
				\r\n 으로 저장된다. 이를 브라우저에 출력할때에는
				<br>로 변경한 후 출력해야 줄바꿈 처리가 된다.
			-->
			</tr>

			<tr>
				<td colspan="4" align="center">
					<%
					/*
					로그인이 되었고, 동시에 해당 글을 작성한 작성자이면
					수정, 삭제 버튼을 보이게 처리한다.
					*/
					if (session.getAttribute("USER_ID") != null && session.getAttribute("USER_ID").toString().equals(dto.getId())) {
					%>
					<button type="button"
						onclick="location.href='Edit.jsp?num=<%=dto.getNum()%>';">
						수정하기</button>
					<button type="button" onclick="isDelete();">삭제하기</button> <%
 }
 %>
					<button type="button"
						onclick="location.href='ListSimple.jsp?<%=queryStr%>';">
						리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>

