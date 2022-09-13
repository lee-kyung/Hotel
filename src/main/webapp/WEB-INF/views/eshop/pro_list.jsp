<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${list.size() / 3}"/>
	<c:if test="${size <= 1}">
		<c:set var="height" value="900"/>
	</c:if>
	<c:if test="${size > 2}">
		<c:set var="height" value="${ ((size-1) * 500) + 900 }"/>
	</c:if>
<style>
	#pro_list {
		width : 1100px;
		height : ${height}px;
		margin : auto;
	}
	#pro_list #eshop_img {
		margin-top : 30px;
		width : 350px;
		height : 350px;
		padding-top : 10px;
	}
	#pro_list table td {
		padding-right : 20px;
	}
	#pro_list #cate1 {
		margin : auto;
		text-align : center;
		margin-top : 50px;
		font-size : 20px;
		width : 550px;
		height : 60px;
	}
	#pro_list #cate1 #cate2 {
		display : inline-block;
		float : left;
		width : 270px;
		height : 50px;
		padding-top : 10px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
	}
	#pro_list #cate1 #cate3 {
		display : inline-block;
		float : right;
		width : 270px;
		height : 50px;
		padding-top : 10px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
	}
	#pro_list #select1 {
		display : inline-block;
		width : 120px;
		height : 50px;
	}
	#pro_list #select2 {
		display : inline-block;
		width : 100px;
		height : 50px;
		float : right;
	}
</style>
<script>
	function page_sel(psel){
		location="pro_list?pcode=${pcode}&osel=${osel}&psel="+psel;	// 정렬후 psel변경해도 정렬순 유지시키기
	}
	window.onload=function(){	/* 사용자가 선택한 페이지목록수를 브라우저에 나타내기 */
		document.getElementById("psel").value="${psel}";
	}
	
	function order_sel(osel){
		location="pro_list?pcode=${pcode}&psel=${psel}&osel="+osel;	// 페이지목록수 변경후 osel변경해도 페이지목록개수 유지시키기
	}
	window.onload=function(){	/* 사용자가 선택한 정렬순을 브라우저에 나타내기 */
		document.getElementById("osel").value="${osel}";
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <c:if test="${(pcode == 'p01') || (pcode == 'p0101') || (pcode == 'p0102')}">
	    <div class="bradcam_area eshop2">
	        <h3> P R O D U C T </h3>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p02') || (pcode == 'p0201') || (pcode == 'p0202')}">
	    <div class="bradcam_area eshop3">
	        <h3> V O U C H E R </h3>
	    </div>
    </c:if>    
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 상품목록 Area Start ================= -->
	<section id="pro_list">
		<c:if test="${(pcode == 'p01') || (pcode == 'p0101') || (pcode == 'p0102')}">
			<div id="cate1">
				<span id="cate2" onclick="location='pro_list?pcode=p0101'"> 고급베딩 </span>
				<span id="cate3" onclick="location='pro_list?pcode=p0102'"> 라이프스타일 </span>
			</div>
		</c:if>
		<c:if test="${(pcode == 'p02') || (pcode == 'p0201') || (pcode == 'p0202')}">
			<div id="cate1">
				<span id="cate2" onclick="location='pro_list?pcode=p0201'"> 레스토랑이용권 </span>
				<span id="cate3" onclick="location='pro_list?pcode=p0202'"> 호텔상품권 </span>
			</div>
		</c:if>
		<span id="select1">
			<select onchange="order_sel(this.value)" id="osel">
				<option value="id asc"> 등록순 </option>
				<option value="id desc"> 최신상품순 </option>
				<option value="halin desc"> 할인율순 </option>
				<option value="price asc"> 낮은가격순 </option>
				<option value="price desc"> 높은가격순 </option>
			</select>
		</span>
		<span id="select2">
			<select onchange="page_sel(this.value)" id="psel">
				<option value="9"> 9개씩 </option>
				<option value="15"> 15개씩 </option>
				<option value="30"> 30개씩 </option>
				<option value="45"> 45개씩 </option>
				<option value="60"> 60개씩 </option>
			</select>
		</span>
		<table align="center">	 <!-- 상품을 10개씩 출력 -->
		<c:set var="n" value="3"/>	<!-- 한 행에 출력되는 열(상품)의 개수 -->
		<c:set var="i" value="0"/>	<!-- 상품 3개마다 행을 바꾸기 위한 변수 -->	
			<tr>
			<c:forEach var="pvo" items="${list}">
				<td onclick="pro_content('pvo.pcode')">
					<div class="offers_area padding_top" id="eshop_img"><div class="single_offers"><div class="about_thumb">
						<img src="../img/eshop/${pvo.img}" height="300" width="300" style="cursor:pointer">	<!-- 상품이미지 -->
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
			<tr class="link" style="background:#F6F6F6;">
				<td colspan="4" height="50" align="center">
				<!-- 그룹으로 이전 이동 -->
				<c:if test="${pstart != 1}">
					<a href="pro_list?pcode=${pcode}&page=${pstart-1}&psel=${psel}&osel=${osel}" style="text-decoration:none;"><</a><a href="pro_list?pcode=${pcode}&page=${pstart-1}&psel=${psel}&osel=${osel}">이전</a>
					<span style="color:#D5D5D5;">|</span>
				</c:if>
				<!-- 페이지 이동범위 출력 -->
				<c:forEach var="pnow" begin="${pstart}" end="${pend}">
					<c:if test="${page == pnow}">
						<a href="pro_list?pcode=${pcode}&page=${pstart-1}&psel=${psel}&osel=${osel}" id="pnow">${pnow}</a>
					</c:if>
					<c:if test="${page != pnow}">
						<a href="pro_list?pcode=${pcode}&page=${pstart-1}&psel=${psel}&osel=${osel}" id="non_pnow">${pnow}</a>
					</c:if>
				</c:forEach>
				<!-- 그룹으로 다음 이동 -->
					<span style="color:#D5D5D5;">|</span>
				<c:if test="${pend == ptotal}">
					<span>다음 ></span>
				</c:if>
				<c:if test="${pend != ptotal}">
				<span>
					<a href="pro_list?pcode=${pcode}&page=${pstart-1}&psel=${psel}&osel=${osel}">다음</a><a href="pro_list?pcode=${pcode}&page=${pstart-1}&psel=${psel}&osel=${osel}" style="text-decoration:none;">></a>
				</span>
				</c:if>
				</td>
			</tr>
		</table>
	</section>
    <!-- ================ 상품목록 Area End ================= -->

</body>