<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${plist.size() / 3}"/>
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
		padding-top : 30px;
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
	}
	#pro_list #wish img {
		cursor : pointer;
	}
	#pro_list #cart {
		float : right;
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
	/* 페이지목록수 선택하기 */
	function page_sel(psel){
		location="pro_list?pcode=${pcode}&osel=${osel}&psel="+psel;
	}
	
	/* 정렬순 선택하기 */
	function order_sel(osel){
		location="pro_list?pcode=${pcode}&psel=${psel}&osel="+osel;
	}
	
	/* 브라우저에 변경된 페이지목록수 및 정렬순 나타내기 */
	/*window.onload=function(){
		document.getElementById("psel").value="${psel}";
		document.getElementById("osel").value="${osel}";
	}*/
	
	/* pro_content로 이동하기 */
	function content_view(pcode){
		location="pro_content?pcode="+pcode;
	}
	
	/* [하위분류]를 클릭하면 버튼색상을 변화시키기 */
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
	
	/* 위시리스트에 추가하고 삭제하기 */
	function wish_add(pcode, num){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			if(chk.responseText == "0") {
				//alert("위시리스트에 추가됐습니다.");
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
				//alert("위시리스트에서 삭제됐습니다.");
				document.getElementsByClassName("wishimg")[num].src="../img/eshop/wish_off.png";
				document.getElementsByClassName("wishimg")[num].setAttribute("onclick", "wish_add('"+pcode+"','"+num+"')");
			}
		}
		chk.open("get", "wish_del?pcode="+pcode);
		chk.send();
	}
	
	/* 장바구니에 추가하고 삭제하기 */
	function cart_add(pcode, num){
		let chk=new XMLHttpRequest();
		chk.onload=function(){
			let arr=chk.responseText;
			if(arr[0] == "0") {
				//alert("장바구니에 추가됐습니다.");
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
				//alert("장바구니에서 삭제됐습니다.");
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
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <c:if test="${(pcode == 'p01')}">
	    <div class="bradcam_area eshop2">
	        <div id="h3" onclick="location='pro_list?pcode=p01&osel=${osel}'" style="cursor:pointer;"> P R O D U C T </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0101')}">
	    <div class="bradcam_area eshop4">
	        <div id="h3" onclick="location='pro_list?pcode=p01&osel=${osel}'" style="cursor:pointer;"> P R O D U C T </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0102')}">
	    <div class="bradcam_area eshop5">
	        <div id="h3" onclick="location='pro_list?pcode=p01&osel=${osel}'" style="cursor:pointer;"> P R O D U C T </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p02')}">
	    <div class="bradcam_area eshop3">
	        <div id="h3" onclick="location='pro_list?pcode=p02&osel=${osel}'" style="cursor:pointer;"> V O U C H E R </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0201')}">
	    <div class="bradcam_area eshop6">
	        <div id="h3" onclick="location='pro_list?pcode=p02&osel=${osel}'" style="cursor:pointer;"> V O U C H E R </div>
	    </div>
    </c:if>
    <c:if test="${(pcode == 'p0202')}">
	    <div class="bradcam_area eshop7">
	        <div id="h3" onclick="location='pro_list?pcode=p02&osel=${osel}'" style="cursor:pointer;"> V O U C H E R </div>
	    </div>
    </c:if>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 상품목록 Area Start ================= -->
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
		<div class="default-select" id="default-select" style="display:inline-block;">
			<select onchange="order_sel(this.value)" id="osel">
				<c:if test="${osel == 'sold desc'}">
					<option value="sold desc" selected> 인기순 </option>
				</c:if>
				<c:if test="${osel != 'sold desc'}">
					<option value="sold desc"> 인기순 </option>
				</c:if>
				<c:if test="${osel == 'id desc'}">
					<option value="id desc" selected> 신상품순 </option>
				</c:if>
				<c:if test="${osel != 'id desc'}">
					<option value="id desc"> 신상품순 </option>
				</c:if>
				<c:if test="${osel == 'halin desc'}">
					<option value="halin desc" selected> 할인율순 </option>
				</c:if>
				<c:if test="${osel != 'halin desc'}">
					<option value="halin desc"> 할인율순 </option>
				</c:if>
				<c:if test="${osel == 'price desc'}">
					<option value="price desc" selected> 고가격순 </option>
				</c:if>
				<c:if test="${osel != 'price desc'}">
					<option value="price desc"> 고가격순 </option>
				</c:if>
				<c:if test="${osel == 'price asc'}">
					<option value="price asc" selected> 저가격순 </option>
				</c:if>
				<c:if test="${osel != 'price asc'}">
					<option value="price asc"> 저가격순 </option>
				</c:if>
			</select>
		</div>
		<div class="default-select" id="default-select" style="display:inline-block;float:right;margin-right:5px;">
			<select onchange="page_sel(this.value)" id="psel">
				<c:if test="${psel == 9}">
					<option value="9" selected> 9개씩 </option>
				</c:if>
				<c:if test="${psel != 9}">
					<option value="9"> 9개씩 </option>
				</c:if>
				<c:if test="${psel == 15}">
					<option value="15" selected> 15개씩 </option>
				</c:if>
				<c:if test="${psel != 15}">
					<option value="15"> 15개씩 </option>
				</c:if>
				<c:if test="${psel == 30}">
					<option value="30" selected> 30개씩 </option>
				</c:if>
				<c:if test="${psel != 30}">
					<option value="30"> 30개씩 </option>
				</c:if>
				<%-- <c:if test="${psel == 45}">
					<option value="45" selected> 45개씩 </option>
				</c:if>
				<c:if test="${psel != 45}">
					<option value="45"> 45개씩 </option>
				</c:if>
				<c:if test="${psel == 60}">
					<option value="60" selected> 60개씩 </option>
				</c:if>
				<c:if test="${psel != 60}">
					<option value="60"> 60개씩 </option>
				</c:if>	 --%>
			</select>
		</div>
		<table align="center">	 <!-- 상품을 9개씩 출력 -->
		<c:set var="n" value="3"/>	<!-- 한 행에 출력되는 열(상품)의 개수 -->
		<c:set var="i" value="0"/>	<!-- 상품 3개마다 행을 바꾸기 위한 변수 -->	
			<tr>
			<c:forEach var="pvo" items="${plist}" varStatus="list">
				<td>
					<div class="offers_area padding_top" id="eshop_img"><div class="single_offers"><div class="about_thumb">
						<img src="../img/eshop/${pvo.img}" height="300" width="300" onclick="content_view('${pvo.pcode}')" style="cursor:pointer">	<!-- 상품이미지 -->
					</div></div></div>
					<!-- 상품명 -->
					<div id="title" onclick="content_view('${pvo.pcode}')"> ${pvo.title} </div>
					<!-- 위시리스트 -->
					<div id="wish">
						<c:if test="${userid == null}">
							<img src="../img/eshop/wish_off.png" width="20" onclick="alert('로그인하셔야 본 서비스를 이용하실 수 있습니다.')">
						</c:if>
						<c:if test="${(userid != null) && (pvo.wishchk == 0)}">
							<img src="../img/eshop/wish_off.png" width="20" onclick="wish_add('${pvo.pcode}', ${list.index})" class="wishimg">
						</c:if>
						<c:if test="${(userid != null) && (pvo.wishchk == 1)}">
							<img src="../img/eshop/wish_on.png" width="20" onclick="wish_del('${pvo.pcode}', ${list.index})" class="wishimg">
						</c:if>
					</div>
					<!-- 장바구니 -->
					<div id="cart">
						<c:if test="${pvo.cartchk == 0}">
							<img src="../img/eshop/cart_off.png" width="25" onclick="cart_add('${pvo.pcode}', ${list.index})" class="cartimg">
						</c:if>
						<c:if test="${pvo.cartchk == 1}">
							<img src="../img/eshop/cart_on.png" width="25" onclick="cart_del('${pvo.pcode}', ${list.index})" class="cartimg">
						</c:if>
					</div>
					<hr style="width:350px;">
					<!-- 판매가 / 할인가 원가 할인율-->
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