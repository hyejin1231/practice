<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.sql.*,java.sql.*, javax.naming.*"%>
     <% request.setCharacterEncoding("utf-8"); %>
    <%
       // 데이터베이스 연결관련 변수 선언
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;   

       
       try{
          
          Context initContext = new InitialContext();
          Context envContext = (Context) initContext.lookup("java:/comp/env");
          DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");

            conn = ds.getConnection();
          // Connection 클래스의 인스턴스로 부터 SQL  문 작성을 위한 Statement 준비
          String sql = "insert into phone_table2 values(?,?,?)";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, request.getParameter("customer_name"));
          pstmt.setString(2, request.getParameter("email"));
          pstmt.setString(3, request.getParameter("telnumber"));

          // username 값을 입력한 경우 sql 문장을 수행.
          if (request.getParameter("customer_name") != null) {
             pstmt.executeUpdate();
          }
       } catch (Exception e) {
          System.out.println(e);
       }
    %>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Product</title>
</head>
<body>
<div align="center">
<H2>이벤트 등록</H2>
<HR>

<form name=form1 method=post action=phoneTest.jsp>
이름 : <input type=text name=customer_name>
이메일 : <input type=text name=email size=20>
전화번호 : <input type=text name=telnumber size=20>
<input type=submit value="등록">
</form>
<HR>
</div>
# 등록 목록<P>
<%
   try{
      // select 문장을 문자열 형태로 구성한다.
      String sql = "select customer_name, email, telnumber from phone_table2";

      pstmt = conn.prepareStatement(sql);

      // select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
       rs = pstmt.executeQuery();
      int i=1;

      // 마지막 데이터까지 반복함.
      while(rs.next()) {
         out.println(i+" : "+rs.getString(1)+" , " + rs.getString(2) + ", " +rs.getString("telnumber")+"<BR>");
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