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
<title>��ǰ�ڵ� ��ȸ ���</title>
</head>
<body>
   <div align="center">
      <h2>��ǰ�ڵ� ��ȸ ���</h2>
         <hr>
      
      <table border="1">
         <tr>
            <td colspan="2" align="center">������ ��ȸ ���</td>
         </tr>
         
         
         <tr>
            <td>��ǰ�ڵ�</td>
            <td>
          		<%=pcode %>
            </td>
         </tr>
         
         <tr>
            <td>�������</td>
            <td>
               <%=pname %>
            </td>
         </tr>
         
         <tr>
            <td>��ȸ�Ͻ�</td>
            <td>
               <%=Time %>
            </td>
         </tr>
      
      </table>
      
      <hr>
      �ۼ���:�ѱ��� ���:1004 �ۼ���:2019-10-31
   
   </div>
</body>
</html>