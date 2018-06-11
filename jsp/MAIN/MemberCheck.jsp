<%@page import="com.sun.org.apache.xalan.internal.xsltc.runtime.Parameter"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ page import = "java.sql.*" %>
  
<% request.setCharacterEncoding("utf-8"); %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<% 					
					String id = request.getParameter("id");
					String password = request.getParameter("password");
                   String chpw=request.getParameter("chpwd");
                  
                 	 String name = request.getParameter("name");
                 	 String sex = request.getParameter("sex");
                 	String birthday = request.getParameter("birthday");
                 	String email = request.getParameter("email");
                 	String zipcode = request.getParameter("zipcode");
                 	String address = request.getParameter("address");
                 	String phone = request.getParameter("phone");
                 	
                 
                  	
                   if(!(password.equals(chpw))){
                   %>
                  	<script type="text/javascript">
					alert("비밀번호가 서로 다릅니다.");
					history.back();
					</script>
                   	
                   	<%} else { 
                   		request.setCharacterEncoding("utf-8");
                   	 
                   	 
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
                   	   "insert into MEMBER values(?,?,?,?,?,?,?,?,?,?)");
                   	  pstmt.setString(1, id);
                   	  pstmt.setString(2, password);
                   	  pstmt.setString(3, name);
                   	  pstmt.setString(4, sex);
                   	pstmt.setString(5, birthday);
                   	pstmt.setString(6, email);
                   	pstmt.setString(7, zipcode);
                   	pstmt.setString(8, address);
                 	pstmt.setString(9, phone);
                 	pstmt.setString(10, "clean");
                
                   	  
                   	  //4. 
                   	  pstmt.executeUpdate();
                   	 } finally {
                   	  if (pstmt != null) try {pstmt.close(); } catch(SQLException ex) {}
                   	  if (conn != null) try {conn.close(); } catch(SQLException ex) {}
                   	 }
            			%>
                   		
                   		<script type="text/javascript">
						alert("회원가입을 하였습니다.");
						location.href="login.jsp";
						</script>
                   		
                    	<% } %>
                    	
                    	
</body>
</html>