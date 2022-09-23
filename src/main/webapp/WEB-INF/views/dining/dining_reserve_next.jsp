<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
  .dining_reserve_next{
    line-height:2;
  }
  .container{
	width: 990px;
	margin: auto;
	}
  diningsec #info_con{
    line-height:1.7;
  }
  diningsec{
    margin: auto;
	margin-bottom: 120px;
  }
  diningsec table{
    width: 750px;
	height: 80px;
	/* 	border: 1px solid #887159; */
	marin-top:20px;
	margin-bottom: 30px;
  }
  diningsec input[type=text]{
	/* width: 260px; */
	height: 30px;
	border: 1px solid #887159;
	}
  diningsec #outer{
	outline:1px solid #887159;
	width: 1000px;
  }
  diningsec #outer #left{
	/* background: pink; */
	width: 760px;
	float: left;
  }
  diningsec #outer #right{
	background: #f9f9f9; 
	width: 225px;
	height: 780px;
	float: right;
	margin-left: 10px;
	padding-left: 10px;
	/* position: absolute;
	left: 950px; */
  } 
  diningsec #outer #right input[type=text]{
	/* width:100px; */
	border: none;
	background: none;
  }
  diningsec #outer #right b{
	color: black;
	}
  diningsec #outer #left b{
    color: black;
	font-size: 16px;
  }
  diningsec .bb{
	align: right;
	}
  table{
    /* align:center;
    margin:auto; */
    font-size:13px;
    
  }
  td{
    margin-top:40px;
  }
  
  /* 결제 css */
  diningsec #pay{
	margin: auto;
	text-align: center;
	}
  diningsec #pay input[type=button]{
	width: 200px;
	height: 50px;
	border: 1px solid #887159;
	color: #887159;
	background: white;
	pointer: cursor;
	}
  diningsec #pay input[type=button]:hover{
	background: #887159;
	color: white;
	}
 </style>
 
 <!-- jQuery -->
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
 
<body>

   <script>
   // 핸드폰 번호 자릿수 채우면 자동 이동
  $(function() {
	    $(".inputs").keyup (function () {
	        var charLimit = $(this).attr("maxlength");
	        if (this.value.length >= charLimit) {
	            $(this).next('.inputs').focus();
	            return false;
	        }
	    });
	});
  
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
	
	// 총가격 구하는 함수
   function total_price() 
   {
	  // 다이닝 타입에 따른 인원, 인원타입 선택값을 가져와서 각각의 금액을 구한다

	  // 예약 인원
	  var ad_su=document.reser.adult.value;
	  document.getElementById("a_su").innerText=ad_su;
	  
	  var cd_su=document.reser.child.value;
	  document.getElementById("c_su").innerText=cd_su;
	  
	  var bd_su=document.reser.baby.value;
	  document.getElementById("b_su").innerText=bd_su;
	  
	  // 총 예약 인원
	  var su_total=Number(ad_su)+Number(cd_su)+Number(bd_su);
	  document.getElementById("sutotal").innerText=su_total;
	  
	  // 총 금액
	  var dine_type=document.getElementById("dine_type").value;
	  
	  if(dine_type=='Breakfast')
	  {
		  var total=Number(60000*ad_su)+Number(30000*cd_su);
		  /* document.getElementById("drtotal").innerText=total; */	
	  }
	  	else if(dine_type=='Lunch')
		  {
	  		  var total=Number(105000*ad_su)+Number(52500*cd_su);
			  /* document.getElementById("drtotal").innerText=total; */		  
			
		  }
	  		else // dine_type=='Dinner'
			  {
				  var total=Number(120000*ad_su)+Number(60000*cd_su);
				  /* document.getElementById("drtotal").innerText=new Intl.NumberFormat().format(total); */
			  }
	  
	               document.getElementById("dr_total").innerText=new Intl.NumberFormat().format(total);

	  // form태그내에 총금액을 전달
	  document.reser.dr_total.value=total;
  } 
   
</script>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
 <div class="bradcam_area dining2">	<!-- class="bradcam_area 클래스명" -->
     <h3> ON THE PLATE </h3>
  </div>  
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- ================ dining_reserve_next area_start ================= -->
<div class="dining_reserve_next">   
 <div class="container"> 
  <div class="row">
     <diningsec>
      <form name="reser" method="post" action="dining_reserve_ok">	
	   <input type="hidden" name="dr_total" value="${dvo.dine_adult}">
	  <%--  <input type="hidden" name="dr_total" value="${dvo.dine_child }"> --%>
		  <div style="color:#887159; font-weight:900"> RESERVATION</div>
		       <div style="font-size: 25px;"> 파라다이스호텔 부산에 오신 것을 환영합니다.</div><br>
		       
		       <h2>ON THE PLATE</h2><br>
		       <hr>
		   <div id="outer">
<!--left--><div id="left">	
			       
               <div style="float:left; width:700px;" id="info"><b>안내사항</b></div><br>
			   <div id="info_con">
			      - 예약 신청을 위한 페이지로 예약 신청 후 직원이 확인하여 예약 확정 문자를 보내드립니다.<br>
			      - 온라인 예약은 이용시간 기준 1일 전 21시까지 신청 가능합니다.<br>
			      - 좌석 배치는 사전 예약순에 따르며 특정 좌석 지정은 불가합니다.<br>
			      - 홈페이지 예약은 최대 8인 이하 테이블에 한하며 9인 이상 단체는 유선으로 문의 부탁드립니다.<br>
			      - 예약 취소 및 변경을 원하실 경우 최소 하루 전까지 온라인으로 예약 취소 후 다시 이용해주시기 바랍니다.<br>
			      - 어린이 인원 예약 시 요청사항에 나이 정보를 입력해 주시기 바랍니다.<br>
			      - 홈페이지 예약 할인 프로모션은 예약 상황에 따라 조기 마감 될 수 있으며 바우쳐,쿠폰사용 및 제휴 할인과 중복 적용되지 않습니다.<br>
			   </div>
			   
			   <!-- 예약정보 -->
			   <table>
			   <tr>
			   
			       <th width="300">방문 희망 일자</th>
			       <th width="300">조식/중식/석식</th>
			       <th width="300">예약시간</th>
			   </tr>
			   <tr>
			       <td><input type="text" name="dr_date" value="${dr_date}" readonly></td>
			       <td><input type="text" name="dine_type" id="dine_type" value="${dine_type}" readonly></td>
			       <td><input type="text" name="dr_time" id="dr_time" value="${dr_time}" readonly></td>
			   </tr> 
			   
			   <tr> <!-- 성인, 어린이, 유아 select --> <!-- 성인, 어린이, 유아 select -->
			       <th>성인</th>
			       <th>어린이</th>
			       <th>유아</th>
			   </tr>
			   <tr> 
			       <td>
			           <select name="adult" id="adult" onchange="total_price()">
			              <option value="0"> 선택 </option>
						  <option value="1"> 1 </option>
					      <option value="2"> 2 </option>
						  <option value="3"> 3 </option>
			           </select>
			       </td>
			       <td>
			           <select name="child" id="child" onchange="total_price()">
			              <option value="0"> 선택 </option>
						  <option value="1"> 1 </option>
					      <option value="2"> 2 </option>
						  <option value="3"> 3 </option>
			           </select>
			       </td>
			       <td>
			           <select name="baby" id="baby" onchange="total_price()">
			              <option value="0"> 선택 </option>
						  <option value="1"> 1 </option>
					      <option value="2"> 2 </option>
						  <option value="3"> 3 </option>
			           </select>
			       </td>
			   </tr> <!-- 성인, 어린이, 유아 select --> <!-- 성인, 어린이, 유아 select -->
			   
			   <tr>
			       <th colspan="3"> 추가 요청사항(선택)<sup>(<span id="nowByte">0</span>/100bytes)</sup></th>
			   </tr>
			   <tr>
			       <td colspan="3"> <textarea cols="100" rows="5" name="dr_extrarq" onkeyup="fn_checkByte(this)" placeholder="* 요청사항은 레스토랑 사정에 따라 응대가 어려울 수 있으며 추가 문의는 전화 주시기 바랍니다."></textarea> </td>
			   </tr>
			   <!-- 고객정보 -->
			   <div><div style="float:left; width:500px;"><b>고객 정보</b></div><div style="float:right;align:right;font-size:12px">* 필수입력항목</div></div><br>
 			</table>
 			<table>
 			 	<tr height="10px"> 
 					<td>
 					<c:if test="${userid==null}">
 					* 예약자 이름 &nbsp;<input type="text" name="bkname">
 					* 휴대폰 번호 &nbsp;
                    <input type="text" name="p1" value="${p1}" class="inputs" maxlength="3" size="10"/>-
			        <input type="text" name="p2" value="${p2}" class="inputs" maxlength="4" size="10"/>-
			        <input type="text" name="p3" value="${p3}" class="inputs" maxlength="4" size="10"/>
                    </c:if>
                    </td>
 					
 					<c:if test="${userid!=null }">
 					* 예약자 이름 &nbsp;<input type="text" name="bkname" value="${name}">
 					* 휴대폰 번호 &nbsp;
 					<input type="text" name="p1" value="${p1}" class="inputs" maxlength="3" size="10"/>-
			        <input type="text" name="p2" value="${p2}" class="inputs" maxlength="4" size="10"/>-
			        <input type="text" name="p3" value="${p3}" class="inputs" maxlength="4" size="10"/>
                    </c:if>
                    </td>

 					
 				</tr> 
 				
 				<tr>
 					<td> &nbsp; </td>
 				</tr>
          </table>
			   
			      <div><b>취소 규정</b></div>
			      <div>
			      - 이용일로부터 1일전 23:59분전까지 무료 취소 가능합니다.<br>
			      - 방문 당일 취소 및 변경은 위약금 10만원이 부과됩니다.
			      </div>
			      <br>
			      <div><b>결제 방법</b></div>
				  <div id="paymethod">
					<input type="radio" value="0" name="paym"> 간편결제&nbsp;&nbsp;
					<input type="radio" value="1"> 현장결제(예약금 10만원) <br> 
					* 쿠폰 / 제휴 바우처 / 이벤트 쿠폰 사용 원하실 경우, 레스토랑에서 결제하기를 선택해 주세요.
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
					<div style="float:left; width:500px;font-weight:900">취소 규정에 대한 동의 </div><div style="float:right;align:right;font-size:12px"><input type="checkbox" name="agree2">동의합니다</div>
					<br>
				<div>
				 - 이용일로부터 1일전 23:59분전까지 무료 취소 가능합니다.<br>
			     - 방문 당일 취소 및 변경은 위약금 10만원이 부과됩니다.
				</div>
				</div><br>
				<div>
				</div>
				</div>
				</div>
				
<!-- right --> <div id="right" style="color:black;">
					<div><b>다이닝 타입</b></div>		
					<div>${dine_type}</div>
					<div><b>예약날짜</b></div>	
					<div>${dr_date}</div>   
					<div><b>예약시간</b></div>
					<div>${dr_time}</div>  
					<div><b>예약인원</b></div>
	                <div>성인<span id="a_su"></span>명/어린이<span id="c_su"></span>명/유아<span id="b_su"></span>명</div><br>
					<div>총<span id="sutotal">&nbsp;&nbsp;&nbsp;</span>명</div><br>
					<div><b>총 가격</b></div>
	                <div><span id="dr_total" name="dr_total">${dvo.dine_adult}</span></div>
                    <br>
					<br>
					<br>
					<br>			  
			       <!-- <div id="pay"><input type="button" id="paymentBtn" value="예약신청" onclick="return check()"></div> -->
			       <div id="pay"><input type="submit" id="paymentBtn" value="예약신청"></div>
           </div>
     </form>

   </diningsec>
  </div>
 </div>
</div>

<script>
    //필수입력사항 입력 했는지 확인
    
</script>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>
