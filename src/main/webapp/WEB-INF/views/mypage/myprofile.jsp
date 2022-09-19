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
	
	#first #txt{
	text-align:left;
	font-size:45px;
	padding-top:50px;}
	
	#first .txt2{
	text-align:right;
	font-size:20px;
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
	padding-top:50px;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
	
	section{
	width:1100px;
	margin:auto;
	border:1px solid red;
	margin-top:100px;
	margin-bottom:200px;}

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
		<div id="txt">${name }님, 환영합니다.</div> 
		<div class="txt2">
			<span>회원정보 수정 > </span>&nbsp;&nbsp;
			<span>비밀번호 수정 > </span>
		</div> 
	</div>	
	<ul>
		<li>객실 예약 확인</li><li>레스토랑 예약 확인</li><li>E-SHOP 주문내역</li><li>웨딩 예약 확인</li>
	</ul>
</div>

<section>
<div id="profile">
		<div>
			<div>아이디</div>
			<div>${mvo.userid }</div>
		</div>
		<div>
			<div>이름</div>
			<div>${mvo.name }</div>
		</div>
		<div>
			<div>휴대전화</div>
			<div>${mvo.phone }</div>
		</div>
		<div>
			<div>생년월일</div>
			<div>${mvo.birth }</div>
		</div>
		<div>
			<div>이메일</div>
			<div>${mvo.email }</div>
		</div>
		<div>
			<div>주소</div>
			<div>${mvo.juso } ${mvo.juso_etc }</div>
		</div>
</div>
</section>
</body>