<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.sql.*,java.sql.*, javax.naming.*"%>
     <% request.setCharacterEncoding("utf-8"); %>
    <%
    
    // link_table (연계 DB)의 이름과 이메일, 전화번호를 저장하기 위한 배열 
    ArrayList<String> Link_name = new ArrayList<>();
    ArrayList<String> Link_email = new ArrayList<>();
    ArrayList<String> Link_telnumber = new ArrayList<>();
    
    // phone_table  (수신 DB)의 이름과 이메일, 전화번호를 저장하기 위한 배열 
    ArrayList<String> Phone_name = new ArrayList<>();
    ArrayList<String> Phone_email = new ArrayList<>();
    ArrayList<String> Phone_telnumber = new ArrayList<>();
    
       // 데이터베이스 연결관련 변수 선언
       Connection conn = null;
       PreparedStatement pstmt = null;
       PreparedStatement Link_pstmt = null;
       ResultSet rs = null;   
       ResultSet Link_rs = null; 

       
       try{
          
          Context initContext = new InitialContext();
          Context envContext = (Context) initContext.lookup("java:/comp/env");
          DataSource ds = (DataSource) envContext.lookup("jdbc/mysql");

          conn = ds.getConnection();
          
          // select 문장을 문자열 형태로 구성한다.
          String sql = "select customer_name, email, telnumber from link_table";

          pstmt = conn.prepareStatement(sql);

          // select 를 수행하면 데이터정보가 ResultSet 클래스의 인스턴스로 리턴됨.
           rs = pstmt.executeQuery();
          int i=1;

          // 마지막 데이터까지 반복함.
          while(rs.next()) {
        	  
        	  // link_table의 select 결과를 이름, 이메일, 전화번호를 각각 배열에 저장함 
        	  Link_name.add(rs.getString(1));
        	  Link_email.add(rs.getString(2));
        	  Link_telnumber.add(rs.getString(3));
            
             i++;
          }
          
          String sql1 = "select customer_name, email, telnumber from phone_table";
          pstmt = conn.prepareStatement(sql1);
          rs = pstmt.executeQuery();
          
          int j=1;

          // 마지막 데이터까지 반복함.
          while(rs.next()) {
        	  
        	  // phone_table의 select 결과를 이름, 이메일, 전화번호를 각각 배열에 저장함 
        	  Phone_name.add(rs.getString(1));
        	  Phone_email.add(rs.getString(2));
        	  Phone_telnumber.add(rs.getString(3));
            
  
             j++;
          }
         
        
          int cnt =0; // phone_table의 이름과 link_table의 이름 중 같은 개수를 확인하기 위한 cnt 값 초기화 
          
          
          for(int k=0; k< Phone_name.size(); k++){
             for(int n =0; n<Link_name.size(); n++){
                if(Phone_name.get(k).equals(Link_name.get(n))){
                  cnt++; // phone_table의 이름과 link_table의 이름이 같은 경우 cnt 값 1씩 증가시킴. 
               
                   
              }
               
             }
   
          }
          
          System.out.println(cnt);

          
          for(int k  =cnt; k<Link_name.size(); k++ ){
              
        	// link_table의 이름이 cnt보다 크면 송신시스템에서 새로운 값이 입력되었다는 뜻이기 때문에 수신시스템 DB에 새로 입력된 값을 insert 해줌.
              if(Link_name.size() > cnt){ 
                     String sql2 = "insert into phone_table values(?,?,?)";
                        pstmt = conn.prepareStatement(sql2);
                         pstmt.setString(1, Link_name.get(k));
                         pstmt.setString(2, Link_email.get(k));
                        pstmt.setString(3, Link_telnumber.get(k));
                          pstmt.executeUpdate();
                     
                 }
           }

        
        
          
          // 수신시스템에서 '등록'버튼을 눌렀을 때 연계 DB와 상관없이 phone_table에 insert 
          String sql3 = "insert into phone_table values(?,?,?)";
          pstmt = conn.prepareStatement(sql3);
           pstmt.setString(1, request.getParameter("customer_name"));
           pstmt.setString(2, request.getParameter("email"));
           pstmt.setString(3, request.getParameter("telnumber"));

            
	            //username 값을 입력한 경우 sql 문장을 수행.
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
<title>수신시스템</title>
</head>
<body>
<div align="center">
<H2>~수신 시스템~</H2>
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
      String sql = "select customer_name, email, telnumber from phone_table";

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










