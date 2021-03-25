<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박혜진</title>
</head>
<body>
<%! String str = "박혜진";

%>
	
	현재 시각 : <%=new java.util.Date() %>
	<hr>
	
	안녕하세요! <br>
	

	<%=str.substring(0,1) %> <br>
	<%=str.substring(1,2) %> <br>
	<%=str.substring(2,3) %> <br>



	입니다.
	
</body>
</html>