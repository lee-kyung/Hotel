<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_list {
		width : 1000px;
		height : 2500px;
		margin : auto;
	}
	#pro_list #eshop_img {
		margin-top : 50px;
		width : 350px;
		height : 350px;
		padding-top : 10px;	
	}
	#pro_list table td {
		padding-right : 30px;
	}
</style>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <c:if test="${pdae == 'p01'}">
	    <div class="bradcam_area eshop2">
	        <h3> P R O D U C T </h3>
	    </div>
    </c:if>
    <c:if test="${pdae == 'p02'}">
	    <div class="bradcam_area eshop3">
	        <h3> V O U C H E R </h3>
	    </div>
    </c:if>    
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 상품목록 Area Start ================= -->
	<section id="pro_list">
		<c:if test="${pdae == 'p01'}">
			<div>
				고급베딩
				라이프스타일
			</div>
		</c:if>
		<c:if test="${pdae == 'p02'}">
			<div>
				레스토랑이용권
				호텔상품권
			</div>
		</c:if>
		<table align="center">	 <!-- 상품을 10개씩 출력 -->
		<c:set var="n" value="3"/>	<!-- 한 행에 출력되는 열(상품)의 개수 -->
		<c:set var="i" value="0"/>	<!-- 상품 3개마다 행을 바꾸기 위한 변수 -->	
			<tr>
			<c:forEach var="pvo" items="${list}">
				<td onclick="pro_content('pvo.pcode')">
					<div class="offers_area padding_top" id="eshop_img"><div class="single_offers"><div class="about_thumb">
						<img src="../img/eshop/${pvo.img1}" height="300" width="300" style="cursor:pointer">	<!-- 상품이미지 -->
					</div></div></div>
					<div id="title"> <h3> ${pvo.title} </h3> </div>	<!-- 상품명 -->
					<hr style="width:350px;">
					<div id="price">		<!-- 판매가 / 할인가 원가 할인율-->
						<c:if test="${pvo.halin == 0}">
							KRW <b style="font-family:TimesNewRoman;font-size:25px;color:black;margin-left:5px;"> <fmt:formatNumber value="${pvo.price}" pattern="#,###"/> </b>
						</c:if>
						<c:if test="${pvo.halin != 0}">
							KRW <b style="font-family:TimesNewRoman;font-size:25px;color:black;margin-left:5px;"> <fmt:formatNumber value="${(pvo.price) - (pvo.price * (pvo.halin / 100) )}" pattern="#,###"/> </b>
							<s style="font-family:TimesNewRoman;color:gray;margin-right:5px;"><fmt:formatNumber value="${pvo.price}" pattern="#,###"/></s>
							<b style="font-family:TimesNewRoman;font-size:20px;"> ${pvo.halin}% </b>
						</c:if>
					</div>
				</td>
				<c:set var="i" value="${i+1}"/>
				<c:if test="${i%n == 0}">
					</tr>
					<tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
	</section>
    <!-- ================ 상품목록 Area End ================= -->

</body>