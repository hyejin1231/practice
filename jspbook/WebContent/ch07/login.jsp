<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="login" class="jspbook.ch07.LoginBean" scope="page"/>
<jsp:setProperty name="login" property="*"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login.jsp</title>
</head>
<body>
<div align="center">
	<h2>로그인~~</h2>
	<hr>
	
	<%
		if(!login.checkUser()) {
			out.println("로그인 실패ㅠㅠ");
		}else{
			out.println("로그인 성공!");
		}
		
	%>
	
	
	<hr>
	
	사용자 아이디: <jsp:getProperty property="userid" name="login"/>
	사용자 비밀번호: <jsp:getProperty property="passwd" name="login"/>
</div>
</body>
</html>