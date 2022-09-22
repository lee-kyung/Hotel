<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	.container{
		width: 1100px;
		margin: auto;
	}
	roomsec{
		margin: auto;
		margin-bottom: 120px;
	}
	roomsec table{
		width: 750px;
		height: 80px;
	 	/* border: 1px solid #887159;  */
		margin-bottom: 30px;
	}
	roomsec input[type=text]{
		width: 260px;
		height: 30px;
		border: 1px solid #887159;
	}
	roomsec #tb input[type=text]{
		border: none;
		width: 100px;
	}
	roomsec #outer{
		outline:1px solid #887159;
		width: 1000px;
	}
	roomsec #outer #left{
		/* background: pink; */
		width: 760px;
		float: left;
	}
	roomsec #outer #right{
		background: #f9f9f9; 
		width: 225px;
		height: 780px;
		float: right;
		margin-left: 5px;
		/* position: absolute;
		left: 950px; */
	} 
	roomsec #outer #right input[type=text]{
		width:100px;
		border: none;
		background: none;
	}
	roomsec #outer #right b{
		color: black;
	}
	roomsec #outer #left b{
		color: black;
		font-size: 16px;
	}
	roomsec .bb{
		align: right;
	}
	roomsec #pay{
		margin: auto;
		text-align: center;
	}
	roomsec #pay input[type=button]{
		width: 200px;
		height: 50px;
		border: 1px solid #887159;
		color: #887159;
		background: white;
		pointer: cursor;
	}
	roomsec #pay input[type=button]:hover{
		background: #887159;
		color: white;
	}
</style>
<script>

	function total_price()
	{
	 	// 인원
		var binwon=document.getElementById("binwon").value;
				
		// 투숙일
		var suk=document.getElementById("suk").value;
		
		// 추가침대
		var bb=document.resv.bextbed.value;
		if(bb==1)
		{ 
			bbprice=65000*bb*suk;
			document.getElementById("bed").innerText=new Intl.NumberFormat().format(bbprice);
		}
		else
		{
			bbprice=0;
			document.getElementById("bed").innerText=new Intl.NumberFormat().format(bbprice);
		}
		
		// 조식
		var bf=document.resv.bmeal.value;
		if(bf==1)
		{
			bfprice=30000*binwon*suk;
			document.getElementById("bfp").innerText=new Intl.NumberFormat().format(bfprice);
		}
		else
		{
			bfprice=0;
			document.getElementById("bfp").innerText=new Intl.NumberFormat().format(bfprice);
		}
		
		
		// 객실가격
		var rprice=document.getElementById("rprice").innerText;
		
		// 총 가격
		var total=Number(bbprice)+Number(bfprice)+Number(rprice);
		document.getElementById("btotal").innerText=new Intl.NumberFormat().format(total);

		// form태그내에 총금액을 전달
		document.resv.btotal.value=total;		
	}
	

	
	// 요청사항 바이트 확인
	function fn_checkByte(obj){
	    const maxByte = 100; //최대 100바이트
	    const text_val = obj.value; //입력한 문자
	    const text_len = text_val.length; //입력한 문자수
	    
	    let totalByte=0;
	    for(let i=0; i<text_len; i++){
	    	const each_char = text_val.charAt(i);
	        const uni_char = escape(each_char); //유니코드 형식으로 변환
	        if(uni_char.length>4){
	        	// 한글 : 2Byte
	            totalByte += 2;
	        }else{
	        	// 영문,숫자,특수문자 : 1Byte
	            totalByte += 1;
	        }
	    }
	    
	    if(totalByte>maxByte){
	    	alert('최대 100Byte까지만 입력가능합니다.');
	        	document.getElementById("nowByte").innerText = totalByte;
	            document.getElementById("nowByte").style.color = "red";
	        }else{
	        	document.getElementById("nowByte").innerText = totalByte;
	            document.getElementById("nowByte").style.color = "green";
	        }
	    } 
	
/*  	// 결제창 스크롤
	function check()
	{
		var num=document.documentElement.scrollTop // 상단으로부터 몇 px스크롤 되었는지 값을 저장
		document.getElementById("right").style.position="fixed";
		if(num>500)
			document.getElementById("right").style.top=num+"px";
		
	}
	document.onscroll=check; 
  */
  
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
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <h3> RESERVATION </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
<div class="features_room">
  <div class="container">
    <div class="row"> 
    	<roomsec>
    	<div style="color:#887159; font-weight:900">RESERVATION</div>
    	<div style="font-size: 25px;">호텔에 오신것을 환영합니다.</div>
    	<hr>
    	<br>
    	<div id="outer">
  		<div id="left">
 			<form name="resv" method="post" action="room_resv_ok" >
 			<input type="hidden" name="btotal" value="${rvo.rprice}">
 			<div><div style="float:left; width:500px;"><b>고객 정보</b></div><div style="float:right;align:right;font-size:12px">* 필수입력항목</div></div><br>
 			<c:if test="${userid!=null}">
 				<div class="bb" onclick="edit()"> 새로운 정보 사용</div>
 			</c:if>
 			<table>
 				<tr height="10px"> 
 					<td>
 					<c:if test="${userid==null}">
 					* 예약자 이름 &nbsp<input type="text" name="bkname">
 					* 휴대폰 번호 &nbsp<input type="text" name="bkphone"></td>
 					</c:if>
 					<c:if test="${userid!=null }">
 					* 예약자 이름 &nbsp<input type="text" name="bkname" value="${name}">
 					* 휴대폰 번호 &nbsp<input type="text" name="bkphone" value="${phone}"></td>
 					</c:if>
 				</tr>
 				<tr>
 					<td> &nbsp </td>
 				</tr>
 				<tr> 
 					<td>특별 요청사항<sup>(<span id="nowByte">0</span>/100bytes)</sup></td>
 				</tr>
 				<tr>
 					<td><textarea cols="60" rows="3" name="spreq" onkeyup="fn_checkByte(this)" placeholder="객실 투숙 시 필요한 비품관련 요청은 한정된 수량으로 인하여 서비스 이용이 제한될 수 있으니 유선상으로 문의하여 주시기 바랍니다."></textarea></td>
 				</tr>
 			</table>
 			<table id="tb">
 				<tr>
 				 	<td width="220px"> 추가 침대(1박당 65000원)</td>
 				 	<td>
 				 		예<input type="radio" value="1" name="bextbed" onchange="total_price()">
 				 		아니오 <input type="radio" value="0" name="bextbed" onchange="total_price()" checked> <!-- <span id="bed"></span>원 -->
 				 	</td>
 				 </tr>
 				 <tr>
 				 	<td> 조식(1인 1박당 30000원) </td>
 				 	<td>
 				 		예<input type="radio" value="1" name="bmeal" onchange="total_price()">
 				 		아니오 <input type="radio" value="0" name="bmeal" onchange="total_price()" checked> <!-- <span id="bfp"></span>원 -->
 				 	</td>
 				 </tr>
				</table>
				<hr>
				<div><b>취소 규정</b></div>
				<div id="cxlpolicy">
					- 투숙 일로부터 2일전 18:00까지 취소 가능하며, 이후 도착일 기준 하루 전 18시까지 1박 요금의 50%, 이후 취소 시 1박 요금의 100% 수수료가 발생합니다.<br> 
					- 투숙 당일 노쇼(No Show) 발생 시 동일한 위약금이 청구될 수 있습니다.
				</div>
				<br>
				<div><b>결제 방법</b></div>
				<div id="paymethod">
					간편결제 <input type="radio" value="0" name="paym">					
				</div>
				<br>
				<div><b>약관 동의</b></div>
				<div>
					<div style="float:left; width:500px;font-weight:900">개인정보 수집 및 이용에 대한 동의</div><div style="float:right;align:right;font-size:12px"><input type="checkbox" name="agree1">동의합니다</div>
				</div><br>
				<div>
<textarea style="resize: none; border:none" rows="5" cols="80" readonly>호텔은 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.
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
				<div>
					<div style="float:left; width:500px;font-weight:900">상품 정보 및 취소 규정에 대한 동의 </div><div style="float:right;align:right;font-size:12px"><input type="checkbox" name="agree2">동의합니다</div>
				</div><br>
				<div>
<textarea style="resize: none; border:none" rows="3" cols="80" readonly>예약 취소 및 변경은 상기 [취소 규정] 기간 내 가능하며, 이후 도착일 기준 하루 전 18시까지 1박 요금의 50%, 이후 취소 시 1박 요금의 100%수수료가 발생합니다.
투숙 당일 노쇼(No Show) 발생 시 동일한 위약금이 청구될 수 있습니다.
</textarea>
				</div>
				
				
			</div>
			<div id="right" style="color:black;">
					<div><b>객실명</b></div>
					<div>${rvo.rname}<input type="hidden" name="rcode" value="${rvo.rcode}" readonly></div><br>
					<div><b>체크인/아웃</b></div>
					<div><input type="text" name="checkin" value="${checkin}" readonly>/ <input type="text" name="checkout" value="${checkout}" readonly></div><br>
					<div><b>투숙일</b></div>
					<div><input type="text" id="suk" name="suk" value="${suk}" style="width:15px;" readonly>일</div><br>
					<div><b>투숙 인원</b></div> 
					<div>성인${adult}명/어린이${child}명 <br> 
						총<input type="text" style="width:15px;"name="binwon" id="binwon" value="${adult+child}" readonly>명
					</div><br>
					<div><b>총 예약금액</b></div>
					<div>
						<span>객실요금</span>&nbsp <span id="rprice">${rvo.rprice}</span>원 <br>
						<span>추가침대</span>&nbsp <span id="bed"></span>원 <br>
						<span>조식</span>&nbsp <span id="bfp"></span>원<br> 
					</div> 
					<br>
					<br>
					<div><b>최종금액</b> &nbsp &nbsp<span id="btotal" name="btotal">${rvo.rprice}</span>원</div>
					<br>
					<br>
					<br>
					<br>
					<div id="pay"><input type="button" id="paymentBtn" value="결제하기" onclick="return check()"></div>
 			</form>
 			</div>
 	  	</roomsec>
 	</div>
  </div>
</div>
<script>
 	// 입력 했는지 확인
	function check()
	{
		// 아이디, 비번, 이름, 전화번호
		if(document.resv.binwon.value>${rvo.rmax})
		{
			alert("선택된 인원수가 최대가능 인원보다 많습니다. 객실을 다시 선택해주세요.");
			return false;
		}
		else if(document.resv.bkname.value.trim()=="")
		{
			alert("이름을 입력하세요");
			return false;
		}
		else if(document.resv.bkphone.value.trim()=="")
		{
			alert("전화번호를 입력하세요");
			return false;
		}
		else if(document.resv.agree1.checked!=true)
		{
			alert("개인정보 수집 및 이용에 대한 동의가 필요합니다.");
			return false;
		}
		else if(document.resv.agree2.checked!=true)
		{
			alert("상품 정보 및 취소 규정에 대한 동의가 필요합니다.");
			return false;
		}
		else if(document.resv.paym.value=="")
		{
			alert("결제방법을 선택하세요")	;
			return false;
		}
		else
		{
			//결제관련
			$("#paymentBtn").click(function () {
				var IMP = window.IMP; // 생략가능
				IMP.init('imp66382802'); 
				// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
				// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
				IMP.request_pay({
					pg: 'html5_inicis',
					pay_method: 'card',
					merchant_uid: 'merchant_' + new Date().getTime(),
					/* 
					 *  merchant_uid에 경우 
					 *  https://docs.iamport.kr/implementation/payment
					 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
					 */
					name: '주문명 : ${rvo.rname}',
					// 결제창에서 보여질 이름
					// name: '주문명 : ${auction.a_title}',
					// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
					amount: 2000,
					// amount: ${bid.b_bid},
					// 가격 
					buyer_name: '이름',
					// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
					// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
					buyer_postcode: '123-456',
					}, function (rsp) {
						console.log(rsp);
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						msg += '결제 금액 : ' + rsp.paid_amount;
						document.resv.submit();
						
						// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
						// 자세한 설명은 구글링으로 보시는게 좋습니다.
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					alert(msg);
				});
			});
			return true;
		}
	}
	
  </script>
        <!-- ================ Rooms Area End ================= -->
</body>