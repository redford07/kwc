<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*, smartProject.*"%>
  <jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
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
String id = request.getParameter("id"); //db에서 찾기위한 세션정보 아이디 가져오기
memberBean.setId(id);

MemberBean mb = new MemberBean();
mb= memberMgr.getMember(id);


%>

	</head>
	<body>

		

			

								  <table>
        
                    
            
          
          
                    
            <tr>
                <td id="title">이메일</td>
                <td>
                    <%=mb.getEmail() %>
                    
                </td>
            </tr>
                    
          
             <tr>
                <td id="title">휴대폰</td>
                <td>
                    <%=mb.getPhone() %>
                </td>
            </tr>
            <br>
        
       
        </table>
    


				<!-- Footer -->
				

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