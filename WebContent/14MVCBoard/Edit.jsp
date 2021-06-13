<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title>
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
	function formValidate(f) {
		if (f.name.value == "") {
			alert("작성자를 입력하세요");
			f.name.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력하세요");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요");
			f.content.focus();
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
				<li class="nav-item"><a class="nav-link"
					href="../mvcboard/list.do">REVIEW</a></li>
				<li class="nav-item"><a class="nav-link"
					href="../08Board/ListSimple.jsp">Q&A</a></li>
			</ul>
		</div>
	</nav>
	</div>
	<h2 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">Edit</h2>
	<!--  
	수정 페이지에서도 파일을 첨부할 수 있으므로 enctype이 있어야한다. 
	만약 파일을 첨부하지 않은 상태로 수정을 하게되면, 기존의 파일명을
	그대로 유지해야 하므로 hidden 입력상자를 통해 기존 파일명을 
	전송한다. 
-->
	<form name="writeFrm" method="post" enctype="multipart/form-data"
		action="../mvcboard/edit.do" onsubmit="return formValidate(this);">
		<input type="hidden" name="idx" value="${dto.idx }" />
		<!-- 일련번호 -->
		<input type="hidden" name="prevOfile" value="${dto.ofile }" />
		<!-- 원본 파일명 -->
		<input type="hidden" name="prevSfile" value="${dto.sfile }" />
		<!-- 저장된 파일명 -->

		<table border="5" width="70%"
			style="display: table; margin-right: auto; margin-left: auto;">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" style="width: 150px;"
					value="${dto.name }" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%;"
					value="${dto.title }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width: 90%; height: 100px;">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<!-- 만약 첨부된 파일이 있다면 표시한다. --> <c:if test="${not empty dto.ofile }">
						<img src="../Uploads/${dto.sfile }" style="width: 100px;" />
						<br />
					</c:if> <input type="file" name="ofile" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
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