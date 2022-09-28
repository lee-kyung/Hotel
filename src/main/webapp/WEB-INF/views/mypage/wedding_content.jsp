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
	text-align:center;
	font-size:25px;
	padding-top:50px;
	cursor:pointer;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
	
	section{
	width:1300px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}

	section #wed_content #title{
	font-size:40px;
	text-align:center;
	margin-bottom:50px;}
	
	section #wed_content #txt1{
	margin-top:70px;
	font-size:30px;
	font-weight:600;
	margin-right:20px;}

	section #wed_content  #btn1{
	width:100px;
	height:40px;
	border:1px solid #887159;
	background:white;
	margin-left:20px;
	color:#887159;}
	
	section #wed_content  #btn2{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;}
	
	section #wed_content #btn3{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;
	cursor:pointer;}
	
	section #wed_content .btn4{
	width:100px;
	height:40px;
	border:1px solid #887159;
	color:#887159;
	background:white;}
	
	section #wed_content #txt2{
	height:30px;
	width:1100px;
	margin:auto;
	margin-top:40px;
	font-size:20px;
	font-weight:600;
	margin-bottom:-20px;}
	
	section #wed_content #txt2 #right{
	float:right;}
	
	section #wed_content #txt2 #left{
	float:left;}
	
	section #wed_content table{
	width:1000px;
	margin:auto;
	margin-top:60px;
	border-bottom:1px solid #887159;}
	
	section #wed_content table td{
	padding:15px;}
	
	section #wed_content table tr:first-child{
	font-size:25px;
	font-weight:600;
	text-align:left;
	border-bottom:2px solid #887159;}
	
	section #wed_content table td:first-child{
	width:250px;}
	
	section #wed_content table #name{
	font-weight:600;
	font-size:20px;}
	
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
<div id="wed_content">
	<div id="title">웨딩 예약 상세 내역</div>
	<div id="txt1">예약상세</div>
	<div id="txt2">
		<div id="left">${wvo.wresv_day } 예약일</div>
		<div id="right">${wvo.wresv_code }</div>	
	</div>

	<table>
		<tr>
			<td colspan="2">
				<c:if test="${wvo.state==0 }">
					예약완료
				</c:if>
				<c:if test="${wvo.state==1 }">
					예약취소
				</c:if>
				<c:if test="${wvo.state==2 }">
					상담완료
				</c:if>	
			</td>
		</tr>
		<tr>
			<td id="name"> ${wvo.wresv_cday } 상담예약</td>
			<td align="right">
		
				<c:if test="${wvo.state==0 }">
					<input type="button" id="btn3" value="예약취소" onclick="location='weddingR_state_change?state=1&wresv_id=${wvo.wresv_id}'">
				</c:if>
				<c:if test="${wvo.state==1 }">
					<input type="button" class="btn4" value="취소완료">
				</c:if>
				<c:if test="${wvo.state==2 }">
					<input type="button" class="btn4" value="상담완료">
				</c:if>	
			</td>
		</tr>
		<tr>
			<td>상담 시간</td>
			<td>${wvo.wresv_time }</td>
		</tr>
		<tr>
			<td>희망하는 웨딩홀</td>
			<td>${wvo.wresv_hall }</td>
		</tr>
		<tr>
			<td>희망하는 예식일</td>
			<td>${wvo.wresv_wday }</td>
		</tr>
		<tr>
			<td>예상 참석자</td>
			<td>${wvo.wresv_inwon }</td>
		</tr>
		<tr>
			<td>문의사항</td>
			<td>${wvo.wresv_content }</td>
		</tr>
	</table>

	<table>
		<tr>
			<td colspan="2">예약자 정보</td>
		</tr>
		<tr>
			<td>상담예약자</td>
			<td>${wvo.wresv_name }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${wvo.wresv_phone }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${wvo.wresv_email }</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2">결제 정보</td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td>
				<c:if test="${wvo.wresv_pay ==0}">
					카드결제
				</c:if>
				<c:if test="${wvo.wresv_pay !=0}">
					무통장입금
				</c:if>
			</td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td>5,000원</td>
		</tr>
	</table>
	
</div>
</section>
</body>