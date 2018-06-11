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
    <title>singo</title>
  

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
    
    
   <script type="text/javascript" src="src/script.js"></script>
<script type="text/javascript">
   

</script>
    <jsp:include page="module/top.jsp"></jsp:include>
  </head>
  
<body onLoad="mm.id.focus()">

    

        <div class="col-md-12">
        <div class="page-header">
    	    <h1>신고하기 <small></small></h1>
        </div>
        
        <form class="form-horizontal" method="post" name="mm" action="singopro.jsp">
        
       
          
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">아이디</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="신고할id" name="sid" required>
          </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">상세설명</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="" name="reason">
          </div>
        </div>
        
        
    
        
       
         
        <div class="form-group">
          <div class="col-sm-12 text-center">
          
            <button class="btn btn-primary" type="submit">신고하기<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="reset">다시쓰기<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>