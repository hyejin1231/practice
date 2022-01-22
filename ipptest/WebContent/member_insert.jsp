<%@page import="ipptest.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    	request.setCharacterEncoding("euc-kr");
    		
%>    
<jsp:useBean id="cust" class="ipptest.Customer"/>    
<jsp:setProperty property="*" name ="cust"/>    
<%

	CustomerDAO dao = new CustomerDAO();
	int cnt = dao.add(cust);
	if(cnt == 1) {
		out.println("<script>alert('등록이 완료 되었습니다.!'); history.go(-1);</script>");
	}else{
		out.println("<script>alert('등록 실패!!'); history.go(-1);</script>");
	}
%>
