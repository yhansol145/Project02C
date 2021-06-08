<%@page import="utils.JSFunction"%>
<%@page import="model.member.MembershipDTO"%>
<%@page import="org.apache.catalina.tribes.membership.Membership"%>
<%@page import="model.member.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
글쓰기 페이지에서 오랫동안 머물러 세션이 소멸되는 경우가 
발생할 수 있으므로, 쓰기 처리를 할때도 반드시 세션을 
확인해야 한다. 
-->    
<%
//폼값 받기

MembershipDAO dao = new MembershipDAO(application); 

String Id = request.getParameter("user_id"); 
String pass = request.getParameter("pass1");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String zipcode = request.getParameter("zipcode");
String address = request.getParameter("address");
String address2 = request.getParameter("address2");
String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");
String mobile1 = request.getParameter("mobile1");
String mobile2 = request.getParameter("mobile2");
String mobile3 = request.getParameter("mobile3");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");


//폼값과 로그인 아이디를 저장하기 위한 DTO객체
MembershipDTO dto = new MembershipDTO();
dto.setId(Id);
dto.setPass(pass); 
dto.setName(name);
dto.setBirth(birth); 
dto.setZipcode(zipcode);
dto.setAddress(address); 
dto.setAddress2(address2);
dto.setEmail(email1+"@"+email2); 
dto.setMobile(mobile1+"-"+mobile2+"-"+mobile3);
dto.setTel(tel1+"-"+tel2+"-"+tel3);

int iResult = dao.insertWrite(dto); 
dao.close();
if(iResult==1) {
   response.sendRedirect("../index.jsp");
}
else {
   JSFunction.alertBack("회원가입에 실패하였습니다.", out); 
}
%> 


