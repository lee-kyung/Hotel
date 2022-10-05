<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	.container {
		width: 1300px;
		margin: auto;
	}
	roomsec {
		width: 1300px;
		margin: auto;
		margin-bottom: 120px;
		/* border: 1px solid black; */
	}
	roomsec #outer {
		outline: 1px solid #887159;
		width: 1200px;
	}
	roomsec #outer #oleft {
		/* background: pink; */
		width: 845px;
		float: left;
	}
	roomsec #outer #oright {
		background: #f9f9f9;
		width: 345px;
		height: 780px;
		float: right;
		margin-left: 5px;
		/* position: absolute;
			left: 950px; */
	}
	roomsec #r1 {
		color: #887159;
		font-weight: 900;
		font-size: 50px;
		font-family: fantasy;
	}
	roomsec #r2 {
		color: #887159;
		font-weight: 900;
		font-size: 20px;
	}
	roomsec #sec1 {
		width: 845px;
		margin-top: 10px;
	}
	roomsec #sec1 #man{
		font-size: 14px;
		color: orange;
		display: inline-block;
		width: 734px;
		text-align: right;
	}
	roomsec #oleft #sec2{
		width: 845px;
		margin-top: 2px;
	}
	roomsec #oleft #sec2 #gm{
		text-align: right;
		font-size: 12px;
		width: 830px;
	}
	roomsec #oleft #sec2 #sb{
		width: 100px;
	}
	roomsec #sec2 input[type=text] {
		width: 300px;
		height: 45px;
		border: 1px solid #887159;
		border-radius: 2px;
	}
	roomsec #sec3{
		width: 845px;
	}
	roomsec #sec3 #sb{
		width: 200px;
		display: inline-block;
	}
	roomsec #outer #title{
		font-weight: 900;
		color: #887159;
		font-size: 20px;
	}
	roomsec #sec4 #agr1 #aleft{
		font-weight: 600;
		width: 500px;
		display: inline-block;
		float: left;
	}
	roomsec #sec4 #agr1 #aright{
		margin-right: 20px;
		float: right;
		font-size: 13px;
	}
	roomsec #outer #oright{
		font-size: 17px;
	}
	roomsec #outer #oright #title2{
		font-weight: 700;
		color: #887159;
		font-size: 19px;
	}
	roomsec #outer #oright input[type=text] {
		width: 100px;
		border: none;
		background: none;
	}
	roomsec #pay {
		margin: auto;
		text-align: center;
	}
	roomsec #pay input[type=button] {
		width: 300px;
		height: 50px;
		border: 1px solid #887159;
		color: #887159;
		background: white;
		pointer: cursor;
		border-radius: 2px;
	}
	roomsec #pay input[type=button]:hover {
		background: #887159;
		color: white;
	}
</style>
<script>
	function total_price() {
		// 인원
		var binwon = document.getElementById("binwon").value;

		// 투숙일
		var suk = document.getElementById("suk").value;

		// 추가침대
		var bb = document.resv.bextbed.value;
		if (bb == 1) {
			bbprice = 65000 * bb * suk;
			document.getElementById("bed").innerText = new Intl.NumberFormat()
					.format(bbprice);
		} else {
			bbprice = 0;
			document.getElementById("bed").innerText = new Intl.NumberFormat()
					.format(bbprice);
		}

		// 조식
		var bf = document.resv.bmeal.value;
		if (bf == 1) {
			bfprice = 30000 * binwon * suk;
			document.getElementById("bfp").innerText = new Intl.NumberFormat()
					.format(bfprice);
		} else {
			bfprice = 0;
			document.getElementById("bfp").innerText = new Intl.NumberFormat()
					.format(bfprice);
		}

		// 객실가격
		var rprice = document.getElementById("rprice").innerText;

		// 총 가격
		var total = Number(bbprice) + Number(bfprice) + Number(rprice);
		document.getElementById("btotal").innerText = new Intl.NumberFormat()
				.format(total);

		// form태그내에 총금액을 전달
		document.resv.btotal.value = total;
	}

	// 요청사항 바이트 확인
	function fn_checkByte(obj) {
		const maxByte = 100; //최대 100바이트
		const text_val = obj.value; //입력한 문자
		const text_len = text_val.length; //입력한 문자수

		let totalByte = 0;
		for (let i = 0; i < text_len; i++) {
			const each_char = text_val.charAt(i);
			const uni_char = escape(each_char); //유니코드 형식으로 변환
			if (uni_char.length > 4) {
				// 한글 : 2Byte
				totalByte += 2;
			} else {
				// 영문,숫자,특수문자 : 1Byte
				totalByte += 1;
			}
		}

		if (totalByte > maxByte) {
			alert('최대 100Byte까지만 입력가능합니다.');
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "red";
		} else {
			document.getElementById("nowByte").innerText = totalByte;
			document.getElementById("nowByte").style.color = "green";
		}
	}

	
	 
	 // 회원정보넣기
	function addinfo()
	{
		var ys=document.resv.gminfo;
		if(ys.checked)
		{
			document.getElementById("bkname").value="${name}";
			document.getElementById("bkphone").value="${phone}";
		}
		else
		{
			document.getElementById("bkname").value="";
			document.getElementById("bkphone").value="";
		}
	}
</script>

<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	<!-- bradcam_area_start -->
	<!-- 새 이미지 추가하는 법
	   	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
	   	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
	<div class="bradcam_area rooms">
		<!-- class="bradcam_area 클래스명" -->
		<div id="h3">RESERVATION</div>
		>
	</div>
	<!-- bradcam_area_end -->
	<!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
	
	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
	<div class="container">
		<div class="row">
			<roomsec>
			<div id="r1">RESERVATION</div>
			<div id="r2">호텔에 오신것을 환영합니다.</div>
			<br>
			<div id="outer">
				<form name="resv" method="post" action="room_resv_ok">
			<div id="oleft">
				<input type="hidden" name="btotal" value="${rvo.rprice}">
					<div id="sec1">
						<span id="title">고객 정보&nbsp&nbsp</span><div id="man">* 필수입력항목</div>
					</div>
					
					<div id="sec2">
						<c:if test="${userid!=null}">
							<div id="gm"><input type="checkbox" name="gminfo" value="gminfo" onclick="addinfo()">회원정보와 동일</div>
						</c:if>
						<div><span id="sb">* 예약자 이름 </span><input type="text" name="bkname" id="bkname" value=""></div>
				 		<br>
				 		<div><span id="sb">* 휴대폰 번호 </span><input type="text" name="bkphone" id="bkphone" value=""></div>
				 		<br>
						<div> 
							특별 요청사항<sup>(<span id="nowByte">0</span>/100bytes)</sup> 
							<textarea cols="80" rows="3" name="spreq" onkeyup="fn_checkByte(this)" 
							placeholder="객실 투숙 시 필요한 비품관련 요청은 한정된 수량으로 인하여 서비스 이용이 제한될 수 있으니 유선상으로 문의하여 주시기 바랍니다."></textarea>
						</div>
					</div>
					<hr>
				
					<div id="sec3">
						<div id="title">추가 옵션</div>
						<div><span id="sb">추가침대(1박당 65000원)</span>
							예<input type="radio" value="1" name="bextbed" onchange="total_price()"> 
							아니오 <input type="radio" value="0" name="bextbed" onchange="total_price()" checked>
						</div>
						<br>
						<div><span id="sb">조식(1인 1박당 30000원)</span>
							예<input type="radio" value="1" name="bmeal"	onchange="total_price()"> 
							아니오 <input type="radio" value="0" name="bmeal" onchange="total_price()" checked>
						</div>
					</div>
					<hr>
					
					<div id="sec4">
						<div id="title">취소 규정</div>
						<div id="cxlpolicy">
							- 투숙 일로부터 2일전 18:00까지 취소 가능하며, 이후 도착일 기준 하루 전 18시까지 1박 요금의 50%, <br>
							이후 취소 시 1박 요금의 100% 수수료가 발생합니다.<br> 
							- 투숙 당일 노쇼(No Show) 발생 시 동일한 위약금이 청구될 수 있습니다.
						</div>
						<br>
						<div id="title">약관 동의</div>
						<div id="agr1">
							<div id="aleft">개인정보 수집 및 이용에 대한 동의</div>
							<div id="aright"><input type="checkbox" name="agree1">동의합니다
							</div>
						</div>
						<div>
<textarea style="resize: none; border: none" rows="5" cols="85"	readonly>
호텔은 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.
개인정보 수집 및 이용 동의 
1. 수집 및 이용 목적 : 본인 식별, 서비스 및 정보제공, 민원처리, 고객문의 안내
2. 수집 항목 
필수항목 : 성명, 휴대전화번호 
3. 보유 기간 및 파기시점 
- 예약내역 : 상법, 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 5년관 보관 됩니다. (단, 취소된 예약 관련 내역은 6개월 보관) 
4. 귀하께서는 본 개인정보 수집 및 이용 동의에 대해 거부할 권리가 있으며, 동의 거부 시 서비스 이용에 제한이 있을 수 있음을 알려드립니다. 
</textarea>
						</div>
						<br>
						<div id="agr1">
							<div id="aleft">상품	정보 및 취소 규정에 대한 동의</div>
							<div id="aright"> <input type="checkbox" name="agree2">동의합니다
						</div>
						</div>
						<br>
						<div>
<textarea style="resize: none; border: none" rows="3" cols="85"	readonly>
예약 취소 및 변경은 상기 [취소 규정] 기간 내 가능하며, 이후 도착일 기준 하루 전 18시까지 1박 요금의 50%, 이후 취소 시 1박 요금의 100%수수료가 발생합니다.
투숙 당일 노쇼(No Show) 발생 시 동일한 위약금이 청구될 수 있습니다.
</textarea>
						</div>
					</div> <!-- sec4 end -->
			</div><!-- oleft end -->
		<!-- oright start -->
			<div id="oright">
					<div id="title2"> 객실명 </div>
					<div>${rvo.rname}<input type="hidden" name="rcode" value="${rvo.rcode}" readonly>
					</div>
					<br>
					<div id="title2"> 체크인/아웃 </div>
					<div>
						<input type="text" name="checkin" value="${checkin}" readonly>/
						<input type="text" name="checkout" value="${checkout}" readonly>
					</div>
					<br>
					<div id="title2"> 투숙일 </div>
					<div>
						<input type="text" id="suk" name="suk" value="${suk}"
							style="width: 15px;" readonly>일
					</div>
					<br>
					<div id="title2"> 투숙 인원 </div>
					<div>
						성인${adult}명/어린이${child}명 <br> 총<input type="text"
							style="width: 15px;" name="binwon" id="binwon"
							value="${adult+child}" readonly>명
					</div>
					<br>
					<div id="title2"> 총 예약금액 </div>
					<div>
						<span>객실요금</span>&nbsp <span id="rprice">${rvo.rprice}</span>원 <br>
						<span>추가침대</span>&nbsp <span id="bed"></span>원 <br> <span>조식</span>&nbsp
						<span id="bfp"></span>원<br>
					</div>
					<br> <br>
					<div id="title2"> 최종 결제 금액  &nbsp<span id="btotal" name="btotal">${rvo.rprice}</span>&nbsp원 </div>
					<br> <br> <br> <br>
					<div id="pay">
						<input type="button" id="paymentBtn" value="결 제 하 기" onclick="return check()">
					</div>
			</div><!-- oright end -->
				</form>
			</div><!-- outer end -->
		</div> <!-- row class end -->
		</roomsec>
	</div><!-- container end -->
<script>
	// 입력 했는지 확인
	function check() {
		// 아이디, 비번, 이름, 전화번호
		if (document.resv.bkname.value.trim() == "") {
			alert("이름을 입력하세요");
			return false;
		} else if (document.resv.bkphone.value.trim() == "") {
			alert("전화번호를 입력하세요");
			return false;
		} else if (document.resv.agree1.checked != true) {
			alert("개인정보 수집 및 이용에 대한 동의가 필요합니다.");
			return false;
		} else if (document.resv.agree2.checked != true) {
			alert("상품 정보 및 취소 규정에 대한 동의가 필요합니다.");
			return false;
		} else {
			//결제관련
			/* 		$("#paymentBtn").click(function () {
						var IMP = window.IMP; // 생략가능
						IMP.init('imp66382802'); 
						IMP.request_pay({
							pg: 'html5_inicis',
							pay_method: 'card',
							merchant_uid: 'merchant_' + new Date().getTime(),

							name: '주문명 : ${rvo.rname}',
							amount: 2000,
							buyer_name: '이름',
							buyer_postcode: '123-456',
							}, function (rsp) {
								console.log(rsp);
							if (rsp.success) {
								var msg = '결제가 완료되었습니다.';
								msg += '결제 금액 : ' + rsp.paid_amount;
								document.resv.submit();
							} else {
								var msg = '결제에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;
							}
							alert(msg);
						});
					}); */
			document.resv.submit();
			return true;
		}
	}
</script>
<!-- ================ Rooms Area End ================= -->
</body>