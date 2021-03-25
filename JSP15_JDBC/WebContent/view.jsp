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
	
	String sql_inc_viewcnt = "UPDATE test_write SET wr_viewcnt = wr_viewcnt+1 WHERE wr_uid =?";
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
		
		conn.setAutoCommit(false); // 여러 쿼리문을 하나의 트랜잭션으로 처리할 시 
		
		pstmt = conn.prepareStatement(sql_inc_viewcnt);
		pstmt.setInt(1, wr_uid);
		cnt = pstmt.executeUpdate();
		
		pstmt.close();
		
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
















