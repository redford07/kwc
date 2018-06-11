<%@ page language="java" contentType="text/html; utf-8"
    pageEncoding="utf-8"%>
  <%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<script language = "javascript">
function writeCheck(){ 
	var form = document.writeform; 
	if( !form.name.value ) { 
		alert( "이름을 적어주세요" ); 
		form.name.focus(); return; 
		} 
	if( !form.password.value ) {
		alert( "비밀번호를 적어주세요" ); 
		form.password.focus(); return; 
		} 
	if( !form.title.value ) { 
		alert( "제목을 적어주세요" ); 
		form.title.focus(); return; 
		} 
	if( !form.memo.value ) { 
		alert( "내용을 적어주세요" ); 
		form.memo.focus(); 
		return; 
		} 
	form.submit(); 
	} </script> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
		<title>게시판</title>
		<meta charset="utf-8" />
	
		<jsp:include page="module/stylesheet.jsp"></jsp:include>
		
		
			
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
							<h2>글쓰기</h2>
							
							<ul class="actions">
								<li><a href="additem.jsp" class="button fit">상품등록</a></li>
								
								
								
							
								
								
							</ul>
						</div>
						
								<li><a href="#one" class="more scrolly">Learn More</a></li>
								
						
					</section>

				<table>
				<form name="writeform" method="post" action="boardwritecheck.jsp">


  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>글쓰기</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input type="text" name="title" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" ><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input type="text"  name="name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" ><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type="password" "password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" ><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" ><td colspan="4"></td></tr>
     <tr height="1" ><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
     
     <td colspan="2">
     <input type="submit" value="등록" OnClick="javascript:writeCheck();"> 
     <input type="button" value="취소" OnClick="javascript:history.back(-1)"> 

      <td>&nbsp;</td>
     </tr>
     
    </table>
   </td>
  </tr>
  </form>
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