<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="display: block; margin-right: auto; margin-left: auto;">
		<form action="FindControllerPw.jsp" method="post">
			<p>아이디 : </p>
			<input type="text" size="20" name="userId"
				placeholder="아이디를 입력해주세요" required> <br class="clear">
			<p>이메일 : </p>
			<input type="text" size="20" name="userEmail"
				placeholder=" 이메일을 입력해주세요." required> <br class="clear">
	
			</div>
			<br /><br />
			<input type="submit" value="FIND PW" class="findpw">
		</form>
	</div>
</body>
</html>