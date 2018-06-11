<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
  <%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<script language = "javascript">
function writeCheck(){ 
	var form = document.writeform; 
	if( !form.name.value ) { 
		alert( "상품을 적어주세요" ); 
		form.name.focus(); return; 
		} 
	if( !form.price.value ) {
		alert( "가격을 적어주세요" ); 
		form.price.focus(); return; 
		} 
	if( !form.stock.value ) { 
		alert( "수량을 적어주세요" ); 
		form.stock.focus(); return; 
		} 
	if( !form.detail.value ) { 
		alert( "내용을 적어주세요" ); 
		form.detail.focus(); 
		return; 
		} 
	form.submit(); 
	} </script> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>게시판</title>
		<meta charset="utf-8" />
	
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		
		
			
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
							<h2>글쓰기</h2>
							
							<ul class="actions">
								<li><a href="additem.jsp" class="button fit">상품등록</a></li>
								
								
								
							
								
								
							</ul>
						</div>
						
								<li><a href="#one" class="more scrolly">Learn More</a></li>
								
						
					</section>

				<table width="75%" align="center" >
	<tr> 
	<td align="center" >

		<form method="post" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
		<table width="95%" align="center"  border="1">
		<tr> 
		<td colspan="2" align="center"><font >상품 등록</font></td>
		</tr>
		<tr> 
		<td align="center">상품이름</td>
		<td align="left"><input type="text" name="name" size="20" required></td>
		</tr>
		<tr> 
		<td align="center">상품가격</td>
		<td align="left"><input type="text" name="price" size="20"></td>
		</tr>
		<tr> 
		<td align="center">상품설명</td>
		<td><textarea rows="10" cols="45" name="detail"></textarea></td>
		</tr>
		<tr> 
		<td align="center">상품수량</td>
		<td><input type="text" name="stock" size="10"></td>
		</tr>
		<tr> 
		<td align="center">상품이미지</td>
		<td><input type="file" name="image"></td>
		</tr>
		<tr> 
		<td colspan="2" align="center"> 
		
		 <input type="submit" value="상품등록" OnClick="javascript:writeCheck();"> 
     <input type="button" value="취소" OnClick="javascript:history.back(-1)"> 
		</td>
		</tr>
		</table>
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