<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.sql.*,java.sql.*, javax.naming.*"%>
    <% request.setCharacterEncoding("utf-8"); %>
    <%
    	// 데이터베이스 연결관련 변수 선언
               Connection conn = null;
               PreparedStatement pstmt = null;
               PreparedStatement pstmt1 = null;
               ResultSet rs = null;   


               
    	try {

    		Context initContext = new InitialContext();
    		Context envContext = (Context) initContext.lookup("java:/comp/env");
    		DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");

    		conn = ds.getConnection();

    		// Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
    		String sql = "insert into jdbc_table values(?,?)"; //jdbc_table에 우선 저장 
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1, request.getParameter("username"));
    		pstmt.setString(2, request.getParameter("email"));

    		// username 값을 입력한 경우 sql 문장을 수행.
    		if (request.getParameter("username") != null) {
    			pstmt.executeUpdate();

    			String phoneSql = "insert into link_table values(?,?,?)"; // 후에 link_table에 저장 
    			pstmt1 = conn.prepareStatement(phoneSql);
    			pstmt1.setString(1, request.getParameter("username"));
    			pstmt1.setString(2, request.getParameter("email"));
    			pstmt1.setString(3, "-");

    			pstmt1.executeUpdate();
    		}

    	} catch (Exception e) {
    		System.out.println(e);
    	}
    %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>송신시스템</title>
</head>
<body>
<div align="center">
<H2>~송신 시스템~</H2>
<HR>

<form name=form1 method=post action=jdbcTest.jsp>
등록이름 : <input type=text name=username>
email주소 : <input type=text name=email size=20>
<input type=submit value="등록">
</form>
<HR>
</div>
# 등록 목록<P>
<%
   try{
      // select 문장을 문자열 형태로 구성한다.
      String sql = "select username, email from jdbc_table";

      pstmt = conn.prepareStatement(sql);

      // select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
       rs = pstmt.executeQuery();
      int i=1;

      // 마지막 데이터까지 반복함.
      while(rs.next()) {
         out.println(i+" : "+rs.getString(1)+" , "+rs.getString("email")+"<BR>");
         i++;
      }

      // 사용한 자원의 반납.
      rs.close();
      pstmt.close();
      conn.close();
   }
   catch(Exception e) {
      System.out.println(e);
   }
%>
</body>
</html>