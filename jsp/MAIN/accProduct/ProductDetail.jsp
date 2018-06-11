<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
 
  <%@ page import="java.util.*, smartProject.*"%>
<jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>게시판</title>
		<meta charset="utf-8" />
	
		<jsp:include page="../module/stylesheet.jsp"></jsp:include>
		
		<script language="JavaScript" src="script.js"></script>
			<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>
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
					
					
						
						<jsp:include page="../module/top.jsp"></jsp:include>
						<nav id="nav">
							<ul>
								<li class="special">
									
									<div id="menu">
										<ul>
											
										
											
										</ul>
									</div>
								</li>
							</ul>
						</nav>
					</header>
					
				<!-- Banner -->
				
					<section id="banner">
						<div class="inner">
							<h2><%=product.getName()%></h2>
							
							<ul class="actions">
								<li><a href="#" class="button fit">상품등록</a></li>
								
								
								
							
								
								
							</ul>
						</div>
						
								<li><a href="#one" class="more scrolly">Learn More</a></li>
								
						
					</section>

				<table width="75%" align="center">
	<tr> 
	<td align="center" >

		<table width="95%" align="center" border="1">
		<tr > 
		<td colspan="3" align="center"><font ><%=product.getName()%></font></td>
		</tr>
		<tr> 
		<td width="20%">
<%--  	<img src="c:/data/<%=product.getImage()%>" > --%>	

        <%-- 이미지 보여주기      --%>

        <img src="<%=request.getContextPath()%>/datafiles/<%=product.getImage()%>" width="100" height="100">     <%--<%=request.getContextPath()%>/datafiles/<%=product.getImage()%> --%>
        <img src="../datafiles/<%=product.getImage()%>"  width="50" height="50">
 
 		</td>
		<td width="30%" valign="top">

			<table border="1" width="100%" heigth="100%">
			<tr>
			<td><b>상품이름 : </b><%=product.getName()%></td>
			</tr>			
			<tr>
			<td><b>가    격 : </b><%=product.getPrice()%></td>
			</tr>
			<tr>
			<td><b>입고날짜 : </b><%=product.getDate()%></td>
			</tr>
			<tr>
			<td><b>재    고 : </b><%=product.getStock()%></td>
			</tr>
			</table>
		
		</td>
		<td width="50%" valign="top"><b>상세설명</b><br><pre><%=product.getDetail()%></pre></td>
		</tr>
		<tr> 
		<td colspan="3" align="center">
		<a href="javascript:productUpdate('<%=product.getNo()%>')">수정하기</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="javascript:productDelete('<%=product.getNo()%>')">삭제하기</a>
		</td>
		</tr>
		</table>

	</td>
	</tr>
	</table>
				
			<form name="update" method="post" action="ProductUpdate.jsp">
	<input type=hidden name=no>
	</form>
	
	<form name="del" method="post" action="ProductProc.jsp?flag=delete">
	<input type=hidden name=no>
	</form>


				<!-- Footer -->
					<jsp:include page="../module/bottom.jsp"></jsp:include>

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