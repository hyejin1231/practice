<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adult page</title>
</head>
<body>
	<%
		int age; 
	
		String str = request.getParameter("age");
		age = Integer.parseInt(str);
		
	%>
	
	당신은 <%=age %> 세 입니다. 
	당신은 성인이기 때문에 사이트를 이용가능합니다~~<br/>
	<a href="input_age.html">처음으로 돌아가기</a>
</body>
</html>