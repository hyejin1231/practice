<%@page import="ipptest.Student"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="s" class="ipptest.StudentDAO"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>학생목록</title>
</head>
<body>
<div align="center">
<h2>학생목록</h2>
<hr>
<table border="1">
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>학과</th>
		<th>전화번호</th>
		<th>이메일</th>
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
<a href="form2.html">학생등록</a>
</div>
</body>
</html>