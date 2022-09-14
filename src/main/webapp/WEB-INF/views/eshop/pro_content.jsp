<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_cnt {
		width : 1100px;
		margin : auto;
	}
	#pro_cnt #a1 #left {
		float : left;
		width : 520px;
		height : 700px;
		border : 1px solid red;
	}
	#pro_cnt #a1 #right {
		float : right;
		width : 520px;
		height : 700px;
		border : 1px solid red;
		padding : 30px;
	}
	#pro_cnt #a1 #left #fimg1 {
		margin-top : 50px;
	}
	#pro_cnt #a1 #left #fimgs {
		margin-top : 30px;
		text-align : center;
	}
	#pro_cnt #a1 #left #fimgs img {
		border : 1px solid #887159;
	}
	#pro_cnt #a1 #right #wish {
		width : 450px;
		height : 30px;
		padding-left : 420px;
		cursor : pointer;
	}
	#pro_cnt #a1 #right #title {
		height : 80px;
		font-size : 40px;
		font-weight : bold;
		letter-spacing : 1px;
		border-bottom : 1px solid darkgray;
	}
	#pro_cnt #a1 #right #price {
		border-bottom : 1px solid lightgray;
	}
	#pro_cnt #a1 #right #price #p_title {
		display : inline-block;
		margin-top : 50px;
		width : 100px;
		height : 80px;
		color : black;
	}
	#pro_cnt #a1 #right #price #price_text1 {
		font-family : TimesNewRoman;
		font-size : 27px;
		color : black;
		margin-left : 5px;
		padding-top : 5px;
	}
	#pro_cnt #a1 #right #price #price_text2 {
		font-family : TimesNewRoman;
		font-size : 13px;
		font-weight : bold;
		letter-spacing : -1px;
		color : gray;
		margin-right : 10px;
	}
	#pro_cnt #a1 #right #price #halin_text1 {
		font-family : TimesNewRoman;
		font-size : 22px;
	}
	#pro_cnt #pro_info {
		margin-bottom : 100px;
		border : 1px solid lightgray;
		text-align : center;
		padding : 50px;
	}
	#pro_cnt #a1 #right #su {
		border-bottom : 1px solid lightgray;
	}
	#pro_cnt #a1 #right #su #s_title {
		display : inline-block;
		margin-top : 50px;
		width : 100px;
		height : 80px;
		color : black;
	}
	#pro_cnt #a1 #right #su #spinner {
		outline : none;
	}
	#pro_cnt #a1 #right #total #t_title {
		display : inline-block;
		margin-top : 50px;
		width : 250px;
		height : 80px;
		color : black;
	}
	#pro_cnt #a1 #right #total #price_text1 {
		font-family : TimesNewRoman;
		font-size : 27px;
		color : black;
		margin-left : 5px;
		padding-top : 5px;
	}
</style>
<script>

</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	<c:if test="${pvo.subpcode == 'p0101'}">
		<div class="bradcam_area eshop2">
	        <h3> B E D D I N G </h3>
	    </div>
	</c:if>
	<c:if test="${pvo.subpcode == 'p0102'}">
	    <div class="bradcam_area eshop2">
	        <h3> L I F E S T Y L E </h3>
	    </div>
	</c:if>
	<c:if test="${pvo.subpcode == 'p0201'}">
	    <div class="bradcam_area eshop3">
	        <h3> R E S T A U R A N T </h3>
	    </div>
    </c:if>
    <c:if test="${pvo.subpcode == 'p0202'}">
	    <div class="bradcam_area eshop3">
	        <h3> H O T E L </h3>
	    </div>
    </c:if>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 상품 상세 Area Start ================= -->
    <div id="pro_cnt">
    <form name="pro_cnt" method="post" action="pro_gumae">
    <input type="hidden" name="pcode" value="${pvo.pcode},">
    	<article id="a1">
    		<!-- 메인이미지_area_start -->
			<div id="left">
				<div id="fimg1">
					<img src="../img/eshop/${pvo.img}" width="500" height="450">
				</div>
				<div id="fimgs">
				<c:forEach var="imgs" items="${pvo.imgs}">
					<img src="../img/eshop/${imgs}" width="80" height="80">
				</c:forEach>
				</div>
			</div>
			<!-- 메인이미지_area_end -->
			<!-- 상품정보_area_start -->
			<div id="right">
				<div id="wish">
					<img src="../img/eshop/wish_off.png" width="20">
				</div>
				<div id="title"> ${pvo.title} </div>	<!-- 상품명 -->
				<div id="price">	<!-- 가격 -->
					<b id="p_title"> 판매가 </b>
					<c:if test="${pvo.halin != 0}">	<!-- 할인율이 0이 아닌 경우 -->
						KRW <b id="price_text1"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",000" /> </b>
						<s id="price_text2"><fmt:formatNumber value="${pvo.price}"/></s>
						<b id="halin_text1"> ${pvo.halin}% </b>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <b id="price_text1"> <fmt:formatNumber value="${pvo.price}"/> </b>
					</c:if>
				</div>
				<div id="su">	<!-- 수량 -->
					<b id="s_title"> 수량선택 </b>
					<input type="number" name="su" min="1" max="${pvo.su}" value="1" id="spinner">
				</div>
				<div id="total">
					<b id="t_title"> 총 상품금액 </b>
					KRW <b id="price_text1"> <fmt:formatNumber value="${pvo.price}"/> </b>
						<input type="hidden" id="p_price">
				</div>
				<!-- 회원/비회원_area_start -->
				<div id="etc">	<!-- 위시리스트, 장바구니, 바로구매 -->
					<!-- 장바구니 -->
					<c:if test="${userid != null}">
						<span class="btn" onclick="cart_add()"> 장바구니 </span>
					</c:if>
					<c:if test="${userid == null}">
						<span class="btn" onclick="alert('로그인하셔야 본 서비스를 이용하실 수 있습니다.')"> 장바구니 </span>
					</c:if>
					
					<!-- 바로구매 -->
					<span class="btn" onclick="pro_submit()"> 바로구매 </span>
				</div>
				<!-- 회원/비회원_area_start -->
			</div>
			<div id="pro_info">
					<img src="../img/eshop/${pvo.simg}" width="100%">
			</div>
			<!-- 상품정보_area_end -->
		</article>
	</form>
	
		<article id="a2">
		
		</article>
	
	</div>
    <!-- ================ 상품 상세 Area End ================= -->

</body>