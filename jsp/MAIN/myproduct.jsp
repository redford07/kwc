<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
  <%@ page import = "java.sql.*" %>
  <%@ page import="java.util.*, smartProject.*"%>
  <jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
   <%@ page import="test.MemberBean" %>
  
  <jsp:useBean id="memberBean" class="test.MemberBean">
 <jsp:setProperty name="mb1" property="*"/>
</jsp:useBean>
<jsp:useBean id="memberMgr" class="test.MemberMgr"/>


<% request.setCharacterEncoding("utf-8"); 
String userid = (String)session.getAttribute("userid");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>내상품</title>
		<meta charset="utf-8" />
	
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		
		
			<script language="JavaScript" src="script.js"></script>
			
	


	</head>
	<body class="landing">

		<!-- Page Wrapper -->
			<div id="page-wrapper">
<!-- 

 String test = request.getParameter("test ");

 test = new String(test .getBytes("8859_1"), "UTF-8");

 -->
				<!-- Header -->
						
					<div id="page-wrapper">
<header id="header" class="alt">
					
					
						
						<jsp:include page="module/top.jsp"></jsp:include>
						<nav id="nav">
							<ul>
								<li class="special">
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<jsp:include page="module/menu.jsp"></jsp:include>
										
											
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>
					
				<!-- Banner -->
				
					<section id="banner">
						<div class="inner">
							<h2>내상품</h2>
							
							<ul class="actions">
							
							
								
								
								
							
								
								
							</ul>
						</div>
						
								<li><a href="#one" class="more scrolly">Learn More</a></li>
								
						
					</section>

				<table width="75%" align="center" >
	<tr> 
	<td align="center" >
 
		<table width="95%" align="center"  border="1">
		<tr > 
		<td align="center"><font >제목</font></td>
		<td align="center"><font >가격</font></td>
		<td align="center"><font >날짜</font></td>
		<td align="center"><font >수량</td>
		<td align="center"><font >작성자</td>
		
		</tr>
		<%
		Vector vResult= proMgr.getMyProduct(userid);
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="5">등록된 상품이 없습니다.</td>
		</tr>
		<%}else{
			for(int i=0; i<vResult.size(); i++){
			ProductBean product = (ProductBean)vResult.get(i);
			
		%>
		<tr> 
		<td align="center"><a href="javascript:productDetail('<%=product.getNo()%>')" href="javascript:productDetail('<%=product.getUserid()%>')"><%=product.getName()%></a></td>
		<td align="center"><%=product.getPrice()%></td>
		<td align="center"><%=product.getDate()%></td>
		<td align="center"><%=product.getStock()%></td>
		<td align="center"><%=product.getUserid() %></td>
		</tr>
		<%}
		}%>
		<tr>
		<%String check = (String)session.getAttribute("userid"); if(check==null){%>
								
								<td colspan="5" align="center"><a href="login.jsp">로그인 후 글쓰기</a></td>
								<% } else{ %>
								<td colspan="5" align="center"><a href="ProductInsert.jsp">상품등록</a></td>
								
							<%}%>
		
		</tr>
		</table>
		
		
<form name="detail" method="post" action="ProductDetail.jsp" >
	<input type="hidden" name="no">
	<input type="hidden" name="userid">
	</form>
				



				<!-- Footer -->
					<jsp:include page="module/bottom.jsp"></jsp:include>

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