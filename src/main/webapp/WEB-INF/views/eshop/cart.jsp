<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${clist.size()}"/>
	<c:if test="${size <= 4}">
		<c:set var="height" value="1000"/>
	</c:if>
	<c:if test="${size > 4}">
		<c:set var="height" value="${ ((size-4) * 100) + 1000 }"/>
	</c:if>
<style>
	#cart {
		width : 1100px;
		height : ${height}px;
		margin : auto;
		margin-top : 80px;
	}
	#cart #spinner {
		border : 1px solid lightgray;
		outline : none;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
	}
	#cart #button1 {
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
	#cart #button2 {
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
	#cart #button11 {
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
	#cart #button22 {
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
	#cart #button3 {
		float : right;
		width : 150px;
		height : 30px;
		padding-top : 5px;
		border : 1px solid lightgray;
		color : #887159;
		font-size : 13px;
		font-weight : normal;
		cursor : pointer;
	}
	#cart #cate1 {
		margin : auto;
		text-align : center;
		margin-top : 50px;
		width : 605px;
		height : 80px;
	}
	#cart #cate2 {
		display : inline-block;
		width : 300px;
		height : 50px;
		padding-top : 12px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
		letter-spacing : 2px;
	}
	#cart #cate3 {
		display : inline-block;
		width : 300px;
		height : 50px;
		padding-top : 12px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
		letter-spacing : 2px;
	}
	#cart #sum {
		font-family : TimesNewRoman;
	}
	#cart table th {
		text-align : center;
		background : #f9f4ee;
	}
	#cart table tr:first-child th {
		border-top : 1px solid #887159;
		background : #f9f4ee;
		padding-top : 6px;
	}
	#cart table td {
		text-align : center;
		height : 100px;
		border-bottom : 1px solid #ececec;
	}
	#cart table tr td:nth-child(2) {
		text-align : left;
	}
	#cart #mainck {
		accent-color : #887159;
		width : 17px;
		height : 17px;
	}
	#cart #subck {
		accent-color : #887159;
		width : 15px;
		height : 15px;
	}
	#cart #su {
		width : 50px;
		height : 25px;
		border : 1px solid lightgray;
		outline : none;
	}
	#cart #ptext {
		font-weight : normal;
		font-size : 15px;
		color : gray;
	}
	#cart #pnum {
		font-size : 18px;
	}
	#cart #paynum {
		display : inline-block;
		font-size : 35px;
		/*color : #887159;*/
	}
	#cart #sign {
		font-weight : normal;
		font-size : 50px;
		color : gray;
	}
	#cart #pouter1 {
		display : inline-block;
	}
	#cart #pouter2 {
		display : inline-block;
		width : 80px;
	}
	#cart #pouter3 {
		display : inline-block;
		line-height : 170%;
	}
	#cart #show_mb {
		margin : auto;
		width : 1000px;
		height : 82px;
		padding : 18px 10px 0px 20px;
		border : 1px solid lightgray;
	}
	#cart #msg {
		float : left;
		font-size : 14px;
	}
	#cart #box {
		float : right;
	}
	#cart #box #memin {
		display : inline-block;
		width : 150px;
		height : 37px;
		padding-top : 6px;
		text-align : center;
		margin-right : 10px;
		border : 1px solid black;
		cursor : pointer;
	}
	#cart #box #login {
		display : inline-block;
		width : 150px;
		height : 37px;
		padding-top : 6px;
		text-align : center;
		border : 1px solid black;
		background : black;
		color : white;
		cursor : pointer;
	}
	#cart #ptitle {
		cursor : pointer;
		padding-left : 5px;
	}
	#cart #ptitle:hover {
		text-decoration : underline;
	}
</style>
<script>
	window.onload=function(){
		let exprice=[${arrprice}];
		let exhalin=[${arrhalin}];
		let exsu=[${arrsu}];
		let exbaefee=[${arrbaefee}];
		let total_price="";
		let total_halin="";
		let total_baefee="";
		
		document.getElementById("mainck").checked=true;
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;
	
		for(i=0;i<len;i++) {
			subck[i].checked=true;
			total_price=parseInt(total_price + (exprice[i] * exsu[i]));
			total_halin=parseInt(total_halin + ((exprice[i] * (exhalin[i] / 100)) * exsu[i]));
			total_baefee=parseInt(total_baefee + exbaefee[i]);
		}
		
		document.getElementById("total_price").innerText=new Intl.NumberFormat().format(total_price);
		document.getElementById("total_halin").innerText=new Intl.NumberFormat().format(total_halin);
		document.getElementById("total_baefee").innerText=new Intl.NumberFormat().format(total_baefee);
		document.getElementById("total_pay").innerText=new Intl.NumberFormat().format(total_price - total_halin + total_baefee);
		
		if(${p == 'p01'}) {
			document.getElementById("cate2").style.background="#887159";
			document.getElementById("cate2").style.color="white";
		}
		else if(${p == 'p02'}) {
			document.getElementById("cate3").style.background="#887159";
			document.getElementById("cate3").style.color="white";
		}
	}
	
	function change_total(su, num){
		let exprice=[${arrprice}];
		let exhalin=[${arrhalin}];
		let exbaefee=[${arrbaefee}];
		let price="";
		let total_price="";
		let total_halin="";
		let total_baefee="";
	
		price=parseInt(exprice[num] * su);
		if(exhalin[num] != 0)
			price=parseInt((exprice[num] - (exprice[num] * (exhalin[num] / 100))) * su);
		document.getElementsByClassName("total")[num].innerText="KRW "+new Intl.NumberFormat().format(price);
		
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;
		for(i=0;i<len;i++) {
			if(subck[i].checked) {
				total_price=parseInt(total_price + (exprice[i] * document.getElementsByClassName("su")[i].value));
				total_halin=parseInt(total_halin + ((exprice[i] * (exhalin[i] / 100)) * document.getElementsByClassName("su")[i].value));
				total_baefee=parseInt(total_baefee + exbaefee[i]);
			}
		}
		
		document.getElementById("total_price").innerText=new Intl.NumberFormat().format(total_price);
		document.getElementById("total_halin").innerText=new Intl.NumberFormat().format(total_halin);
		document.getElementById("total_baefee").innerText=new Intl.NumberFormat().format(total_baefee);
		document.getElementById("total_pay").innerText=new Intl.NumberFormat().format(total_price - total_halin + total_baefee);
	}
	
	function allcheck(ck){
		let exprice=[${arrprice}];
		let exhalin=[${arrhalin}];
		let exbaefee=[${arrbaefee}];
		let total_price="";
		let total_halin="";
		let total_baefee="";
		
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;		
		for(i=0;i<len;i++) {
			if(ck)	
				subck[i].checked=true;
			else
				subck[i].checked=false;
			
			if(subck[i].checked) {
				total_price=parseInt(total_price + (exprice[i] * document.getElementsByClassName("su")[i].value));
				total_halin=parseInt(total_halin + ((exprice[i] * (exhalin[i] / 100)) * document.getElementsByClassName("su")[i].value));
				total_baefee=parseInt(total_baefee + exbaefee[i]);				
			}
		}
		
		document.getElementById("total_price").innerText=new Intl.NumberFormat().format(total_price);
		document.getElementById("total_halin").innerText=new Intl.NumberFormat().format(total_halin);
		document.getElementById("total_baefee").innerText=new Intl.NumberFormat().format(total_baefee);
		document.getElementById("total_pay").innerText=new Intl.NumberFormat().format(total_price - total_halin + total_baefee);
	}
	
	function subcheck(){
		let exprice=[${arrprice}];
		let exhalin=[${arrhalin}];
		let exbaefee=[${arrbaefee}];
		let total_price="";
		let total_halin="";
		let total_baefee="";
		
		let chk=0;
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;			
		for(i=0;i<len;i++) {
			if(subck[i].checked) {
				chk++;
				
				total_price=parseInt(total_price + (exprice[i] * document.getElementsByClassName("su")[i].value));
				total_halin=parseInt(total_halin + ((exprice[i] * (exhalin[i] / 100)) * document.getElementsByClassName("su")[i].value));
				total_baefee=parseInt(total_baefee + exbaefee[i]);				
			}
		}
		
		document.getElementById("total_price").innerText=new Intl.NumberFormat().format(total_price);
		document.getElementById("total_halin").innerText=new Intl.NumberFormat().format(total_halin);
		document.getElementById("total_baefee").innerText=new Intl.NumberFormat().format(total_baefee);
		document.getElementById("total_pay").innerText=new Intl.NumberFormat().format(total_price - total_halin + total_baefee);
		
		if(chk == len)
			document.getElementById("mainck").checked=true;
		else
			document.getElementById("mainck").checked=false;
	}
	
	function cart_del(){
		let del="";
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;
		for(i=0;i<len;i++) {
			if(subck[i].checked)
				del=subck[i].value+","+del;
		}
		location="wishcart_del?delid="+del+"&dchk=2&p=${p}";	
	}
	
	function one_gumae(pcode, num){
		let su=document.getElementsByClassName("su")[num].value;
		
		let total_price=parseInt(document.getElementsByClassName("cost")[num].value * su);
		let total_halin=parseInt(document.getElementsByClassName("halin")[num].value * su);
		let total_baefee=document.getElementsByClassName("baefee")[num].innerText;
		let total_pay=parseInt(total_price - total_halin);
		
		if(total_baefee != "??????") {
			total_baefee=total_baefee.substring(4, total_baefee.length);
			total_baefee=parseInt(total_baefee.replace(/,/g, ""));;
			total_pay=parseInt(total_price - total_halin + total_baefee);
		}
		else
			total_baefee=0;
		
		location="pro_gumae?pcode="+pcode+"&su="+su+"&gchk=1&p=${p}&total_price="+total_price+"&total_halin="+total_halin+"&total_baefee="+total_baefee+"&total_pay="+total_pay;
	}
	
	function gumae(n){
		let pcode="";
		let su="";
		let subck=document.getElementsByClassName("subck");
		let len=subck.length;
		
		if(n == 2) {
			document.getElementById("mainck").checked=true;
			for(i=0;i<len;i++) {
				subck[i].checked=true;
			}
		}
		
		for(i=0;i<len;i++) {
			if(subck[i].checked) {
				pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
				su=su+document.getElementsByClassName("su")[i].value+",";
			}
		}
		
		let total_price=document.getElementById("total_price").innerText;
			total_price=total_price.replace(/,/g, "");
		let total_halin=document.getElementById("total_halin").innerText;
			total_halin=total_halin.replace(/,/g, "");
		let total_baefee=document.getElementById("total_baefee").innerText;
			total_baefee=total_baefee.replace(/,/g, "");
		let total_pay=document.getElementById("total_pay").innerText;
			total_pay=total_pay.replace(/,/g, "");
			
		location="pro_gumae?pcode="+pcode+"&su="+su+"&gchk=1&p=${p}&total_price="+total_price+"&total_halin="+total_halin+"&total_baefee="+total_baefee+"&total_pay="+total_pay;
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
	    <div class="bradcam_area eshop1">
	        <div id="h3" onclick="location='cart?p=${p}'" style="cursor:pointer;"> C A R T </div>
	    </div>
    <!-- ================ (Sitemesh) Top Area ????????? End ================= -->


	<!-- ================ ???????????? Area Start ================= -->
    <div id="cart">
    	<c:if test="${userid == null}">
	    	<div id="show_mb">
	    		<div id="msg"> ??????????????? ??? ?????? ?????? ??? ??????????????? ???????????? ????????? ????????? ??? ????????????.<br>???????????? ??? ????????? ????????? ???????????? ???????????????. </div>
	    		<div id="box">
	    			<div id="memin" onclick="location='../member/member_input'"> ???????????? </div>
	    			<div id="login" onclick="location='../login/login?ck=3&p=${p}'"> ????????? </div>
	    		</div>
	    	</div>
    	</c:if>
  		<c:if test="${p == 'p01'}">
    		<div id="cate1">
				<span id="cate2" onclick="location='cart?p=p01'"> ??? ??? ??? ??? <span id="sum">[${sum1}]</span> </span><span id="cate3" onclick="location='cart?p=p02'"> ??? ??? ??? ??? ??? <span id="sum">[${sum2}]</span> </span>
			</div>
		</c:if>
		<c:if test="${p == 'p02'}">
			<div id="cate1">
				<span id="cate2" onclick="location='cart?p=p01'"> ??? ??? ??? ??? <span id="sum">[${sum1}]</span> </span><span id="cate3" onclick="location='cart?p=p02'"> ??? ??? ??? ??? ??? <span id="sum">[${sum2}]</span> </span>
			</div>
		</c:if>
		<table width="1000" align="center" cellpadding="0">
			<tr>
				<th height="50" width="50"> <input type="checkbox" onclick="allcheck(this.checked)" id="mainck"> </th>
				<th colspan="2" width="270">???????????? </th>
				<th width="150">????????????</th>
				<th width="70">??????</th>
				<th width="180">????????????</th>
				<th width="100">?????????</th>
				<th width="120">??????</th>
			</tr>
		<c:if test="${clist.size() < 1}">
			<tr>
				<td colspan="80"> <div style="height:200px;padding-top:90px;"> ????????? ????????? ????????????.</div> </td>
			</tr>
		</c:if>
		<c:forEach var="cvo" items="${clist}" varStatus="cart">
			<input type="hidden" class="pcode" value="${cvo.pcode}">
			<input type="hidden" class="halin" value="${cvo.price * (cvo.halin / 100)}">
			<tr class="cktr">
				<!-- ???????????? -->
				<td> <input type="checkbox" class="subck" onclick="subcheck()" value="${cvo.id}" id="subck"> </td>
				<!-- ????????????(?????????, ?????????) -->
				<td colspan="2" style="padding-left:10px;">
					<img src="../img/eshop/${cvo.fimg}" width="80" height="80" id="main_fimg" onclick="location='pro_content?pcode=${cvo.pcode}'" style="cursor:pointer;">
					<span onclick="location='pro_content?pcode=${cvo.pcode}'" id="ptitle"> ${cvo.title} </span>
				</td>
				<!-- ???????????? -->
				<td class="price">
					<c:if test="${cvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${cvo.price - (cvo.price * (cvo.halin / 100))}" pattern=",###" /> </span>
					</c:if>
					<c:if test="${cvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${cvo.price}"/> </span>
					</c:if>
				</td>
				<!-- ?????? -->
				<%-- <td> <input type="number" name="su" min="1" max="${cvo.psu}" value="${cvo.su}" onchange="change_total(this.value, '${cvo.price}', '${cvo.halin}', ${cart.index})" class="su"> </td> --%>
				<td> <input type="number" name="su" min="1" max="${cvo.psu}" value="${cvo.su}" onchange="change_total(this.value, ${cart.index})" class="su" id="su"> </td>
				<td class="total">	<!-- ???????????? -->
					<c:if test="${cvo.halin != 0}">	<!-- ???????????? ?????? -->
						KRW <span class="price_text1"> <fmt:formatNumber value="${(cvo.price - (cvo.price * (cvo.halin / 100))) * cvo.su}" pattern=",###" /> </span>
					</c:if>
					<c:if test="${cvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${cvo.price * cvo.su}"/> </span>
					</c:if>
				</td>
				<!-- ????????? -->
				<td class="baefee">
					<c:if test="${cvo.baefee == 0}">
						??????
					</c:if>
					<c:if test="${cvo.baefee != 0}">
						KRW <fmt:formatNumber value="${cvo.baefee}"/>
					</c:if>
				</td>
				<td>	<!-- 1??? ?????? or ???????????? -->
					<div onclick="one_gumae('${cvo.pcode}', ${cart.index})" id="button1"> ???????????? </div>
					<div onclick="location='wishcart_del?delid=${cvo.id},&dchk=2&p=${p}'" id="button2"> ???????????? </div>
				</td>
			</tr>
			
				<input type="hidden" name="cost" value="${cvo.price}" class="cost">
					
		</c:forEach>
			<tr>
				<td colspan="8" style="height:50px;padding-top:10px;padding-bottom:20px;"> <div onclick="cart_del()" id="button3"> ???????????? ???????????? </div> </td>
			</tr>
			<tr>
				<th colspan="8" height="100" style="border-top:2px solid #887159;border-bottom:none;">
					<div id="pouter1"><span id="ptext"> ???????????? </span> <br>
					<span id="pnum"> KRW <span id="total_price"></span> </span> </div>
					<div id="pouter2"><span id="sign"> - </span> </div>
					<div id="pouter1"><span id="ptext"> ???????????? </span> <br>
					<span id="pnum"> KRW <span id="total_halin"></span> </span> </div>
					<div id="pouter2"><span id="sign"> + </span> </div>
					<div id="pouter1"><span id="ptext"> ????????? </span> <br>
					<span id="pnum"> KRW <span id="total_baefee"></span> </span> </div>
					<div id="pouter2"><span id="sign"> = </span> </div>
					<div id="pouter3"><span id="ptext"> ??? ???????????? </span> <br>
					<span id="paynum"> KRW <span id="total_pay"></span> </span> </div>
				</th>
			</tr>
			<tr>
				<td colspan="8" style="border-bottom:none;">
					<span onclick="location='eshop'" id="button22" style="float:left;"> ?????? ???????????? </span>
					<span onclick="gumae(2)" id="button11" style="float:right;"> ???????????? ?????? </span>
					<span onclick="gumae(1)" id="button22" style="float:right;"> ???????????? ?????? </span>					
				</td>
			</tr>
		</table>
	</div>
    <!-- ================ ???????????? Area End ================= -->

</body>