<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
  
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>5000MALL</title>
		<meta charset="utf-8" />
	
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		
		<% 
		request.setCharacterEncoding("utf-8");

		//String name = request.getParameter("username"); 
		String name = (String)session.getAttribute("username");
		
		
		
			if(name==null) name="";
			else name=name+"님";
			%>
			
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
							<h2>5000mall</h2>
							<p><%=name %>환영합니다<br />
							<br />
							5000Mall입니다</a></p>
							<ul class="actions">
							<%String check = (String)session.getAttribute("userid"); if(check==null){%>
								
								<li><a href="ProductMgr.jsp" class="button fit">상품보기</a></li>
								
								<% } else{ %>
								<li><a href="ProductInsert.jsp" class="button fit">상품등록</a></li>
								<li><a href="ProductMgr.jsp" class="button fit">상품보기</a></li>
								
							<%}%>
								
								
							</ul>
						</div>
						
								<li><a href="#cta" class="more scrolly">Learn More</a></li>
								
						
					</section>

				

				<!-- CTA -->
					<section id="cta" class="wrapper style4">
						
					
						<div class="inner">
							<header>
								<h2>최신상품 </h2>
								<p>최신상품을 확인해보세요!</p>
							</header>
							<ul class="actions vertical">
								<li><a href="ProductMgr.jsp" class="button fit special">최신상품보기</a></li>
								<!--<li><a href="#" class="button fit">Learn More</a></li>  -->
								
							</ul>
						</div>
					</section>
					

				<!-- Footer -->
				
					<jsp:include page="module/bottom.jsp"></jsp:include>

			</div>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=DairaoavXy9y35nSjShB&submodules=geocoder"></script>
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