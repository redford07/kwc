<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
<% request.setCharacterEncoding("utf-8"); %>
    <%@ page import="test.MemberBean" %>
    <jsp:useBean id="mMgr" class="test.DBConnectionMgr"/>
<jsp:useBean id="memberBean" class="test.MemberBean">
</jsp:useBean>
<jsp:useBean id="memberMgr" class="test.MemberMgr"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>MODIFY INFO</title>
		<meta charset="utf-8" />
		
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		

<%
String id=request.getParameter("id");//db에서 찾기위한 세션정보 아이디 가져오기
String phone = request.getParameter("phone");
memberBean.setId(id);
memberBean.setPhone(phone);
MemberBean mb = new MemberBean();
mb= memberMgr.findMember(id,phone);


%>

	</head>
	<body>

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header">
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

				<!-- Main -->
					<article id="main">
						<header>
							<h2>비밀번호찾기</h2>
							<p>YOUR MEMBER INFORMATION</p>
						</header>
						<section class="wrapper style5">
							<div class="inner">

								  <table>
            <tr>
                <td id="title">회원님의 아이디</td>
                <td><%=mb.getId() %></td>
            </tr>
                        
            <tr>
                <td id="title" >회원님의 비밀번호</td>
                <td><%=mb.getPass() %></td>
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