<%@page import="model.member.MembershipDTO"%>
<%@page import="model.member.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
String Id = request.getParameter("Id");
System.out.println(Id);

MembershipDAO dao = new MembershipDAO();
boolean check = dao.checkId(Id);
%>

<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
			function idUse() {
				/* 
				팝업창에서 재 입력한 아이디를 부모창으로 전달하기 위해 opener속성을 사용한다.
				팝업창이 열릴때 부모쪽에서는 readonly속성이 부여되어 
				사용자는 수정할 수 없게되지만 JS에서는 값을 수정할 수 있다.
				*/
				opener.document.loginFrm.user_id.value =
					document.overlapFrm.retype_id.value;
				self.close();
			}
		</script>
</head>

<body>
	<h2>아이디 중복확인 하기</h2>

	<h3>
		입력한 아이디 :
		<%=request.getParameter("id") %></h3>
		
	
	<%
		if(check==true){
			out.println("중복된 아이디가 있습니다. 다른아이디를 입력하세요");
		}
		else{
			out.println("사용 가능한 아이디입니다.");
		}
	%>
	<a href="#" onclick="self.close();">닫기</a>
	
	
	<h3>아이디가 중복되었을때 재입력한 아이디</h3>
	<form name="overlapFrm">
		<input type="text" name="retype_id" size="20" /> <input type="button"
			value="아이디사용하기" onclick="idUse();" />
	</form>
</body>

</html>