<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
  
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>게시판</title>
		<meta charset="utf-8" />
	
		<jsp:include page="../module/stylesheet.jsp"></jsp:include>
		
	
			
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
									<a href="#menu" class="menuToggle"><span>Menu</span></a>
									<div id="menu">
										<ul>
											<jsp:include page="../module/menu.jsp"></jsp:include>
										
											
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
								<li><a href="../additem.jsp" class="button fit">상품등록</a></li>
								
								
								
							
								
								
							</ul>
						</div>
						
								<li><a href="../index.jsp#one" class="more scrolly">Learn More</a></li>
								
						
					</section>

				

				
					<h4>Default</h4>
								<div class="table-wrapper">
									<table>
										<thead>
											<tr>
												<th>Name</th>
												<th>Description</th>
												<th>Price</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>Item 1</td>
												<td>Ante turpis integer aliquet porttitor.</td>
												<td>29.99</td>
											</tr>
											<tr>
												<td>Item 2</td>
												<td>Vis ac commodo adipiscing arcu aliquet.</td>
												<td>19.99</td>
											</tr>
											<tr>
												<td>Item 3</td>
												<td> Morbi faucibus arcu accumsan lorem.</td>
												<td>29.99</td>
											</tr>
											<tr>
												<td>Item 4</td>
												<td>Vitae integer tempus condimentum.</td>
												<td>19.99</td>
											</tr>
											<tr>
												<td>Item 5</td>
												<td>Ante turpis integer aliquet porttitor.</td>
												<td>29.99</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td colspan="2"></td>
												<td>100.00</td>
											</tr>
										</tfoot>
									</table>
								</div>

				<!-- Footer -->
					<jsp:include page="../module/bottom.jsp"></jsp:include>

			</div>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.scrollex.min.js"></script>
			<script src="../assets/js/jquery.scrolly.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>

	</body>
</html>