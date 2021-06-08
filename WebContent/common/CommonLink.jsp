<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<tr>
			<td>
			<!-- 로그인 여부를 판단하기 위해 session영역의 속성을 사용한다. -->
			<% if(session.getAttribute("USER_ID")==null){ %>
				<a href="../Session/Login.jsp"></a>
				<% } %>
			</td>
		</tr>
</body>
</html>