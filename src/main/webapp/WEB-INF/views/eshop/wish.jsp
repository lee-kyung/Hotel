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
		margin-top : 100px;
	}
	#wish table th {
		text-align : center;	
	}
	#wish table td {
		text-align : center;
		height : 100px;
	}
	#wish table tr td:nth-child(2) {
		text-align : left;
	}
	#wish #spinner {
		border : 1px solid lightgray;
		outline : none;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
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
		border : 1px solid #887159;
		color : #887159;
		margin : auto;
		font-size : 13px;
		font-weight : normal;
		cursor : pointer;
	}
	#wish #button11 {
		width : 150px;
		height : 42px;
		padding-top : 8px;
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
		height : 42px;
		padding-top : 8px;
		border : 1px solid #887159;
		color : #887159;
		font-size : 15px;
		font-weight : normal;
		margin : auto 5px auto auto;
		cursor : pointer;
	}
	#wish #button3 {
		width : 100%;
		height : 30px;
		padding-top : 5px;
		border : 1px solid #887159;
		color : #887159;
		font-size : 13px;
		font-weight : normal;
		cursor : pointer;
	}
</style>
<script>
	/* 정렬순 선택하기 */
	function order_sel(osel){
		location="wish?osel="+osel;
	}

	/* 위시리스트의 초기상태 : 전부체크 */
	window.onload=function(){
		document.getElementById("mainck").checked=true;
		let len=document.getElementsByClassName("subck").length;
		for(i=0;i<len;i++) {
			document.getElementsByClassName("subck")[i].checked=true;
		}
	}

	/* 전체 선택 & 해제하기 */
	function allcheck(ck){	// ck가 true면 체크된 상태, ck가 false면 체크가 안된 상태
		let len=document.getElementsByClassName("subck").length;	// subck의 개수를 구하기
		if(ck){	// [mainck]가 체크되면, class="subck"의 checked속성을 true로 바꾸기			
			for(i=0;i<len;i++) {
				document.getElementsByClassName("subck")[i].checked=true;
			}
		}
		else {	// [mainck]의 체크가 해제되면, class="subck"의 checked속성을 false로 바꾸기		
			for(i=0;i<len;i++) {
				document.getElementsByClassName("subck")[i].checked=false;
			}
		}
	}
	
	/* 개별로 선택 & 해제하기 */
	function subcheck(){
		let chk=0;	// subck의 항목이 얼마나 체크됐는지 확인하는 변수
		let len=document.getElementsByClassName("subck").length;	// subck의 개수를 구하기
		for(i=0;i<len;i++) {	// subck의 checked속성의 true/false를 일일이 확인하여 개수 세기
			if(document.getElementsByClassName("subck")[i].checked)
				chk++;
		}
		if(chk == len)	// 전체 subck의 개수와 checked된 개수가 같다면? mainck의 checked를 true로, 다르다면? mainck의 checked는 false로
			document.getElementById("mainck").checked=true;
		else
			document.getElementById("mainck").checked=false;
	}
	
	/* 선택상품 위시리스트 삭제하기 */
	function wish_del(){
		/* 체크된 상품을 삭제 → 체크된 상품의 wish.id들을 '구분자'를 통해 '문자열의 형태'로 만들어서 [delid]에 담아 전송하기 */
		let del="";
		let len=document.getElementsByClassName("subck").length;	// subck의 개수를 구하기
		for(i=0;i<len;i++) {
			if(document.getElementsByClassName("subck")[i].checked)	// 체크가 됐다면
				del=document.getElementsByClassName("subck")[i].value+","+del;
		}
		location="wishcart_del?delid="+del+"&dchk=1";	// delid=삭제할id,삭제할id,삭제할id, → 마지막 구분자(콤마)는 신경X		
	}
	
	/* 선택상품 or 전체상품 장바구니로 보내기 */
	function move_cart(n){	// n=1이면 선택이동, n=2면 전체이동
		/* 체크박스가 체크된 곳의 index와 hidden의 index는 같다 → [hidden의 value값]을 구분자(,)를 사용하여 [pcode변수]에 배열로 저장 */
		let pcode="";
		let len=document.getElementsByClassName("subck").length;	
		
		/* 상품을 전체 체크시키기 */
		if(n == 2) {
			document.getElementById("mainck").checked=true;
			for(i=0;i<len;i++) {
				document.getElementsByClassName("subck")[i].checked=true;
			}
		}
		
		/* pcode를 구분자(,)로 구분하여 하나의 문자열로 생성하기 */
		for(i=0;i<len;i++) {
			if(document.getElementsByClassName("subck")[i].checked)	// (장바구니이동)체크가 됐다면
				pcode=document.getElementsByClassName("pcode")[i].value+","+pcode;
		}
		location="move_cart?pcode="+pcode;
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	    <div class="bradcam_area eshop1">
	        <h3> 위 시 리 스 트 </h3>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 장바구니 Area Start ================= -->
    <div id="wish">
    	<div class="default-select" id="default-select" style="display:inline-block;">
			<select onchange="order_sel(this.value)" id="osel">
				<c:if test="${osel == 'id asc'}">
					<option value="id asc" selected> 과거등록순 </option>
				</c:if>
				<c:if test="${osel != 'id asc'}">
					<option value="id asc"> 등록순 </option>
				</c:if>
				<c:if test="${osel == 'id desc'}">
					<option value="id desc" selected> 최신등록순 </option>
				</c:if>
				<c:if test="${osel != 'id desc'}">
					<option value="id desc"> 최신상품순 </option>
				</c:if>
				<c:if test="${osel == 'halin desc'}">
					<option value="halin desc" selected> 높은할인율순 </option>
				</c:if>
				<c:if test="${osel != 'halin desc'}">
					<option value="halin desc"> 높은할인율순 </option>
				</c:if>
				<c:if test="${osel == 'price asc'}">
					<option value="price asc" selected> 낮은가격순 </option>
				</c:if>
				<c:if test="${osel != 'price asc'}">
					<option value="price asc"> 낮은가격순 </option>
				</c:if>
				<c:if test="${osel == 'price desc'}">
					<option value="price desc" selected> 높은가격순 </option>
				</c:if>
				<c:if test="${osel != 'price desc'}">
					<option value="price desc"> 높은가격순 </option>
				</c:if>
			</select>
		</div>
		<table width="1000" align="center" border="1">
			<tr>
				<th height="50"> <input type="checkbox" onclick="allcheck(this.checked)" id="mainck"> </th>
				<th colspan="2">상품정보</th>
				<th>상품금액</th>
				<th>배송비</th>
				<th>장바구니</th>
			</tr>
		<c:if test="${wlist.size() < 1}">
			<tr>
				<td colspan="80" height="100"> 등록된 상품이 없습니다. </td>
			</tr>
		</c:if>
		<c:forEach var="wvo" items="${wlist}">
			<input type="hidden" class="pcode" value="${wvo.pcode}">
			<tr>
				<td> <input type="checkbox" class="subck" onclick="subcheck()" value="${wvo.id}"> </td> <!-- 체크박스 -->
				<td colspan="2">	<!-- 상품정보(이미지, 상품명) -->
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
					<div onclick="location='move_cart?pcode=${wvo.pcode},'" id="button1"> 장바구니로 </div>
					<div onclick="location='wishcart_del?delid=${wvo.id},&dchk=1'" id="button2"> 삭제하기 </div>
				</td>
			</tr>
		</c:forEach>
			<tr>
				<th colspan="8" height="60"> <div onclick="wish_del()" id="button3"> 선택상품 삭제하기 </div> </th>
			</tr>
			<tr>
				<th colspan="8" height="80">
					<span onclick="location='eshop'" id="button22" style="float:left;"> 계속 쇼핑하기 </span>
					<span onclick="move_cart(2)" id="button11" style="float:right;"> 전체 장바구니로 </span>
					<span onclick="move_cart(1)" id="button22" style="float:right;"> 선택 장바구니로 </span>					
				</th>
			</tr>
		</table>
	</div>
    <!-- ================ 장바구니 Area End ================= -->

</body>