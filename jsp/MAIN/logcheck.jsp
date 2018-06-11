
<%@ page contentType = "text/html; charset=utf-8" %>
<%@ page import = "java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<html>
<head><title>로그인체크</title></head>
<body>

MEMBER 테이블의 내용
<table width="100%" border="1">
<%
String userid,userpwd;
String checkid,checkpwd;
userid=request.getParameter("id");
userpwd=request.getParameter("pwd");
String username=null;
String black=null;
int ch=0;
if(userid.equals("admin")&&userpwd.equals("admin")){
session.setAttribute("adminKey", userid);
session.setAttribute("userpwd",userpwd);
session.setAttribute("username", username);
response.sendRedirect("admin/Index.jsp");
ch=2;
	
 }
%>
<%
	// 1. JDBC 드라이버 로딩
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/textdb?" +
							"useUnicode=true&characterEncoding=utf8";
		String dbUser = "root";
		String dbPass = "nm9410";
		
		String query = "select * from MEMBER order by id";
		
		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		// 3. Statement 생성
		stmt = conn.createStatement();
		
		// 4. 쿼리 실행
		rs = stmt.executeQuery(query);
		
		// 5. 쿼리 실행 결과 출력
		while(rs.next()) {


checkid=rs.getString("id");
checkpwd=rs.getString("password");
black=rs.getString("black");
if(userid.equals(checkid)&&userpwd.equals(checkpwd)==true) 
{
	ch=1;
	if(black.equals("black")) ch=2;
	username=rs.getString("name");
	 break;
}

else continue;
		}
		
		
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
	
	
	if(ch==1) {//접속자 정보를 디비에서 찾았을 경우
	
		session.setAttribute("userid",userid);
		session.setAttribute("userpwd",userpwd);
		session.setAttribute("username", username);
		
		session.setMaxInactiveInterval(60*60);
		
		Cookie cookie = new Cookie("id", userid);
	    response.addCookie(cookie);
	    cookie.setMaxAge(60*60);
	    cookie.setDomain("modifymember.jsp");
	    cookie.setPath("modifymember.jsp");


	%>
	<jsp:forward page="index.jsp">
	<jsp:param value="<%=username %>" name="username"/>
	</jsp:forward>
	<% } else if(ch==0) {%>
	<jsp:forward page="loginfail.jsp"></jsp:forward>
	
	<%}else if(ch==2) {%>
	<script>
	alert("당신은 블랙리스트입니다");
	history.back();
	</script>
	<%} %>
</table>

</body>
</html>
