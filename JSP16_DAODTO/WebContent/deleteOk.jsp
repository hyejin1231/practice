<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   <%-- JDBC 관련 클래스 import --%>
<jsp:useBean id="dao" class = "com.lec.beans.WriteDAO"/>

<%
	int wr_uid = Integer.parseInt(request.getParameter("wr_uid"));
%>  

<%
	int cnt = dao.deleteByUid(wr_uid);
%>
  
<% if(cnt == 0){ %>
<script>
	alert("삭제실패");
	history.back();
</script>
<% } else { %>
<script>
	alert("삭제성공");
	location.href = "list.jsp";
</script>
<% } %>