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
	
	#first ul li{
	display:inline-block;
	border:1px solid #cccccc;
	width:450px;
	height:150px;
	margin-top:20px;
	background:white;
	border-right:none;
	text-align:center;
	font-size:25px;
	padding-top:50px;
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

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 문구(자유롭게 변경하기) </h3>
    </div>
    
<!-- first -->    
<div id="first">
	<div id="first_1">
		<div id="txt"><span onclick="location='mypage'">${name }님, 환영합니다.</span></div> 
	</div>
	<ul>
		<li onclick="location='room_resv'">객실 예약 확인</li><li onclick="location='dine_resv'">레스토랑 예약 확인</li><li onclick="location='eshop_gumae'">E-SHOP 주문내역</li><li onclick="location='wedding_resv'">웨딩 예약 확인</li>
	</ul>
</div>
<!-- first/ -->
	
	
<section>
<div id="mypage">

	<div style="height:200px;">
		<div id="left">
			<div id="txt1">호텔 멤버</div>
			<div id="txt2">${name}님의 가입일 <span id="joinday">${joinday }</span></div>
		</div>
		<div id="right">

			<div onclick="location='../mypage/myprofile_pwd'">회원정보 수정 </div><div onclick="location='../mypage/mypwd_change'">비밀번호 수정 </div><div onclick="alert('보유하신 쿠폰이 없습니다.');">쿠폰</div>
		 
		</div>
	</div>
	
	<div class="under"></div>
	<div id="second">
			<div style="font-size:25px;">${y } 년 이용실적</div>
			<div style="margin-left:20px;">투숙횟수 : ${room}</div>
			<div style="margin-left:20px;">다이닝횟수 : ${dine }</div>
			<div style="margin-left:20px;">상품구매횟수 : ${eshop }</div>
			<div style="margin-left:20px;">적립금 : ${juk }</div>
	</div>
	<div class="under" style="margin-top:50px;"></div>
	<div id="txt3">최근 사용 내역</div>

	 	<table border="1">
			<tr>
				<td colspan="4"><a href="room_resv">최근 객실내역</a></td>
			</tr>
			<tr>
				<td>객실명</td>
				<td>체크인</td>
				<td>체크아웃</td>
				<td width="150">예약일</td>
			</tr>
	 		<c:forEach items="${rlist }" var="rvo">
			<tr>
				<td>${rvo.rname}</td>
				<td>${rvo.checkin }</td>
				<td>${rvo.checkout }</td>
				<td>${rvo.bkdate }</td>
			</tr>
			</c:forEach> 
		</table>
		
	 	 <table border="1">
			<tr>
				<td colspan="4"><a href="dine_resv">최근 레스토랑내역</a></td>
			</tr>
			<tr>
				<td>식사일</td>
				<td>식사유형</td>
				<td>식사시간</td>
				<td width="150">예약일</td>
			</tr>
			<c:forEach items="${dlist }" var="dvo">
			<tr>
				<td>${dvo.dr_date }</td>
				<td>${dvo.dine_type }</td>
				<td>${dvo.dr_time }</td>
				<td>${dvo.writeday }</td>
			</tr>
			</c:forEach>
		</table>
		 
	 	<table border="1">
			<tr>
				<td colspan="4"><a href="wedding_resv">최근 웨딩내역</a></td>
			</tr>
			<tr>
				<td>웨딩홀</td>
				<td>상담일</td>
				<td>상담시간</td>
				<td width="150">예약일</td>
			</tr>
			<c:forEach items="${wlist }" var="wvo">
			<tr>
				<td>${wvo.wresv_hall }</td>
				<td>${wvo.wresv_cday }</td>
				<td>${wvo.wresv_time }</td>
				<td>${wvo.wresv_day }</td>
			</tr>
			</c:forEach>
		</table>
	 
	 	<table border="1">
			<tr>
				<td colspan="3"><a href="eshop_gumae">최근 ESHOP내역</a></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td>금액</td>
				<td width="150">구매일</td>
			</tr>
			<c:forEach items="${glist }" var="gvo">
			<tr>
				<td>${gvo.title }</td>
				<td>${gvo.total_price }</td>
				<td>${gvo.buyday }</td>
			</tr>
			</c:forEach>
		</table>

</div>
</section>




</body>