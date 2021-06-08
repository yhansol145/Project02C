<%@page import="model.member.MembershipDTO"%>
<%@page import="model.member.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <% request.setCharacterEncoding("utf-8"); %>

<%
String name = request.getParameter("userName");
String email = request.getParameter("userEmail");

MembershipDAO dao = new MembershipDAO(application);
MembershipDTO dto = new MembershipDTO();

dto.setName(name);
dto.setEmail(email);

String user_id = dao.findId(dto);
%>


<%if(user_id == null){ %>
<script type="text/javascript">
alert("존재하지 않은 계정입니다");
history.go(-1);
</script>
<%}else{%>
<script type="text/javascript">
alert("찾으시는 계정은 <%=user_id%>입니다.");
location.href="Login.jsp";
</script>
<%}%>