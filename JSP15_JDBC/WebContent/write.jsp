<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write Page</title>
</head>
<script>
	function chkSubmit() {
		frm = document.forms["frm"];
		
		var name = frm["name"].value.trim();
		var subject = frm["subject"].value.trim();
		
		if(name == "") {
			alert("작성자는 반드시 작성해야합니다.");
			frm["name"].focus();
			return false;
		}
		
		if(subject == "") {
			alert("제목은 반드시 작성해야합니다.");
			frm["subject"].focus();
			return false;
		}
		
		return true;
		
	}
</script>
<body>
 <h1>글 작성</h1>
 
 <form name = "frm" action="writeOk.jsp" method="post" onsubmit="return chkSubmit()">
 	작성자 : <input type="text" name="name" /> <br>
 	제목 : <input type="text" name = "subject"/> <br>
 	내용: <textarea name="content"> </textarea>
 	<br><br>
 	
 	<input type="submit" value="등록"/> 
 </form>

 <button type="button" onclick="location.href='list.jsp'">목록으로</button>
</body>
</html>