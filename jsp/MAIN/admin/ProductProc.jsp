<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
<%
	String flag = request.getParameter("flag");
	String userid = (String)session.getAttribute("userid");
	boolean result = false;
	
	if(flag.equals("insert")){
    	result=proMgr.insertProduct(request,userid);
	}else if(flag.equals("update")){
    	result=proMgr.updateProduct(request);
    }else if(flag.equals("delete")){
		result=proMgr.deleteProduct(request.getParameter("no"));
	}else{
		response.sendRedirect("ProductMgr.jsp");
	}
	
	if(result){
%>
	  <script>
	    alert("처리하였습니다");
		location.href="ProductMgr.jsp";
	  </script>
<%	}else{%>
	  <script>
	    alert("오류가 발생하였습니다.");
		location.href="ProductMgr.jsp";
	  </script>
<%	}%>