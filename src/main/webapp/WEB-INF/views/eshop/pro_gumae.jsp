<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_gumae {
		width : 1000px;
		height : 1000px;
		margin : auto;
	}
</style>
<script>
	
</script>
</head>
<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
		<div class="bradcam_area basic">
	        <h3> 주문/결제 </h3>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
    
	<!-- ================ 주문/결제 Area Start ================= -->
	<section id="pro_gumae">
	<form method="post" action="pro_gumae_ok">
	<input type="hidden" name="gchk" value="${gchk}">
		<!-- 주문상품정보 start -->
		<table width="1000" align="center" border="1">
		<caption> 주문상품 확인 </caption>
			<tr>
				<th colspan="2">상품정보</th>
				<th>상품금액</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>배송비</th>
			</tr>
			<c:forEach var="pvo" items="${plist}" varStatus="gumae">
			<input type="hidden" class="pcode" value="${cvo.pcode}">
			<tr>
				<!-- 상품정보(이미지, 상품명) -->
				<td colspan="2">
					<img src="../img/eshop/${pvo.img}" width="80" height="80" id="main_fimg">
					${pvo.title}
				</td>
				<!-- 상품금액 -->
				<td>
					<c:if test="${pvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",###"/> </span>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price}" pattern=",###"/> </span>
					</c:if>
				</td>	
				<!-- 수량 -->
				<td> ${pvo.su} </td>
				<!-- 주문금액 -->
				<td>
					<c:if test="${pvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) * pvo.su}" pattern=",###"/> </span>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price * pvo.su}" pattern=",###"/> </span>
					</c:if>
				</td>
				<!-- 배송비 -->
				<td>
					<c:if test="${pvo.baefee == 0}">
						무료
					</c:if>
					<c:if test="${pvo.baefee != 0}">
						KRW <fmt:formatNumber value="${pvo.baefee}"/>
					</c:if>
				</td>
			</tr>
			</c:forEach>
		</table>
		<!-- 주문상품정보 end -->
		
		<!-- 주문서작성 start -->
		
		<!-- 주문서작성 end -->
	</form>
	</section>
    <!-- ================ 주문/결제 Area End ================= -->

</body>