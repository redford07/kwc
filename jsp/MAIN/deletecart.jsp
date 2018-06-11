<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      
  <%@ page import="java.util.*, smartProject.*"%>
  <jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
   
  
  


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>deletecart</title>
</head>
<body>
<%proMgr.deleteCart(request.getParameter("no")); %>

		<%response.sendRedirect("cartlist.jsp"); %>
		<script type="text/javascript">
		alert("삭제성공");
		
		</script>
	

</body>
</html>