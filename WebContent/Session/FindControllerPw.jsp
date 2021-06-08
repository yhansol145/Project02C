<%@page import="model.member.MembershipDTO"%>
<%@page import="model.member.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("utf-8"); %>
    
<%
String id = request.getParameter("userId");
String email = request.getParameter("userEmail");

MembershipDAO dao = new MembershipDAO(application);
MembershipDTO dto = new MembershipDTO();

dto.setId(id);
dto.setEmail(email);



String user_pw = dao.findPw(dto);
%>

<%if(user_pw == null){ %>
<script type="text/javascript">
alert("계정, 이메일 정보를 확인하세요");
history.go(-1);
</script>
<%}else{%>
<script type="text/javascript">
alert("찾으시는 비밀번호는은 <%=user_pw%>입니다.");
location.href="Login.jsp";
</script>
<%}%>