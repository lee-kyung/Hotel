<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${clist.size()}"/>
	<c:if test="${size <= 5}">
		<c:set var="height" value="1000"/>
	</c:if>
	<c:if test="${size > 5}">
		<c:set var="height" value="${ ((size-4) * 100) + 1000 }"/>
	</c:if>
<style>
	#cart {
		width : 1100px;
		height : ${height}px;
		margin : auto;
		margin-top : 100px;
	}
	#cart table th {
		text-align : center;	
	}
	#cart table td {
		text-align : center;
		height : 100px;
	}
	#cart table tr td:nth-child(2) {
		text-align : left;
	}
	#cart #spinner {
		border : 1px solid lightgray;
		outline : none;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
	}
</style>
<script>
	/* 상품당 가격을 구하기 */
	function cal_pro(){
		let len=document.getElementsByClassName("subck").length;
		let exprice=[${arrprice}];
		let exhalin=[${arrhalin}];
		let exsu="";
		let exbaefee=[${arrbaefee}];
		let total_price="";
		let total_halin="";
		let total_baefee="";
		for(i=0;i<len;i++) {
			exsu[i]=document.getElementsByClassName("su")[i].value
			price=parseInt(exprice[i] * exsu[i]);
			if(exhalin[i] != 0)
				price=parseInt((exprice[i] - (exprice[i] * (exhalin / 100))) * exsu[i]);
			document.getElementsByClassName("price")[i].innerText=exprice[i];
			total_price=parseInt(total_price + (exprice[i] * exsu[i]));
			total_halin=parseInt(total_halin + ((exprice[i] * (exhalin[i] / 100)) * exsu[i]));
			total_baefee=parseInt(total_baefee + exbaefee[i]);
		}
		document.getElementById("total_price").innerText="KRW "+new Intl.NumberFormat().format(total_price);
		document.getElementById("total_halin").innerText="KRW "+new Intl.NumberFormat().format(total_halin);
		document.getElementById("total_baefee").innerText="KRW "+new Intl.NumberFormat().format(total_baefee);
		document.getElementById("total_pay").innerText="KRW "+new Intl.NumberFormat().format(total_price - total_halin + total_baefee);
	}
	
	/* 장바구니의 초기상태 : 전부체크 및  모든 상품 값을 계산하기 */
	window.onload=function(){
		document.getElementById("mainck").checked=true;
		let len=document.getElementsByClassName("subck").length;
		let exprice=[${arrprice}];
		let exhalin=[${arrhalin}];
		let exsu=[${arrsu}];
		let exbaefee=[${arrbaefee}];
		let total_price="";
		let total_halin="";
		let total_baefee="";
		for(i=0;i<len;i++) {
			document.getElementsByClassName("subck")[i].checked=true;
			total_price=parseInt(total_price + (exprice[i] * exsu[i]));
			total_halin=parseInt(total_halin + ((exprice[i] * (exhalin[i] / 100)) * exsu[i]));
			total_baefee=parseInt(total_baefee + exbaefee[i]);
		}
		document.getElementById("total_price").innerText="KRW "+new Intl.NumberFormat().format(total_price);
		document.getElementById("total_halin").innerText="KRW "+new Intl.NumberFormat().format(total_halin);
		document.getElementById("total_baefee").innerText="KRW "+new Intl.NumberFormat().format(total_baefee);
		document.getElementById("total_pay").innerText="KRW "+new Intl.NumberFormat().format(total_price - total_halin + total_baefee);
	}
	
	/* 수량을 변경하면 [주문금액]과 체크된 [상품금액합계&할인금액합계&배송비&결제금액]을 변하게 하기 */
	/*function change_total(su, price, halin, num){
		let total=parseInt(price * su);
		if(halin != 0)
			total=parseInt((price - (price * (halin / 100))) * su);
		total=new Intl.NumberFormat().format(total);
		document.getElementsByClassName("total")[num].innerText="KRW "+total;
		
		let total_price="";
		let total_halin="";
		let total_baefee="";
		let total_pay="";
		let len=document.getElementsByClassName("subck").length;	// subck의 개수를 구하기
		for(i=0;i<len;i++) {
			if(document.getElementsByClassName("subck")[i].checked) {	// 체크가 됐다면
				total_price=total_price+parseInt(document.getElementsByClassName("total")[i].innerText);
			}
		}
		console.log(total_price);
	}*/
	
	function change_total(su, num){
		let len=document.getElementsByClassName("subck").length;
		let exprice=[${arrprice}];
		let exhalin=[${arrhalin}];
		let exbaefee=[${arrbaefee}];
		let prict="";
		let total_price="";
		let total_halin="";
		let total_baefee="";
		
		price=parseInt(exprice[num] * su);
		if(exhalin[num] != 0)
			price=parseInt((exprice[num] - (exprice[num] * (exhalin / 100))) * su);
		document.getElementsByClassName("total")[num].innerText="KRW "+new Intl.NumberFormat().format(price);
		
		for(i=0;i<len;i++) {
			total_price=parseInt(total_price + (exprice[i] * su));
			total_halin=parseInt(total_halin + ((exprice[i] * (exhalin[i] / 100)) * su));
			total_baefee=parseInt(total_baefee + exbaefee[i]);
		}
		
		document.getElementById("total_price").innerText="KRW "+new Intl.NumberFormat().format(total_price);
		document.getElementById("total_halin").innerText="KRW "+new Intl.NumberFormat().format(total_halin);
		document.getElementById("total_baefee").innerText="KRW "+new Intl.NumberFormat().format(total_baefee);
		document.getElementById("total_pay").innerText="KRW "+new Intl.NumberFormat().format(total_price - total_halin + total_baefee);
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
	
	/* 선택상품 장바구니 삭제하기 */
	function cart_del(){
		/* 체크된 상품을 삭제 → 체크된 상품의 cart.id들을 '구분자'를 통해 '문자열의 형태'로 만들어서 [delid]에 담아 전송하기 */
		let del="";
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;
		for(i=0;i<len;i++) {
			if(subck[i].checked)
				del=del+document.getElementsByClassName("subck")[i].value+",";
		}
		location="cart_del?delid="+del;	// delid=삭제할id,삭제할id,삭제할id, → 마지막 구분자(콤마)는 신경X		
	}
	
	/* 1개상품 구매하기 */
	function one_gumae(pcode, num){
		let su=document.getElementsByClassName("su")[num].value;		
		location="pro_gumae?pcode="+pcode+"&su="+su+"&gchk=1";
	}
	
	/* 선택상품 구매하기 */
	function sel_gumae(){
		/* 체크된 상품의 pcode, su를 구분자(,)로 구분하여 하나의 문자열로 생성하기 */
		let pcode="";
		let su="";
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;
		for(i=0;i<len;i++) {
			if(subck[i].checked) {
				pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
				su=su+document.getElementsByClassName("su")[i].value+",";
			}
		}
		location="pro_gumae?pcode="+pcode+"&su="+su+"&gchk=1";
	}
	
	/* 전체상품 구매하기 */
	function all_gumae(){
		/* 상품을 전체 체크시키고, pcode와 su를 구분자(,)로 구분하여 하나의 문자열로 생성하기 */
		let pcode="";
		let su="";
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;
		
		document.getElementById("mainck").checked=true;
		for(i=0;i<len;i++) {
			document.getElementsByClassName("subck")[i].checked=true;
		}

		for(i=0;i<len;i++) {
			if(subck[i].checked) {
				pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
				su=su+document.getElementsByClassName("su")[i].value+",";
			}
		}
		location="pro_gumae?pcode="+pcode+"&su="+su+"&gchk=1";
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	    <div class="bradcam_area eshop1">
	        <h3> 장 바 구 니 </h3>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 장바구니 Area Start ================= -->
    <div id="cart">
		<table width="1000" align="center" border="1">
			<tr>
				<th height="50"> <input type="checkbox" onclick="allcheck(this.checked)" id="mainck"> </th>
				<th colspan="2">상품정보</th>
				<th>상품금액</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>배송비</th>
				<th>주문</th>
			</tr>
			<c:forEach var="cvo" items="${clist}" varStatus="cart">
			<input type="hidden" class="pcode" value="${cvo.pcode}">
			<tr>
				<td> <input type="checkbox" class="subck" onclick="subcheck()" value="${cvo.id}"> </td> <!-- 체크박스 -->
				<td colspan="2">	<!-- 상품정보(이미지, 상품명) -->
					<img src="../img/eshop/${cvo.fimg}" width="80" height="80" id="main_fimg">
					${cvo.title}
				</td>
				<!-- 상품금액 -->
				<td class="price">
					<c:if test="${cvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${cvo.price - (cvo.price * (cvo.halin / 100))}" pattern=",###" /> </span>
					</c:if>
					<c:if test="${cvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${cvo.price}"/> </span>
					</c:if>
				</td>
				<!-- 수량 -->
				<%-- <td> <input type="number" name="su" min="1" max="${cvo.psu}" value="${cvo.su}" onchange="change_total(this.value, '${cvo.price}', '${cvo.halin}', ${cart.index})" class="su"> </td> --%>
				<td> <input type="number" name="su" min="1" max="${cvo.psu}" value="${cvo.su}" onchange="change_total(this.value, ${cart.index})" class="su"> </td>
				<td class="total">	<!-- 주문금액 -->
					<c:if test="${cvo.halin != 0}">	<!-- 할인하는 경우 -->
						KRW <span class="price_text1"> <fmt:formatNumber value="${(cvo.price - (cvo.price * (cvo.halin / 100))) * cvo.su}" pattern=",###" /> </span>
					</c:if>
					<c:if test="${cvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${cvo.price * cvo.su}"/> </span>
					</c:if>
				</td>
				<!-- 배송비 -->
				<td class="baefee">
					<c:if test="${cvo.baefee == 0}">
						무료
					</c:if>
					<c:if test="${cvo.baefee != 0}">
						KRW <fmt:formatNumber value="${cvo.baefee}"/>
					</c:if>
				</td>
				<td>	<!-- 1개 주문 or 삭제하기 -->
					<span onclick="one_gumae('${cvo.pcode}', ${cart.index})"> 주문하기 </span>
					<span onclick="location='cart_del?delid=${cvo.id},'"> 삭제하기 </span>
				</td>
			</tr>
			</c:forEach>
			<tr>
				<th colspan="8" height="60"> <span onclick="cart_del()"> 선택상품 삭제하기 </span> </th>
			</tr>
			<tr>
				<th colspan="8" height="80">
					상품 금액 합계 <span id="total_price"></span> - 할인 금액 합계 <span id="total_halin"></span> + 배송비 <span id="total_baefee"></span> = 총 결제금액 <span id="total_pay"></span>
				</th>
			</tr>
			<tr>
				<th colspan="8" height="80">
					<span onclick="location='eshop'"> 계속 쇼핑하기 </span>
					<span onclick="sel_gumae()"> 선택상품 주문하기 </span>
					<span onclick="all_gumae()"> 전체상품 주문하기 </span>
				</th>
			</tr>
		</table>
	</div>
    <!-- ================ 장바구니 Area End ================= -->

</body>