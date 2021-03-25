<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	String sql_delete = "DELETE FROM test_write WHERE wr_uid=?";
	
	try {
		Class.forName(driver);
		//out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(url,uid, pw);
		//out.println("conn 성공" + "<br>");
		
		pstmt = conn.prepareStatement(sql_delete);
		pstmt.setInt(1, wr_uid);
		cnt= pstmt.executeUpdate();
		
	} catch(Exception e){
		e.printStackTrace();
		//※ 예외처리를 하든지, 예외 페이지를 설정해주어야 한다.
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