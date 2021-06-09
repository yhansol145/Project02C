<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL 사용을 위한 taglib 지시어 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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

	<h2 style="text-align: center; margin-top: 50px;">Review</h2>

	<form method="get">
		<table border="5" width="70%"
			style="margin-right: auto; margin-left: auto; margin-top: 50px;">
			<tr>
				<td align="center"><select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select> <input type="text" name="searchWord" /> <input type="submit"
					value="검색하기" /></td>
			</tr>
		</table>
	</form>
	<table border="5" width="70%"
		style="text-align: center; margin-right: auto; margin-left: auto;">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="8%">첨부</th>
		</tr>
		<!-- 게시물 출력 부분을 JSTL로 변경함 -->
		<c:choose>
			<c:when test="${empty boardLists }">
				<!-- 등록된 게시물이 없을때. -->
				<tr>
					<td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 게시물이 있는 경우 확장 for문 형태의 forEach태그 사용함. -->
				<c:forEach items="${boardLists }" var="row" varStatus="loop">
					<tr align="center">
						<td>
							<!-- 가상번호 --> ${map.totalCount - (((map.pageNum-1) * map.pageSize) 
					+ loop.index)}
						</td>
						<td align="left"><a
							href="../mvcboard/view.do?idx=${row.idx }">${row.title }</a></td>
						<td>${row.name }</td>
						<td>${row.visitcount }</td>
						<td>${row.postdate }</td>
						<td>
							<!-- 첨부된 파일이 있는경우에만 다운로드 링크 출력됨. --> <c:if
								test="${not empty row.ofile }">
								<!-- 파일 다운로드 시 다운로드 횟수를 증가해야 하므로 
					게시물의 일련번호가 필요함. -->
								<a
									href="../mvcboard/download.do?ofile=${row.ofile 
					}&sfile=${row.sfile }&idx=${row.idx }">[Down]</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<table border="5" width="70%"
		style="margin-right: auto; margin-left: auto;">
		<tr align="center">
			<td>
				<!-- 컨트롤러에서 map에 저장한 페이지번호 문자열 출력 --> ${map.pagingImg }
			</td>
			<td width="100"><button type="button"
					onclick="location.href='../mvcboard/write.do';">글쓰기</button></td>
		</tr>
	</table>

	<%@ include file="../layout/footer.jsp"%>
</body>
</html>