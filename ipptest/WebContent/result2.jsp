<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ipptest.Product" %>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<jsp:useBean id="product" class="ipptest.PdService"/>    
<%
	request.setCharacterEncoding("utf-8");
	String pcode = request.getParameter("pcode");
	
	 long time = System.currentTimeMillis();
	 SimpleDateFormat date = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy", Locale.ENGLISH);
	 String Time = date.format(new Date(time));
	 
	 String pname = product.getProduct(pcode);
	
	 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품코드 조회 결과</title>
</head>
<body>
   <div align="center">
      <h2>제품코드 조회 결과</h2>
         <hr>
      
      <table border="1">
         <tr>
            <td colspan="2" align="center">제조사 조회 결과</td>
         </tr>
         
         
         <tr>
            <td>제품코드</td>
            <td>
          		<%=pcode %>
            </td>
         </tr>
         
         <tr>
            <td>제조사명</td>
            <td>
               <%=pname %>
            </td>
         </tr>
         
         <tr>
            <td>조회일시</td>
            <td>
               <%=Time %>
            </td>
         </tr>
      
      </table>
      
      <hr>
      작성자:한국인 비번:1004 작성일:2019-10-31
   
   </div>
</body>
</html>