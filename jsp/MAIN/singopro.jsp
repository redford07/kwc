<%@ page contentType="text/html;charset=utf-8" %>
<jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("sid");
	String reason = request.getParameter("reason");
	boolean result = false;

	
    	result=proMgr.singo(id,reason);
	
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="index.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="index.jsp";
	  </script>
<%	}%>