<%@page import="jspbook.ch07.AddPd"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="am" class="jspbook.ch07.PdManager" scope="application"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록 </title>
</head>
<body>
<div align="center">
<h2>제품 등록</h2>
<hr>
<a href="pd_form.html">제품추가</a><p>
<table border=1 width=500>
<tr><td>제품명</td><td>제품코드</td><td>제조사</td></tr>
<%
	for(AddPd pd : am.getAddrList()) {
%>
	<tr>
	<td><%=pd.getPdname() %></td>
	<td><%=pd.getPdcode() %></td>
	<td><%=pd.getPdcom() %></td>
<%	
	}
%>
</table>
</div>
</body>
</html>