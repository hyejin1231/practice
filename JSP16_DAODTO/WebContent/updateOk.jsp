<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<jsp:useBean id="dao" class = "com.lec.beans.WriteDAO"/>
<%
	request.setCharacterEncoding("utf-8");

	int wr_uid = Integer.parseInt(request.getParameter("wr_uid"));
	String wr_subject = request.getParameter("wr_subject");
	String wr_content = request.getParameter("wr_content");
%>    

<%
	int cnt = dao.update(wr_uid, wr_subject, wr_content);
%>



<% if(cnt == 0){ %>
<script>
	alert ("수정 실패");
	history.back();
</script>

<% } else { %>
<script>
	alert("수정성공");
	location.href = "view.jsp?wr_uid=<%=wr_uid%>"; <%-- 수정성공하면 view 로 이동해서 제대로 수정되었는지 확인--%>
</script>

<% } %>



