<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ch06: session.jsp</title>
</head>
<body>
<div align="center">
	<h2> session 예제</h2>
	<hr>
	<%
		if(session.isNew()) {
			out.println("<script> alert('세션이 헤제되어 다시 설정합니다.')</script>");
			session.setAttribute("login","홍길동");
		}
	%>
	
	<%= session.getAttribute("login") %> 님 환영합니다!! <br>
	
	1. 세션 id : <%= session.getId() %> <br>
	2. 세션 유지기간 : <%= session.getMaxInactiveInterval() %> <br>
	
</div>
</body>
</html>