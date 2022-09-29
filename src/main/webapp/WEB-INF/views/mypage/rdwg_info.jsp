<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#rdwginfo {
		width : 1100px;
		margin : auto;
		margin-bottom : 100px;
	}
	#rdwginfo #tbox {
		width : 1000px;
		height : 30px;
		margin : 70px auto 30px auto;
		font-size : 15px;
		font-weight : bold;
	}
	#rdwginfo #name {
		font-weight : 600;
		font-size : 20px;
	}
	#rdwginfo table {
		width : 1000px;
		margin : auto;
		margin-bottom : 60px;
		border-bottom : 2px solid #887159;
	}
	#rdwginfo table td {
		padding : 15px;
	}
	#rdwginfo table tr:first-child{
		font-size : 25px;
		font-weight : 600;
		border-bottom : 2px solid #887159;
	}	
	#rdwginfo table td:first-child{
		width : 250px;
	}
	#rdwginfo #sbox {
		margin : auto;
		text-align : center;
	}
	#rdwginfo #btn1 {
		display : inline-block;
		width : 150px;
		height : 35px;
		padding-top : 5px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;	
	}
	#rdwginfo #btn2 {
		display : inline-block;
		width : 150px;
		height : 35px;
		padding-top : 5px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
	}
</style>
<script>
	function bjcancel(bjcode){
		location="../mypage/bjcancel?bjcode="+bjcode;
	}
</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">
        <div id="h3" style="font-size:70px;">
        	<c:if test="${gubun == 'r'}"> 객실 예약내역 </c:if>
        	<c:if test="${gubun == 'd'}"> 다이닝 예약내역 </c:if>
        	<c:if test="${gubun == 'w'}"> 웨딩 예약내역 </c:if>
        	<c:if test="${gubun == 'e'}"> 주문내역 </c:if>
        </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 예약 및 주문 내역 Area Start ================= -->
	<div id="rdwginfo">
	
	<!-- 객실 예약 내역_area_start -->
	<c:if test="${gubun == 'r'}">
    	<!-- 예약 정보 -->
		<div id="tbox">
			<div style="float:left;"> ${rvo.bkdate} 예약 </div>
			<div style="float:right;"> ${rvo.bid} 	</div>	
		</div>
	
		<!-- 예약 상세 정보 -->
		<table>
			<tr>
				<td colspan="2">
					<c:choose>
						<c:when test="${rvo.bstate == 1}"> 예약완료 </c:when>
						<c:when test="${rvo.bstate == 2}"> 사용완료 </c:when>
						<c:when test="${rvo.bstate == 3}"> 취소완료 </c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td id="name"> ${rvo.rname} </td>
				</td>
			</tr>
			<tr>
				<td> 체크인 </td>
				<td> ${rvo.checkin} </td>
			</tr>
			<tr>
				<td> 체크아웃 </td>
				<td> ${rvo.checkout} </td>
			</tr>
			<tr>
				<td> 예약인원 </td>
				<td> ${rvo.binwon}인 </td>
			</tr>
			<tr>
				<td> 추가침대 </td>
				<td> ${rvo.bextbed} </td>
			</tr>
			<tr>
				<td> 조식 </td>
				<td> ${rvo.bmeal} </td>
			</tr>
			<tr>
				<td> 요청사항 </td>
				<td> ${rvo.spreq} </td>
			</tr>
		</table>
	
		<!-- 예약자 정보 -->
		<table>
			<tr>
				<td colspan="2"> 예약자 정보 </td>
			</tr>
			<tr>
				<td> 예약자 </td>
				<td> ${rvo.bkname} </td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> ${rvo.bkphone} </td>
			</tr>
		</table>
	
		<!-- 결제 정보 -->
		<table>
			<tr>
				<td colspan="2"> 결제 정보 </td>
			</tr>
			<tr>
				<td> 결제수단 </td>
				<td> 간편결제 </td>
			</tr>
			<tr>
				<td> 결제금액 </td>
				<td> <fmt:formatNumber value="${rvo.btotal}" pattern=",###"/>원 </td>
			</tr>
		</table>
	
		<!-- 예약 상태 -->
		<div id="sbox">
			<c:if test="${rvo.bstate == 1}"> <div onclick="bjcancel('${rvo.bid}')" id="btn2"> 예약취소 </div> </c:if>
			<div onclick="location='../main/index'" id="btn1"> 메인으로 </div>
		</div>
	 	</c:if>
	<!-- 객실 예약 내역_area_end -->
    
    <!-- 다이닝 예약 내역_area_start -->
 	<c:if test="${gubun == 'd'}">
 		<!-- 예약 정보 -->
		<div id="tbox">
			<div style="float:left;"> ${dvo.writeday} 예약 </div>
			<div style="float:right;"> ${dvo.bid} 	</div>	
		</div>
	
		<!-- 예약 상세 정보 -->
		<table>
			<tr>
				<td colspan="2">
					<c:choose>
						<c:when test="${dvo.dr_state == 0}"> 예약완료 </c:when>
						<c:when test="${dvo.dr_state == 1}"> 사용완료 </c:when>
						<c:when test="${dvo.dr_state == 2}"> 취소완료 </c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td id="name"> ${dvo.dr_date} 방문예정 </td>
				</td>
			</tr>
			<tr>
				<td> 식사유형 </td>
				<td> ${dvo.dine_type} </td>
			</tr>
			<tr>
				<td> 식사시간 </td>
				<td> ${dvo.dr_time} </td>
			</tr>
			<tr>
				<td> 성인 </td>
				<td> ${dvo.adult}인 </td>
			</tr>
			<tr>
				<td> 어린이 </td>
				<td> ${dvo.child}인 </td>
			</tr>
			<tr>
				<td> 유아 </td>
				<td> ${dvo.baby}인 </td>
			</tr>
			<tr>
				<td> 요청사항 </td>
				<td> ${dvo.dr_extrarq} </td>
			</tr>
		</table>
	
		<!-- 예약자 정보 -->
		<table>
			<tr>
				<td colspan="2"> 예약자 정보 </td>
			</tr>
			<tr>
				<td> 예약자 </td>
				<td>
					<c:if test="${userid == null}"> guest </c:if>
					<c:if test="${userid != null}">	${userid} </c:if>
				</td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> ${dvo.p1}-${dvo.p2}-${dvo.p3} </td>
			</tr>
		</table>
	
		<!-- 결제 정보 -->
		<table>
			<tr>
				<td colspan="2"> 결제 정보 </td>
			</tr>
			<tr>
				<td> 결제수단 </td>
				<td>
					<c:if test="${dvo.sudan == 0}"> 간편결제 </c:if>
					<c:if test="${dvo.sudan == 1}">	현장결제 </c:if>
				</td>
			</tr>
			<tr>
				<td> 결제금액 </td>
				<td> <fmt:formatNumber value="${dvo.dr_total}" pattern=",###"/>원 </td>
			</tr>
		</table>
	
		<!-- 예약 상태 -->
		<div id="sbox">
			<c:if test="${dvo.dr_state == 0}"> <div onclick="bjcancel('${dvo.bid}')" id="btn2"> 예약취소 </div> </c:if>
			<div onclick="location='../main/index'" id="btn1"> 메인으로 </div>
		</div>
 	</c:if>
    <!-- 다이닝 예약 내역_area_end -->
    
    <!-- 웨딩 예약 내역_area_start -->
 	<c:if test="${gubun == 'w'}">
 	<!-- 예약 정보 -->
		<div id="tbox">
			<div style="float:left;"> ${wvo.wresv_day} 예약 </div>
			<div style="float:right;"> ${wvo.wresv_code} 	</div>	
		</div>
	
		<!-- 예약 상세 정보 -->
		<table>
			<tr>
				<td colspan="2">
					<c:choose>
						<c:when test="${wvo.state == 0}"> 예약완료 </c:when>
						<c:when test="${wvo.state == 1}"> 취소완료 </c:when>
						<c:when test="${wvo.state == 2}"> 상담완료 </c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td id="name"> ${wvo.wresv_cday} 상담예정 </td>
				</td>
			</tr>
			<tr>
				<td> 상담 시간 </td>
				<td> ${wvo.wresv_time} </td>
			</tr>
			<tr>
				<td> 희망하는 웨딩홀 </td>
				<td> ${wvo.wresv_hall} </td>
			</tr>
			<tr>
				<td> 희망하는 예식일 </td>
				<td> ${wvo.wresv_wday} </td>
			</tr>
			<tr>
				<td> 예상 참석자 </td>
				<td> ${wvo.wresv_inwon} </td>
			</tr>
			<tr>
				<td> 문의사항 </td>
				<td> ${wvo.wresv_content} </td>
			</tr>
		</table>
	
		<!-- 예약자 정보 -->
		<table>
			<tr>
				<td colspan="2"> 예약자 정보 </td>
			</tr>
			<tr>
				<td> 예약자 </td>
				<td> ${wvo.wresv_name} </td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> ${wvo.wresv_phone} </td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> ${wvo.wresv_email} </td>
			</tr>
		</table>
	
		<!-- 결제 정보 -->
		<table>
			<tr>
				<td colspan="2"> 결제 정보 </td>
			</tr>
			<tr>
				<td> 결제수단 </td>
				<td>
					<c:if test="${wvo.wresv_pay == 0}"> 카드결제 </c:if>
					<c:if test="${wvo.wresv_pay == 1}">	무통장입금 </c:if>
				</td>
			</tr>
			<tr>
				<td> 결제금액 </td>
				<td> 5,000원 </td>
			</tr>
		</table>
	
		<!-- 예약 상태 -->
		<div id="sbox">
			<c:if test="${wvo.state == 0}"> <div onclick="bjcancel('${wvo.wresv_code}')" id="btn2"> 예약취소 </div> </c:if>
			<div onclick="location='../main/index'" id="btn1"> 메인으로 </div>
		</div>
 	</c:if>
    <!-- 웨딩 예약 내역_area_end -->
    
    <!-- 이샵 주문 내역_area_start -->
 	<c:if test="${gubun == 'e'}">
 	<!-- 예약 정보 -->
		<div id="tbox">
			<div style="float:left;"> ${buyday} 구매 </div>
			<div style="float:right;"> ${gvo.jumuncode} </div>	
		</div>
	
		<!-- 예약 상세 정보 -->
		<table>
			<tr>
				<td colspan="3">
					<c:choose>
						<c:when test="${gvo.state == 0}"> 결제완료 </c:when>
						<c:when test="${gvo.state == 1}"> 취소요청중 </c:when>
						<c:when test="${gvo.state == 2}"> 취소완료 </c:when>
						<c:when test="${gvo.state == 3}">
							<c:if test="${gvo.bname != null}"> 배송완료 </c:if>
							<c:if test="${gvo.bname == null}"> 사용완료 </c:if>
						</c:when>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td id="name" colspan="3"> 주문상품 </td>
				</td>
			</tr>
			<c:forEach var="gvo" items="${glist}">
			<tr>
				<td width="300" style="padding-left:50px;">
					<img src="../img/eshop/${gvo.pimg}" width="50" height="50">
					${gvo.title}
				</td>
				<td width="100"> ${gvo.total_su}개 </td>
				<td> <fmt:formatNumber value="${gvo.total_price}" pattern=",###"/>원 </td>
			</tr>
			</c:forEach>
		</table>
	
		<!-- 구매자 정보 -->
		<table>
			<tr>
				<td colspan="3"> 구매자 정보 </td>
			</tr>
			<tr>
				<td> 구매자 </td>
				<td> ${gvo.pname} </td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> ${gvo.pphone} </td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> ${gvo.pemail} </td>
			</tr>
		</table>
		
		<!-- 배송지 정보 -->
		<c:if test="${gvo.bname != null}">
		<table>
			<tr>
				<td colspan="3"> 배송지 정보 </td>
			</tr>
			<tr>
				<td> 받는사람 </td>
				<td> ${gvo.bname} </td>
			</tr>
			<tr>
				<td> 연락처 </td>
				<td> ${gvo.bphone} </td>
			</tr>
			<tr>
				<td> 주소 </td>
				<td> ${gvo.bjuso} ${gvo.bjuso_etc} </td>
			</tr>
		</table>
		</c:if>
	
		<!-- 결제 정보 -->
		<table>
			<tr>
				<td colspan="2"> 결제 정보 </td>
			</tr>
			<tr>
				<td> 결제수단 </td>
				<td>
					<c:if test="${gvo.pay_sudan == 0}"> 간편결제 </c:if>
				</td>
			</tr>
			<tr>
				<td> 결제금액 </td>
				<td> <fmt:formatNumber value="${gvo.total_price}" pattern=",###"/>원 </td>
			</tr>
		</table>
	
		<!-- 예약 상태 -->
		<div id="sbox">
			<c:if test="${gvo.state == 0}"> <div onclick="bjcancel('${gvo.jumuncode}')" id="btn2"> 주문취소 </div> </c:if>
			<div onclick="location='../main/index'" id="btn1"> 메인으로 </div>
		</div>
 	</c:if>
    <!-- 이샵 주문 내역_area_end -->
    
	</div>
    <!-- ================ 예약 및 주문 내역 Area End ================= -->

</body>