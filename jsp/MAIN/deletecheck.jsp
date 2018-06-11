<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
  
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="test.MemberBean" %>
<%@ page import="test.MemberMgr" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<jsp:useBean id="mgr" class="test.MemberMgr"></jsp:useBean>
</head>
<body>
	<% 
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	String sid = (String)session.getAttribute("userid");
	String spassword = (String)session.getAttribute("userpwd");
	%>
	<%
	request.setCharacterEncoding("utf-8");
	//boolean resultid = mgr.checkId(id);
	//boolean resultpassword = mgr.checkPassword(password);
	boolean result = mgr.DeleteMemberCheck(id,password);
	
	if(result&&id.equals(sid)&&password.equals(spassword))
	{
		boolean a = mgr.DeleteMember(id);
		session.invalidate();
		%>
		
		<script type="text/javascript">
		alert("탈퇴완료!");
		location.href="index.jsp";
		</script>
		<%} else {%>
	
			<script type="text/javascript">
		alert("탈퇴실패!");
		history.back();
		</script>
	
	<%} %>
	
	
	
	
%>
	
</body>
</html>