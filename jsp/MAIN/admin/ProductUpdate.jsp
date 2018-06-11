<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, smartProject.*"%>
<jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
							<h2>업데이트 페이지</h2>
							<p>This is a page for update</p>
						</header>
						

	<%ProductBean product= proMgr.getProduct(request.getParameter("no"));%>

	<table width="75%" align="center" >
	<tr> 
	<td align="center">

		<form method="post" action="ProductProc.jsp?flag=update" enctype="multipart/form-data">
		<table width="95%" align="center"border="1">
		<tr> 
		<td colspan="2" align="center">상품등록</td>
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