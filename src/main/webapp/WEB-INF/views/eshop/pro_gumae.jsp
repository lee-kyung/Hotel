<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${plist.size()}"/>
	<c:if test="${size <= 1}">
		<c:set var="height" value="2000"/>
	</c:if>
	<c:if test="${size > 5}">
		<c:set var="height" value="${ ((size-4) * 100) + 800 }"/>
	</c:if>
<style>
	#pro_gumae {
		width : 1000px;
		height : ${height}px;
		margin : auto;
		margin-top : 50px;
	}
	#pro_gumae b {
		color : black;
	}
	/*#pro_gumae {
		color : #887159;
		font-family : 돋움;
	}*/
	#pro_gumae prosec table {
		width: 580px;
		height: 80px;
		margin-bottom: 30px;
	}
	#pro_gumae prosec table tr td:first-child  {
		width : 150px;
		height : 70px;
	}
	#pro_gumae prosec input[type=text] {
		width: 450px;
		height: 50px;
		border: 1px solid #887159;
		outline : none;
		padding-left : 10px;
	}
	#pro_gumae prosec #outer {
		outline:1px solid #887159;
		width: 1000px;
	}
	#pro_gumae prosec #outer #title {
		height : 30px;
		margin-top : 30px;
		margin-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
	#pro_gumae prosec #outer #left {
		float: left;
		width: 600px;
		padding-left : 20px;
	}
	#pro_gumae prosec #outer #left #bzip {
		width: 250px;
		height: 50px;
		border: 1px solid #887159;
		outline : none;
	}
	#pro_gumae prosec #outer #left #zip_btn {
		width: 200px;
		height: 50px;
		border: 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#pro_gumae prosec #outer #right {
		background: #f9f9f9; 
		width: 350px;
		height: 780px;
		float: right;
		margin-left: 5px;
	}
	#pro_gumae prosec #outer #right #total {
		margin-left : 25px;
		width : 300px;		
		height : 40px;
		font-size : 15px;
	}
	#pro_gumae prosec #outer #right #total_p {
		float : right;
		margin-right : 25px;
		text-align : right;
		width : 300px;		
		height : 40px;
		font-size : 22px;
	}
	#pro_gumae prosec #outer #right #btns {
		width : 350px;
		text-align : center;
		margin-top : 100px;
	}
	#pro_gumae prosec #outer #right #paymentBtn {
		width: 150px;
		height: 50px;
		border: 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#pro_gumae prosec #outer #right #gobackBtn {
		width: 150px;
		height: 50px;
		border: 1px solid #887159;
		background : white;
		color : #887159;
		cursor : pointer;
	}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	/* 우편번호 버튼 클릭시 호출되는 함수 */
	function juso_search() {
		new daum.Postcode({
			oncomplete: function(data) {
				if (data.userSelectedType === 'R')	// 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				else	// 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
	
				/* 우편번호와 주소 정보를 해당 필드에 넣기 */
				document.gumae.bzip.value = data.zonecode; // 우편번호
				document.gumae.bjuso.value = addr;  // 주소
				/* 커서를 상세주소 필드로 이동하기 */
				document.gumae.bjuso_etc.focus();
			}
		}).open();
	}
	
	function goBack(){
		history.back();
	}
	
	function getInfo(ck){
		if(${userid == null}) {
			if(ck == true) {
				document.getElementById("bname").value=document.getElementById("pname").value;
				document.getElementById("bphone").value=document.getElementById("pphone").value;
			}
			else {
				document.getElementById("bname").value="";
				document.getElementById("bphone").value="";	
			}
		}
		
		if(${userid != null}) {
			if(ck == true) {
				document.getElementById("bname").value="${mvo.name}";
				document.getElementById("bphone").value="${mvo.phone}";
				document.getElementById("bzip").value="${mvo.zip}";
				document.getElementById("bjuso").value="${mvo.juso}";
				document.getElementById("bjuso_etc").value="${mvo.juso_etc}";
			}
			else {
				document.getElementById("bname").value="";
				document.getElementById("bphone").value="";
				document.getElementById("bzip").value="";
				document.getElementById("bjuso").value="";
				document.getElementById("bjuso_etc").value="";
			}
		}
	}
</script>
</head>
<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
		<div class="bradcam_area basic">
	        <h3> 주문/결제 </h3>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
    
	<!-- ================ 주문/결제 Area Start ================= -->
	<section id="pro_gumae">
	<form name="gumae" method="post" action="pro_gumae_ok">
	<input type="hidden" name="gchk" value="${gchk}">
		<!-- 주문상품확인 start -->
		<h3> 주문상품 확인 </h3>
		<table width="1000" align="center" border="1">
			<tr>
				<th colspan="2">상품정보</th>
				<th>상품금액</th>
				<th>수량</th>
				<th>주문금액</th>
				<th>배송비</th>
			</tr>
			
				<c:set var="cpcode" value=""/>
				<c:set var="csu" value=""/>
				<c:set var="ctotal" value=""/>
			
			<c:forEach var="pvo" items="${plist}">
			<tr>
				<!-- 상품정보(이미지, 상품명) -->
				<td colspan="2">
					<img src="../img/eshop/${pvo.img}" width="80" height="80" id="main_fimg">
					${pvo.title}
				</td>
				<!-- 상품금액 -->
				<td>
					<c:if test="${pvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",###"/> </span>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price}" pattern=",###"/> </span>
					</c:if>
				</td>	
				<!-- 수량 -->
				<td> ${pvo.su} </td>
				<!-- 주문금액 -->
				<td>
					<c:if test="${pvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) * pvo.su}" pattern=",###"/> </span>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price * pvo.su}" pattern=",###"/> </span>
					</c:if>
				</td>
				<!-- 배송비 -->
				<td>
					<c:if test="${pvo.baefee == 0}">
						무료
					</c:if>
					<c:if test="${pvo.baefee != 0}">
						KRW <fmt:formatNumber value="${pvo.baefee}"/>
					</c:if>
				</td>
			</tr>
			
				<fmt:formatNumber var="cimsi" value="${(pvo.price * pvo.su) - (pvo.price * (pvo.halin / 100) * pvo.su) + pvo.baefee}" pattern="###"/>
			
				<c:set var="cpcode" value="${cpcode += pvo.pcode += ','}"/>
				<c:set var="csu" value="${csu += pvo.su += ','}"/>
				<c:set var="ctotal" value="${ctotal += cimsi += ','}"/>
			
			</c:forEach>
		</table>
		<!-- 주문상품확인 end -->
		
		<!-- pro_gumae_ok에 배열로 보낼 정보 start -->
		<input type="hidden" name="pcode" value="${cpcode}">
		<input type="hidden" name="su_imsi" value="${csu}">
		<input type="hidden" name="price_imsi" value="${ctotal}">
		<!-- pro_gumae_ok에 배열로 보낼 정보 end -->
		
		<!-- 주문서작성 start -->
	<div class="features_room">
	<div class="container">
    <div class="row">
    <prosec>
    	<h3> 주문서 작성 </h3>
    	<div id="outer">
  		<div id="left">
 			<div id="title"><b style="font-size:20px;"> 주문자 정보 입력 </b></div>
 			<table>
 				<tr> 
 					<td> 주문자명* </td>
 					<td>
 						<c:if test="${userid == null}">
 							<input type="text" name="pname" placeholder="이름을 입력하세요." id="pname">
 						</c:if>
 						<c:if test="${userid != null}">
 							<input type="text" name="pname" value="${mvo.name}" placeholder="이름을 입력하세요.">
 						</c:if>
 					</td>
 				</tr>
 				<tr>
 					<td> 연락처* </td>
 					<td>
 						<c:if test="${userid == null}">
 							<input type="text" name="pphone" placeholder="연락처를 입력하세요." id="pphone">
 						</c:if>
 						<c:if test="${userid != null}">
 							<input type="text" name="pphone" value="${mvo.phone}" placeholder="연락처를 입력하세요.">
 						</c:if>
 					</td>
 				</tr>
 				<tr>
 					<td> 이메일* </td>
 					<td>
 						<c:if test="${userid == null}">
 							<input type="text" name="pemail"  placeholder="이메일을 입력하세요.">
 						</c:if>
 						<c:if test="${userid != null}">
 							<input type="text" name="pemail" value="${mvo.email}" placeholder="연락처를 입력하세요.">
 						</c:if>
 					</td>
 				</tr>
 			</table>
 		<c:if test="${p == 'p01'}">
 			<div id="title" style="margin-top:50px;"><b style="float:left;font-size:20px;"> 배송지 정보 입력 </b>
 				<c:if test="${userid == null}">
 					<span style="float:right;"><input type="checkbox" name="same_info" onclick="getInfo(this.checked)"> 주문자와 동일 </span>
 				</c:if>
 				<c:if test="${userid != null}">
 					<span style="float:right;"><input type="checkbox" name="same_info" onclick="getInfo(this.checked)"> 회원정보와 동일 </span>
 				</c:if>
 			</div>
 			<table>
				<tr> 
 					<td> 받는 사람* </td>
 					<td> <input type="text" name="bname" placeholder="이름을 입력하세요." id="bname"> </td>
 				</tr>
 				<tr>
 					<td> 연락처* </td>
 					<td> <input type="text" name="bphone" placeholder="연락처를 입력하세요." id="bphone"> </td>
 				</tr>
 				<tr>
 					<td> 배송 주소* </td>
 					<td> <input type="text" name="bzip" readonly placeholder="우편번호" id="bzip" onclick="juso_search()" ><input type="button" value="주소검색" onclick="juso_search()" id="zip_btn"> </td>
 				</tr>
 				<tr>
 					<td></td>
 					<td> <input type="text" name="bjuso" readonly placeholder="기본주소" onclick="juso_search()" id="bjuso"> </td>
 				</tr>
 				<tr>
 					<td></td>
 					<td> <input type="text" name="bjuso_etc" placeholder="상세주소를 입력하세요." id="bjuso_etc"> </td>
 				</tr>
 			</table>
 		</c:if>
 		<c:if test="${p == 'p02'}">
		</c:if>
				<div><b>결제 방법</b></div>
				<div id="paymethod">
				
				</div>
				<br>
				<div><b>약관 동의</b></div>
				<div>
					<div style="float:left; width:500px;font-weight:900">비회원주문 개인정보 수집이용 동의</div><div style="float:right;align:right;font-size:12px"><input type="checkbox" name="agree1">동의합니다</div>
				</div><br>
				<div>
					
				</div>
			</div>
		<div id="right">
			<div id="title" style="width:330px;margin-left:10px;"><b style="font-size:20px;"> 결제 정보 </b></div>
				<div id="total"> <span style="float:left;"> 주문금액 </span> <span style="float:right;"> KRW <fmt:formatNumber value="${total_price}" pattern=",###"/> </span> </div>
				<div id="total"> <span style="float:left;"> 할인금액 </span> <span style="float:right;"> KRW <fmt:formatNumber value="${total_halin}" pattern=",###"/> </span> </div>
				<div id="total"> <span style="float:left;"> 배송비 </span> <span style="float:right;"> KRW <fmt:formatNumber value="${total_baefee}" pattern=",###"/> </span> </div>
				<div id="title" style="width:330px;margin-left:10px;"> <b style="font-size:20px;"> 총 결제금액 </b> </div>
				<div id="total_p"> KRW <b style="font-family:TimesNewRoman;"> <fmt:formatNumber value="${total_pay}" pattern=",###"/> </b> </div>
				<div id="btns">					
					<input type="button" id="gobackBtn" value="이전단계" onclick="goBack()">
					<input type="button" id="paymentBtn" value="결제하기" onclick="return check()">
				</div>
		</div>
		</div>
	</prosec>
 	</div>
	</div>
	</div>
		<!-- 주문서작성 end -->	
	</form>
	</section>
	
	<script>
	/* 필수입력 체크후 [결제하기]로 넘어가기 */
	function check()
	{
		if(document.gumae.bname.value.trim() == "") {
			alert("주문자명을 입력하세요.");
			return false;
		}
		else if(document.gumae.bphone.value.trim() == "") {
			alert("주문자의 연락처를 입력하세요.");
			return false;
		}
	
		else if(document.gumae.pname.value.trim() == "") {
			alert("받는 사람을 입력하세요.");
			return false;
		}
		else if(document.gumae.bphone.value.trim() == "") {
			alert("받는 사람의 연락처를 입력하세요.");
			return false;
		}
		else if(document.gumae.bzip.value.trim() == "") {
			alert("주소를 검색하여 우편번호를 입력하세요.");
			return false;
		}
		else if(document.gumae.bjuso.value.trim() == "") {
			alert("주소를 검색하여 기본주소를 입력하세요.");
			return false;
		}
		else if(document.gumae.bjuso_etc.value.trim() == "") {
			alert("상세주소를 입력하세요.");
			return false;
		}

		else if(document.gumae.agree1.checked == false)
		{
			alert("비회원주문 개인정보 수집이용에 대한 동의가 필요합니다.");
			return false;
		}
		else
		{
			document.gumae.submit();
			return true;
		}
	}
  </script>
  
    <!-- ================ 주문/결제 Area End ================= -->

</body>