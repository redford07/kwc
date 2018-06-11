<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*, smartProject.*"%>
<jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>게시판</title>
		<meta charset="utf-8" />
	
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		
		
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
							<h2>게시판</h2>
							
							<ul class="actions">
								<li><a href="#" class="button fit">상품등록</a></li>
								
								
								
							
								
								
							</ul>
						</div>
						
								<li><a href="#one" class="more scrolly">Learn More</a></li>
								
						
					</section>

				<table width="75%" align="center">
	<tr> 
	<td align="center" >

		<form method="post" action="ProductProc.jsp?flag=update" enctype="multipart/form-data">
		<table width="95%" align="center"  border="1">
		<tr > 
		<td colspan="2" align="center"><font>상품등록</font></td>
		</tr>
		<tr> 
		<td width="31%" align="center">상품이름</td>
		<td width="69%" align="left"> 
		<input type="text" name="name" value="<%=product.getName()%>">
		</td>
		</tr>
		<tr> 
		<td height="21" align="center">상품가격</td>
		<td align="left"> 
		<input type="text" name="price" size="20" value="<%=product.getPrice()%>">원</td>
		</tr>
		<tr> 
		<td align="center">상품내용</td>
		<td><textarea rows="10" cols="45" name="detail"><%=product.getDetail()%></textarea>
		</td>
		</tr>
		<tr> 
		<td align="center">상품입고수량</td>
		<td align="left"> 
		<input type="text" name="stock" size="10" value="<%=product.getStock()%>">개</td>
		</tr>
		<tr> 
		<td align="center">상품이미지</td>
		<td align="left"><img src="../data/<%=product.getImage()%>">
		<input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
		<input type="submit" value="제품수정">&nbsp;&nbsp;&nbsp;
		<input type="reset" value="다시쓰기">
		</td>
		</tr>
		</table>
		<input type=hidden name="no" value="<%=product.getNo()%>">
		</form>

	</td>
	</tr>
	</table>
				

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