<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lec.beans.*" %> <%-- DAO, DTO 모두  --%>
<jsp:useBean id="dao" class= "com.lec.beans.WriteDAO"/>
<%
	int wr_uid = Integer.parseInt(request.getParameter("wr_uid"));
	// ※ 이 단계에서 parameter 검증 필요
%>
<%
	// dao를 사용한 트랜잭션 
	WriteDTO [] arr  = dao.selectByUid(wr_uid);
%>

<%
	String name = arr[0].getWr_name();
	String subject = arr[0].getWr_subject();
	String content = arr[0].getWr_content();
	String regdate = arr[0].getWr_regdate();
	int viewcnt = arr[0].getWr_viewcnt();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정 <%= subject %></title>
</head>
<script>
// form 검증 
function chkSubmit() {
	frm = document.forms["frm"];
	
//	var name = frm["name"].value.trim();
	var subject = frm["wr_subject"].value.trim();
	
//	if( name == ""){
//		alert("작성자 란은 반드시 입력해야 합니다.");
//		frm["name"].focus();
//		return false; // submit 안됨 
//	}
	
	if(subject == "") {
		alert("제목은 반드시 작성해야 합니다.");
		frm["wr_subject"].focus();
		return false;
	}
	
	return true;
	
}
</script>
<body>
<h2>수정</h2>
<%--내용 과 제목만 수정 가능. submit 하기전에 검증 --%>
<form name="frm" action="updateOk.jsp" 
	method="post" onsubmit="return chkSubmit()">
	
<input type = "hidden" name = "wr_uid" value = "<%=wr_uid %>"/>
작성자 : <%= name %><br>  <%-- 작성자 이름은 변경 불가 --%>
제목 : 
<input type="text" name="wr_subject" value="<%= subject%>"><br>
내용 :
<textarea name="wr_content"><%= content %></textarea>
<br><br>
<input type="submit" value="수정"/>
</form>

<button onclick="history.back()">이전으로</button>
<button onclick="location.href = 'list.jsp'">목록보기</button>

</body>
</html>
















