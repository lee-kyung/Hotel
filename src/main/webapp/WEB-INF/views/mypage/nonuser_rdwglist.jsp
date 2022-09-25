<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 비회원 예약/주문 내역 </h3>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 예약 및 주문 내역 Area Start ================= -->
	<div id="rdwglist">
	${rvo.bkname}
    <!-- 객실 예약내역_area_start -->
    <c:if test="${gubun == 'r'}">
	<table id="room" border="1">
		<tr>
			<td> 예약자 </td>
			<td> 체크인 </td>
			<td> 체크아웃 </td>
			<td> 객실명 </td>
			<td> 예약인원 </td>
			<td> 추가침대 </td>
			<td> 조식 </td>
			<td> 총 결제금액</td>
			<td> 특별요청사항 </td>
			<td> 예약한 날짜 </td>
			<td> 예약상태 </td>		
		</tr>
	    <tr>
	  		<td> ${rvo.bkname} </td>
	  		<td> ${rvo.checkin} </td>
	  		<td> ${rvo.checkout} </td>
	  		<td> ${rvo.rname} </td>
	  		<td> ${rvo.binwon} </td>
	  		<td> ${rvo.bextbed} </td>
	  		<td> ${rvo.bmeal} </td>
	  		<td> ${rvo.btotal} </td>
			<td> ${rvo.bkdate} </td>	  		
	  		<td> ${rvo.spreq} </td>
	  			<c:choose>
					<c:when test="${rvo.bstate == 1}"> <c:set var="rstate" value="예약"/> </c:when>
					<c:when test="${rvo.bstate == 2}"> <c:set var="rstate" value="사용완료"/> </c:when>
					<c:when test="${rvo.bstate == 3}"> <c:set var="rstate" value="취소됨"/> </c:when>
				</c:choose>
	  		<td> ${rstate} </td>
	  	<tr>
	</table>
 	</c:if>
    <!-- 객실 예약내역_area_end -->
    
    <!-- 다이닝 예약내역_area_start -->
 	<c:if test="${gubun == 'd'}">
 	<table id="dining" border="1">
		<tr>
			<td> 예약자 </td>
			<td> 연락처 </td>
			<td> 이메일 </td>
			<td> 식사날짜 </td>
			<td> 식사유형 </td>
			<td> 식사시간 </td>
			<td> 성인 </td>
			<td> 어린이 </td>
			<td> 유아 </td>
			<td> 총 금액 </td>
			<td> 요청사항 </td>
			<td> 예약한 날짜 </td>
			<td> 예약상태 </td>
		</tr>
	  	<tr>
	  		<td> ${dvo.bkname} </td>
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
	  			<c:choose>
					<c:when test="${dvo.dr_state == 0}"> <c:set var="dstate" value="예약"/> </c:when>
					<c:when test="${dvo.dr_state == 1}"> <c:set var="dstate" value="사용완료"/> </c:when>
					<c:when test="${dvo.dr_state == 2}"> <c:set var="dstate" value="취소됨"/> </c:when>
				</c:choose>
		  	<td> ${dstate} </td>
	  	</tr>
	</table>
 	</c:if>
    <!-- 다이닝 예약내역_area_end -->
    
    <!-- 웨딩 예약내역_area_start -->
 	<c:if test="${gubun == 'w'}">
 	<table id="wedding" border="1">
		<tr>
			<td> 예약자 </td>
			<td> 연락처 </td>
			<td> 상담예약일 </td>
			<td> 예식희망일 </td>
			<td> 예약시간 </td>
			<td> 웨딩홀 </td>
			<td> 인원 </td>
			<td> 예약한 날짜 </td>
			<td> 예약상태 </td>
		</tr>
	  	<tr>
	  		<td> ${wvo.wresv_name} </td>
	  		<td> ${wvo.wresv_phone} </td>
	  		<td> ${wvo.wresv_cday} </td>
	  		<td> ${wvo.wresv_wday} </td>
	  		<td> ${wvo.wresv_time} </td>
	  		<td> ${wvo.wresv_hall} </td>
	  		<td> ${wvo.wresv_inwon} </td>
			<td> ${wvo.wresv_day} </td>
	  			<c:choose>
					<c:when test="${wvo.state == 0}"> <c:set var="wstate" value="예약완료"/> </c:when>
					<c:when test="${wvo.state == 1}"> <c:set var="wstate" value="취소됨"/> </c:when>
					<c:when test="${wvo.state == 2}"> <c:set var="wstate" value="사용완료"/> </c:when>
				</c:choose>
	  		<td> ${wstate} </td>				
	  	</tr>
	</table>
 	</c:if>
    <!-- 웨딩 예약내역_area_end -->
    
    <!-- 이샵 주문내역_area_start -->
 	<c:if test="${gubun == 'e'}">
 	<table id="eshop" border="1">
		<tr>
			<td> 구매자 </td>
			<td> 연락처 </td>
			<td> 상품명 </td>
			<td> 총 결제금액 </td>
			<td> 주문할 날짜 </td>
			<td> 주문상태 </td>
		</tr>
	  <c:forEach var="gvo" items="${glist}">
		<tr>
			<td> ${gvo.pname} </td>
			<td> ${gvo.pphone} </td>
			<td> ${gvo.pname} </td>
			<td> ${gvo.total_price} </td>
			<td> ${gvo.buyday} </td>
				<c:choose>
					<c:when test="${gvo.state == 0}"> <c:set var="estate" value="결제완료"/> </c:when>
					<c:when test="${gvo.state == 1}"> <c:set var="estate" value="취소요청"/> </c:when>
					<c:when test="${gvo.state == 2}"> <c:set var="estate" value="취소완료"/> </c:when>
					<c:when test="${gvo.state == 3}"> <c:set var="estate" value="배송완료"/> </c:when>
				</c:choose>
	  		<td> ${estate} </td>	
		</tr>
	  </c:forEach>
	</table>
 	</c:if>
    <!-- 이샵 주문내역_area_end -->
    
	</div>
    <!-- ================ 예약 및 주문 내역 Area End ================= -->

</body>