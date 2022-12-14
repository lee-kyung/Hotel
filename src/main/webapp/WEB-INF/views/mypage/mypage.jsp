<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	page import="java.time.LocalDate" %> 
<%
	int y, m, d;
	LocalDate today=LocalDate.now();
	y=today.getYear();	
	m=today.getMonthValue();
	request.setAttribute("y", y);
	request.setAttribute("m", m);
%>
<head>
<style>
/******************/
	#first{
	width:100%;
	height:400px;
	background:#F3F3F3;
	text-align:center;}
	
	#first #first_1{
	margin:auto;
	width:1800px;}
	
	#first #first_1 span{
	cursor:pointer;}
	
	#first #txt{
	text-align:left;
	font-size:40px;
	padding-top:50px;
	margin-bottom:50px;}
	
	#first .txt2{
	text-align:right;
	font-size:18px;}
	
	#first .txt2 span{
	cursor:pointer;}
	
	#first #list{
	width:100%;
	margin:auto;}
	
	#first ul li{
	display:inline-block;
	border:1px solid #cccccc;
	width:23%;
	height:150px;
	margin-top:20px;
	background:white;
	border-right:none;
	font-size:25px;
	padding-top:52px;
	cursor:pointer;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
/******************/


	
	section{
	width:1300px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section #mypage #txt1{
	font-size:30px;}
	
	section #mypage #txt2{
	margin-top:70px;
	font-size:20px;
	margin-left:20px;}
	
	section #mypage #joinday{
	color:#887159;
	font-weight:600;
	margin-left:30px;}
	
	section #mypage #left{
	float:left;}
	
	section #mypage #right{
	float:right;}
	
	section #mypage #right div{
	display:inline-block;
	border:1px solid #887159;
	width:230px;
	height:120px;
	margin-top:45px;
	padding-top:45px;
	text-align:center;
	font-size:20px;
	border-top:none;
	border-bottom:none;
	cursor:pointer;}
	
	section #mypage #right div:first-child{
	border-left:none;}
	
	section #mypage #right div:last-child{
	border-right:none;}
	
	section #mypage .under{
	border-bottom:1px solid #887159;
	margin-top:70px;}
	
	section #mypage #second{
	width:1000px;
	margin-top:70px;
	margin-left:30px;}
	
	section #mypage #second div{
	padding:13px;}
	
	section #mypage #txt3{
	font-size:30px;
	margin-top:50px;}
	
	section #mypage table{
	margin:auto;
	margin-top:50px;
	width:1000px;
	text-align:center;
	border-color:#887159;
	border-top-color:white;
	border-right:none;
	border-left:none;}
	
	section #mypage table tr:first-child{
	font-weight:600;
	text-align:left;
	font-size:25px;}
	
	section #mypage table a{
	color:black;}
	
	section #mypage table a:hover{
	letter-spacing:2px;
	color:red;}
	
	section #mypage table tr:first-child a{
	color:#887159;}
	
	section #mypage table tr:nth-child(2){
	font-weight:600;
	font-size:18px;}
	
	section #mypage table td{
	height:30px;
	padding:20px;
	border-left:none;
	border-right:none;}
	
</style>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
    <!-- bradcam_area_start -->
    <!-- ??? ????????? ???????????? ???
    	???[webapp\resources\css]????????? ?????? [style.css]????????? ?????? ????????????
    	???[webapp\resources\img\banner]????????? ?????????????????? ???????????? -->
    <div class="bradcam_area mypage">	<!-- class="bradcam_area ????????????" -->
        <div id="h3">MY PAGE</div>
    </div>
    
<!-- first -->    
<div id="first">
	<div id="first_1">
		<div id="txt"><span onclick="location='mypage'">${name }???, ???????????????.</span></div> 
	</div>
	<div id="list">
		<ul>
			<li onclick="location='room_resv'">?????? ?????? ??????</li><li onclick="location='dine_resv'">???????????? ?????? ??????</li><li onclick="location='eshop_gumae'">E-SHOP ????????????</li><li onclick="location='wedding_resv'">?????? ?????? ??????</li>
		</ul>
	</div>
</div>
<!-- first/ -->
	
	
<section>
<div id="mypage">

	<div style="height:200px;">
		<div id="left">
			<div id="txt1">?????? ??????</div>
			<div id="txt2">${name}?????? ????????? <span id="joinday">${joinday }</span></div>
		</div>
		<div id="right">
		<!-- ???????????? -->
		<c:if test="${kid == null}">
			<div onclick="location='../mypage/myprofile_pwd'">???????????? ?????? </div><div onclick="location='../mypage/mypwd_change'">???????????? ?????? </div><div onclick="alert('???????????? ????????? ????????????.');">??????</div>
		</c:if>
		<!-- ???????????????????????? -->
		<c:if test="${kid != null}">
			<div onclick="location='../mypage/myprofile'"> ???????????? ?????? </div><div onclick="alert('???????????? ????????? ????????????.');">??????</div>
		</c:if>		 
		</div>
	</div>
	
	<div class="under"></div>
	<div id="second">
			<div style="font-size:25px;">${y } ??? ????????????</div>
			<div style="margin-left:20px;">???????????? : ${room}</div>
			<div style="margin-left:20px;">??????????????? : ${dine }</div>
			<div style="margin-left:20px;">?????????????????? : ${eshop }</div>
			<div style="margin-left:20px;">????????? : ${juk } ???</div>
	</div>
	<div class="under" style="margin-top:50px;"></div>
	<div id="txt3">?????? ?????? ??????</div>

	 	<table border="1">
			<tr>
				<td colspan="4"><a href="room_resv">?????? ????????????</a></td>
			</tr>
			<tr>
				<td width="400">?????????</td>
				<td>?????????</td>
				<td>????????????</td>
				<td width="150">?????????</td>
			</tr>
	 		<c:forEach items="${rlist }" var="rvo">
			<tr>
				<td><a href="room_content?id=${rvo.id}">${rvo.rname}</a></td>
				<td>${rvo.checkin }</td>
				<td>${rvo.checkout }</td>
				<td>${rvo.bkdate }</td>
			</tr>
			</c:forEach> 
		</table>
		
	 	 <table border="1">
			<tr>
				<td colspan="4"><a href="dine_resv">?????? ??????????????????</a></td>
			</tr>
			<tr>
				<td width="400">?????????</td>
				<td>????????????</td>
				<td>????????????</td>
				<td width="150">?????????</td>
			</tr>
			<c:forEach items="${dlist }" var="dvo">
			<tr>
				<td><a href="dine_content?dr_id=${dvo.dr_id}">${dvo.dr_date }</a></td>
				<td>${dvo.dine_type }</td>
				<td>${dvo.dr_time }</td>
				<td>${dvo.writeday }</td>
			</tr>
			</c:forEach>
		</table>
		 
	 	<table border="1">
			<tr>
				<td colspan="4"><a href="wedding_resv">?????? ????????????</a></td>
			</tr>
			<tr>
				<td width="400">?????????</td>
				<td>?????????</td>
				<td>????????????</td>
				<td width="150">?????????</td>
			</tr>
			<c:forEach items="${wlist }" var="wvo">
			<tr>
				<td><a href="wedding_content?wresv_id=${wvo.wresv_id }">${wvo.wresv_hall }</a></td>
				<td>${wvo.wresv_cday }</td>
				<td>${wvo.wresv_time }</td>
				<td>${wvo.wresv_day }</td>
			</tr>
			</c:forEach>
		</table>
	 
	 	<table border="1">
			<tr>
				<td colspan="3"><a href="eshop_gumae">?????? ESHOP??????</a></td>
			</tr>
			<tr>
				<td width="600">?????????</td>
				<td>??????</td>
				<td width="150">?????????</td>
			</tr>
			<c:forEach items="${glist }" var="gvo">
			<tr>
				<td><a href="eshop_content?id=${gvo.id}&jumuncode=${gvo.jumuncode }">${gvo.title }</a></td>
				<td><fmt:formatNumber value="${gvo.total_price }"/>???</td>
				<td>${gvo.buyday }</td>
			</tr>
			</c:forEach>
		</table>

</div>
</section>




</body>