<%@page import="model.member.MembershipDAO"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값으로 전송된 파라미터를 받아옴
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

//web.xml의 컨텍스트 초기화 파라미터 읽어옴


//DAO객체 생성 및 DB연결
MembershipDAO dao = new MembershipDAO(application);

//폼값으로 받은 아이디, 패스워드를 통해 로그인 처리 메소드 호출
Map<String, String> memberMap = dao.getMemberMap(id, pw); 


if(memberMap.get("id") != null){
	//로그인에 성공한 경우 session영역에 회원인증정보를 저장한다.
	session.setAttribute("USER_ID", memberMap.get("id"));
	session.setAttribute("USER_PW", memberMap.get("pass"));
	session.setAttribute("USER_NAME", memberMap.get("name"));
	//로그인 페이지로 이동
	response.sendRedirect("Login.jsp");
}
else{
	//로그인 실패시 request영역에 속성을 저장한다.
	request.setAttribute("ERROR_MSG", "* 회원정보를 올바르게 입력하세요 *");
	//로그인 페이지로 포워드(전달) 한다.
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
%>