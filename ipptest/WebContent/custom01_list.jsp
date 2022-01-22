<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ipptest.Customer" %>
<jsp:useBean id="c" class="ipptest.CustomerDAO"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원목록조회</title>
</head>
<style>
	table{
		width : 800px;
	}
		
</style>
<body>
<div align="center">
<h2>회원목록조회</h2>
<hr>
<table border="1" >
	<tr>
		<th>회원아이디</th>
		<th>회원이름</th>
		<th>이메일</th>
		<th>연락처</th>
	</tr>
	
	<%
		for(Customer customer : c.getAll()){
	%>
		<tr>
			<td><%=customer.getP_id() %></td>
			<td><%=customer.getC_name() %></td>
			<td><%=customer.getC_email() %></td>
			<td><%=customer.getC_tel() %></td>
		
		</tr>
	<% 		
		}
	
	%>
	
	
</table>
<b>HRDKOREA Copyrightⓒ2015 All rights reserved. Human Resources Development Service of Korea</b>

</div>
</body>
</html>