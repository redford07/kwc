<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String admin_id = (String)session.getAttribute("adminKey");

	if(admin_id == null) {
		response.sendRedirect("AdminLogin.jsp");
	}
%>
<table width="100%" align="center" >
  <tr> 
    <td align="center"><a href="../index.jsp" >사이트 홈 </a></b></td>
    <td align="center"><a href="Index.jsp">관리자 홈 </a></b></td>
    <td align="center"><a href="AdminLogout.jsp">관리자 로그아웃 </a></b></td>
    <td align="center"><a href="MemberMgr.jsp">회원 관리 </a></b></td>
    <td align="center"><a href="ProductMgr.jsp">상품 관리 </a></b></td>
    <td align="center"><a href="singolist.jsp">신고 관리 </a></b></td>
    <!--<td align="center"><a href="OrderMgr.jsp">주문 관리</a></b></td>  -->
    
  </tr>
</table> 