<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
	<c:set var="size" value="${plist.size()}"/>
	<c:if test="${size <= 1}">
		<c:set var="height" value="2000"/>
		<c:set var="paytop" value="690"/>	<!-- 750 -->
	</c:if>
	<c:if test="${size > 1}">
		<c:set var="height" value="${((size-1) * 100) + 1500}"/>
		<c:set var="paytop" value="${((size-1) * 100) + 690}"/>
	</c:if>
<style>
	#pro_gumae {
		width : 1000px;
		/*height : ${height}px;*/
		margin : auto;
		margin-top : 50px;
		margin-bottom : 200px;
	}
	#pro_gumae b {
		color : black;
	}
	#pro_gumae #pro_table td {
		border-bottom : 1px solid #ececec;
	}
	#pro_gumae prosec table {
		width : 580px;
		height : 80px;
		margin-bottom : 30px;
	}
	#pro_gumae prosec table tr td:first-child  {
		width : 150px;
		height : 70px;
	}
	#pro_gumae prosec input[type=text] {
		width : 450px;
		height : 50px;
		border : 1px solid #887159;
		outline : none;
		padding-left : 10px;
	}
	#pro_gumae prosec #outer {
		outline : 1px solid #887159;
		width : 1000px;
	}
	#pro_gumae prosec #outer #title {
		height : 30px;
		margin-top : 30px;
		margin-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
	#pro_gumae prosec #outer #left {
		float : left;
		width : 600px;
		padding-left : 20px;
	}
	#pro_gumae prosec #outer #left #bzip {
		width : 250px;
		height : 50px;
		border : 1px solid #887159;
		outline : none;
	}
	#pro_gumae prosec #outer #left #zip_btn {
		width : 200px;
		height : 50px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#pro_gumae prosec #outer #left #agree_scroll {
		width : 580px;
		height : 150px;
		margin-top : 10px;
		padding-top : 10px;
		overflow : scroll;
		overflow-x : hidden;
		font-size : 13px;
	}
	#pro_gumae prosec #outer #right {
		border-top : 1px solid #887159;
		background : #f9f4ee;
		width : 350px;
		height : 450px;
		float : right;
		margin-left : 5px;
		position : relative;	/* fixed는 고정, relative는 따라 다님 */
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
	#pro_gumae #ck {
		accent-color : #887159;
	}
</style>
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function juso_search() {
		new daum.Postcode({
			oncomplete: function(data) {
				if (data.userSelectedType === 'R')
					addr = data.roadAddress;
				else
					addr = data.jibunAddress;
	
				document.gumae.bzip.value = data.zonecode;
				document.gumae.bjuso.value = addr;
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
	
	/* #right에 스크롤 기능을 주기 */
	function right_stop(){
		//document.getElementById("abc").innerText=document.documentElement.scrollTop;	// <span id="abc"></span>
		let top=document.documentElement.scrollTop;
		let left=(window.screen.width/2)+137;	//137, 220, (window.screen.width/7)
		
		console.log(window.screen.width/7);
		console.log((window.screen.width/2)+240);
		
		if(${paytop} < top) {
			document.getElementById("right").style.position="fixed";
			document.getElementById("right").style.top="110px";
			document.getElementById("right").style.left=left+"px";
		}
		else if(top <= ${paytop}) {
			document.getElementById("right").style.position="relative";
			document.getElementById("right").style.top="0px";
			document.getElementById("right").style.left="0px";
		}
		/*else {
			document.getElementById("right").style.position="relative";
			document.getElementById("right").style.top=window.screen.height;
			document.getElementById("right").style.left=window.screen.width;
		}*/	
	}
	window.onscroll=right_stop;
</script>
</head>
<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
		<div class="bradcam_area basic">
	        <div id="h3"> O R D E R </div>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
    
	<!-- ================ 주문/결제 Area Start ================= -->
	<section id="pro_gumae">
	<form name="gumae" method="post" action="pro_gumae_ok">
	<input type="hidden" name="gchk" value="${gchk}">
		
		<!-- 주문상품확인 start -->
		<h3> 주문상품 확인 </h3>
		<table width="1000" align="center" cellpadding="0" id="pro_table">
			<tr height="50" style="border-top:1px solid #887159;background:#f9f4ee;text-align:center">
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
			<tr height="100" style="text-align:center;">
				<!-- 상품정보(이미지, 상품명) -->
				<td colspan="2" width="250" style="text-align:left;padding-left:10px;">
					<img src="../img/eshop/${pvo.img}" width="80" height="80" id="main_fimg">
					${pvo.title}
				</td>
				<!-- 상품금액 -->
				<td width="200">
					<c:if test="${pvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price - (pvo.price * (pvo.halin / 100))}" pattern=",###"/> </span>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price}" pattern=",###"/> </span>
					</c:if>
				</td>	
				<!-- 수량 -->
				<td width="70"> ${pvo.su}개 </td>
				<!-- 주문금액 -->
				<td width="200">
					<c:if test="${pvo.halin != 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${(pvo.price - (pvo.price * (pvo.halin / 100))) * pvo.su}" pattern=",###"/> </span>
					</c:if>
					<c:if test="${pvo.halin == 0}">
						KRW <span class="price_text1"> <fmt:formatNumber value="${pvo.price * pvo.su}" pattern=",###"/> </span>
					</c:if>
				</td>
				<!-- 배송비 -->
				<td width="130">
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
	 					<span style="float:right;"><input type="checkbox" name="same_info" onclick="getInfo(this.checked)" id="ck"> 주문자와 동일 </span>
	 				</c:if>
	 				<c:if test="${userid != null}">
	 					<span style="float:right;"><input type="checkbox" name="same_info" onclick="getInfo(this.checked)" id="ck"> 회원정보와 동일 </span>
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
			<c:if test="${userid == null}">
			<div id="title" style="margin-top:50px;"><b style="font-size:20px;"> 약관 동의 </b></div>
				<div style="margin-top:20px;">
					<div style="float:left; width:500px;font-weight:900">
						비회원주문 개인정보 수집이용 동의
					</div>
					<div style="float:right;align:right;font-size:12px">
						<input type="checkbox" name="agree1" id="ck">
						동의합니다
					</div>
				</div>
				<textarea id="agree_scroll">
1.이용약관
※ “ㄹㄷ호텔 이숍”의 이용약관은 공정거래위원회에서 심의한 표준약관에 기반하여 작성 되었습니다.
				
공 정 거 래 위 원 회
표준약관 제10023호 전자상거래(인터넷사이버몰) 표준약관
				
제1조 (목적)
본 약관은 ㄹㄷ호텔 리워즈 멤버십 회원(이하 “회원”)이 ㈜호텔ㄹㄷ(이하 “회사”)가 운영하는 “ㄹㄷ호텔 이숍” 서비스를 이용함에 있어 회원과 회사의 제반 권리, 의무, 관련 절차 등을 규정하는데 그 목적이 있습니다.

제2조 (정의)
본 약관에서 사용하는 주요 용어의 정의는 다음과 같습니다.
1. “ㄹㄷ호텔 이숍”이란 “회사”가 회원 및 비회원에게 유/무상의 다양한 상품 및 서비스를 제공하는 고객 서비스 프로그램을 말합니다. 서비스의 구체적인 내용은 홈페이지를 통하여 공지를 하며 변경이 있는 경우 본 약관 제3조에서 정한 방법으로 이를 회원에게 고지합니다.
2. ‘고객’이란 ㄹㄷ호텔 리워즈 회원 가입 여부를 불문하고 ㄹㄷ호텔 이숍에서 제공하는 상품 또는 서비스를 구입하려 하거나 본 약관에 동의하고 소정의 절차를 거쳐 구입한 자를 말합니다.
3. ‘회원’이란 ㄹㄷ호텔 리워즈 회원 가입 후 “ㄹㄷ호텔 이숍”에서 개인정보수집 동의를 마치고 “ㄹㄷ호텔 이숍” 서비스의 모든 기능을 이용할 수 있는 권한을 부여 받은 고객을 말합니다.
4. ‘영업장’이란 회사에서 운영하는 다양한 혜택의 고객 서비스 프로그램 및 용역 또는 재화를 제공하는 곳을 의미합니다. 회사의 상품이나 서비스를 제공하는 오프라인 매장은 물론이고 회사와 제휴 계약을 체결한 외부 매장도 “영업장”이 될 수 있습니다.
5. 쿠폰이란 회사가 마케팅 목적으로 회원에게 제공하는 혜택으로 “ㄹㄷ호텔 이숍”에서 이벤트 상품을 구매 하거나 기타 이벤트를 참여 할 경우 제공되며 회원이 보유한 쿠폰으로는 상품이나 서비스를 구매하거나 구매시 할인혜택을 제공받을 수 있습니다.
이 약관에서 사용하는 용어 중 본 조에서 정하지 아니한 것은 관계 법령 및 서비스 별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례를 따릅니다.

제3조 (약관의 명시와 개정)
1. “ㄹㄷ호텔 이숍” 은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소, 전화번호, 사업자등록번호, 통신판매업신고번호, 개인정보 보호 책임자 등을 이용자가 쉽게 알 수 있도록 “ㄹㄷ호텔 이숍”의 초기(메인)화면에 게시합니다. 단, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
2. “ㄹㄷ호텔 이숍”이 약관을 개정 할 경우에는 적용 일자 및 개정 사유를 명시하여 현행 약관과 함께 쇼핑몰의 메인화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지하고, 또 약관의 개정이 예정되어 있다는 사실을 다음 중 2가지 이상의 방법으로 통지합니다. 단, 회원에게 불리하게 약관이 변경되는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지 및 통지합니다.
- 회사 직영점 또는 가맹점 내 게시
- 전화연락 또는 휴대폰메시지
- 전자우편을 통한 통보(E-mail)
- 우편 통지 또는 전단고지
- 회사 홈페이지 내 게시
3. 개정된 약관은 그 효력 발생일로부터 유효합니다.
4. “ㄹㄷ호텔 이숍”은 [전자상거래 등에서의 소비자보호에 관한 법률], [전자금융거래법], [전자서명법], [개인정보보호법], [방문판매 등에 관한 법률], [소비자기본법] 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
5. 회원은 약관 개정에 거부할 권리가 있으며, 개정된 약관에 동의하지 않을 경우 약관개정 사실을 통지받은 후 개정 약관의 효력 발생일 이전까지 이용계약을 해지(회원탈퇴)할 수 있습니다. 개정된 약관의 효력 발생일 이후에도 서비스를 계속 이용할 경우 약관의 변경사항에 동의하는 것으로 간주합니다.
6. 본 조의 고지방법은 이 약관에서 달리 규정하지 않는 한, 이 약관의 각 조항에서 규정하는 통보 또는 통지의 경우에 이를 준용합니다.

제4조 (서비스의 제공 및 변경)
1.”ㄹㄷ호텔 이숍”은 다음과 같은 업무를 수행합니다.
1) 재화 또는 용역에 대한 정보 제공 및 상품 판매 등록
2) 판매 등록된 재화 또는 용역의 배송
3) 기타 “ㄹㄷ호텔 이숍”이 정하는 업무
2. “ㄹㄷ호텔 이숍”은 부득이한 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 재화 또는 용역의 내용을 변경 할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공 일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

제5조 (서비스 이용 개시)
1. “ㄹㄷ호텔 이숍” 이 제공하는 서비스는 ㄹㄷ호텔 리워즈 회원 가입 정보로 이용이 가능하며 리워즈 회원이 아닌 경우에도 개인정보 제공에 동의한 후 이용 가능합니다. 회원은 최초 1회 동의만으로 계속 서비스를 이용할 수 있습니다. ㄹㄷ호텔 리워즈 회원 가입/수정/탈퇴는 ㄹㄷ호텔 공식 홈페이지 에서 가능합니다.
2.“ㄹㄷ호텔 이숍”은 상품 구매 단계 이전까지 개인정보수집동의를 완료해야 상품 구매가 가능하며 비동의 할 경우 구입이 불가합니다.
3. 구매내역, 보유쿠폰의 내역 확인은 “ㄹㄷ호텔 이숍” 내 마이 페이지에서 가능하며 비회원의 경우 그 확인에 제한이 있을 수 있습니다. 이는 추후 회사의 사정에 따라 추가 또는 변경될 수 있으며 이 경우 본 약관 제 3조에 규정된 통지방법을 준용하여 별도로 회원에게 고지 합니다.

제6조 (서비스 이용신청 철회)
1. 회원은 언제든지 ㄹㄷ호텔 공식 홈페이지 또는 고객센터를 통하여 서비스 이용신청의 철회를 요청할 수 있으며, 회사는 회원의 탈퇴 요청에 따라 지체 없이 이용 철회에 필요한 제반 절차를 수행합니다.
2. 이용신청의 철회 시 개인정보 및 제공된 쿠폰은 모두 삭제되며 삭제된 정보는 복구되지 않습니다. “회사”의 오프라인 매장에서는 이용 철회를 신청 할 수 없습니다.
3. 회원이 다음 각 호에 해당하는 경우, 회사는 당해 회원의 서비스 이용자격을 상실 시킬 수 있습니다.
1) ㄹㄷ호텔 리워즈 회원 자격이 정지/상실된 경우
2) 다른 회원의 서비스 이용을 부당하게 방해하거나 그 정보를 도용하는 등 관련 법령을 위반하여 전자거래질서를 위협하는 경우
3) 회사 홈페이지 및 가맹점을 이용하여 법령 및 이 약관에서 금지하거나 반하는 행위를 하는 경우
4) 회원 아이디, 포인트 등을 타인과 거래하는 행위를 하는 경우
5) 회사 전산상의 오류를 오류임을 알고서 악용하여 이익을 취득하는 행위를 하는 경우
6) 기타 본 약관상의 의무를 위반한 경우

제7조 (L.POINT 적립 제도)
1. 회원은 “ㄹㄷ호텔 이숍”에서 상품 등의 구매 및 공급을 완료한 후 회사가 정한 적립 기준 등에 따라 회사로부터 L.POINT를 적립 받을 수 있습니다.
2. 제1항에 따라 완료된 상품 등의 구매 및 공급이 취소 또는 철회되거나, 전산시스템의 오류, 또는 기타 비정상적인 방법으로L.POINT가 적립된 경우, 회사는 회원에게 적립한 L.POINT를 회수할 수 있습니다.
3. “ㄹㄷ호텔 이숍” 은 L.POINT 적립만 가능하며 사용은 불가능 합니다. L.POINT와 그 이용내역에 관련한 모든 사항은 ㄹㄷ멤버스(주)가 자신의 권한과 책임으로 관리·운영합니다.
4. L.POINT의 적립에 관련된 기타 상세한 사항은 ㄹㄷ멤버스㈜의 L.POINT 회원약관에 따릅니다.

제8조 (개인정보보호 정책)
1. 회사는 관계법령이 정하는 바에 따라 회원가입정보를 포함한 회원의 개인정보를 보호하기 위하여 노력을 합니다. 회원의 개인정보보호에 관하여 관계법령 및 회사 개인정보처리방침에 정한 바에 따릅니다.
2. 회사는 “ㄹㄷ호텔 이숍”의 상품을 구매하고자 하는 고객의 동의를 얻어 서비스 제공에 필요한 최소한의 정보를 수집하며, 회원가입기간 중 회원제도 운영의 필요에 따라 회원의 동의 또는 법령에서 정한 기준 하에 추가적인 정보의 수집을 할 수 있습니다.
3. 회원은 회사에 제공한 개인정보와 관련하여 변경사항이 있는 경우 지체 없이 회사에 그 변경사실을 통지하여야 합니다. 회원이 변경사실의 통지를 태만히 함으로써 회사로부터의 연락, 통지 또는 문서 등이 연착하거나 도착하지 않아 발생한 손해는 회원이 부담하여야 합니다.

제9조 (서비스 종료)
1. “ㄹㄷ호텔이숍” 서비스를 종료하고자 할 경우, 회사는 서비스를 종료하고자 하는 날 (이하 “서비스 종료일”)로부터 3개월 이전에 본 약관 제3조에 규정된 통지방법을 준용하여 회원에게 통지합니다.
2. 서비스 종료일까지 회사는 제공된 쿠폰 사용을 촉진하는 활동을 적극적으로 하며, 서비스 종료일까지 사용되지 않은 쿠폰은 소멸됩니다.

제 10조 (지식재산권의 귀속 및 이용제한)
1.”ㄹㄷ호텔 이숍”이 작성한 저작물에 대한 저작권 및 기타 지식재산권은 “ㄹㄷ호텔 이숍”에 귀속합니다.
2. 이용자는 “ㄹㄷ호텔 이숍”을 이용함으로써 얻은 정보 중, “ㄹㄷ호텔 이숍”에게 지식재산권이 귀속된 정보를 “ㄹㄷ호텔 이숍”의 사전 승낙없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

제 11조 (면책조항)
1.”ㄹㄷ호텔 이숍”은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공 할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
2. “ㄹㄷ호텔 이숍”은 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.
3. “ㄹㄷ호텔 이숍”은 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며, 그밖의 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.
4. “ㄹㄷ호텔 이숍”은 회원이 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관해서는 책임을 지지 않습니다.

제 12조 (모바일 상품권의 유효기간, 취소 및 환불 정책)
1. “ㄹㄷ호텔 이숍”에서는 기간을 제공하여 일시적으로 생산, 제공, 판매되는 물품 또는 용역을 대상으로 하는 모바일 상품권(레스토랑 이용권, 상품 교환권 등)을 판매합니다. 그 유효기간은 구매일로 부터 93일 이고 정기적 가격인상, 식자재 수급상황에 따른 메뉴변경으로 인해 유효기간의 연장은 제공하지 않습니다.
2. “ㄹㄷ호텔 이숍”의 모바일 쿠폰(레스토랑 이용권 등)의 유효기간이 지난 경우, 자동 취소되며 구매자에게 100% 환불 조치가 이루어 집니다.

제13조 (배송 정책)
1. 배송 소요기간은 고객이 ㄹㄷ호텔 이숍에서 구입한 상품에 대해 대금결제 확인일의 익일을 기산일로 하여 배송이 완료되기까지의 기간을 말합니다.
2. 회사는 고객의 대금 결제일로 부터 3영업일 이내에 배송을 시작 합니다. 단, 고객과 상품 등의 공급시기에 관하여 별도의 약정(상품 등의 공급시기에 관한 상세페이지를 통한 안내 포함)이 있었다면 그 약정에 따릅니다.
3. 천재지변 등 불가항력적인 사유가 발생한 경우 그 해당기간은 배송 소요기간에서 제외됩니다.
4. 주말 및 공휴일은 배송 소요기간에서 제외됩니다.
5. 상품을 배송업체에 인도한 후 배송과 관련하여 고객, 배송업체, 금융기관 등과의 사이에 발생한 분쟁은 당사자들 간의 해결을 원칙으로 하며, 회사는 어떠한 책임도 부담하지 않습니다.
6. 회사는 고객에게 상품 수령 후 일정 기간 내 수취확인을 요청할 수 있습니다. 상품의 발송확인 처리 이후에 고객이 수취확인을 하지 않아 배송중 상태가 지속될 경우, 회사는 발송확인일로부터 2주 이내에 수취확인요청 안내를 할 수 있고, 회사의 안내 이후에도 구매회원의 수취확인이 이루어지지 않을 경우 안내 후 3일이 경과한 시점에 자동으로 배송완료로 전환될 수 있으며 이 경우 실제 고객이 상품을 수령하지 못한 경우에 구매회원은 미수취신고를 할 수 있습니다.

제14조 (취소 정책)
1. 고객은 구매한 상품 등이 발송되기 전까지 취소 요청을 할 수 있으며, 상품이 배송중인 경우에는 취소요청이 아닌 반품절차에 따라 처리됩니다.
2. 회원이 전산상으로 취소 요청한 상품 등이 이미 실제로 배송이 시작되었거나 주문제작(생산)이 시작된 등 특별한 사정이 있는 경우, 판매회원이 구매회원의 취소요청에 대하여 거부하거나 보류할 수 있으며, 이 경우 구매 회원에게 별도로 고지(사이트를 통한 안내 또는 유선연락)합니다.
3. 회원의 상품 구매후 배송을 위한 정보가 충분하지 않거나 매장 수령 예정일 입력 오류 등 정상적인 거래의 이행이 불가능하다고 판단될 경우 상품 구매 건은 강제 취소처리 될 수 있습니다.
4. 취소처리에 따른 환불은 제17조 환불 정책에 의하여 처리합니다.

제15조 (반품 정책)
1. 고객은 회사의 상품 발송 이후부터 배송완료일 후 7일 이내까지 관계법령에 의거하여 반품을 신청할 수 있습니다. 단, 사이트를 통하여 발송 준비중으로 표시되더라도 실제로 발송이 이루어진 경우에는 본 조의 내용을 적용하여 반품 절차로 진행됩니다.
2. 다음 각호의 경우에는 고객이 상품 등을 공급받은 날로부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날로부터 30일 이내에 반품을 신청할 수 있습니다. 단, 이 경우에도 구매 확정 이후에는 회사의 사이트나 서비스를 이용하여 반품 처리가 이루어지지 않고 회사와 별도로 협의하여 진행됩니다.
1) 배송된 상품 등이 주문내용과 상이하거나 판매자가 제공한 표시·광고 내용과 상이할 경우
2) 상품 등이 파손, 손상되었거나 오염된 상태로 배송된 경우
3) 전자상거래법 제13조에 의하여 광고에 표시하여야 할 사항을 표시하지 아니한 상태에서 상품 등 매매계약이 체결된 경우
3. 고객이 반품 신청한 상품 등이 고객의 요청으로 주문 제작되는 상품이며 상품이 이미 제작 되었을 경우 “ㄹㄷ호텔 이숍”은 반품 신청에 대하여 반품 접수를 거부하거나 보류할 수 있으며, 이 경우 고객에게 별도로 고지(사이트를 통한 안내 또는 유선연락)합니다.
4. “ㄹㄷ호텔 이숍”의 반품 접수 거부나 보류에 대해 고객은 다시 반품을 신청할 수 있으며, 반품 신청시에 자동 구매 확정이 연기되거나 취소됩니다.
5. 반품처리를 위해 약속한 기일을 경과하거나 고객의 반품 신청 요청에 2영업일 이내에 응답하지 않은 경우, 해당 상품 등의 반품 신청은 자동으로 접수되고, “ㄹㄷ호텔 이숍”은 환불에 필요한 조치를 이행합니다.
6. 반품에 관한 일반적인 사항은 「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령이 판매자가 제시한 조건보다 우선합니다.
7. 반품에 소요되는 비용은 반품에 대한 귀책사유가 있는 자에게 일반적으로 귀속됩니다(예시: 단순 변심의 경우 구매회원부담, 상품하자의 경우 판매회원부담 등). 단, 당사자 간에 별도의 약정이 있었던 때에는 그 약정에 따라 부담합니다.
8. 반품 상품 등의 배송방법은 상품 등의 종류, 부피 등을 고려하여 처리 가능한 방식에 따라 진행하여야 합니다.
9. 반품 처리에 따른 환불은 제17조 환불 정책에 따라 처리합니다.
10. 반품 신청 시, 반품사유에 관하여 “ㄹㄷ호텔 이숍”에 정확히 통보(구두 또는 서면으로)하지 않고 상품을 반환하거나 고객 부담의 반품배송비를 지불하지 않는 등의 사유가 발생하면 반품처리 및 환불이 지연될 수 있습니다.

제16조 (교환 정책)
1. 고객은 “ㄹㄷ호텔 이숍”의 상품 발송 시로부터 배송 완료일 후 7일 이내까지 관계 법령에 의거하여 교환을 신청할 수 있습니다.
2. 교환은 동일한 상품 및 동일한 옵션인 경우에만 가능합니다. 이 외에 경우에는 반품 후 재구매 절차를 진행하여야 합니다.
3. 교환신청을 하더라도 “ㄹㄷ호텔 이숍”에 교환할 물품의 재고가 없는 경우에는 교환이 불가능하며, 이 경우에 해당 교환신청은 제15조를 준용하여 반품신청으로 처리됩니다.
4. 교환에 소요되는 비용은 교환에 대한 귀책사유가 있는 자에게 일반적으로 귀속됩니다(단순 변심의 경우 고객부담, 상품하자의 경우 “ㄹㄷ호텔 이숍” 부담). 단, 당사자간에 별도의 약정이 있었던 때에는 그 약정에 따라 부담합니다.

제17조 (환불 정책)
1. 상품 등의 주문 취소 또는 반품 완료 처리에 의하여 고객에 대한 환불사유가 발생할 시 회사는 3영업일 이내에 이미 지급받은 상품 등의 대금을 환불하거나 환불에 필요한 조치를 취합니다.
2. 회사는 위 대금을 환불함에 있어서 고객이 구매수단으로 사용한 신용카드의 결제를 제공한 사업자 로 하여금 상품 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
3. 환불은 원칙적으로 고객이 지급한 결제수단을 통하여 진행합니다. 카드결제를 통한 구매건의 환불은 카드결제 취소를 통해서만 가능합니다.
4. 부분 주문 취소는 불가능 하며 상품 일부에 대한 취소/환불을 원하실 경우 전체 물품의 취소 및 재결제를 진행합니다.

제18조 (반품/교환/환불의 적용 배제)
다음의 각 호의 경우에는 고객의 청약철회가 제한될 수 있습니다.(단, 상품 불량, 표시/광고 내용과 상이한 경우에는 제한되지 아니합니다.)
1) 고객의 단순 변심으로 인한 교환/반품 요청이 상품 등을 수령한 날로부터 7일을 경과한 경우
2) 고객의 귀책사유로 말미암아 상품이 멸실·훼손된 경우 (단, 상품 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
3) 고객의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(화장품류, 식품은 밀봉 개봉 시, 의류, 침구류는 수선했거나 세탁하였을 시, 기타 사용·분리·훼손에 의해 상품의 가치가 현저히 감소하여 재판매가 불가할 시)
4) 신선식품 상품으로 상품의 특성상 배송이 시작된 경우(신선식품은 냉장/냉동을 포함하며, 상품 불량인 경우는 제외)
5) 시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우(계절의류, 냉난방기기, 계절상품, 유효기간이 있는 가공식품 등)
6) 고객의 구매로 주문 제작되는 상품(케이크, 드라이브 스루 등 주문 제작 되는 식품)
7) 배송된 상품이 하자 없음을 확인한 후 설치가 완료된 상품의 경우 (가전제품, 가구, 헬스기기 등)
8) 복제가 가능한 상품의 포장을 훼손한 경우(CD, DVD, GAME, 서적 등의 경우 포장 개봉 시)
9) 주문에 따라 개별적으로 생산되는 물품 등 회사 또는 “ㄹㄷ호텔 이숍”에 회복 할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 고객의 서면(전자문서를 포함)에 의한 동의를 받은 경우
10) 구매하신 상품의 구성품 일부가 훼손되거나 누락된 경우(침구류 세트상품, 화장품 세트 상품, 의류에 부착되는 액세사리, 가전제품의 부속품, 사은품 등)
11) 기타 관련법령이 정하는 청약철회 제한사유에 해당되는 경우

제19조 (분쟁조정 및 관할 법원)
1. 본 약관에서 정하지 않은 사항과 본 약관의 해석에 관하여는 대한민국 관련법령 및 상관례에 따릅니다.
2. 본 약관에 의한 서비스 이용과 관련한 제반 분쟁 및 소송은 서울중앙지방법원을 제1심 관할법원으로 합니다.

<부칙>
제1조 (시행일)
본 약관은 2022년 1월 25일부터 시행됩니다.
				</textarea>
			</c:if>
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
						<c:if test="${p == 'p01'}">	<!-- 배송상품일 경우 -->
							<input type="button" id="paymentBtn" value="결제하기" onclick="return check1()">
						</c:if>
						<c:if test="${p == 'p02'}">	<!-- 모바일상품일 경우 -->
							<input type="button" id="paymentBtn" value="결제하기" onclick="return check2()">
						</c:if>
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
    <!-- ================ 주문/결제 Area End ================= -->
    	
	<script>
	/* 배송상품의 필수입력 체크후 [결제하기]로 진행 */
	function check1(){
		if(document.gumae.pname.value.trim() == "") {
			alert("주문자명을 입력하세요.");
			return false;
			}
			else if(document.gumae.pphone.value.trim() == "") {
				alert("주문자의 연락처를 입력하세요.");
				return false;
				}
				else if(document.gumae.pemail.value.trim() == "") {
					alert("주문자의 이메일을 입력하세요.");
					return false;
					}
					else if(document.gumae.bname.value.trim() == "") {
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
										/*else if(document.gumae.agree1.checked == false) {
											alert("비회원주문 개인정보 수집이용에 대한 동의가 필요합니다.");
											return false;
										}*/
										else {
											document.gumae.submit();
											return true;
										}
	}
	
	/* 모바일상품의 필수입력 체크후 [결제하기]로 진행 */
	function check2(){
		if(document.gumae.pname.value.trim() == "") {
			alert("주문자명을 입력하세요.");
			return false;
			}
			else if(document.gumae.pphone.value.trim() == "") {
				alert("주문자의 연락처를 입력하세요.");
				return false;
				}
				else if(document.gumae.pemail.value.trim() == "") {
					alert("주문자의 이메일을 입력하세요.");
					return false;
					}
					/*else if(document.gumae.agree1.checked == false) {
						alert("비회원주문 개인정보 수집이용에 대한 동의가 필요합니다.");
						return false;
					}*/
					else {
						document.gumae.submit();
						return true;
					}
	}
  </script>
  
</body>