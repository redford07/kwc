<%@page import="com.sun.org.apache.xalan.internal.xsltc.runtime.Parameter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ page import = "java.sql.*" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<% String password = request.getParameter("password");
                   String chpw=request.getParameter("chpwd");
                   
                  	
                   if(!(password.equals(chpw))){
                   %>
                  	<script type="text/javascript">
					alert("비밀번호가 서로 다릅니다.");
					history.back();
					</script>
                   	
                   	<%} else { %>
                   		
            			<jsp:forward page="dbinsert.jsp"/>
                   		
                   		
                   		
                 <%   	} %>
</body>
</html>