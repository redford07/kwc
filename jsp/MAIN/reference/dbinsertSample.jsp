<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<% 

 request.setCharacterEncoding("utf-8");
 String memberID = request.getParameter("memberID");
 String password= request.getParameter("pwd");
 String name = request.getParameter("name");
 String email = request.getParameter("email");
 
 //1. JDBC 드라이버 로딩
 Class.forName("com.mysql.jdbc.Driver");
 
 Connection conn = null;
 PreparedStatement pstmt = null;

 try {
  String jdbcDriver = "jdbc:mysql://localhost:3306/textdb?" +
       "useUnicode=true&characterEncoding=utf8";
  String dbUser = "root";
  String dbPass = "nm9410";
  
  //2. 데이터베이스 커넥션 생성
  conn = DriverManager.getConnection(jdbcDriver,dbUser,dbPass);
  
  //3. 
  pstmt = conn.prepareStatement(
   "insert into MEMBER values(?,?,?,?)");
  pstmt.setString(1, memberID);
  pstmt.setString(2, password);
  pstmt.setString(3, name);
  pstmt.setString(4, email);
  
  //4. 
  pstmt.executeUpdate();
 } finally {
  if (pstmt != null) try {pstmt.close(); } catch(SQLException ex) {}
  if (conn != null) try {conn.close(); } catch(SQLException ex) {}
 }
%>
<html>
<head><title>삽입</title></head>
<body>

<jsp:forward page="login.jsp"></jsp:forward>

</body>
</html>
 
