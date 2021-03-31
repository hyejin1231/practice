
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>    
<jsp:useBean id="dao" class="com.lec.beans.WriteDAO"/>  <%-- DAO 빈 객체 생성 --%>
<%  // dao 사용한 트랜잭션
	WriteDTO [] arr = dao.select();
%>
  
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>List Page</title>
<style>
table {width : 100%;}
table, th, td {
	border : 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>



	<hr>
		<h2>리스트</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
			
		<%
		for(int i = 0; i < arr.length; i++){
			out.println("<tr>");
			out.println("<td>" + arr[i].getWr_Uid() + "</td>");
			out.println("<td><a href='view.jsp?wr_uid=" + arr[i].getWr_Uid() + "'>" + arr[i].getWr_subject() + "</a></td>");
			out.println("<td>" + arr[i].getWr_name() + "</td>");
			out.println("<td>" + arr[i].getWr_viewcnt() + "</td>");
			out.println("<td>" + arr[i].getWr_regdate() + "</td>");
			out.println("</tr>");
		}
%>
			
		
	</table>
	<br>
	<button onclick = "location.href = 'write.jsp'">신규등록</button>	



</body>
</html>














