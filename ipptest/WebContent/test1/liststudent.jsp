<%@page import="ipptest.Student"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="s" class="ipptest.StudentDAO"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�л����</title>
</head>
<body>
<div align="center">
<h2>�л����</h2>
<hr>
<table border="1">
	<tr>
		<th>�й�</th>
		<th>�̸�</th>
		<th>�а�</th>
		<th>��ȭ��ȣ</th>
		<th>�̸���</th>
	</tr>
	
	<%
		for(Student student : s.listAll() ) {
	%>
		<tr>
			<td><%=student.getStudno() %></td>
			<td><%=student.getName() %></td>
			<td><%=student.getDept() %></td>
			<td><%=student.getTel() %></td>
			<td><%=student.getEmail() %></td>
		</tr>
	<% 		
		}
	%>
</table>
<a href="form2.html">�л����</a>
</div>
</body>
</html>