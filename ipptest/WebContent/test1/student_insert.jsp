<%@page import="ipptest.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="stud" class="ipptest.Student"/>
<jsp:setProperty property="*" name="stud"/>
<%
	StudentDAO dao = new StudentDAO();
	int cnt = dao.add(stud);
	if(cnt == 1) {
		out.println("<script>alert('등록이 완료 되었습니다.!');location.href='liststudent.jsp'; </script>");
	}else {
		out.println("<script>alert('등록 실패!!'); history.go(-1);</script>");
	}
	
%>