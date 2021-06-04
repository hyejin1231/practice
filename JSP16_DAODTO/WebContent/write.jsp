<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="inc_header.html"%>
<title>Write Page</title>
</head>
<script>
	function chkSubmit() {
		frm = document.forms["frm"];
		
		var name = frm["wr_name"].value.trim();
		var subject = frm["wr_subject"].value.trim();
		
		if(name == "") {
			alert("작성자는 반드시 작성해야합니다.");
			frm["wr_name"].focus();
			return false;
		}
		
		if(subject == "") {
			alert("제목은 반드시 작성해야합니다.");
			frm["wr_subject"].focus();
			return false;
		}
		
		return true;
		
	}
</script>
<body>
<div class="container shadow mx-auto mt-5 p-5 w-60">
 <h2>글 작성</h2>
 <hr>
 
 <div class="container shadow mx-auto mt-5 p-5 w-60">
 <form name = "frm" action="writeOk.jsp" method="post" onsubmit="return chkSubmit()">
 	작성자 : <input type="text" name="wr_name" style="margin: 10px 10px 10px 10px;" /> <br> 
 	제목 : <input type="text" name = "wr_subject" style="margin: 10px 10px 10px 20px;"/> <br>
 	내용: <br>
 	<textarea name="wr_content" style="margin: 10px 0px 0px 0px;"> </textarea>
 	<br><br>
 	
 	<input type="submit" value="등록" class="btn btn-warning ml-2"/> 
 </form>
 
 </div>


 <button type="button" onclick="location.href='list.jsp'" style="margin: 20px 0px 0px 0px;" class="btn btn-success ml-2">목록으로</button>
 
 </div>
</body>
</html>







