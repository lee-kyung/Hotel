<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#rdwglist {
		width : 1100px;
		margin : auto;
	}
	#rdwglist table {
		width : 1000px;
		margin : auto;
		text-align : center;
	}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 비회원 예약/주문 내역 </h3>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 예약 및 주문 내역 Area Start ================= -->
	<div id="rdwglist">
	    <!-- 객실 예약내역_area_start -->
	    <c:if test="${gubun == 'r'}">
	    
	    <!-- 예약 정보 -->
	    <div>
	    	<h3> 예약 정보 </h3>
	    	<div> 체크인 ${rvo.checkin} </div>
	    	<div>
	    		<fmt:parseNumber var="in" value="${rvo.checkin}" integerOnly="true"/>
	    		<fmt:parseNumber var="out" value="${rvo.checkout}" integerOnly="true"/>
	    		${days}박
	    	</div>
	    	<div> 체크아웃 ${rvo.checkout} </div>
	    </div>
	    
	    <!-- 객실 정보 -->
	    <div>
	    	<h3> 객실 정보</h3>
	    	<div> 객실명 ${rvo.rname} </div>
	    	<div> 예약인원 ${rvo.binwon} </div>
	    	<div> 조식 ${rvo.bmeal} </div>
	    	<div> 추가침대 ${rvo.bextbed} </div>
	    	<div> 특별요청사항 ${rvo.spreq} </div>
	    </div>
	    
	    <!-- 예약자 정보 -->
	    <div>
	    	<h3> 예약자 정보</h3>
	    	<div> 예약자 ${rvo.bkname} </div>
	    	<div> 연락처 ${rvo.bkphone} </div>
	    	<div> 총 결제금액 ${rvo.btotal} </div>
	    	<div> 예약한 날짜 ${rvo.bkdate} </div>
	    </div>
	
		<!-- 예약 상태 -->
		<div>
		<c:choose>
			<c:when test="${rvo.bstate == 1}"> <div onclick="cancel()"> 예약취소 </div> </c:when>
			<c:when test="${rvo.bstate == 2}"> <div> 사용완료 </div> </c:when>
			<c:when test="${rvo.bstate == 3}"> <div> 취소완료 </div> </c:when>
		</c:choose>
			<div onclick="location='../main/index'"> 메인으로 </div>
		</div>
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