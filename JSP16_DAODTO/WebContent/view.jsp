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
<%@ include file="inc_header.html"%>
<title>읽기 <%= subject %></title>
</head>
<style>
.a {
margin: 20px 0px 0px 0px;
}
</style>
<script>
	function chkDelete(wr_uid) {
		var r = confirm("삭제하시겠습니까?");
		
		if(r) {
			location.href = 'deleteOk.jsp?wr_uid=' + wr_uid;
		}
	}
</script>
<body>
<div class="container shadow mx-auto mt-5 p-5 w-60">
<h2><%=subject %></h2>
<hr>

<div class="container shadow mx-auto mt-5 p-5 w-60">
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
</div>

<div class = "a">
<button onclick = "location.href = 'update.jsp?wr_uid=<%=wr_uid %>'" class="btn btn-warning ml-2">수정하기</button>
<button onclick = "location.href = 'list.jsp'" class="btn btn-success ml-2">목록보기</button>
<button onclick = "chkDelete(<%=wr_uid%>)" class="btn btn-secondary ml-2">삭제하기</button>
<button onclick = "location.href=  'write.jsp'" class="btn btn-outline-success ml-2">신규등록</button>
</div>

</div>
</body>
</html>
















