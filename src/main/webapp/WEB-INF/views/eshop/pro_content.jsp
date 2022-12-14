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
	/* ????????? '1~${pvo.su}' ???????????? ??????????????? ?????? */
	function su_check(su){
		if(su < 1)
			document.pro_cnt.su=1;
		else if(su > ${pvo.su})
			document.pro_cnt.su=${pvo.su};
	}

	let tprice="${pvo.price}";
	let thalin=parseInt("${pvo.price * (pvo.halin / 100)}");
	let tpay=parseInt("${pvo.price - (pvo.price * (pvo.halin / 100)) + pvo.baefee}");
	
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
		
		let pimsi=tprice*su;
		let himsi=thalin*su;
		
		document.getElementById("tprice").value=pimsi;
		document.getElementById("thalin").value=himsi;
		document.getElementById("tpay").value=pimsi-himsi+parseInt("${pvo.baefee}");
	}
	
	function wish_add(pcode){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			if(chk.responseText == "0") {
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
				document.getElementById("wishimg").src="../img/eshop/wish_off.png";
				document.getElementById("wishimg").setAttribute("onclick", "wish_add('"+pcode+"')");
			}
		}
		chk.open("get", "wish_del?pcode="+pcode);
		chk.send();
	}
	
	function cart_add(pcode){
		let su=document.pro_cnt.su.value;
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			let arr=chk.responseText.split(",");
			if(arr[0] == "0") {
				if(confirm("???????????? ????????? ??????????????? ???????????????. ??????????????? ?????????????????????????"))
					location="../eshop/cart?p="+arr[1];
			}
			else {
				alert("?????? ?????? ??????");
			}
		}
		chk.open("get", "cart_add?pcode="+pcode+"&su="+su);
		chk.send();
	}
	
	function show_img(num){
		document.getElementById("main_fimg").src=document.getElementsByClassName("other_fimgs")[num].src;
	}
	
	function pro_submit(){
		document.pro_cnt.submit();	
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
	<c:if test="${pvo.subpcode == 'p0101'}">
		<div class="bradcam_area eshop4">
	        <div id="h3" onclick="location='pro_list?pcode=p0101'" style="cursor:pointer;"> B E D D I N G </div>
	    </div>
	</c:if>
	<c:if test="${pvo.subpcode == 'p0102'}">
	    <div class="bradcam_area eshop5">
	        <div id="h3" onclick="location='pro_list?pcode=p0102'" style="cursor:pointer;"> L I F E S T Y L E </div>
	    </div>
	</c:if>
	<c:if test="${pvo.subpcode == 'p0201'}">
	    <div class="bradcam_area eshop6">
	        <div id="h3" onclick="location='pro_list?pcode=p0201'" style="cursor:pointer;"> D I N I N G </div>
	    </div>
    </c:if>
    <c:if test="${pvo.subpcode == 'p0202'}">
	    <div class="bradcam_area eshop7">
	        <div id="h3" onclick="location='pro_list?pcode=p0202'" style="cursor:pointer;"> B A K E R Y </div>
	    </div>
    </c:if>
    <!-- ================ (Sitemesh) Top Area ????????? End ================= -->


	<!-- ================ ?????? ?????? Area Start ================= -->
    <div id="pro_cnt">
		<form name="pro_cnt" method="post" action="pro_gumae?p=${p}&gchk=0">
		<input type="hidden" name="pcode" value="${pvo.pcode},">
		
    	<article id="a1">
    		<!-- ???????????????_area_start -->
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
			<!-- ???????????????_area_end -->
			<!-- ????????????_area_start -->
			<div id="right">
				<div id="wish">	<!-- ??????????????? -->
					<c:if test="${(userid == null) && (wishcnt == 0)}">
						<img src="../img/eshop/wish_off.png" width="25" onclick="alert('??? ???????????? ?????????????????? ?????? ???????????????.')">
					</c:if>
					<c:if test="${(userid !=null) && (wishcnt == 0)}">
						<img src="../img/eshop/wish_off.png" width="25" onclick="wish_add('${pvo.pcode}')" id="wishimg">
					</c:if>
					<c:if test="${(userid != null) && (wishcnt == 1)}">
						<img src="../img/eshop/wish_on.png" width="25" onclick="wish_del('${pvo.pcode}')" id="wishimg">
					</c:if>
				</div>
				<div id="title"> ${pvo.title} </div>	<!-- ????????? -->
				<div id="price">	<!-- ?????? -->
					<b id="p_title"> ????????? </b>
					<c:if test="${pvo.halin != 0}">	<!-- ???????????? ?????? -->
						KRW <b class="price_text1"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",###" /> </b>
						<s id="price_text2"><fmt:formatNumber value="${pvo.price}"/></s>
						<b id="halin_text1"> ${pvo.halin}% </b>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <b class="price_text1"> <fmt:formatNumber value="${pvo.price}"/> </b>
					</c:if>
				</div>
				<div id="su">	<!-- ?????? -->
					<b id="s_title"> ?????? </b>
					<input type="number" name="su" min="1" max="${pvo.su}" value="1" onchange="change_total_juk(this.value)" onblur="su_check(this.value)" id="spinner" >
				</div>
				<div id="total">
					<b id="t_title">
						??? ???????????? <br>
						<c:if test="${pvo.baefee == 0}">
							<i id="baefee"> (????????? ??????) </i>
						</c:if>
						<c:if test="${pvo.baefee != 0}">
							<i id="baefee"> (????????? KRW <b style="color:black;"> <fmt:formatNumber value="${pvo.baefee}"/> </b> ??????) </i>
						</c:if>
					</b>
					<c:if test="${(pvo.halin != 0) && (pvo.baefee != 0)}">	<!-- ??????????????? ???????????? ?????? ?????? -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) + pvo.baefee}" pattern=",###" /> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(pvo.halin != 0) && (pvo.baefee == 0)}"> <!-- ??????????????? ???????????? ?????? ?????? -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",###" /> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(pvo.halin == 0) && (pvo.baefee != 0)}"> <!-- ?????? ??? ????????? ???????????? ?????? ?????? -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price + pvo.baefee}" pattern=",###"/> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(pvo.halin == 0) && (pvo.baefee == 0)}"> <!-- ?????? ??? ????????? ???????????? ?????? ?????? -->
						<b class="price_text1" id="total_price"> <fmt:formatNumber value="${pvo.price}" pattern=",###"/> </b> <span id="won">KRW</span>
					</c:if>
					<c:if test="${(userid != null) && (pvo.juk != 0)}"> <!-- ???????????? ??????, ???????????? ?????? -->
						<c:if test="${pvo.halin == 0}">
							<i id="juk"> KRW <b id="juk_price"><fmt:formatNumber value="${pvo.price * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) ??? ?????? ???????????????. </i>
						</c:if>
						<c:if test="${pvo.halin != 0}">
							<i id="juk"> KRW <b id="juk_price"><fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) ??? ?????? ???????????????. </i>
						</c:if>
					</c:if> <p>
					<c:if test="${(userid == null) && (pvo.juk != 0)}">	<!-- ???????????? ??????, ????????? ??? ??? ?????? -->
						<c:if test="${pvo.halin == 0}">
							<i id="juk"> (????????? ??? ??????????????? KRW <b id="juk_price"><fmt:formatNumber value="${pvo.price * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) ??? ???????????????.) </i>
						</c:if>
						<c:if test="${pvo.halin != 0}">
							<i id="juk"> (????????? ??? ??????????????? KRW <b id="juk_price"><fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) * (pvo.juk / 100)}" pattern=",###"/></b> (${pvo.juk}%) ??? ???????????????.) </i>
						</c:if>
					</c:if>
				</div>

				<!-- ????????????, ???????????? -->
				<div id="etc">	
					<!-- ???????????? -->
					<span id="btn1" onclick="cart_add('${pvo.pcode}')"> ???????????? </span>
					
					<!-- ???????????? -->
					<span id="btn2" onclick="pro_submit()"> ???????????? </span>
				</div>

			</div>
			<div id="pro_info">
					<img src="../img/eshop/${pvo.simg}" width="100%">
			</div>
			<!-- ????????????_area_end -->
			
			<!-- pro_gumae??? ?????? ?????? start -->
			<c:set var="chalin" value="${pvo.price * (pvo.halin / 100)}"/>
			<c:set var="cpay" value="${pvo.price - (pvo.price * (pvo.halin / 100)) + pvo.baefee}"/>
			<input type="hidden" name="total_price" value="${pvo.price}" id="tprice">
			<input type="hidden" name="total_halin" value="${chalin}" id="thalin">
			<input type="hidden" name="total_baefee" value="${pvo.baefee}">
			<input type="hidden" name="total_pay" value="${cpay}" id="tpay">
			<!-- pro_gumae??? ?????? ?????? end -->
		
		</article>
		</form>

		<article id="a2">
		
		</article>
	
	</div>
    <!-- ================ ?????? ?????? Area End ================= -->

</body>