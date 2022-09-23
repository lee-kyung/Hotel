<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	#first #txt{
	text-align:left;
	font-size:40px;
	padding-top:50px;}
	
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
	padding-top:50px;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
/******************/

	section{
		width:1500px;
		margin:auto;
		margin-top:100px;
		margin-bottom:200px;
	}
	section table{
		width: 1500px;
	}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 최신 예약 </h3>
    </div>
    
<!-- first -->    
<div id="first">
	<div id="first_1"> 
		<div class="txt2">
			<span onclick="location='../admin/memberlist'">회원 목록 확인 </span>&nbsp;&nbsp;
		</div> 
	</div>
	<ul>
		<li><a href="../admin/roomlist">객실 예약 확인</a></li><li><a href="../admin/dinelist">레스토랑 예약 확인</a></li><li><a href="../admin/gumaelist">E-SHOP 주문내역</a></li><li><a href="../admin/wedlist">웨딩 예약 확인</a></li>
	</ul>
</div>
<!-- first/ -->
	
	
<section>
<div>
<!-- 내용 작성 -->
	<h2> 최근 예약/구매 내역 5개</h2>
	<br>
	<hr>
	<table id="room" border="1">
		<tr>
			<td colspan="14"><h2>객실 예약</h2></td>
		</tr>
		<tr>
			<td> ID </td>
			<td> 아이디 </td>
			<td> 예약자 </td>
			<td> 체크인 </td>
			<td> 체크아웃 </td>
			<td> 객실명 </td>
			<td> 예약일 </td>
			<td> 예약인원 </td>
			<td> 추가침대 </td>
			<td> 조식 </td>
			<td> 총 결제금액</td>
			<td> 특별요청사항 </td>
			<td> 예약상태 </td>		
		</tr>
	  <c:forEach items="${rlist}" var="rvo">
	    <tr>
	  		<td> ${rvo.id} </td>
	  		<td> ${rvo.userid} </td>
	  		<td> ${rvo.bkname} </td>
	  		<td> ${rvo.checkin} </td>
	  		<td> ${rvo.checkout} </td>
	  		<td> ${rvo.rname} </td>
	  		<td> ${rvo.bkdate} </td>
	  		<td> ${rvo.binwon} </td>
	  		<td> ${rvo.bextbed} </td>
	  		<td> ${rvo.bmeal} </td>
	  		<td> ${rvo.btotal} </td>	  		
	  		<td> ${rvo.spreq} </td>
	  	<c:if test="${rvo.bstate == 1}">
	  		<c:set var="bstate" value="예약"/>
	  	</c:if>
	  	<c:if test="${rvo.bstate == 2}">
	  		<c:set var="bstate" value="사용완료"/>
	  	</c:if>
	  	<c:if test="${rvo.bstate == 3}">
	  		<c:set var="bstate" value="취소됌"/>
	  	</c:if>
	  		<td> ${bstate} </td>
	  	<tr>
	  </c:forEach>
	</table>
	<br>
	<hr>
	<table id="dine" border="1">
		<tr>
			<td colspan="15"><h2>레스토랑 예약</h2></td>
		</tr>
		<tr>
			<td> 번호 </td>
			<td> 아이디 </td>
			<td> 예약번호 </td>
			<td> 전화번호 </td>
			<td> 이메일 </td>
			<td> 식사날짜 </td>
			<td> 식사유형 </td>
			<td> 식사시간 </td>
			<td> 성인 </td>
			<td> 어린이 </td>
			<td> 유아 </td>
			<td> 총 금액 </td>
			<td> 요청사항 </td>
			<td> 예약일 </td>
			<td> 예약상태 </td>
		</tr>
<%-- 	  <c:forEach items="${dlist}" var="dvo">
	  	<tr>
	  		<td> ${dvo.dr_id} </td>
	  		<td> ${dvo.userid} </td>
	  		<td> ${dvo.dining_id} </td>
	  		<td> ${dvo.p1}-${dvo.p2}-${dvo.p3} </td>
	  		<td> ${dvo.email} </td>
	  		<td> ${dvo.dr_date} </td>
	  		<td> ${dvo.dine_type} </td>
	  		<td> ${dvo.dr_time} </td>
	  		<td> ${dvo.adult} </td>
	  		<td> ${dvo.child} </td>
	  		<td> ${dvo.baby} </td>
	  		<td> ${dvo.dr_total} </td>
	  		<td> ${dvo.dr_extrarq} </td>
	  		<td> ${dvo.writeday} </td>
	  		<td> ${dvo.dr_state} </td>
	  	</tr>
	  </c:forEach> --%>
	</table>
	<br>
	<hr>
	<table id="shop" border="1">
		<tr>
			<td colspan="6"><h2>상품 판매</h2></td>
		</tr>
		<tr>
			<td> 번호 </td>
			<td> 아이디 </td>
			<td> 주문번호 </td>
			<td> 구매자 </td>
			<td> 연락번호 </td>
			<td> 이메일 </td>
			<td> 상품명 </td>
			<td> 상품코드 </td>
			<td> 총결제금액 </td>
			<td> 구매일 </td>
			<td> 상태 </td>
		</tr>
	  <c:forEach items="${glist}" var="gvo">
		<tr>
			<td> ${gvo.id} </td>
			<td> ${gvo.userid} </td>
			<td> ${gvo.jumuncode} </td>
			<td> ${gvo.pname} </td>
			<td> ${gvo.pphone} </td>
			<td> ${gvo.pname} </td>
			<td> ${gvo.pcode} </td>
			<td> ${gvo.total_price} </td>
			<td> ${gvo.buyday} </td>
			<td> ${gvo.state} </td>
		</tr>
	  </c:forEach>
	</table>
	<br>
	<hr>
	<table id="wedding" border="1">
		<tr>
			<td colspan="11"><h2>웨딩 상담 예약</h2></td>
		</tr>
		<tr>
			<td> 번호 </td>
			<td> 아이디 </td>
			<td> 상담예약일 </td>
			<td> 예약일 </td>
			<td> 예식희망일 </td>
			<td> 예약시간 </td>
			<td> 웨딩홀 </td>
			<td> 예약자 </td>
			<td> 연락번호 </td>
			<td> 인원 </td>
			<td> 예약상태 </td>
		</tr>
	  <c:forEach items="${wlist}" var="wvo">
	  	<tr>
	  		<td> ${wvo.wresv_id} </td>
	  		<td> ${wvo.userid} </td>
	  		<td> ${wvo.wresv_cday} </td>
	  		<td> ${wvo.wresv_day} </td>
	  		<td> ${wvo.wresv_wday} </td>
	  		<td> ${wvo.wresv_time} </td>
	  		<td> ${wvo.wresv_hall} </td>
	  		<td> ${wvo.wresv_name} </td>
	  		<td> ${wvo.wresv_phone} </td>
	  		<td> ${wvo.wresv_inwon} </td>
	  		<td> ${wvo.state} </td>		
	  	</tr>
	  </c:forEach>
	</table>
</div>
</section>
</body>














