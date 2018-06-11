<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  
<% request.setCharacterEncoding("utf-8"); %>
    <%@ page import="test.MemberBean" %>
    <jsp:useBean id="mMgr" class="test.DBConnectionMgr"/>
<jsp:useBean id="memberBean" class="test.MemberBean">
 <jsp:setProperty name="mb1" property="*"/>
</jsp:useBean>
<jsp:useBean id="memberMgr" class="test.MemberMgr"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>MODIFY INFO</title>
		<meta charset="utf-8" />
		
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		

<%
String id = (String)session.getAttribute("userid"); //db에서 찾기위한 세션정보 이메일 가져오기
memberBean.setId(id);

MemberBean memberbean = new MemberBean();
memberbean= memberMgr.getMember(id);


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
							<h2>회원정보 변경</h2>
							<p>MODIFY YOUR MEMBER INFORMATION</p>
						</header>
						<section class="wrapper style5">
							<div class="inner">
	<form method="post" action="updatecheck.jsp">
								  <table>
				
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" value="<%=memberbean.getId()%>" readonly/></td>
					
				</tr>
				
				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="password" value="<%=memberbean.getPass()%>"/></td>
					
				</tr>
				
				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" value="<%=memberbean.getName()%>"/></td>
					
				</tr>
				
				<tr>
					<td id="title">이메일</td>
					<td><input type="email" name="email" value="<%=memberbean.getEmail()%>"/></td>
					
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="text" name="sex" value="<%=memberbean.getSex()%>"/></td>
					
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="text" name="birthday" value="<%=memberbean.getBirthday()%>"/></td>
					
				</tr>

				
                      
						 <!--  
						이 부분은 select로 구현하려 했으나 귀찮아서 일단 미구현 추후 시간나면 구현예정
						@
                        <select	 name="mail2" id="mail2">
							<option	value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="nate.com">nate.com</option>
					</select>

						--> 
                  

				<tr>
					<td id="title">전화번호</td>
					<td><input type="text" name="phone" value="<%=memberbean.getPhone()%>"/></td>
					
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input type="text" name="address" value="<%=memberbean.getAddress()%>"/></td>
					
				</tr>
			</table>
            <br><br>
            <input type="button" value="취소" onclick="javascript:window.location='index.jsp'">
            <input type="submit" value="수정"/>  
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