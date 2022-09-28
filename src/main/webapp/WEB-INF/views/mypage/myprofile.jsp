<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
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
	padding-top:50px;}
	
	#first .txt2{
	margin-bottom:20px;
	text-align:right;
	font-size:20px;
	cursor:pointer;}
	
	#first #list{
	width:1820px;
	margin:auto;}
	
	#first ul li{
	display:inline-block;
	border:1px solid #cccccc;
	width:450px;
	height:150px;
	margin-top:20px;
	background:white;
	border-right:none;
	font-size:25px;
	padding-top:50px;
	cursor:pointer;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
	
	section{
	width:1100px;
	margin:auto;
	margin-top:50px;
	margin-bottom:200px;}
	
	section #profile #border{
	margin-top:70px;
	margin-bottom:70px;
	border:1px solid #887159;
	padding-top:20px;
	padding-bottom:40px;}
	
	section #profile div{
	padding:10px;}
	
	section #profile #title{
	text-align:center;
	font-size:35px;}
	
	section #profile .my{
	border:1px solid #887159;
	width:500px;
	height:50px;
	margin-left:20px;}
	
	section #profile .myjuso{
	border:1px solid #887159;
	width:700px;
	height:50px;
	margin-left:20px;}
	
	section #profile #btn_right{
	float:right;}
	section #profile input[type=button]{
	margin-top:70px;
	width:300px;
	height:60px;
	background:#887159;
	border:none;
	color:white;
	cursor:pointer;}
	
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
<div id="first">
	<div id="first_1">
		<div id="txt"><span onclick="location='mypage'">${name }님, 환영합니다.</span></div>
		<div class="txt2">
			<span onclick="location='../mypage/myprofile_pwd'">회원정보 수정 > </span>&nbsp;&nbsp;
			<span onclick="location='../mypage/mypwd_change'">비밀번호 수정 > </span>
		</div> 
	</div>
	<div id="list">	
		<ul>
			<li onclick="location='room_resv'">객실 예약 확인</li><li onclick="location='dine_resv'">레스토랑 예약 확인</li><li onclick="location='eshop_gumae'">E-SHOP 주문내역</li><li onclick="location='wedding_resv'">웨딩 예약 확인</li>
		</ul>
	</div>
</div>

<section>
<div id="profile">
	<div id="title">회원정보</div>
	<div id="border">
		<div>
			<div>아이디</div>
			<div class="my">${mvo.userid }</div>
		</div>
		<div>
			<div>이름</div>
			<div class="my">${mvo.name }</div>
		</div>
		<div>
			<div>휴대전화</div>
			<div class="my">${mvo.phone }</div>
		</div>
		<div>
			<div>생년월일</div>
			<div class="my">${mvo.birth }</div>
		</div>
		<div>
			<div>이메일</div>
			<div class="my">${mvo.email }</div>
		</div>
		<div>
			<div>주소</div>
			<div class="myjuso">${mvo.juso } ${mvo.juso_etc }</div>
		</div>
		<div id="btn_right">
			<input type="button" onclick="location='../mypage/myprofile_edit'" value="정보수정">
			<input type="button" value="회원탈퇴" onclick="location='../member/member_out'">
		</div>
	</div>
</div>
</section>
</body>