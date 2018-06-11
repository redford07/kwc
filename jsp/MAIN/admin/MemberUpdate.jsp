<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import ="java.util.*" %> 
<%@ page import ="test.MemberBean" %> 
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memMgr" class="test.MemberMgr" />


<html>
<head>
<title>회원수정</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600">
<br>

	<%@ include file="Top.jsp" %>
	<%
	String mem_id = request.getParameter("mem_id");
	MemberBean regBean= memMgr.getMember(mem_id);
	%>
	 
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<form name="regForm" method="post" action="MemberUpdateProc.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3"><font color="#FFFFFF"><b> 
		<%=regBean.getName()%>
		회원님의 정보를 수정합니다.</b></font> </td>
		</tr>
		<tr> 
		<td>아이디</td>
		<td><%=regBean.getId()%></td>
		</tr>
		<tr> 
		<td>패스워드</td>
		<td><input type="text" name="mem_passwd" value="<%=regBean.getPass()%>"></td>
		</tr>
		<tr> 
		<td>이름</td>
		<td><input type="text" name="mem_name" value="<%=regBean.getName()%>"></td>
		</tr>
		<tr> 
		<td>이메일</td>
		<td><input type="text" name="mem_email"  size="30" value="<%=regBean.getEmail()%>"></td>
		</tr>
		<tr> 
		<td>성별</td>
		<td><input type="text" name="mem_phone" value="<%=regBean.getSex()%>"></td>
		</tr>
		<tr> 
		<td>주소</td>
		<td><input type="text" name="mem_address" size="50" value="<%=regBean.getAddress()%>"></td>
		</tr>
		<tr> 
		<td>직업</td>
		<td><select name=mem_job>
		<option value="0">선택하세요.
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
		</select>
		
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="수정완료"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="다시쓰기"> 
		</td>
		</tr>
		<input type="hidden" name="mem_id" value="<%=mem_id%>">
		</form>
		</table>

	</td>
	</tr>
	</table>
	
	<%@ include file="Bottom.jsp" %>
		
</body>
</html>
