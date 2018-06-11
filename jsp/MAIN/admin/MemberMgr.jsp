<%@page import="java.util.Vector"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@page import="test.*"%>
<%@ page import = "java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>



<html>
<head>
		<title>관리자 페이지</title>
		<meta charset="utf-8" />
		<jsp:include page="../module/stylesheet.jsp"></jsp:include>
		<script language="JavaScript" src="script.js"></script>




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
							<h2>회원정보 페이지</h2>
							<p>This is a page for member</p>
						</header>




	<table width="75%" align="center" >
	<tr>
	<td align="center">

		<table width="95%" align="center" border="1">
		<tr >
		<td align="center"><font color="#FFFFFF">회원이름</font></td>
		<td align="center"><font color="#FFFFFF">회원아이디</font></td>
		<td align="center"><font color="#FFFFFF">패스워드</font></td>
		<td align="center"><font color="#FFFFFF">성별</font></td>
		<td align="center"><font color="#FFFFFF">생일</font></td>
		<td align="center"><font color="#FFFFFF">주소</font></td>
		<td align="center"><font color="#FFFFFF">신용</font></td>
		
		<!-- <td align="center"><font color="#FFFFFF">수정</font></td> -->
		</tr>
		<%
Class.forName("com.mysql.jdbc.Driver");

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	String jdbcDriver = "jdbc:mysql://localhost:3306/textdb?" +
						"useUnicode=true&characterEncoding=utf8";
	String dbUser = "root";
	String dbPass = "nm9410";
	
	String query = "select * from MEMBER";
	
	// 2. 데이터베이스 커넥션 생성
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	
	// 3. Statement 생성
	stmt = conn.createStatement();
	
	// 4. 쿼리 실행
	rs = stmt.executeQuery(query);
	Vector vecList = new Vector();
	// 5. 쿼리 실행 결과 출력
	while(rs.next()) {

		 MemberBean bean = new MemberBean();
			bean.setId(rs.getString("id"));
			bean.setPass(rs.getString("password"));
			bean.setName(rs.getString("name"));
			bean.setSex(rs.getString("sex"));
			bean.setBirthday(rs.getString("birthday"));
			bean.setEmail(rs.getString("email"));
			bean.setZipcode(rs.getString("zipcode"));
			bean.setAddress(rs.getString("address"));
			bean.setBlack(rs.getString("black"));
			vecList.add(bean);


	}
	for(int i=0;i<vecList.size();i++){
	MemberBean regBean = (MemberBean)vecList.get(i);
	%>
	
			
		<tr>
		<td align="center"><%=regBean.getName()%></a></td>
		<td align="center"><%=regBean.getId()%></td>
		<td align="center"><%=regBean.getPass()%></td>
		<td align="center"><%=regBean.getSex()%></td>
		<td align="center"><%=regBean.getBirthday()%></td>
		<td align="center"><%=regBean.getAddress()%></td>
		<td align="center"><%=regBean.getBlack()%></td>
		
		<!--<td align="center"><a href="javascript:Update('<%=regBean.getId()%>')">수정하기</a></td>  -->
		</tr>
		<% }%>
		</table>
	</td>
	</tr>
	</table>
	<%
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	// 6. 사용한 Statement 종료
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (stmt != null) try { stmt.close(); } catch(SQLException ex) {}
	
	// 7. 커넥션 종료
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}

%>
	<form name="update" method="post" action="MemberUpdate.jsp">
	<input type=hidden name="mem_id">
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
