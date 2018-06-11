<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>
     <%@ page import="test.MemberBean" %>
    <jsp:useBean id="mMgr" class="test.DBConnectionMgr"/>
<jsp:useBean id="memberBean" class="test.MemberBean"/>
<jsp:useBean id="memberMgr" class="test.MemberMgr"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>update check</title>
</head>
<body>
<%


String black = request.getParameter("black");

String id = request.getParameter("id");






boolean result=true;




result= memberMgr.UpdateBlack(black,id);

if(result){%>
<script type="text/javascript">
			alert("수정성공!");
			location.href="singolist.jsp";
</script>
<%} else {%>
<script type="text/javascript">
			
			
			alert("수정실패!");
			history.back();
</script>

<%} %>
    

</body>
</html>