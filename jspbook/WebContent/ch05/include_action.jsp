<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<TITLE>ch05 :include action 테스트</TITLE></HEAD>
<BODY>
<H2>include_action.jsp 에서footer.jsp 호출</H2>
<HR>
include_action.jsp 에서 출력한 메시지 입니다.<BR>

<jsp:include page="footer.jsp">
<!-- jsp:param -->
<!-- include, forward 액션에서 사용할 수 있는 파라미터를 설정한다.  -->
	<jsp:param name="email" value="test@test.net" />
	<jsp:param name="tel" value="000-000-0000" />
</jsp:include>
</body>
</html>