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
    <title>signup</title>
  

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
   
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("아이디를 입력해 주세요.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");

	}

	function zipCheck() {
		url = "zipCheck.jsp?check=y";
		window
				.open(url, "ZipCodeSearch",
						"width=500,height=300,scrollbars=yes");
	}
</script>
    <jsp:include page="module/top.jsp"></jsp:include>
  </head>
  
<body onLoad="mm.id.focus()">

    

        <div class="col-md-12">
        <div class="page-header">
    	    <h1>회원가입 <small></small></h1>
        </div>
        
        <form class="form-horizontal" method="post" name="mm" action="MemberCheck.jsp">
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">아이디</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" placeholder="ID" name="id" required>
          <input type="button" value="ID중복확인"
									onClick="idCheck(this.form.id.value)" required>
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" >비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호" name="password" required>
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" name="chpwd" required>
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
             </div>
          </div>
          
          
          
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="이름" name="name" required>
          </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">성별</label>
          <div class="col-sm-6">
            						남<input  type="radio" name="sex" value="1"
									checked="checked">
									 여<input type="radio" name="sex"
									value="2">
          </div>
        </div>
        
         <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">생년월일</label>
          <div class="col-sm-6">
            <input class="form-control" type="text" name="birthday" size="30" value="" placeholder="ex)941024">
									
          </div>
        </div>
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이메일</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputEmail" type="email" placeholder="Email" name="email" required>
          </div>
        </div>
        
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">우편번호</label>
          <div class="col-sm-6">
          <tr>
          
         <td> <input type="text" name="zipcode" size="12" >
		  <input type="button" value="우편번호찾기" onClick="zipCheck()"></td>
		  
		  </tr>
		  <tr>
								
								<td>
								
								<input class="form-control" type="text" name="address" size="45" placeholder="주소"></td>
								
							</tr>
             </div>
        </div>
        
        
        
        <!-- 
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">취미</label>
          <div class="col-sm-6">
				
								<td>
									복수선택가능(1개이상)
								 	<input type="checkbox" name="hobby" value="인터넷" required>
								 	인터넷<input type="checkbox" name="hobby" value="인터넷">
								 
									여행<input type="checkbox" name="hobby" value="여행" > 게임<input
									type="checkbox" name="hobby" value="게임"> 영화<input
									type="checkbox" name="hobby" value="영화"> 운동<input
									type="checkbox" name="hobby" value="운동">
								</td>           
           </div>
        </div>
        
         -->
        
        
        
        <!-- 
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">직업</label>
          <div class="col-sm-6">
            <tr>
								
								<td><select name=job>
										<option value="0" selected>선택하세요.
										<option value="회사원">회사원
										<option value="연구전문직">연구전문직
										<option value="교수학생">교수학생
										<option value="일반자영업">일반자영업
										<option value="공무원">공무원
										<option value="의료인">의료인
										<option value="법조인">법조인
										<option value="종교,언론,에술인">종교.언론/예술인
										<option value="농,축,수산,광업인">농/축/수산/광업인
										<option value="주부">주부
										<option value="무직">무직
										<option value="기타">기타
								</select></td>
								
							</tr>
            </div>
        </div>
         -->
        
        
        
        
        
        
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <input type="tel" class="form-control" id="inputNumber" name="phone" placeholder="- 없이 입력해 주세요" />
                 
                </div>
              </div>
        </div>
       
         
        <div class="form-group">
          <div class="col-sm-12 text-center">
          
            <button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
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