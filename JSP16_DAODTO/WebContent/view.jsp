<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %>    
<jsp:useBean id="dao" class="com.lec.beans.WriteDAO"/>

<%
	int wr_uid = Integer.parseInt(request.getParameter("wr_uid"));
%>  

<% // dao 를 사용한 트랜잭션
	WriteDTO [] arr = dao.readByUid(wr_uid);
%>

<% if(arr == null || arr.length == 0){ %>
		<script>
			alert("해당 글이 삭제되거나 없습니다");
			history.back();
		</script>
<%
		return;
	}
%>

<%
	String name = arr[0].getWr_name();
	String subject =  arr[0].getWr_subject();
	String content = arr[0].getWr_content();
	String regdate = arr[0].getWr_regdate();
	int viewcnt =  arr[0].getWr_viewcnt();
%>


<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>읽기 <%= subject %></title>
</head>
<script>
	function chkDelete(wr_uid) {
		var r = confirm("삭제하시겠습니까?");
		
		if(r) {
			location.href = 'deleteOk.jsp?wr_uid=' + wr_uid;
		}
	}
</script>
<body>
<h2>읽기 <%=subject %></h2>
<br>
wr_uid : <%= wr_uid %><br>
작성자 : <%= name %><br>
제목: <%= subject %><br>
등록일: <%= regdate %><br>
조회수: <%= viewcnt %><br>
내용: <br>
<hr>
<div>
<%= content %>
</div>
<hr>
<br>
<button onclick = "location.href = 'update.jsp?wr_uid=<%=wr_uid %>'">수정하기</button>
<button onclick = "location.href = 'list.jsp'">목록보기</button>
<button onclick = "chkDelete(<%=wr_uid%>)">삭제하기</button>
<button onclick = "location.href=  'write.jsp'">신규등록</button>
</body>
</html>
















