<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<%
	request.setCharacterEncoding("utf-8");

	int wr_uid = Integer.parseInt(request.getParameter("wr_uid"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
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
	
	String sql_update = "UPDATE test_write SET wr_subject =?, wr_content =? WHERE  wr_uid =?";

	try{
		Class.forName(driver);
		//out.println("드라이버 로딩 성공" + "<br>");
		conn = DriverManager.getConnection(url,uid, pw);
		//out.println("conn 성공" + "<br>");
		
		pstmt = conn.prepareStatement(sql_update);
		pstmt.setString(1, subject);
		pstmt.setString(2, content);
		pstmt.setInt(3, wr_uid);
		
		cnt = pstmt.executeUpdate();
	}catch(Exception e){
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
	}
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



