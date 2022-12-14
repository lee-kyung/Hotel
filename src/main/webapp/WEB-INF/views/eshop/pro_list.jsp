<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${plist.size() / 3}"/>
	<c:if test="${size <= 1}">
		<c:set var="height" value="900"/>
	</c:if>
	<c:if test="${size > 1}">
		<c:set var="height" value="${ ((size-1) * 500) + 900 }"/>
	</c:if>
<style>
	#pro_list {
		width : 1100px;
		height : ${height}px;
		margin : 50px auto 100px auto;
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
		margin-top : 70px;
		width : 1090px;
		height : 80px;
	}
	#pro_list #cate1 #cate2 {
		display : inline-block;
		float : left;
		width : 540px;
		height : 50px;
		padding-top : 12px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
	}
	#pro_list #cate1 #cate2:hover {
		border : 1px solid #887159;
		background : #887159;
		color : white;
	}
	#pro_list #cate1 #cate3 {
		display : inline-block;
		float : right;
		width : 540px;
		height : 50px;
		padding-top : 12px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
	}
	#pro_list #cate1 #cate3:hover {
		border : 1px solid #887159;
		background : #887159;
		color : white;
	}
	#pro_list #title {
		display : inline-block;
		font-size : 22px;
		letter-spacing : -2px;
		word-spacing : 2px;
		cursor : pointer;
	}
	#pro_list #wish {
		float : right;
		margin-top : 2px;
	}
	#pro_list #wish img {
		cursor : pointer;
	}
	#pro_list #cart {
		float : right;
		margin-top : 1px;
		margin-right : 10px;
	}
	#pro_list #cart img {
		cursor : pointer;
	}
	#pro_list #price_text1 {
		font-family : TimesNewRoman;
		font-size : 25px;
		color : black;
		margin-left : 5px;
	}
	#pro_list #price_text2 {
		font-family : TimesNewRoman;
		font-size : 15px;
		font-weight : bold;
		letter-spacing : -1px;
		color : gray;
		margin-right : 5px;
	}
	#pro_list #halin_text1 {
		font-family : TimesNewRoman;
		font-size : 22px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	function order_sel(osel){
		location="pro_list?pcode=${pcode}&psel=${psel}&osel="+osel;
	}

	function content_view(pcode){
		location="pro_content?pcode="+pcode;
	}
	
	window.onload=function(){
		if(${(pcode == 'p0101') || (pcode == 'p0201')}) {
			document.getElementById("cate2").style.background="#887159";
			document.getElementById("cate2").style.color="white";
		}
		else if(${(pcode == 'p0102') || (pcode == 'p0202')}) {
			document.getElementById("cate3").style.background="#887159";
			document.getElementById("cate3").style.color="white";
		}
	}
	
	function wish_add(pcode, num){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			if(chk.responseText == "0") {
				document.getElementsByClassName("wishimg")[num].src="../img/eshop/wish_on.png";
				document.getElementsByClassName("wishimg")[num].setAttribute("onclick", "wish_del('"+pcode+"','"+num+"')");
			}
		}
		chk.open("get", "wish_add?pcode="+pcode);
		chk.send();
	}
	function wish_del(pcode, num){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			let arr=chk.responseText;
			if(arr[0]  == "0") {
				document.getElementsByClassName("wishimg")[num].src="../img/eshop/wish_off.png";
				document.getElementsByClassName("wishimg")[num].setAttribute("onclick", "wish_add('"+pcode+"','"+num+"')");
			}
		}
		chk.open("get", "wish_del?pcode="+pcode);
		chk.send();
	}
	
	function cart_add(pcode, num){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			let arr=chk.responseText;
			if(arr[0] == "0") {
				document.getElementsByClassName("cartimg")[num].src="../img/eshop/cart_on.png";
				document.getElementsByClassName("cartimg")[num].setAttribute("onclick", "cart_del('"+pcode+"','"+num+"')");
			}
		}
		chk.open("get", "cart_add?pcode="+pcode);
		chk.send();
	}
	function cart_del(pcode, num){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			if(chk.responseText == "0") {
				document.getElementsByClassName("cartimg")[num].src="../img/eshop/cart_off.png";
				document.getElementsByClassName("cartimg")[num].setAttribute("onclick", "cart_add('"+pcode+"','"+num+"')");
			}
		}
		chk.open("get", "cart_del?pcode="+pcode);
		chk.send();
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
    <c:if test="${(pcode == 'p01')}">
	    <div class="bradcam_area eshop2">
	        <div id="h3" onclick="location='pro_list?pcode=p01'" style="cursor:pointer;"> P R O D U C T </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0101')}">
	    <div class="bradcam_area eshop4">
	        <div id="h3" onclick="location='pro_list?pcode=p01'" style="cursor:pointer;"> P R O D U C T </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0102')}">
	    <div class="bradcam_area eshop5">
	        <div id="h3" onclick="location='pro_list?pcode=p01'" style="cursor:pointer;"> P R O D U C T </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p02')}">
	    <div class="bradcam_area eshop3">
	        <div id="h3" onclick="location='pro_list?pcode=p02'" style="cursor:pointer;"> V O U C H E R </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0201')}">
	    <div class="bradcam_area eshop6">
	        <div id="h3" onclick="location='pro_list?pcode=p02'" style="cursor:pointer;"> V O U C H E R </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0202')}">
	    <div class="bradcam_area eshop7">
	        <div id="h3" onclick="location='pro_list?pcode=p02'" style="cursor:pointer;"> V O U C H E R </div>
	    </div>
    </c:if>
    <!-- ================ (Sitemesh) Top Area ????????? End ================= -->


	<!-- ================ ???????????? Area Start ================= -->
	<section id="pro_list">
		<c:if test="${(pcode == 'p01') || (pcode == 'p0101') || (pcode == 'p0102')}">
			<div id="cate1">
				<span id="cate2" onclick="location='pro_list?pcode=p0101&osel=${osel}'"> B E D D I N G </span>
				<span id="cate3" onclick="location='pro_list?pcode=p0102&osel=${osel}'"> L I F E S T Y L E </span>
			</div>
		</c:if>
		<c:if test="${(pcode == 'p02') || (pcode == 'p0201') || (pcode == 'p0202')}">
			<div id="cate1">
				<span id="cate2" onclick="location='pro_list?pcode=p0201&osel=${osel}'"> D I N I N G </span>
				<span id="cate3" onclick="location='pro_list?pcode=p0202&osel=${osel}'"> B A K E R Y </span>
			</div>
		</c:if>
		<div style="float:left;margin-top:30px;letter-spacing:-1px;"> ??? <b style="color:#887159;font-family:TimesNewRoman">${sum}</b>?????? ????????? ????????????. </div>
		<div class="default-select" id="default-select" style="float:right;margin-top:20px;">
			<select onchange="order_sel(this.value)" id="osel">
				<c:if test="${osel == 'sold desc'}">
					<option value="sold desc" selected> ????????? </option>
				</c:if>
				<c:if test="${osel != 'sold desc'}">
					<option value="sold desc"> ????????? </option>
				</c:if>
				<c:if test="${osel == 'id desc'}">
					<option value="id desc" selected> ???????????? </option>
				</c:if>
				<c:if test="${osel != 'id desc'}">
					<option value="id desc"> ???????????? </option>
				</c:if>
				<c:if test="${osel == 'halin desc'}">
					<option value="halin desc" selected> ????????? </option>
				</c:if>
				<c:if test="${osel != 'halin desc'}">
					<option value="halin desc"> ????????? </option>
				</c:if>
				<c:if test="${osel == 'price desc'}">
					<option value="price desc" selected> ???????????? </option>
				</c:if>
				<c:if test="${osel != 'price desc'}">
					<option value="price desc"> ???????????? </option>
				</c:if>
				<c:if test="${osel == 'price asc'}">
					<option value="price asc" selected> ???????????? </option>
				</c:if>
				<c:if test="${osel != 'price asc'}">
					<option value="price asc"> ???????????? </option>
				</c:if>
			</select>
		</div>
		<table align="center">	 <!-- ????????? 9?????? ?????? -->
		<c:set var="n" value="3"/>	<!-- ??? ?????? ???????????? ???(??????)??? ?????? -->
		<c:set var="i" value="0"/>	<!-- ?????? 3????????? ?????? ????????? ?????? ?????? -->	
			<tr>
			<c:forEach var="pvo" items="${plist}" varStatus="list">
				<td>
					<div class="offers_area padding_top" id="eshop_img"><div class="single_offers"><div class="about_thumb">
						<img src="../img/eshop/${pvo.img}" height="330" width="340" onclick="content_view('${pvo.pcode}')" style="cursor:pointer;">	<!-- ??????????????? -->
					</div></div></div>
					<!-- ????????? -->
					<div id="title" onclick="content_view('${pvo.pcode}')"> ${pvo.title} </div>
					<!-- ??????????????? -->
					<div id="wish">
						<c:if test="${userid == null}">
							<img src="../img/eshop/wish_off.png" width="20" onclick="alert('?????????????????? ??? ???????????? ???????????? ??? ????????????.')">
						</c:if>
						<c:if test="${(userid != null) && (pvo.wishchk == 0)}">
							<img src="../img/eshop/wish_off.png" width="20" onclick="wish_add('${pvo.pcode}', ${list.index})" class="wishimg">
						</c:if>
						<c:if test="${(userid != null) && (pvo.wishchk == 1)}">
							<img src="../img/eshop/wish_on.png" width="20" onclick="wish_del('${pvo.pcode}', ${list.index})" class="wishimg">
						</c:if>
					</div>
					<!-- ???????????? -->
					<div id="cart">
						<c:if test="${pvo.cartchk == 0}">
							<img src="../img/eshop/cart_off.png" width="25" onclick="cart_add('${pvo.pcode}', ${list.index})" class="cartimg">
						</c:if>
						<c:if test="${pvo.cartchk == 1}">
							<img src="../img/eshop/cart_on.png" width="25" onclick="cart_del('${pvo.pcode}', ${list.index})" class="cartimg">
						</c:if>
					</div>
					<hr style="width:350px;">
					<!-- ????????? / ????????? ?????? ?????????-->
					<div id="price">
						<c:if test="${pvo.halin == 0}">
							KRW <b id="price_text1"> <fmt:formatNumber value="${pvo.price}" pattern="#,###"/> </b>
						</c:if>
						<c:if test="${pvo.halin != 0}">
							KRW <b id="price_text1"> <fmt:formatNumber value="${(pvo.price) - (pvo.price * (pvo.halin / 100) )}" pattern="#,###"/> </b>
							<s id="price_text2"><fmt:formatNumber value="${pvo.price}" pattern="#,###"/></s>
							<b id="halin_text1"> ${pvo.halin}% </b>
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
    <!-- ================ ???????????? Area End ================= -->

</body>