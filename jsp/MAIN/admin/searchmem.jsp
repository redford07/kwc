<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ page import="test.MemberBean" %>
    <jsp:useBean id="mMgr" class="test.DBConnectionMgr"/>
<jsp:useBean id="memberBean" class="test.MemberBean">
 
</jsp:useBean>
<jsp:useBean id="memberMgr" class="test.MemberMgr"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="JavaScript" src="script.js"></script>
		<title>관리자 페이지</title>
		<meta charset="utf-8" />
		<jsp:include page="../module/stylesheet.jsp"></jsp:include>
		
		<%
String id = request.getParameter("memsearch"); //db에서 찾기위한 세션정보 이메일 가져오기
memberBean.setId(id);

MemberBean memberbean = new MemberBean();
memberbean= memberMgr.getMember(id);

if(id==null){%>
<script>
alert("아이디를 찾을 수 없습니다.");
history.back();

</script>

<% 
}

%>
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
							<h2>블랙리스트 추가</h2>
							<p>bad person</p>
						</header>
	<form method="post" action="searchmempro.jsp">
								  <table>
				
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="id" value="<%=memberbean.getId()%>" readonly/></td>
					
				</tr>
			
				
				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="name" value="<%=memberbean.getName()%>"/></td>
					
				</tr>
				<tr>
					<td id="title">블랙리스트 추가</td>
					<td><input type="text" name="black" value="black"/></td>
					
				</tr>
			

			

			

				

			
				
			</table>
            <br><br>
            
            <input type="submit" value="수정"/>  
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