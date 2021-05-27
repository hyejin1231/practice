<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="addpd" class="jspbook.ch07.AddPd"/>
<jsp:setProperty name="addpd" property="*"/>
<jsp:useBean id="am" class="jspbook.ch07.PdManager" scope="application"/>
<%
	am.add(addpd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
</head>
<body>
<div align="center">
<H2>등록내용</H2>
제품명 : <jsp:getProperty property="pdname" name="addpd"/><P>
제품코드 : <%=addpd.getPdcode() %><P>
제조사: <%=addpd.getPdcom() %> <P>

<HR>
<a href="pd_list.jsp">목록 보기</a>
</div>
</body>
</html>