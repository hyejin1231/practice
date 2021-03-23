<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="person1" class="com.lec.beans.Person" scope="page"/>

<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>Java Bean</title>
</head>
<body>

	<jsp:setProperty name="person1" property = "name" value="박혜진"/> 
	<jsp:setProperty name="person1" property="age"  value="24"/>
	<jsp:setProperty name="person1" property = "id" value="1234"/>
	<jsp:setProperty name="person1" property = "gender" value="여"/>
	
	<h3>person1</h3>
	이름 : <jsp:getProperty name="person1" property ="name"/> <br>
	나이 : <jsp:getProperty name="person1" property ="age"/> <br>
	아이디 : <jsp:getProperty name="person1" property ="id"/> <br> 
	성별 : <jsp:getProperty name="person1" property ="gender"/> <br>
	
	<!-- 기본생성자 생성 후 usebean 안에서 setProperty 사용  -->
	<jsp:useBean id="person2" class="com.lec.beans.Person" scope="page">
		<jsp:setProperty name="person2" property = "name" value="박혜진2"/> 
		<jsp:setProperty name="person2" property="age"  value="242"/>
		<jsp:setProperty name="person2" property = "id" value="12342"/>
		<jsp:setProperty name="person2" property = "gender" value="여"/>
	</jsp:useBean>
	
	
		<h3>person2</h3>
	이름 : <jsp:getProperty name="person2" property ="name"/> <br>
	나이 : <jsp:getProperty name="person2" property ="age"/> <br>
	아이디 : <jsp:getProperty name="person2" property ="id"/> <br> 
	성별 : <jsp:getProperty name="person2" property ="gender"/> <br>
	
	
	<!-- form에서 전송된 데이터 bean객체로 받기  -->
	<jsp:useBean id="person3" class="com.lec.beans.Person" scope="page">
		<jsp:setProperty name="person3" property = "name" /> 
		<jsp:setProperty name="person3" property="age"  />
		<jsp:setProperty name="person3" property = "id" />
		<jsp:setProperty name="person3" property = "gender" />
	</jsp:useBean>
	
		
		<h3>person3</h3>
	이름 : <jsp:getProperty name="person3" property ="name"/> <br>
	나이 : <jsp:getProperty name="person3" property ="age"/> <br>
	아이디 : <jsp:getProperty name="person3" property ="id"/> <br> 
	성별 : <jsp:getProperty name="person3" property ="gender"/> <br>
	
</body>
</html>