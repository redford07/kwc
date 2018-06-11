<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, smartProject.*"%>

<jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="JavaScript" src="script.js"></script>
		<title>관리자 페이지</title>
		<meta charset="utf-8" />
		<jsp:include page="../module/stylesheet.jsp"></jsp:include>
	</head>
	<body>

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header">
						<jsp:include page="Top.jsp"></jsp:include>
						
						
					</header>

				<!-- Main -->
					<article id="main">
						<header>
							<h2>블랙리스트 관리</h2>
							<p>Bad person</p>
						</header>
						
<table width="75%" align="center" >
	<tr> 
	<td align="center" >
 
		<table width="95%" align="center"border="1">
		<tr > 
		<td align="center">이름</td>
		<td align="center">이유</td>
	
		<td align="center">&nbsp;</td>
		</tr>
		<%
		Vector vResult= proMgr.getBlackList();
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">등록된 신고가 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<vResult.size(); i++){
				BlackListBean BlackList = (BlackListBean)vResult.get(i);
		%>
		<tr> 
		<td align="center"><%=BlackList.getId()%></td>
		<td align="center"><%=BlackList.getReason()%></td>
		
	
		</tr>
		<%}
		}%>
		<tr>
		<form  method="post" name="sch" action="searchmem.jsp">
						 <input type="text" name="memsearch" placeholder="회원검색">
						 <input type="submit" name="searchsub" value="검색하기">
						 </form>
		</tr>
		</table>
		
	</td>
	</tr>
	</table>
	<form name="detail" method="post" action="ProductDetail.jsp" >
	<input type="hidden" name="no">
	</form>
					</article>

				<!-- Footer -->
					<jsp:include page="Bottom.jsp"></jsp:include>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>