<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<p>지금 현재 페이지는 include 페이지입니다!!</p>
	
	<jsp:include page="sub.jsp"/>
	<p> 위 라인의 내용은 sub페이지의 내용입니다~~</p>
	
</body>
</html>