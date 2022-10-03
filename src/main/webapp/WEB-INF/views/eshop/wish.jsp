<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${wlist.size()}"/>
	<c:if test="${size <= 5}">
		<c:set var="height" value="800"/>
	</c:if>
	<c:if test="${size > 5}">
		<c:set var="height" value="${ ((size-4) * 100) + 800 }"/>
	</c:if>
<style>
	#wish {
		width : 1100px;
		height : ${height}px;
		margin : auto;
		margin-top : 50px;
	}
	#wish #price_text1 {
		font-family : TimesNewRoman;
		color : black;
		margin-left : 5px;
	}
	#wish #halin_text1 {
		font-family : TimesNewRoman;
	}
	#wish #halin_text2 {
		font-family : TimesNewRoman;
		letter-spacing : -3px;
	}
	#wish #button1 {
		width : 80px;
		height : 30px;
		padding-top : 5px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		margin : auto;
		margin-bottom : 5px;
		font-size : 13px;
		font-weight : normal;
		cursor : pointer;
	}
	#wish #button2 {
		width : 80px;
		height : 30px;
		padding-top : 5px;
		border : 1px solid lightgray;
		color : #887159;
		margin : auto;
		font-size : 13px;
		font-weight : normal;
		cursor : pointer;
	}
	#wish #button11 {
		width : 150px;
		height : 41px;
		padding-top : 9px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		font-size : 15px;
		font-weight : normal;
		margin : auto;
		cursor : pointer;
	}
	#wish #button22 {
		width : 150px;
		height : 41px;
		padding-top : 9px;
		border : 1px solid #887159;
		color : #887159;
		font-size : 15px;
		font-weight : normal;
		margin : auto 5px auto auto;
		cursor : pointer;
	}
	#wish #button3 {
		width : 150px;
		height : 30px;
		padding-top : 5px;
		border : 1px solid lightgray;
		color : #887159;
		margin : auto;
		font-size : 13px;
		font-weight : normal;
		cursor : pointer;
		float : right;
		margin-top : 30px;
	}
	#wish table tr:nth-child(2) th {
		text-align : center;
		background : #f9f4ee;
		padding-top : 6px;
	}
	#wish table td {
		text-align : center;
		border-bottom : 1px solid #ececec;
	}
	#wish table tr:first-child td {
		border-bottom : 1px solid #887159;
		height : 80px;
	}
	#wish table tr td:nth-child(2) {
		text-align : left;
	}
	#wish #mainck {
		accent-color : #887159;
		width : 17px;
		height : 17px;
	}
	#wish #subck {
		accent-color : #887159;
		width : 15px;
		height : 15px;
	}
	#wish .obtn {
		display : inline-block;
		width : 80px;
		height : 35px;
		padding-top : 5px;
		border-bottom : 2px solid #887159;
		background : white;
		color : #887159;
		font-weight : normal;
		cursor : pointer;
		margin-left : 10px;
		margin-top : 15px;
	}
	#wish .obtn:hover {
		background : #887159;
		color : white;
	}
</style>
<script>
	/* 위시리스트의 초기상태 : 전부체크 */
	window.onload=function(){
		document.getElementById("mainck").checked=true;
		let len=document.getElementsByClassName("subck").length;
		for(i=0;i<len;i++) {
			document.getElementsByClassName("subck")[i].checked=true;
		}
	}

	/* 전체 선택 & 해제하기 */
	function allcheck(ck){
		let len=document.getElementsByClassName("subck").length;
		if(ck){	
			for(i=0;i<len;i++) {
				document.getElementsByClassName("subck")[i].checked=true;
			}
		}
		else {	
			for(i=0;i<len;i++) {
				document.getElementsByClassName("subck")[i].checked=false;
			}
		}
	}
	
	/* 개별로 선택 & 해제하기 */
	function subcheck(){
		let chk=0;
		let len=document.getElementsByClassName("subck").length;
		for(i=0;i<len;i++) {
			if(document.getElementsByClassName("subck")[i].checked)
				chk++;
		}
		if(chk == len)
			document.getElementById("mainck").checked=true;
		else
			document.getElementById("mainck").checked=false;
	}
	
	/* 선택상품 위시리스트 삭제하기 */
	function wish_del(){
		let del="";
		let len=document.getElementsByClassName("subck").length;
		for(i=0;i<len;i++) {
			if(document.getElementsByClassName("subck")[i].checked)
				del=document.getElementsByClassName("subck")[i].value+","+del;
		}
		location="wishcart_del?delid="+del+"&dchk=1";
	}
	
	/* 선택상품 or 전체상품 장바구니로 보내기 */
	function move_cart(n){	// n=1이면 선택이동, n=2면 전체이동
		let pcode="";
		let len=document.getElementsByClassName("subck").length;	
		
		/* 상품을 전체 체크시키기 */
		if(n == 2) {
			document.getElementById("mainck").checked=true;
			for(i=0;i<len;i++) {
				document.getElementsByClassName("subck")[i].checked=true;
			}
		}
		
		/* pcode를 배열을 위해 하나의 문자열로 만들기 */
		for(i=0;i<len;i++) {
			if(document.getElementsByClassName("subck")[i].checked)
				pcode=document.getElementsByClassName("pcode")[i].value+","+pcode;
		}
		location="move_cart?pcode="+pcode;
	}
	
	/* 정렬순을 클릭하며 색상 변하기 */
	window.onload=function(){
		if(${osel == 'id asc'}) {
			document.getElementsByClassName("obtn")[0].style.background="#887159";
			document.getElementsByClassName("obtn")[0].style.color="white";
			}
			else if (${osel == 'halin desc'}) {
				document.getElementsByClassName("obtn")[1].style.background="#887159";
				document.getElementsByClassName("obtn")[1].style.color="white";
				}
				else if (${osel == 'price asc'}) {
					document.getElementsByClassName("obtn")[2].style.background="#887159";
					document.getElementsByClassName("obtn")[2].style.color="white";
					}
					else if (${osel == 'price desc'}) {
						document.getElementsByClassName("obtn")[3].style.background="#887159";
						document.getElementsByClassName("obtn")[3].style.color="white";
						}
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	    <div class="bradcam_area eshop1">
	        <div id="h3"> W I S H L I S T </div>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<c:if test="${userid == null}"> <c:redirect url="../main/index"/> </c:if>

	<!-- ================ 장바구니 Area Start ================= -->
    <div id="wish">
		<table width="1000" align="center" cellpadding="0">
			<tr>
				<td colspan="8" height="50">
					<div id="osel" style="float:left;">
						<span onclick="location='wish?osel=id asc'" class="obtn"> 등록순 </span>
						<span onclick="location='wish?osel=halin desc'" class="obtn"> 할인순 </span>
						<span onclick="location='wish?osel=price asc'" class="obtn"> 최저가순 </span>
						<span onclick="location='wish?osel=price desc'" class="obtn"> 최고가순 </span>
					</div>
					<div onclick="wish_del()" id="button3"> 선택상품 삭제하기 </div>
				</td>
			</tr>
			<tr>
				<th height="50" width="70"> <input type="checkbox" onclick="allcheck(this.checked)" id="mainck"> </th>
				<th colspan="2" width="300">상품정보</th>
				<th width="250">상품금액</th>
				<th width="150">배송비</th>
				<th width="150">장바구니</th>
			</tr>
		<c:if test="${wlist.size() < 1}">
			<tr>
				<td colspan="80"> <div style="height:200px;padding-top:90px;"> 등록된 상품이 없습니다.</div> </td>
			</tr>
		</c:if>
		<c:forEach var="wvo" items="${wlist}">
			<input type="hidden" class="pcode" value="${wvo.pcode}">
			<tr>
				<td height="100"> <input type="checkbox" class="subck" onclick="subcheck()" value="${wvo.id}" id="subck"> </td> <!-- 체크박스 -->
				<td colspan="2" style="padding-left:10px;">	<!-- 상품정보(이미지, 상품명) -->
					<img src="../img/eshop/${wvo.fimg}" width="80" height="80" id="main_fimg">
					${wvo.title}
				</td>
				<td>	<!-- 상품금액 -->
					<c:if test="${wvo.halin == 0}">
							KRW <b id="price_text1"> <fmt:formatNumber value="${wvo.price}" pattern="#,###"/> </b>
						</c:if>
						<c:if test="${wvo.halin != 0}">
							KRW <b id="price_text1"> <fmt:formatNumber value="${(wvo.price) - (wvo.price * (wvo.halin / 100) )}" pattern="#,###"/> </b>
							<b id="halin_text1">(${wvo.halin}<b id="halin_text2">%↓)</b> </b>
						</c:if>
				</td>
				<td>	<!-- 배송비 -->
					<c:if test="${wvo.baefee == 0}">
						무료
					</c:if>
					<c:if test="${wvo.baefee != 0}">
						KRW <fmt:formatNumber value="${wvo.baefee}"/>
					</c:if>
				</td>
				<td>	<!-- 1개 주문 or 삭제하기 -->
					<div onclick="location='move_cart?pcode=${wvo.pcode},'" id="button1"> 장바구니 </div>
					<div onclick="location='wishcart_del?delid=${wvo.id},&dchk=1'" id="button2"> 삭제하기 </div>
				</td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="8" height="100" style="border:none;">
					<span onclick="location='eshop'" id="button22" style="float:left;"> 계속 쇼핑하기 </span>
					<span onclick="move_cart(2)" id="button11" style="float:right;"> 전체 장바구니로 </span>
					<span onclick="move_cart(1)" id="button22" style="float:right;"> 선택 장바구니로 </span>					
				</td>
			</tr>
		</table>
	</div>
    <!-- ================ 장바구니 Area End ================= -->

</body>