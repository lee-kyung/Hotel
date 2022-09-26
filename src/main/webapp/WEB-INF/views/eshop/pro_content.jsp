<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_cnt {
		width : 1100px;
		margin : auto;
		margin-top : 50px;
	}
	#pro_cnt #a1 #left {
		float : left;
		width : 520px;
		height : 700px;
	}
	#pro_cnt #a1 #right {
		float : right;
		width : 520px;
		height : 700px;
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
		cursor : pointer;
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
		margin-top : 75px;
		width : 230px;
		height : 70px;
		color : black;
		padding-left : 20px;
	}
	#pro_cnt #a1 #right #total #won {
		float : right;
		margin-top : 80px;
		margin-right : 10px;
	}
	#pro_cnt #a1 #right #total .price_text1 {
		float : right;
		margin-top : 70px;
		margin-right : 10px;
		font-family : TimesNewRoman;
		font-size : 30px;
		color : black;
	}
	#pro_cnt #a1 #right #juk {
		display : inline-block;
		width : 450px;
		height : 30px;
		text-align : right;
		font-size : 15px;
	}
	#pro_cnt #a1 #right #baefee {
		font-weight : normal;
		font-size : 13px;
	}
	#pro_cnt #a1 #etc {
		display : inline-block;
		width : 450px;
		height : 100px;
		padding-top : 30px;
		text-align : center;
		margin-left : 10px;
	}
	#pro_cnt #a1 #etc #btn1 {
		float : left;
		width : 220px;
		height : 50px;
		padding-top : 12px;
		border : 1px solid #887159;
		color : #887159;
		font-weight : bold;
		cursor : pointer;
	}
	#pro_cnt #a1 #etc #btn2 {
		float : right;
		width : 220px;
		height : 50px;
		padding-top : 12px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		font-weight : bold;
		cursor : pointer;
	}
	#pro_cnt #pro_info img {
		margin-bottom : 150px;
		border : 1px solid lightgray;
		text-align : center;
		padding : 50px;
		margin-top : 50px;
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
	
	/* 수량을 '1~${pvo.su}' 사이값만 입력되도록 하기 */
	function su_check(su){
		if(su < 1)
			document.pro_cnt.su=1;
		else if(su > ${pvo.su})
			document.pro_cnt.su=${pvo.su};
	}

	/* pro_gumae로 넘어갈 [주문금액], [할인금액], [총결제금액]의 개당 가격 */
	let tprice="${pvo.price}";
	let thalin=parseInt("${pvo.price * (pvo.halin / 100)}");
	let tpay=parseInt("${pvo.price - (pvo.price * (pvo.halin / 100)) + pvo.baefee}");
	
	/* 수량을 변경하면 [총 상품금액]과 [적립금]도 변하게 하기 */
	function change_total_juk(su){	
		let total=Math.ceil(${pvo.price} * su);
		let juk="";
		
		if(${(pvo.halin == 0) && (pvo.baefee != 0)})
			total=Math.ceil((${pvo.price} * su) + ${pvo.baefee});
		else if(${(pvo.halin != 0) && (pvo.baefee == 0)})
			total=Math.ceil(${pvo.price - (pvo.price * (pvo.halin / 100) ) } * su);
		else if(${(pvo.halin != 0) && (pvo.baefee != 0)})
			total=Math.ceil((${pvo.price - (pvo.price * (pvo.halin / 100) ) } * su) + ${pvo.baefee});
		
		if(${(pvo.halin == 0) && (pvo.juk != 0)})
			juk=Math.ceil(${pvo.price * (pvo.juk / 100)} * su);
		else if(${(pvo.halin != 0) && (pvo.juk != 0)})
			juk=Math.ceil(${(pvo.price - (pvo.price * (pvo.halin / 100))) * (pvo.juk / 100)} * su);
		
		juk=new Intl.NumberFormat().format(juk);
		total=new Intl.NumberFormat().format(total);
		if(${pvo.juk != 0})
			document.getElementById("juk_price").innerText=juk;
		document.getElementById("total_price").innerText=total;
		
		/* pro_gumae로 넘어갈 [주문금액], [할인금액], [총결제금액]의 최종가격을 구해서 input type="hidden"에 넣기 */
		let pimsi=tprice*su;
		let himsi=thalin*su;
		
		document.getElementById("tprice").value=pimsi;
		document.getElementById("thalin").value=himsi;
		document.getElementById("tpay").value=pimsi-himsi+parseInt("${pvo.baefee}");
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
	
	/* 장바구니에 회원/비회원 구분하여 추가하기 */
	function cart_add(pcode){
		let su=document.pro_cnt.su.value;
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			let arr=chk.responseText.split(",");
			if(arr[0] == "0") {
				if(confirm("선택하신 상품이 장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?"))
					location="../eshop/cart?p="+arr[1];
			}
			else {
				alert("내부 오류 발생");
			}
		}
		chk.open("get", "cart_add?pcode="+pcode+"&su="+su);
		chk.send();
	}
	
	/* 후보이미지를 클릭하면 메인이미지 자리에 뜨기 */
	function show_img(num){
		document.getElementById("main_fimg").src=document.getElementsByClassName("other_fimgs[num]").src;
		//console.log(document.getElementsByClassName("mine[num]").src);
	}
	
	/* 바로구매 : javascript로 form을 submit시키기*/
	function pro_submit(){
		document.pro_cnt.submit();	
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
		<form name="pro_cnt" method="post" action="pro_gumae?p=${p}&gchk=0">
		<input type="hidden" name="pcode" value="${pvo.pcode},">
		
    	<article id="a1">
    		<!-- 메인이미지_area_start -->
			<div id="left">
				<div id="fimg1">
					<img src="../img/eshop/${pvo.img}" width="500" height="450" id="main_fimg">
				</div>
				<div id="fimgs">
				<c:forEach var="imgs" items="${pvo.imgs}" varStatus="fimgs">
					<img src="../img/eshop/${imgs}" width="80" height="80" class="other_fimgs" onclick="show_img(${fimgs.index})">
				</c:forEach>
				</div>
			</div>
			<!-- 메인이미지_area_end -->
			<!-- 상품정보_area_start -->
			<div id="right">
				<div id="wish">	<!-- 위시리스트 -->
					<c:if test="${(userid == null) && (wishcnt == 0)}">
						<img src="../img/eshop/wish_off.png" width="25" onclick="alert('본 서비스는 로그인하셔야 이용 가능합니다.')">
					</c:if>
					<c:if test="${(userid !=null) && (wishcnt == 0)}">
						<img src="../img/eshop/wish_off.png" width="25" onclick="wish_add('${pvo.pcode}')" id="wishimg">
					</c:if>
					<c:if test="${(userid != null) && (wishcnt == 1)}">
						<img src="../img/eshop/wish_on.png" width="25" onclick="wish_del('${pvo.pcode}')" id="wishimg">
					</c:if>
				</div>
				<div id="title"> ${pvo.title} </div>	<!-- 상품명 -->
				<div id="price">	<!-- 가격 -->
					<b id="p_title"> 판매가 </b>
					<c:if test="${pvo.halin != 0}">	<!-- 할인하는 경우 -->
						KRW <b class="price_text1"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",###" /> </b>
						<s id="price_text2"><fmt:formatNumber value="${pvo.price}"/></s>
						<b id="halin_text1"> ${pvo.halin}% </b>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <b class="price_text1"> <fmt:formatNumber value="${pvo.price}"/> </b>
					</c:if>
				</div>
				<div id="su">	<!-- 수량 -->
					<b id="s_title"> 수량 </b>
					<input type="number" name="su" min="1" max="${pvo.su}" value="1" onchange="change_total_juk(this.value)" onblur="su_check(this.value)" id="spinner" >
				</div>
				<div id="total">
					<b id="t_title">
						총 상품금액 <br>
						<c:if test="${pvo.baefee == 0}">
							<i id="baefee"> (배송비 무료) </i>
						</c:if>
						<c:if test="${pvo.baefee != 0}">
							<i id="baefee"> (배송비 KRW <b style="color:black;"> <fmt:formatNumber value="${pvo.baefee}"/> </b> 포함) </i>
						</c:if>
					</b>
					<c:if test="${(pvo.halin != 0) && (pvo.baefee != 0)}">	<!-- 할인하는데 배송비가 있는 경우 -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) + pvo.baefee}" pattern=",###" /> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(pvo.halin != 0) && (pvo.baefee == 0)}"> <!-- 할인하는데 배송비가 없는 경우 -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",###" /> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(pvo.halin == 0) && (pvo.baefee != 0)}"> <!-- 할인 안 하는데 배송비가 있는 경우 -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price + pvo.baefee}" pattern=",###"/> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(pvo.halin == 0) && (pvo.baefee == 0)}"> <!-- 할인 안 하는데 배송비가 없는 경우 -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price}" pattern=",###"/> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(userid != null) && (pvo.juk != 0)}"> <!-- 적립금이 있고, 로그인한 경우 -->
						<c:if test="${pvo.halin == 0}">
							<i id="juk"> KRW <b id="juk_price"><fmt:formatNumber value="${pvo.price * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) 이 적립 예정입니다. </i>
						</c:if>
						<c:if test="${pvo.halin != 0}">
							<i id="juk"> KRW <b id="juk_price"><fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) 이 적립 예정입니다. </i>
						</c:if>
					</c:if> <p>
					<c:if test="${(userid == null) && (pvo.juk != 0)}">	<!-- 적립금이 없고, 로그인 안 한 경우 -->
						<c:if test="${pvo.halin == 0}">
							<i id="juk"> (로그인 후 구매하시면 KRW <b id="juk_price"><fmt:formatNumber value="${pvo.price * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) 이 적립됩니다.) </i>
						</c:if>
						<c:if test="${pvo.halin != 0}">
							<i id="juk"> (로그인 후 구매하시면 KRW <b id="juk_price"><fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) 이 적립됩니다.) </i>
						</c:if>
					</c:if>
				</div>

				<!-- 장바구니, 바로구매 -->
				<div id="etc">	
					<!-- 장바구니 -->
					<span id="btn1" onclick="cart_add('${pvo.pcode}')"> 장바구니 </span>
					
					<!-- 바로구매 -->
					<span id="btn2" onclick="pro_submit()"> 바로구매 </span>
				</div>

			</div>
			<div id="pro_info">
					<img src="../img/eshop/${pvo.simg}" width="100%">
			</div>
			<!-- 상품정보_area_end -->
			
			<!-- pro_gumae에 보낼 정보 start -->
			<c:set var="chalin" value="${pvo.price * (pvo.halin / 100)}"/>
			<c:set var="cpay" value="${pvo.price - (pvo.price * (pvo.halin / 100)) + pvo.baefee}"/>
			<input type="hidden" name="total_price" value="${pvo.price}" id="tprice">
			<input type="hidden" name="total_halin" value="${chalin}" id="thalin">
			<input type="hidden" name="total_baefee" value="${pvo.baefee}">
			<input type="hidden" name="total_pay" value="${cpay}" id="tpay">
			<!-- pro_gumae에 보낼 정보 end -->
		
		</article>
		</form>

		<article id="a2">
		
		</article>
	
	</div>
    <!-- ================ 상품 상세 Area End ================= -->

</body>