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
		out.println("<script>alert('����� �Ϸ� �Ǿ����ϴ�.!'); history.go(-1);</script>");
	}else{
		out.println("<script>alert('��� ����!!'); history.go(-1);</script>");
	}
%>
