<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
  <%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>게시판</title>
		<meta charset="utf-8" />
	
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		
		<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/textdb?" +
			"useUnicode=true&characterEncoding=utf8";
	String id = "root";
	String pass = "nm9410";
	int total = 0;
	
	try {
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();

		String sqlCount = "SELECT * FROM board";
		ResultSet rs = stmt.executeQuery(sqlCount);
		
		if(rs.next()){
			total = rs.getInt(1);
		}
		rs.close();
		//out.print("총 게시물 : " + total + "개");
		
		String sqlList = "SELECT NUM, USERNAME, TITLE, TIME, HIT from board order by NUM DESC";
		rs = stmt.executeQuery(sqlList);
		
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
							<h2>게시판</h2>
							
							<ul class="actions">
								<li><a href="additem.jsp" class="button fit">상품등록</a></li>
								
								
								
							
								
								
							</ul>
						</div>
						
								<li><a href="#one" class="more scrolly">Learn More</a></li>
								
						
					</section>

				

				
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String name = rs.getString(2);
			String title = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
		
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><a href="boardview.jsp?idx=<%=idx%>"><%=title %></td>
	<td align="center"><%=name %></td>
	<td align="center"><%=time %></td>
	<td align="center"><%=hit %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
  <td><input type=button value="글쓰기" OnClick="window.location='boardwrite.jsp'"></td>

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