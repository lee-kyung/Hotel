<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
  .dining_reserve_next{
    line-height:2;
  }
/*  caption{
    align:center;
  } */
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
	margin-left: 5px;
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
 </style>
 
 <!-- jQuery -->
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
 
<body>

   <script>
   
  function categoryChange(e)
  {
	  
	  /* var dr_time_"${dine_type}"=dr_time_["Breakfast","Lunch","Dinner"]; */
	  var dr_time="${dine_type}";
	  var dr_time_Breakfast=["8:00","10:00"];
	  var dr_time_Lunch=["13:00","15:00"];
	  var dr_time_Dinner=["16:00","18:00"];
	  var target= document.getElementById("dr_time");
	  
	  var dr_time_Breakfast=["8:00","10:00"];
	  var dr_time_Lunch=["13:00","15:00"];
	  var dr_time_Dinner=["16:00","18:00"];
	  var target= document.getElementById("dr_time");
	  
	  if(e.value == "Breakfast") var d = dr_time_Breakfast;
		else if(e.value == "Lunch") var d = dr_time_Lunch;
		else if(e.value == "Dinner") var d = dr_time_Dinner;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
             }
  } 

  $(function() {
	    $(".inputs").keyup (function () {
	        var charLimit = $(this).attr("maxlength");
	        if (this.value.length >= charLimit) {
	            $(this).next('.inputs').focus();
	            return false;
	        }
	    });
	});
  
/*   function total_price() // 총가격 구하는 함수
  {
	  // 다이닝 타입에 따른 인원, 인원타입 선택값을 가져와서 각각의 금액을 구한다
	  // 다이닝타입
	  var ss=document.reser.adult.value;
	  var ssprice=(인원*${dvo.dine_adult})+인원*어린이;
	  document.getElementById("adult").innerText=new Intl.NumberFormat().format(ssprice);
	  
	  // form태그내에 총금액을 전달
	  document.reser.total.value=tt;
  } */

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
		   <table width="1000" align="center" border="1">
		  <div style="color:#887159; font-weight:900"> RESERVATION</div>
		       <div style="font-size: 25px;"> 파라다이스호텔 부산에 오신 것을 환영합니다.</div><br>
		       
		       <h2>ON THE PLATE</h2><br>
		       <hr>
		   <div id="outer">
<!--left--><div id="left">	
			<form name="reser" method="post" action="dining_reserve_ok" onsubmit="return check(this)">	       
		       
		   </table>
               <div style="float:left; width:700px;" id="info"><b>안내사항</b><br></div>
			   <div id="info_con">
			      - 예약 신청을 위한 페이지로 예약 신청 후 직원이 확인하여 예약 확정 문자를 보내드립니다.<br>
			      - 온라인 예약은 이용시간 기준 1일 전 21시까지 신청 가능합니다.<br>
			      - 좌석 배치는 사전 예약순에 따르며 특정 좌석 지정은 불가합니다.<br>
			      - 홈페이지 예약은 최대 8인 이하 테이블에 한하며 9인 이상 단체는 유선으로 문의 부탁드립니다.<br>
			      - 예약 취소 및 변경을 원하실 경우 최소 하루 전까지 온라인으로 예약 취소 후 다시 이용해주시기 바랍니다.<br>
			      - 어린이 인원 예약 시 요청사항에 나이 정보를 입력해 주시기 바랍니다.<br>
			      - 홈페이지 예약 할인 프로모션은 예약 상황에 따라 조기 마감 될 수 있으며 바우쳐,쿠폰사용 및 제휴 할인과 중복 적용되지 않습니다.
			   </div>
			   <!-- 예약정보 -->
			   <table>
			   <tr>
			   
			       <th width="300">방문 희망 일자</th>
			       <th width="300">조식/중식/석식</th>
			       <th width="300">예약시간</th>
			   </tr>
			   <tr>
			       <td><input type="text" name="dr_date" value="${ymd}" readonly></td>
			       <td>
			       <input type="hidden" id="changeInput">
			        <select value="${dine_type}" name="dine_type" id="dine_type" onchange="categoryChange(this)">
			         <option value="${dine_type}">${dine_type}</option>
			         <option value="Breakfast" name="dine_type" id="dine_type">Breakfast</option>
			         <option value="Lunch" name="dine_type" id="dine_type">Lunch</option>
			         <option value="Dinner" name="dine_type" id="dine_type">Dinner</option>
			        </select>
			<%-- <input type="text" name="dine_type" value="${ dine_type}"> --%>
			       </td>
			       <td>
			
			      <select id="dr_time" name="dr_time">
			         <option value="0">선택</option>
			          <c:if test="${dvo.dine_type == 'Breakfast' }">
			
			            <option value="8:00" name="dr_time">8:00</option>
			            <option value="10:00" name="dr_time">10:00</option>
			          </c:if>
			       
			          <c:if test="${dvo.dine_type == 'Lunch' }">
			    
			            <option value="13:00" name="dr_time">13:00</option>
			            <option value="15:00" name="dr_time">15:00</option>
			          </c:if>
			       
			         <c:if test="${dvo.dine_type == 'Dinner' }">
			
			            <option value="16:00" name="dr_time">16:00</option>
			            <option value="18:00" name="dr_time">18:00</option>  
			         </c:if>
			       </select>
			 
			       </td>
			   </tr> 
			   <tr>
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
			           <select name="child" id="child">
			              <option value="0"> 선택 </option>
						  <option value="1"> 1 </option>
					      <option value="2"> 2 </option>
						  <option value="3"> 3 </option>
			           </select>
			       </td>
			       <td>
			           <select name="baby" id="baby">
			              <option value="0"> 선택 </option>
						  <option value="1"> 1 </option>
					      <option value="2"> 2 </option>
						  <option value="3"> 3 </option>
			           </select>
			       </td>
			   </tr>
			   <tr>
			       <th colspan="3"> 추가 요청사항(선택)</th>
			   </tr>
			   <tr>
			       <td colspan="3"> <textarea cols="100" rows="5" name="dr_extrarq"></textarea> </td>
			   </tr>
			   <tr>
			       <td colspan="3">
			       * 요청사항은 레스토랑 사정에 따라 응대가 어려울 수 있으며 추가 문의는 전화 주시기 바랍니다.</td>
			   </tr>
			   <!-- 고객정보 -->
			   <div><div style="float:left; width:500px;"><b>고객 정보</b></div><div style="float:right;align:right;font-size:12px">* 필수입력항목</div></div><br>
 			<c:if test="${userid!=null}">
 				<div class="bb" onclick="edit()"> 새로운 정보 사용</div>
 			</c:if>
 			</table>
 			<table>
 				<tr height="10px"> 
 					<td>
 					<c:if test="${userid==null}">
 					* 예약자 이름 &nbsp<input type="text" name="bkname">
 					* 휴대폰 번호 &nbsp
                    <input type="text" name="p1" value="${p1}" class="inputs" maxlength="3" size="10"/>-
			        <input type="text" name="p2" value="${p2}" class="inputs" maxlength="4" size="10"/>-
			        <input type="text" name="p3" value="${p3}" class="inputs" maxlength="4" size="10"/>
                    </td>
 					</c:if>
 					<c:if test="${userid!=null }">
 					* 예약자 이름 &nbsp<input type="text" name="bkname" value="${name}">
 					* 휴대폰 번호 &nbsp
 					<input type="text" name="p1" value="${p1}" class="inputs" maxlength="3" size="10"/>-
			        <input type="text" name="p2" value="${p2}" class="inputs" maxlength="4" size="10"/>-
			        <input type="text" name="p3" value="${p3}" class="inputs" maxlength="4" size="10"/>
                    </td>

 					</c:if>
 				</tr>
 				</table>
 				<tr>
 					<td> &nbsp </td>
 				</tr>
			   <%-- <tr>
			       <th>이름</th>
			       <th colspan="2">휴대폰 번호<input type="hidden" name="phone" value="${p1+p2+p3}"></th>
			   </tr>
			   <tr>
			       <td><input type="text" name="name" value="${name}" size="40"></td>
			       <td colspan="2">
			        <input type="text" name="p1" value="${p1}" class="inputs" maxlength="3" size="10"/>-
			        <input type="text" name="p2" value="${p2}" class="inputs" maxlength="4" size="10"/>-
			        <input type="text" name="p3" value="${p3}" class="inputs" maxlength="4" size="10"/>
			       </td>
			   </tr> --%>     
			   
			   
			      <div><b>취소 규정</b></div>
			      <div id="cxlpolicy">
			      - 이용일로부터 1일전 23:59분전까지 무료 취소 가능합니다.<br>
			      - 방문 당일 취소 및 변경은 위약금 10만원이 부과됩니다.
			      </div>
			      <br>
			      <div><b>결제 방법</b></div>
				  <div id="paymethod">
					간편결제 <input type="radio" value="0" name="paym">
					카드결제 <input type="radio" value="1" name="paym">
					
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
				
<!-- right --> <div id="right" style="color:black">
					<div><b>다이닝 타입</b></div>		
					<div>${drvo.dine_type}</div><br>
					<div><b>예약날짜</b></div>	
					<div><input type="text" name="dr_date" value="${dr_date}" readonly></div>   
					<div><b>예약시간</b></div>
			     
			   <tr>
			       <th> 총 가격 </th>
			       <td colspan="3"> <span id="dr_total">
			       <fmt:formatNumber value="${rdto.price}" type="number"/></span>원 </td>
			   </tr>  
			   <tr>
			       <td colspan="3" align="center"><input type="submit" value="예약신청"></td>
			   </tr>
		    </table>
       </div>
     </form>
    </div>
   </diningsec>
  </div>
 </div>
</div>

    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>
