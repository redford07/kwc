<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*, smartProject.*"%>

<jsp:useBean id="orderMgr" class="smartProject.OrderMgr" />
<jsp:useBean id="proMgr" class="smartProject.ProductMgr" />
<script language="JavaScript" src="script.js"></script>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<title>관리자 페이지</title>
		<meta charset="utf-8" />
		<jsp:include page="../module/stylesheet.jsp"></jsp:include>
	</head>
	<body>

		<!-- Page Wrapper -->
			<div id="page-wrapper">

				<!-- Header -->
					<header id="header">
						<jsp:include page="Top.jsp"></jsp:include>
						
						
					</header>

				<!-- Main -->
					<article id="main">
						<header>
							<h2>서비스 준비중입니다.</h2>
							<p>This is a page for order</p>
						</header>
				<table width="75%" align="center">
	<tr> 
	<td align="center">

		<table width="95%" align="center"" border="1">
		<tr> 
		<td align="center">주문번호</td>
		<td align="center">주문자</td>
		<td align="center">제품</td>
		<td align="center">주문수량</td>
		<td align="center">주문날짜</td>
		<td align="center">주문상태</td>
		<td>&nbsp;</td>
		</tr>
		<%
		Vector vResult = orderMgr.getOrderList();
		if(vResult.size() ==0){
		%>
		<tr> 
		<td align="center" colspan="7">주문 내역이 없습니다</td>
		</tr>
		<%}else{
			for(int i=0; i< vResult.size(); i++){
			OrderBean order = (OrderBean)vResult.get(i);
			ProductBean product = proMgr.getProduct(order.getProduct_no());
		%>
		<tr> 
		<td align="center"><%=order.getNo()%></td>
		<td align="center"><%=order.getId()%></td>
		<td align="center"><%=product.getName()%></td>
		<td align="center"><%=order.getQuantity()%></td>
		<td align="center"><%=order.getDate()%></td>
		<td align="center">
		<%
		switch(Integer.parseInt(order.getState())){
		case 1 : out.println("접수중");
		break;
		case 2 : out.println("접수");
		break;
		case 3 : out.println("입금확인");
		break;
		case 4 : out.println("배송준비");
		break;
		case 5 : out.println("배송중");
		break;
		default : out.println("완료");
		}%>
		</td>
		<td align="center"><a href="javascript:orderDetail('<%=order.getNo()%>')">상세보기</a></td>
		</tr>
		<%}
		}%>
		</table>
	
	</td>
	</tr>
	</table>


	<form name="detail" method="post" action="OrderDetail.jsp" >
	<input type="hidden" name="no">
	</form>
	

					</article>

				<!-- Footer -->
					<jsp:include page="Bottom.jsp"></jsp:include>

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