<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
/******************/
	#first{
		width: 100%;
		height: 270px;
		background: #F3F3F3;
		text-align: center;
		margin: auto;
	}
	#first #first_1{
		margin: auto;
		width: 100%;
	}
	#first #txt{
		text-align:left;
		font-size:40px;
		padding-top:50px;
		margin-right: 10px;
	}
	#first .txt2{
		padding-top: 10px;
		text-align:right;
		font-size:18px;
	}
	#first .txt2 a{
		cursor:pointer;
	}
	#first .txt2 a:hover{
		color: #887159;
	}
	#first ul li{
		display: inline-block;
		border: 1px solid #cccccc;
		width: 24%;
		height: 100px;
		margin-top: 44px;
		background: white;
		border-right: none;
		text-align: center;
		font-size: 25px;
		padding-top: 30px;
	}	
	#first ul li:last-child{
		border-right:1px solid #cccccc;
	}
	#first ul li:hover{
		background: #F3F3F3;
	}
/******************/

	#sec1{
		width:1300px;
		margin:auto;
		margin-top:100px;
		margin-bottom:200px;
	}
	#sec1 table{
		width: 1200px;
		margin-top: 20px;
	}
	#sec1 table tr:first-child td{
		border-bottom: 2px solid #887159;
	}
	#sec1 table tr th{
		border-bottom: 1px solid #887159;
	}
	#sec1 table tr:last-child td{
		border-bottom: 1px solid #887159;
	}
	#sec1 table th{
		font-size: 18px;
		font-weight: 700;
		color: #887159;
	}
	#sec table tr td{
		padding: 10px;
	}
	#sec1 h2{
		color: #887159;
		font-family: fantasy;
		letter-spacing: 2px;
		text-decoration: underline;
	}
</style>
</head>

<body>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> ADMIN </div>
    </div>
    
<!-- first -->    
<div id="first">
	<div id="first_1"> 
		<div class="txt2">
			<span>
				<a href="../info/gongji_list">공지 관리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../info/faq_list">FAQ관리</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../admin/memberlist">회원 목록 확인</a></span>
		</div> 
	</div>
	<ul>
		<li><a href="../room/room_list">객실 관리</a></li><li><a href="../dining/dining_list">레스토랑 관리</a></li><li><a href="../eshop/pro_adlist">E-SHOP 상품 관리</a></li><li><a href="../wedding/wed_list">웨딩홀 관리</a></li>
	</ul>
</div>
<!-- first/ -->
	
	
<section id="sec1">
<div>
<!-- 내용 작성 -->
	<h1> 최근 예약/구매 내역 5개</h1>
	<br>
	
	<table id="room">
		<tr>
			<td colspan="14"><h2><a href="../admin/roomlist">ROOM</a></h2></td>
		</tr>
		<tr>
			<th height="50px"> 예약자 </th>
			<th> 예약번호 </th>
			<th> 체크인 </th>
			<th> 체크아웃 </th>
			<th> 객실 </th>
			<th> 예약일 </th>
			<th> 총 결제금액</th>
			<th> 예약상태 </th>		
		</tr>
	  <c:forEach items="${rlist}" var="rvo">
	    <tr>
	  		<td> ${rvo.bkname} </td>
	  		<td> ${rvo.bid} </td>
	  		<td> ${rvo.checkin} </td>
	  		<td> ${rvo.checkout} </td>
	  		<td> ${rvo.rname} </td>
	  		<td> ${rvo.bkdate} </td>
	  		<td> ${rvo.btotal} </td>	  		
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
	  	</tr>
	  </c:forEach>
	</table>
	<br>
	
	<table id="dine">
		<tr>
			<td colspan="16"><h2><a href="../admin/dinelist">DINING</a></h2></td>
		</tr>
		<tr>

			<th height="50px"> 예약자 </th>
			<th> 예약번호 </th>
			<th> 식사날짜 </th>
			<th> 식사유형 </th>
			<th> 식사시간 </th>
			<th> 예약일 </th>
			<th> 총 금액 </th>
			<th> 예약상태 </th>
		</tr>
 	  <c:forEach items="${dlist}" var="dvo">
	  	<tr>
	  		<td> ${dvo.bkname} </td>
	  		<td> ${dvo.bid} </td>
	  		<td> ${dvo.dr_date} </td>
	  		<td> ${dvo.dine_type} </td>
	  		<td> ${dvo.dr_time} </td>
	  		<td> ${dvo.writeday} </td>
	  		<td> ${dvo.dr_total} </td>
	  		<c:if test="${dvo.dr_state == 0}">
	  			<c:set var="state" value="예약"/>
		  	</c:if>
		  	<c:if test="${dvo.dr_state == 1}">
		  		<c:set var="state" value="사용완료"/>
		  	</c:if>
		  	<c:if test="${dvo.dr_state == 2}">
		  		<c:set var="state" value="취소됌"/>
		  	</c:if>
		  		<td> ${state} </td>
	  	</tr>
	  </c:forEach> 
	</table>
	<br>
	
	<table id="shop">
		<tr>
			<td colspan="11"><h2><a href="../admin/gumaelist">ESHOP</a></h2></td>
		</tr>
		<tr>
			<th height="50px"> 구매자 </th>
			<th> 주문번호 </th>
			<th> 상품명 </th>
			<th> 상품코드 </th>
			<th> 구매일 </th>
			<th> 총결제금액 </th>
			<th> 상태 </th>
		</tr>
	  <c:forEach items="${glist}" var="gvo">
		<tr>
			<td> ${gvo.pname} </td>
			<td> ${gvo.jumuncode} </td>
			<td> 상품명 </td>
			<td> ${gvo.pcode} </td>
			<td> ${gvo.buyday} </td>
			<td> ${gvo.total_price} </td>
			<c:if test="${gvo.state == 0}">
	  			<c:set var="state" value="결제완료"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 1}">
		  		<c:set var="state" value="취소요청"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 2}">
		  		<c:set var="state" value="취소완료"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 3}">
		  		<c:set var="state" value="배송완료"/>
		  	</c:if>
	  		<td> ${state} </td>	
		</tr>
	  </c:forEach>
	</table>
	<br>
	
	<table id="wedding">
		<tr>
			<td colspan="12"><h2><a href="../admin/wedlist">WEDDING</a></h2></td>
		</tr>
		<tr>
			<th height="50px"> 예약자 </th>
			<th> 예약번호 </th>
			<th> 상담일 </th>
			<th> 웨딩홀 </th>
			<th> 예식희망일 </th>
			<th> 예약일 </th>
			<th> 예약상태 </th>
		</tr>
	  <c:forEach items="${wlist}" var="wvo">
	  	<tr>
	  		<td> ${wvo.wresv_name} </td>
	  		<td> ${wvo.wresv_code} </td>
	  		<td> ${wvo.wresv_cday} </td>
	  		<td> ${wvo.wresv_hall} </td>
	  		<td> ${wvo.wresv_wday} </td>
	  		<td> ${wvo.wresv_day} </td>
	  		<c:if test="${wvo.state == 0}">
	  			<c:set var="state" value="예약완료"/>
		  	</c:if>
		  	<c:if test="${wvo.state == 1}">
		  		<c:set var="state" value="취소됌"/>
		  	</c:if>
		  	<c:if test="${wvo.state == 2}">
		  		<c:set var="state" value="사용완료"/>
		  	</c:if>
	  		<td> ${state} </td>				
	  	</tr>
	  </c:forEach>
	</table>
</div>
</section>
</body>














