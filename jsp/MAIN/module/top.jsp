
						
<% 
String username = (String)session.getAttribute("username");


%>
					
 
 	
 	<%if(username==null){ %>
 	<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-left">
						<a class="special"href="index.jsp">5000mall</a>
						<a href="login.jsp">  Login</a>
						<a href="index.jsp#cta">  NewItem</a>
						<a href="singo.jsp">report</a>
						<!--  <a href="index.jsp#cta">  NewItem</a>-->
						
						
					</ul>
				</div>
	<%}else if(username!=null){ %>
	
	
	
	
	<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-left">
						<a href="index.jsp">5000mall</a>
						
						<a href="logout.jsp">  Logout</a>
						<a href="memberinfo.jsp">  MyPage</a>
						<a href="cartlist.jsp">  MyCart</a>
						<a href="myproduct.jsp">  MyProduct</a>
						<a href="singo.jsp">report</a>
						
					</ul>
				</div>

<%}%>
