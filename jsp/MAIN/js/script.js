function inputCheck(){
	if(document.regFrm.id.value==""){
		alert("���̵� �Է��� �ּ���.");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.pass.value==""){
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.regFrm.pass.focus();
		return;
	}
	if(document.regFrm.repass.value==""){
		alert("��й�ȣ�� Ȯ���� �ּ���");
		document.regFrm.repass.focus();
		return;
	}
	if(document.regFrm.pass.value != document.regFrm.repass.value){
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		document.regFrm.repass.value="";
		document.regFrm.repass.focus();
		return;
	}
	if(document.regFrm.name.value==""){
		alert("�̸��� �Է��� �ּ���.");
		document.regFrm.name.focus();
		return;
	}
	if(document.regFrm.birthday.value==""){
		alert("������ϸ� �Է��� �ּ���.");
		document.regFrm.birthday.focus();
		return;
	}
	if(document.regFrm.email.value==""){
		alert("�̸����� �Է��� �ּ���.");
		document.regFrm.email.focus();
		return;
	}
    var str=document.regFrm.email.value;	   
    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');
    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail�ּ� ������ �߸��Ǿ����ϴ�.\n\r�ٽ� �Է��� �ּ���!');
	      document.regFrm.email.focus();
		  return;
    }
    if(document.regFrm.zipcode.value==""){
		alert("�����ȣ�� �˻��� �ּ���.");
		return;
	}
	if(document.regFrm.job.value=="0"){
		alert("������ ������ �ּ���.");
		document.regFrm.job.focus();
		return;
	}
	document.regFrm.submit();
}

function win_close(){
	self.close();
}
function Update(mem_id){
	document.update.mem_id.value=mem_id;
	document.update.submit();
}


//product 

function productDetail(no) {
	document.detail.no.value=no;
	document.detail.submit();
}

function productDelete(no) {
	document.del.no.value=no;
	document.del.submit();
}

function productUpdate(no){
	document.update.no.value=no;
	document.update.submit();
}


//order

function orderDetail(no){
	document.detail.no.value=no;
	document.detail.submit();	
}

function orderUpdate(form){
	form.flag.value="update"
	form.submit();
}

function orderDelete(form) {
	form.flag.value="delete";
	form.submit();
}


//order end
