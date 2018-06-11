<%@ page language="java" contentType="text/html; charset=utf-8" 
    pageEncoding="utf-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
</head>
<body>
로그아웃
<% session.invalidate(); %>

	<jsp:forward page="index.jsp"/>
	

</body>
</html>