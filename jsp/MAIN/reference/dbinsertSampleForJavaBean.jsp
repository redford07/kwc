<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import ="test.MemberBean" %>
<%@ page import ="test.RegisterMgr" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="mMgr" class="test.MemberMgr"/>
<jsp:useBean id="bean" class="test.MemberBean"/>
<jsp:useBean id="dbc" class="test.DBConnectionMgr"/>
<jsp:useBean id="rg" class="test.RegisterMgr"/>
<jsp:setProperty  name="bean" property="*"/>




<%
//	rg.getMemberList();
rg.getMemberList();


	  boolean result = mMgr.insertMember(bean);
	 
	  if(result){
%>
<script type="text/javascript">
		alert("회원가입을 하였습니다.");
		location.href="login.jsp";
</script>
<% }else{%>
<script type="text/javascript">
		alert("회원가입에 실패 하였습니다.");
		history.back();
</script>
<%} %>