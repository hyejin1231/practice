<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
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
		
		ArrayList<String> company = new ArrayList<>();

		//데이터베이스 연결관련 변수 선언
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
<title>제품코드 조회 결과</title>
</head>
<style>
div.a {font-size : 5px;}
</style>
<body>
<div align="center">
<H2> 제품코드 조회 결과 </H2>
<HR>
<form name=form1 method="post" action=code_result.jsp>
<table border=1 cellspacing="1" cellpadding="5">
<%
	try{
		String sql = "select pdcom from product_search where pdcode = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("pdcode"));
		
		rs = pstmt.executeQuery();
		
		int i = 1;
		
		while(rs.next()) {
			company.add(rs.getString("pdcom"));
			
			i++;
		}
		
		
	
		 
		
	}catch(Exception e) {
		System.out.println(e);
	}

%>
<tr>
<td colspan=2 align=center> 제품코드 조회 결과</td>
</tr>
		
<tr>
<td>제품코드</td>
<td ><%= request.getParameter("pdcode") %></td>
</tr>

<tr>
<td>제조사명</td>
<td >
	<%
		if(company.size() == 0) {
			%>
			등록되지 않은 제품입니다. 
			<% 
		}else {
			%>
				<%=company.get(0) %> 
			<% 
		}
	%>
</td>
</tr>

<tr>
<td>조회일시</td>
<td colspan=2 width= 300> <%=new java.util.Date() %></td>
</tr>



</table>

<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<div class = "a" >작성일: <%= sf.format(nowTime) %> 입니다.</div>




</form>
</div>
</body>
</html>