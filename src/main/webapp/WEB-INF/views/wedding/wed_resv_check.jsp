<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
	width:1100px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section #resv_check #title{
	font-family:fantasy;
	font-size:70px;}
	
	section #resv_check #txt{
	font-size:18px;
	margin-left:40px;}
	
	section #resv_check #name{
	margin-top:120px;
	font-size:40px;
	margin-bottom:30px;}
	
	section #resv_check #border{
	border:1px solid black;
	height:450px;
	width:850px;
	margin:auto;}
	
	section #resv_check #left{
	margin-top:50px;
	display:inline-block;
	margin-left:20px;
	width:150px;}
	
	section #resv_check #right{
	display:inline-block;
	width:550px;}
	
	section #resv_check #left div{
	font-weight:600;
	padding:25px;}
	
	section #resv_check #right div{
	padding:25px;
	border-bottom:1px solid black;}
	
	section #resv_check #txt2{
	margin-top:50px;
	margin-right:20px;
	float:right;}
	
	section #resv_check .under{
	border-bottom:1px solid black;}
	
	section #resv_check #btn_center{
	margin-top:150px;
	text-align:center;}
	
	section #resv_check input[type=button]{
	margin-left:50px;
	width:500px;
	height:70px;
	background:black;
	color:white;}
	
	#wed_chk2 img{
	width:100%;
	margin-bottom:150px;}
	
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <h3> 예약확인 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
<section>
<div id="resv_check"> 
	
	<div id="title">RESERVATION</div>
	<div id="name">${wrvo.wresv_name }님 ! <span id="txt">예약이 완료되었습니다.</span></div>
	<div id="border">
	<div id="left">
		<div>상담 예약일</div>
		<div>상담 시간</div>
		<div>주문번호</div>
		<div>전화번호</div>
	</div>
	<div id="right">
		<div>${wrvo.wresv_cday }</div>
		<div>${wrvo.wresv_time }</div>
		<div>${wrvo.wresv_code }</div>
		<div>${wrvo.wresv_phone }</div>
	</div>
		<div id="txt2">비회원은 이름과 주문코드로 조회가 가능합니다.</div>
	</div>
	<div id="btn_center"><input type="button" onclick="location='../main/index'" value="확 인"></div>
</div>
</section>

<div id="wed_chk2">
	<img src="../img/wedding/wedding_chk.jpg">
</div>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>