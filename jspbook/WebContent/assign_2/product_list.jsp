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


	
	
	} catch (Exception e) {
		System.out.println(e);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 제품 목록 </title>
</head>
<body>
<div align="center">
<h2>제품 등록</h2>
<hr>
<a href="product_form.html">제품추가</a><p>
<table border=1 width=500>
<tr><td>제품명</td><td>제품코드</td><td>제조사</td></tr>
<%

	try{
		
		String sql = "select pdname, pdcode, pdcom from product";
		
		pstmt = conn.prepareStatement(sql);
		
	     rs = pstmt.executeQuery();
	     int i=1;
	
	while(rs.next()) {
%>
	<tr>
	<td><%=rs.getString("pdname") %></td>
	<td><%=rs.getString("pdcode") %></td>
	<td><%=rs.getString("pdcom") %></td>
<%	
	}
    // 사용한 자원의 반납.
    rs.close();
    pstmt.close();
    conn.close();
	}catch(Exception e) {
		    System.out.println(e);
	}
%>
</table>
</div>
</body>
</html>


















