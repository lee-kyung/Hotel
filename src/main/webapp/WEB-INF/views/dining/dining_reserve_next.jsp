<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
  .dining_reserve_next{
    height:1400px;
    line-height:2;
  }
  caption{
    align:center;
  }
  .flex-container{
    width:1300px;
    margin:auto;
    /* display:inline-flex; */
  }
  #section_left1 #info{
    font-size:18px;
    font-weight:700px;
    color:#887159;
    margin:auto;
  }
  #section_left1 #info_con{
    line-height:1.7;
  }
  #section_left1{
    /* float:left; */
    width:600px;
  }
  #section_right{
    float:right;
    width:200px;
    /* height:900px; */
  } 
  table{
    align:center;
    margin:auto;
    font-size:13px;
    
  }
  td{
    margin-top:40px;
  }
 </style>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 
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
    <!-- 부타이틀(자유롭게 변경)_area_start -->
<div class="dining_reserve_next">   
 <div id="section_left1"> 
  

 </div>
 <div id="section_left2"> 
  <form name="reser" method="post" action="dining_reserve_ok" onsubmit="return check(this)">
   <div id="1-1">
   <table width="1000" align="center" border="1">
   <caption>
  <h3 style="font-weight:790px;"> RESERVATION</h3>
 
       <h2> 파라다이스호텔 부산에 오신 것을 환영합니다.</h2><br>
       <h2>ON THE PLATE</h2><br>
       <span id="info">안내사항<br></span>


   </caption>
   </table>
   <table width="1000" align="center" border="1">
       <tr>
        <td id="info_con" colspan="3">
      - 예약 신청을 위한 페이지로 예약 신청 후 직원이 확인하여 예약 확정 문자를 보내드립니다.<br>
      - 온라인 예약은 이용시간 기준 1일 전 21시까지 신청 가능합니다.<br>
      - 좌석 배치는 사전 예약순에 따르며 특정 좌석 지정은 불가합니다.<br>
      - 홈페이지 예약은 최대 8인 이하 테이블에 한하며 9인 이상 단체는 유선으로 문의 부탁드립니다.<br>
      - 예약 취소 및 변경을 원하실 경우 최소 하루 전까지 온라인으로 예약 취소 후 다시 이용해주시기 바랍니다.<br>
      - 어린이 인원 예약 시 요청사항에 나이 정보를 입력해 주시기 바랍니다.<br>
      - 홈페이지 예약 할인 프로모션은 예약 상황에 따라 조기 마감 될 수 있으며 바우쳐,쿠폰사용 및 제휴 할인과 중복 적용되지 않습니다.
        </td>
      </tr>
     <tr>
       <th width="300">방문 희망 일자</th>
       <th width="300">조식/중식/석식</th>
       <th width="300">예약시간</th>
     </tr>
     <tr>
       <td>${ymd}<input type="hidden" name="dr_date" ></td>
       <td>
       <input type="hidden" id="changeInput">
        <select value="${dine_type}" name="dine_type" id="dine_type" onchange="categoryChange(this)">
         <option value="${dine_type}">${dine_type}</option>
         <option value="Breakfast" name="dine_type" id="dine_type">Breakfast</option>
         <option value="Lunch" name="dine_type" id="dine_type">Lunch</option>
         <option value="Dinner" name="dine_type" id="dine_type">Dinner</option>
        </select>
<%--         <input type="text" name="dine_type" value="${ dine_type}"> --%>
       </td>
       <td>
 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
      <select id="dr_time" name="dr_time">
      <%--   <c:forEach items="${ }"> --%>
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
         
<%--        </c:forEach> --%>
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
           <select name="adult" id="adult">
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
       <td colspan="3"> 추가 요청사항(선택)</td>
     </tr>
     <tr>
       <td colspan="3"> <textarea cols="100" rows="5" name="dr_extrarq"></textarea> </td>
     </tr>
     <tr>
       <td colspan="3">
       * 요청사항은 레스토랑 사정에 따라 응대가 어려울 수 있으며 추가 문의는 전화 주시기 바랍니다.</td>
     </tr>
     <tr>
       <td>이름</td>
       <td colspan="2">휴대폰 번호<input type="hidden" name="phone" value="${p1+p2+p3}"></td>
     </tr>
     <tr>
       <td><input type="text" name="name" value="${name}" size="40"></td>
       <td colspan="2">
        <input type="text" name="p1" value="${p1}" class="inputs" maxlength="3" size="10" />-
        <input type="text" name="p2" value="${p2}" class="inputs" maxlength="4" size="10"/>-
        <input type="text" name="p3" value="${p3}" class="inputs" maxlength="4" size="10"/>
       </td>
     </tr>     
     <tr>
       <td>이메일</td>
     </tr>
     <tr>
       <td><input type="text" name="email" size="40"></td>
     </tr>
     <tr>
       <td colspan="3"> 추가 요청사항(선택)</td>
     </tr>
     <tr>
       <td colspan="3"> 
      - 이용일로부터 1일전 23:59분전까지 무료 취소 가능합니다.<br>
      - 방문 당일 취소 및 변경은 위약금 10만원이 부과됩니다.
       </td>
     </tr>
     <tr>
       <td colspan="3"> 결제 방법</td>
     </tr>
     <tr>
       <td><input type="radio">전체금액 온라인 결제</td>
        <td colspan="2"><input type="radio">레스토랑에서 결제(예약금 10만원 결제)</td>
     </tr>
     <tr>
       <td colspan="3" align="center"><input type="submit" value="예약신청"></td>
     </tr>
    </table>
   </div>
  </form>
 </div>
</div>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>
