<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ipptest.Customer" %>
<jsp:useBean id="c" class="ipptest.CustomerDAO"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�������ȸ</title>
</head>
<style>
	table{
		width : 800px;
	}
		
</style>
<body>
<div align="center">
<h2>ȸ�������ȸ</h2>
<hr>
<table border="1" >
	<tr>
		<th>ȸ�����̵�</th>
		<th>ȸ���̸�</th>
		<th>�̸���</th>
		<th>����ó</th>
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
<b>HRDKOREA Copyright��2015 All rights reserved. Human Resources Development Service of Korea</b>

</div>
</body>
</html>