<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.sql.*,java.sql.*, javax.naming.*"%>   
<%
	request.setCharacterEncoding("utf-8");
%>    

<%
		// 데이터베이스 연결관련 변수 선언
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");
		
			conn = ds.getConnection();
		
			String sql = "insert into product values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("pdname"));
			pstmt.setString(2, request.getParameter("pdcode"));
			pstmt.setString(3, request.getParameter("pdcom"));
		
			// username 값을 입력한 경우 sql 문장을 수행.
			if (request.getParameter("pdname") != null) {
				pstmt.executeUpdate();
		
			}
		
		} catch (Exception e) {
			System.out.println(e);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 등록 내용 </title>
</head>
<body>
<div align="center">
<H2>등록 내용</H2>
제품명 : <%= request.getParameter("pdname") %><P>
제품코드 :  <%= request.getParameter("pdcode") %><P>
제조사:   <%= request.getParameter("pdcom") %><P>

<HR>
<a href="product_list.jsp">목록 보기</a>
</div>
</body>
</html>








