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
	width:1300px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}

	section #dine_content #title{
	font-size:40px;
	text-align:center;
	margin-bottom:50px;}
	
	section #dine_content #txt1{
	margin-top:70px;
	font-size:30px;
	font-weight:600;
	margin-right:20px;}

	section #dine_content  #btn1{
	width:100px;
	height:40px;
	border:1px solid #887159;
	background:white;
	margin-left:20px;
	color:#887159;}
	
	section #dine_content  #btn2{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;}
	
	section #dine_content #btn3{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;
	cursor:pointer;}
	
	section #dine_content .btn4{
	width:100px;
	height:40px;
	border:1px solid #887159;
	color:#887159;
	background:white;}
	
	section #dine_content #txt2{
	height:30px;
	width:1100px;
	margin:auto;
	margin-top:40px;
	font-size:20px;
	font-weight:600;
	margin-bottom:-20px;}
	
	section #dine_content #txt2 #right{
	float:right;}
	
	section #dine_content #txt2 #left{
	float:left;}
	
	section #dine_content table{
	width:1000px;
	margin:auto;
	margin-top:60px;
	border-bottom:1px solid #887159;}
	
	section #dine_content table td{
	padding:15px;}
	
	section #dine_content table tr:first-child{
	font-size:25px;
	font-weight:600;
	text-align:left;
	border-bottom:2px solid #887159;}
	
	section #dine_content table td:first-child{
	width:250px;}
	
	section #dine_content table #name{
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
<div id="dine_content">
	<div id="title">레스토랑 예약 상세 내역</div>
	<div id="txt1">예약상세</div>
	<div id="txt2">
		<div id="left">${dvo.writeday } 예약일</div>
		<div id="right">${dvo.bid }</div>	
	</div>
		
	<table>
		<tr>
			<td colspan="2">
				<c:if test="${dvo.dr_state==0 }">
					예약완료
				</c:if>
				<c:if test="${dvo.dr_state==1  }">
					사용완료
				</c:if>
				<c:if test="${dvo.dr_state==2  }">
					예약취소
				</c:if>	
			</td>
		</tr>
		<tr>
			<td id="name"> ${dvo.dr_date } 식사예약일</td>
			<td align="right">
				<c:if test="${dvo.dr_state==0 }">
					<input type="button" id="btn3" value="예약취소" onclick="location='dineR_state_change?dr_state=2&dr_id=${dvo.dr_id}'">
				</c:if>
				<c:if test="${dvo.dr_state==1 }">
					<input type="button" class="btn4" value="사용완료">
				</c:if>
				<c:if test="${dvo.dr_state==2 }">
					<input type="button" class="btn4" value="취소완료">
				</c:if> 
			</td>
		</tr>
		<tr>
			<td>식사유형</td>
			<td>${dvo.dine_type }</td>
		</tr>
		<tr>
			<td>식사시간</td>
			<td>${dvo.dr_time }</td>
		</tr>
		<tr>
			<td>성인</td>
			<td>${dvo.adult }인</td>
		</tr>
		<tr>
			<td>어린이</td>
			<td>${dvo.child }인</td>
		</tr>
		<tr>
			<td>유아</td>
			<td>${dvo.baby }인</td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td>${dvo.dr_extrarq }</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2">예약자 정보</td>
		</tr>
		<tr>
			<td>상담예약자</td>
			<td>${name }</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${dvo.p1 }-${dvo.p2 }-${dvo.p3 }</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${email }</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2">결제 정보</td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td>
				<c:if test="${dvo.sudan ==0}">
					간편결제
				</c:if>
				<c:if test="${dvo.sudan !=0}">
					현장결제
				</c:if>
			</td>
		</tr>
		<tr>
			<td>결제금액</td>
			<td><fmt:formatNumber value="${dvo.dr_total}"/>원</td>
		</tr>
	</table>
	
</div>
</section>
</body>