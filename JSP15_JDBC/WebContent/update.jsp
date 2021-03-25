<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.util.Date" %>    
<%@ page import = "java.sql.*" %>   <%-- JDBC 관련 클래스 import --%>

<%
	int wr_uid = Integer.parseInt(request.getParameter("wr_uid"));
%>  
<%
	Connection conn = null;
	Statement  stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int cnt = 0;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mariadb://localhost:3306/mydb";
	String uid = "root";
	String pw = "1234";
	
	String sql_select_by_wr_uid = "SELECT * FROM test_write WHERE wr_uid = ?";
%>  
<%
	String name = "";
	String subject = "";
	String content = "";
	String regdate = "";
	int viewcnt = 0;
%>
<%
	try{
		Class.forName(driver);
		//out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(url,uid, pw);
		//out.println("conn 성공" + "<br>");
		
		pstmt = conn.prepareStatement(sql_select_by_wr_uid);
		pstmt.setInt(1, wr_uid);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			subject = rs.getString("wr_subject");
			content = rs.getString("wr_content");
			if(content == null) content = "";
			
			name = rs.getString("wr_name");
			viewcnt = rs.getInt("wr_viewcnt");
			Date d = rs.getDate("wr_regdate");
			Time t = rs.getTime("wr_regdate");
			if(d != null) {
				regdate = new SimpleDateFormat("yyyy-MM-dd").format(d) +
						new SimpleDateFormat("hh:mm:ss").format(t);
			}
		}else {
%>
			<script>
				alert("해당 글이 삭제되거나 없습니다.");
				history.back();
			</script>



<% 
	return;
		}
	} catch(Exception e){
		e.printStackTrace();
		//※ 예외처리를 하든지, 예외 페이지를 설정해주어야 한다.
		conn.rollback(); // 트랜잭션 실패하면 원위치 시키기 !!!!
	} finally {
		// DB 리소스 해제
		try{
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	} // end try
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>수정 <%= subject %></title>
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
<h2>수정</h2>
<form name="frm" action="updateOk.jsp" 
	method="post" onsubmit="return chkSubmit()">
	
<input type = "hidden" name = "wr_uid" value = "<%=wr_uid %>"/>
작성자 : <%= name %><br>  <%-- 작성자 이름은 변경 불가 --%>
제목 : 
<input type="text" name="subject" value="<%= subject%>"><br>
내용 :
<textarea name="content"><%= content %></textarea>
<br><br>
<input type="submit" value="수정"/>
</form>

<button onclick="history.back()">이전으로</button>
<button onclick="location.href = 'list.jsp'">목록보기</button>
</body>
</html>


















