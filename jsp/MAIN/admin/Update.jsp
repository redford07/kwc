<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import ="java.util.*,smartProject.*" %> 
<% 
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="memMgr" class="smartProject.MemberMgr" />


<html>
<head>
<title>ȸ������</title>
<link href="../style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600">
<br>

	<%@ include file="Top.jsp" %>
	<%
	String mem_id = request.getParameter("mem_id");
	RegisterBean regBean= memMgr.getMember(mem_id);
	%>
	 
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">

		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
		<form name="regForm" method="post" action="UpdateProc.jsp">
		<tr align="center" bgcolor="#996600"> 
		<td colspan="3"><font color="#FFFFFF"><b> 
		<%=regBean.getMem_name()%>
		ȸ������ ������ �����մϴ�.</b></font> </td>
		</tr>
		<tr> 
		<td>���̵�</td>
		<td><%=regBean.getMem_id()%></td>
		</tr>
		<tr> 
		<td>�н�����</td>
		<td><input type="text" name="mem_passwd" value="<%=regBean.getMem_passwd()%>"></td>
		</tr>
		<tr> 
		<td>�̸�</td>
		<td><input type="text" name="mem_name" value="<%=regBean.getMem_name()%>"></td>
		</tr>
		<tr> 
		<td>�̸���</td>
		<td><input type="text" name="mem_email"  size="30" value="<%=regBean.getMem_email()%>"></td>
		</tr>
		<tr> 
		<td>��ȭ��ȣ</td>
		<td><input type="text" name="mem_phone" value="<%=regBean.getMem_phone()%>"></td>
		</tr>
		<tr> 
		<td>�ּ�</td>
		<td><input type="text" name="mem_address" size="50" value="<%=regBean.getMem_address()%>"></td>
		</tr>
		<tr> 
		<td>����</td>
		<td><select name=mem_job>
		<option value="0">�����ϼ���.
		<option value="ȸ���">ȸ���
		<option value="����������">����������
		<option value="�����л�">�����л�
		<option value="�Ϲ��ڿ���">�Ϲ��ڿ���
		<option value="������">������
		<option value="�Ƿ���">�Ƿ���
		<option value="������">������
		<option value="����,���,������">����.���/������
		<option value="��,��,����,������">��/��/����/������
		<option value="�ֺ�">�ֺ�
		<option value="����">����
		<option value="��Ÿ">��Ÿ
		</select>
		<script>document.regForm.mem_job.value="<%=regBean.getMem_job()%>"</script>
		</td>
		</tr>
		<tr> 
		<td colspan="2" align="center"><input type="submit" value="�����Ϸ�"> 
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<input type="reset" value="�ٽþ���"> 
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
