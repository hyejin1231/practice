<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<TITLE>ch05 :footer.jsp</TITLE></HEAD>
<BODY>
footer.jsp 에서 출력한  메시지 입니다.
<HR>
<!-- jsp:param을 통해 받은 것을 name으로 설정한 이름을 request.getParameter로 받기 -->
<%= request.getParameter("email") %>,
<%= request.getParameter("tel") %>
<br>
<%
	out.println(request.getParameter("tel"));
%>
</body>
</html>