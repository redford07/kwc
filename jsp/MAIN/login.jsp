<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>LOGIN</title>
	

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/cssForLogin?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/cssForLogin'>

	<link rel="stylesheet" href="cssForLogin/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="cssForLogin/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	
</head>
<%String name=request.getParameter("name"); %>
<body>
	<form action="logcheck.jsp" method="post">
	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo"><a href="index.jsp">5000 Mall</a> <span></span></span></h1>
			
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
				
			</div>
			<label for="username">UserID</label>
			<br/>
			<input type="text" id="username" name="id">
			
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="pwd">
			<br/>
			<button type="submit">Sign In</button>
			<br/>
			<a href="findpwd.jsp"><p class="small">Forgot your password?</p></a>
			<a href="MadeMember.jsp"><p class="small">Are you not member?</p></a>
		</div>
	</div>
	</form>
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>