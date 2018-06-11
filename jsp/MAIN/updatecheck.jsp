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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>update check</title>
</head>
<body>
<%

String id = (String)session.getAttribute("userid");//db에서 찾기위한 세션정보 가져오기
String password = request.getParameter("password");
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String birthday = request.getParameter("birthday");
String address = request.getParameter("address");
String email = request.getParameter("email");
String phone = request.getParameter("phone");





boolean result;

MemberBean memberbean = new MemberBean();

memberbean.setPass(password);
memberbean.setName(name);
memberbean.setSex(sex);
memberbean.setBirthday(birthday);
memberbean.setAddress(address);
memberbean.setEmail(email);
memberbean.setZipcode(address);
memberbean.setId(id);
memberbean.setPhone(phone);


result= memberMgr.MyUpdateMember(memberbean);

if(result){%>
<script type="text/javascript">
			alert("수정성공!");
			location.href="memberinfo.jsp";
</script>
<%} else {%>
<script type="text/javascript">
			
			
			alert("수정실패!");
			history.back();
</script>

<%} %>
    

</body>
</html>