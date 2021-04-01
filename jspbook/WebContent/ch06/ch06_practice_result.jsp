<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	// 한글 캐릭터셋 변환
	request.setCharacterEncoding("UTF-8");
	// HTML 폼에서 username으로 전달된 값을 가지고 옴 
	String username = request.getParameter("username");
	
	// username이 null 이 아닌 경우 세션에 값을 저장
	if(username != null) {
		session.setAttribute("user",username);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result!</title>
</head>
<body>

	안녕하세요! <br>
	
	<%=username.substring(0,1) %> <br>
	<%=username.substring(1,2) %> <br>
	<%=username.substring(2,3) %> <br>


	입니다.
</body>
</html>