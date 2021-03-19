<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	<%
		int sum = 0;
		
		for(int i = 1; i <= 100; i++) {
			sum += i;
		}
	%>
	
	1부터 100까지의 합은?! : <%= sum %>
	
	--%>
	
	<H3>오늘의 할일</H3>
	- jsp 복습하기 <br> 
	- 여고추리반 보기 <br>
	- 책 읽기 <br>
	
	<%@ include file = "test.jsp" %>

</body>
</html>