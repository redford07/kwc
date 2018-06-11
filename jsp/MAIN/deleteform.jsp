<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>bootstrap template</title>
  

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="css/style.css" media="screen" title="no title" charset="utf-8">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <jsp:include page="module/stylesheet.jsp"></jsp:include>
    
   <script type="text/javascript" src="src/script.js"></script>
<script type="text/javascript">
   
	
</script>
    <jsp:include page="module/top.jsp"></jsp:include>
  </head>
  
<body onLoad="mm.id.focus()">



    

        <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원탈퇴 <small></small></h1>
        </div>
        
        <form class="form-horizontal" method="post" name="mm" action="deletecheck.jsp">
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">아이디</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" placeholder="ID" name="id" required>
          
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" >비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호" name="password" required>
        <p class="help-block"></p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" name="chpwd" required>
                <p class="help-block"></p>
             </div>
          </div>
          
          
         
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
          
            <button class="btn btn-primary" type="submit">회원탈퇴<i class="fa fa-check spaceLeft"></i></button>
           </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
      <jsp:include page="module/bottom.jsp"></jsp:include>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>