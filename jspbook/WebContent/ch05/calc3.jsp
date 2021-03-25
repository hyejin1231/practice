<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	int num1, num2 = 0;
	int result = 0;
	String op = "";
	
	public int calculator() {
		if(op.equals("+")) {
			result = num1 + num2;
		}else if(op.equals("-")) {
			result = num1 - num2; 
		}else if(op.equals("*")) {
			result = num1 * num2; 
		}else if(op.equals("/")) {
			result = num1 / num2; 
		}
		
		return result;
	}
%>

<%
	if(request.getMethod().equals("POST")) {
		
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		op = request.getParameter("op");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
<center/>
<h3>계산기</h3>
<hr>
<form name = "calc" method="post">
	<input type="text" name = "num1" width="200" size="5" />
	<select name="op">
		<option>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</select>
	
		<input type="text" name = "num2" width="200" size="5" />
		<input type="submit" value="계산" name= "B1"/>
		<input type="reset" value="다시 입력" name="B2"/> 
</form>
<hr>
	<%=num1 %>  <%=op %>  <%=num2 %> <br>
 계산결과: <%=calculator() %>
</body>
</html>