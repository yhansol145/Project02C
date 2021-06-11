<%@page import="model1.board.BoardDAO"%>
<%@page import="utils.BoardPage"%>
<%@page import="common.BoardConfig"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//application 내장객체를 인수로 DAO객체를 생성한다. (DB연결)
BoardDAO dao = new BoardDAO(application);

//파라미터를 저장하기 위해 Map컬렉션 생성
Map<String, Object> param = new HashMap<String, Object>();

//검색에 대한 파라미터를 받아서 변수에 저장
String searchField = request.getParameter("searchField"); //검색할 필드명
String searchWord = request.getParameter("searchWord"); //검색어

String queryStr = "";

//사용자가 검색을 했다면
if (searchWord != null) {
	//검색필드와 검색어를 Map에 추가한다.
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}

//게시물의 전체 갯수를 카운트하기 위한 메소드 호출
int totalCount = dao.selectCount(param);
System.out.println("토탈카운트"+ totalCount);


/*** 페이지 처리 start ***/
int pageSize = BoardConfig.PAGE_PER_SIZE; //한페이지에 출력할 게시물의 갯수
int blockPage = BoardConfig.PAGE_PER_BLOCK; //한 블럭당 출력할 페이지번호의 갯수
int totalPage = (int)Math.ceil((double)totalCount/pageSize); //전체 페이지 수 계산
int pageNum = 1; //목록 첫 진입시에는 무조건 1페이지로 설정

//만약 파라미터로 전달된 페이지번호가 있다면
String pageTemp = request.getParameter("pageNum");
if(pageTemp!=null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp); //해당 번호로 페이지번호를 지정한다.
	
//목록을 페이지별로 구분하기 위해 between에 사용할 값 계산
int start = (pageNum-1) * pageSize;
int end = pageSize;



//계산된 값은 Map컬렉션에 저장
param.put("start", start);
param.put("end", end);

/*** 페이지처리 end ***/

//목록에 실제 출력할 레코드를 얻어오기 위한 메소드 호출
List<BoardDTO> boardLists = dao.selectListPage(param);
//자원해제
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
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
	<h2 style="text-align: center; margin-top: 50px; margin-bottom: 50px;">Q&A</h2>
	<%@ include file="../common/CommonLink.jsp"%>

	<form method="get" style="display: table; margin-right: auto; margin-left: auto;">
		<table width="70%">
			<tr align="center">
				<select name="searchField">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchWord" />
				<input type="submit" value="검색하기" />
			</tr>
		</table>
	</form>

	<!-- 목록 출력을 위한 테이블 -->
	<table border="5" width="70%" style="display: table; margin-right: auto; margin-left: auto; text-align: center">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<%
		if (boardLists.isEmpty()) {
			//컬렉션에 저장된 데이터가 없다면...
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
		</tr>
		<%
		} else {
		//컬렉션에 저장된 데이터가 있다면 해당 내용을 반복하여 출력한다.
		int vNum = 0; //목록의 가상번호로 사용
		int countNum = 0;
		//List컬렉션에 저장된 갯수만큼 반복하기 위해 확장 for문 사용
		for (BoardDTO dto : boardLists) {
			//게시물 카운트수를 통해 가상번호 부여
			vNum = totalCount--;

			//getter()를 통해 출력한다.
		%>
		<tr align="center">
			<td><%=vNum%></td>
			<td align="left"><a href="View.jsp?num=<%=dto.getNum()%> "><%=dto.getTitle()%></a>
			</td>
			<td align="center"><%=dto.getId()%></td>
			<td align="center"><%=dto.getVisitcount()%></td>
			<td align="center"><%=dto.getRegidate()%></td>
		</tr>
		<%
		}
		}
		%>
	</table>
	<table border="5" width="70%" style="display: table; margin-right: auto; margin-left: auto;">
		<tr align="center">
			<td>
				<%=BoardPage.pagingStr(totalCount, pageSize,
  					blockPage, pageNum, request.getRequestURI(), queryStr) %>
			</td>
			<td width="100"><button type="button" 
				onclick="location.href='Write.jsp';">글쓰기</button></td>
		</tr>
	</table>
	<%@ include file="../layout/footer.jsp"%>
</body>
</html>