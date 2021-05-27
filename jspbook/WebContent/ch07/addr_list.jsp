<%@page import="jspbook.ch07.AddBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="am" class="jspbook.ch07.AddrManager" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 리스트</title>
</head>
<body>
<div align="center">
<h2>주소록 리스트</h2>
<hr>
<a href="addr_form.html">주소추가</a><p>
<table border=1 width=500>
<tr><td>이름</td><td>전화번호</td><td>이메일</td><td>성별</td></tr>
<%
	for(AddBean ab : am.getAddrList()) {
%>
	<tr>
	<td><%=ab.getUsername() %></td>
	<td><%=ab.getTel() %></td>
	<td><%=ab.getEmail() %></td>
	<td><%=ab.getGender() %></td></tr>
<%	
	}
%>
</table>
</div>
</body>
</html>