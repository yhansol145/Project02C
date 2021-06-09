<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판</title> 
</head>
<body>
<script>
function commentValidate(f){
	if(f.pass.value==""){
		alert("비밀번호를 입력하세요");
		f.pass.focus();
		return false;
	}
}
</script>
<h2>댓글삭제</h2>
<form name="commentFrm" method="post" action="./commentDeleteAction.comm" onsubmit="return commentValidate(this);">
<input type="hidden" name="idx" value="${param.idx }" />
<input type="hidden" name="board_idx" value="${param.board_idx }" />
<table border="1" width="90%">
	<colgroup>
		<col width="30%"/>
		<col width="40%"/>
		<col width="*"/>
	</colgroup>
	<tr>
		<td>작성자 : <input type="text" name="name" size="10" value="${dto.name }" readonly style="background-color:#888888;" /></td>
		<td colspan="2">비밀번호 : <input type="password" name="pass" size="10" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="comments" style="width:100%;height:70px;background-color:#888888;" readonly>${dto.comments }</textarea>
		</td>
		<td><input type="submit" value="댓글삭제" style="width:80px;height:77px;background-color:#FF0000;" /></td>
	</tr>
</table>
</form>
</body>
</html>