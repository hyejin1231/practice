<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<jsp:useBean id="dao" class="com.lec.beans.WriteDAO"/>
<%
	request.setCharacterEncoding("utf-8"); //한글 인코딩!!
%>

<jsp:useBean id="dto" class="com.lec.beans.WriteDTO"/>


<jsp:setProperty property ="*" name = "dto"/>

<%

	int cnt= dao.insert(dto);
%>


<% if(cnt == 0){ %>
	<script>
		alert("등록 실패!!!!!");
		history.back();
	</script>
<% } else { %>
	<script>
		alert("등록성공, 리스트를 출력합니다");
		location.href = "list.jsp";
	</script>
<% }  %>









