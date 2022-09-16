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
	}
	#pro_cnt #a1 #right #wish img {
		cursor : pointer;
	}
	#pro_cnt #a1 #right #title {
		height : 60px;
		font-size : 30px;
		font-weight : bold;
		letter-spacing : -2px;
		word-spacing : 2px;
		border-bottom : 2px solid darkgray;
	}
	#pro_cnt #a1 #right #price {
		border-bottom : 1px solid lightgray;
	}
	#pro_cnt #a1 #right #price #p_title {
		display : inline-block;
		margin-top : 50px;
		width : 120px;
		height : 60px;
		color : black;
		padding-left : 20px;
	}
	#pro_cnt #a1 #right #price .price_text1 {
		font-family : TimesNewRoman;
		font-size : 25px;
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
		font-size : 20px;
	}
	#pro_cnt #pro_info img {
		margin-bottom : 100px;
		border : 1px solid lightgray;
		text-align : center;
		padding : 50px;
		margin-top : 50px;
	}
	#pro_cnt #a1 #right #su {
		border-bottom : 1px solid lightgray;
	}
	#pro_cnt #a1 #right #su #s_title {
		display : inline-block;
		margin-top : 50px;
		width : 120px;
		height : 60px;
		color : black;
		padding-left : 20px;
	}
	#pro_cnt #a1 #right #su #spinner {
		border : 1px solid lightgray;
		outline : none;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
	}
	#pro_cnt #a1 #right #total #t_title {
		display : inline-block;
		margin-top : 50px;
		width : 250px;
		height : 80px;
		color : black;
		padding-left : 20px;
	}
	#pro_cnt #a1 #right #total .price_text1 {
		font-family : TimesNewRoman;
		font-size : 30px;
		color : black;
		margin-left : 5px;
		padding-top : 5px;
	}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	/* 수량을 변경하면 [총 상품금액]도 변하게 하기 */
	/*$(function(){
		$("#spinner").spinner({
			min : 1,
			max : 100,
			spin : function(e, ui){
				let total=parseInt(${pvo.price} * ui.value);
				if(${pvo.halin != 0})
					total=parseInt(${pvo.price - (pvo.price * (pvo.halin / 100) ) } * ui.value);

				total=new Intl.NumberFormat().format(total);
				document.getElementById("total_price").innerText=total;
			}
		});
	});*/
	
	/* 수량을 변경하면 [총 상품금액]도 변하게 하기 */
	function change_total(su){
		let total=parseInt(${pvo.price} * su);
		if(${pvo.halin != 0})
			total=parseInt(${pvo.price - (pvo.price * (pvo.halin / 100) ) } * su);

		total=new Intl.NumberFormat().format(total);
		document.getElementById("total_price").innerText=total;
	}

	/* 위시리스트에 추가하고 삭제하기 */
	function wish_add(pcode){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			if(chk.responseText == "0") {
				//alert("위시리스트에 추가됐습니다.");
				document.getElementById("wishimg").src="../img/eshop/wish_on.png";
				document.getElementById("wishimg").setAttribute("onclick", "wish_del('"+pcode+"')");
			}
		}
		chk.open("get", "wish_add?pcode="+pcode);
		chk.send();
	}
	function wish_del(pcode){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			if(chk.responseText == "0") {
				//alert("위시리스트에서 삭제됐습니다.");
				document.getElementById("wishimg").src="../img/eshop/wish_off.png";
				document.getElementById("wishimg").setAttribute("onclick", "wish_add('"+pcode+"')");
			}
		}
		chk.open("get", "wish_del?pcode="+pcode);
		chk.send();
	}
	
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	<c:if test="${pvo.subpcode == 'p0101'}">
		<div class="bradcam_area eshop2">
	        <h3 onclick="location='pro_list?pcode=p0101'" style="cursor:pointer;"> B E D D I N G </h3>
	    </div>
	</c:if>
	<c:if test="${pvo.subpcode == 'p0102'}">
	    <div class="bradcam_area eshop2">
	        <h3 onclick="location='pro_list?pcode=p0102'" style="cursor:pointer;"> L I F E S T Y L E </h3>
	    </div>
	</c:if>
	<c:if test="${pvo.subpcode == 'p0201'}">
	    <div class="bradcam_area eshop3">
	        <h3 onclick="location='pro_list?pcode=p0201'" style="cursor:pointer;"> R E S T A U R A N T </h3>
	    </div>
    </c:if>
    <c:if test="${pvo.subpcode == 'p0202'}">
	    <div class="bradcam_area eshop3">
	        <h3 onclick="location='pro_list?pcode=p0202'" style="cursor:pointer;"> H O T E L </h3>
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
				<div id="wish">	<!-- 위시리스트 -->
					<c:if test="${(userid == null) && (wishcnt == 0)}">
						<img src="../img/eshop/wish_off.png" width="20" onclick="alert('로그인하셔야 본 서비스를 이용하실 수 있습니다.')">
					</c:if>
					<c:if test="${(userid !=null) && (wishcnt == 0)}">
						<img src="../img/eshop/wish_off.png" width="20" onclick="wish_add('${pvo.pcode}')" id="wishimg">
					</c:if>
					<c:if test="${(userid != null) && (wishcnt == 1)}">
						<img src="../img/eshop/wish_on.png" width="20" onclick="wish_del('${pvo.pcode}')" id="wishimg">
					</c:if>
				</div>
				<div id="title"> ${pvo.title} </div>	<!-- 상품명 -->
				<div id="price">	<!-- 가격 -->
					<b id="p_title"> 판매가 </b>
					<c:if test="${pvo.halin != 0}">	<!-- 할인하는 경우 -->
						KRW <b class="price_text1"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",000" /> </b>
						<s id="price_text2"><fmt:formatNumber value="${pvo.price}"/></s>
						<b id="halin_text1"> ${pvo.halin}% </b>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <b class="price_text1"> <fmt:formatNumber value="${pvo.price}"/> </b>
					</c:if>
				</div>
				<div id="su">	<!-- 수량 -->
					<b id="s_title"> 수량 </b>
					<input type="number" name="su" min="1" max="${pvo.su}" value="1" id="spinner" onchange="change_total(this.value)">
				</div>
				<div id="total">
					<b id="t_title"> 총 상품금액 </b>
					<c:if test="${pvo.halin != 0}">	<!-- 할인하는 경우 -->
						KRW <b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",000" /> </b>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price}"/> </b>
					</c:if>
				</div>
				<!-- 회원/비회원_area_start -->
				<div id="etc">	<!-- 장바구니, 바로구매 -->
					<!-- 장바구니 -->
					<span class="btn" onclick="cart_add()"> 장바구니 </span>
					
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