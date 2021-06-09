<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="isLogin.jsp" %>
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
	<h2 style="text-align: center; margin-top: 50px;">Detail View</h2>
	<table border="5" width="90%" style="margin-right: auto; margin-left: auto;">
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="*" />
		</colgroup>
		<tr>
			<td>번호</td>
			<td>${dto.idx }</td>
			<td>작성자</td>
			<td>${dto.name }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${dto.postdate }</td>
			<td>조회수</td>
			<td>${dto.visitcount }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3">${dto.title }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100">${dto.content }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<!-- 첨부한 파일이 있을때만 다운로드 링크 활성화 --> <c:if
					test="${not empty dto.ofile }">
			${dto.ofile }<!-- 기존 파일명 출력 -->
					<a
						href="../mvcboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile 
				}&idx=${dto.idx }">
						[다운로드] </a>
				</c:if>
			</td>
			<td>다운로드수</td>
			<td>${dto.downcount }</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<!--  
			비회원제 게시판의 경우 수정, 삭제를 위해 먼저 비밀번호 검증을
			진행해야 한다. 따라서 동일한 요청명으로 진입하는 대신 파라미터
			mode를 통해 수정/삭제를 구분하여 분기한다. 
			-->
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=edit&idx=${param.idx}';">
					수정하기</button>
				<button type="button"
					onclick="location.href='../mvcboard/pass.do?mode=delete&idx=${param.idx}';">
					삭제하기</button>
				<button type="button" onclick="location.href='../mvcboard/list.do';">
					리스트바로가기</button>
			</td>
		</tr>
	</table>
	<!-- 댓글 작성 폼 추가 -->
	<h2 style="text-align: center; margin-top: 50px;">Comment</h2>
	<script>
function commentValidate(f){
	if(f.name.value==""){
		alert("작성자를 입력하세요");
		f.name.focus();
		return false;
	}
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;
	}
	if(f.comments.value==""){
		alert("댓글 내용을 입력하세요");
		f.comments.focus();
		return false;
	}
}
</script>
	<form name="commentFrm" method="post" action="./commentWrite.comm"
		onsubmit="return commentValidate(this);">
		<!-- 해당 게시물의 일련번호로 댓글 테이블의 참조키가 된다. -->
		<input type="hidden" name="board_idx" value="${param.idx }" />
		<table border="5" width="90%" style="margin-right: auto; margin-left: auto;">
			<colgroup>
				<col width="30%" />
				<col width="40%" />
				<col width="*" />
			</colgroup>
			<tr>
				<td>작성자 : <input type="text" name="name" size="10" /></td>
				<td colspan="2">비밀번호 : <input type="password" name="pass"
					size="10" /></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="comments"
						style="width: 100%; height: 70px;"></textarea></td>
				<td><input type="submit" value="댓글쓰기"
					style="width: 80px; height: 77px;" /></td>
			</tr>
		</table>

		<h2 style="text-align: center; margin-top: 50px;">Comment List</h2>
		<script>
function commentEdit(idx, board_idx){
	window.open('./commentEdit.comm?idx='+idx+'&board_idx='+board_idx,'
			commentPop', 'top=0, left=0, width=700, height=300');
}
function commentDelete(idx, board_idx){
	window.open('./commentDelete.comm?idx='+idx+'&board_idx='+board_idx,'
			commentPop', 'top=0, left=0, width=700, height=300');
}
</script>
		<!--  
	HTML5에서 지원하는 앵커(Ancher) 기능으로 해당 페이지에서 특정
	위치를 로드하고 싶을때 아래와같이 <a태그에 name속성을 부여한다.
	사용시에는 쿼리스트링 마지막에 #앵커명 형태로 사용하면 된다.
-->
		<a name="commentsList"></a>
		<table border="5" width="90%" style="margin-right: auto; margin-left: auto;">
			<colgroup>
				<col width="30%" />
				<col width="40%" />
				<col width="*" />
			</colgroup>
			<c:choose>
				<c:when test="${empty comments }">
					<tr>
						<td colspan="3" align="center">등록된 댓글이 없습니다 ^^</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${comments }" var="row" varStatus="loop">
						<tr>
							<td>작성자 : ${row.name }</td>
							<td>작성일 : ${row.postdate }</td>
							<td>
								<!-- 수정, 삭제를 위해 전달되는 파라미터는 댓글의 일련번호,
					해당 게시물의 일련번호 2개가 필요하다. --> <input type="button" value="수정"
								onclick="commentEdit(${row.idx }, ${row.board_idx 
					})" />
								<input type="button" value="삭제"
								onclick="commentDelete(${row.idx }, ${row.board_idx 
					})" />
							</td>
						</tr>
						<tr>
							<td colspan="3">${row.comments }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<%@ include file="../layout/footer.jsp"%>
</body>
</html>
