<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
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
    font-size:15px;
    margin-top:10px;
  }
 </style>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 
</head>
 
<body>
   <script>
  function categoryChange(e)
  {
	  var time_a=["8:00","10:00"];
	  var time_b=["13:00","15:00"];
	  var time_c=["16:00","18:00"];
	  var target= document.getElementById("time");
	  
	  if(e.value == "a") var d = time_a;
		else if(e.value == "b") var d = time_b;
		else if(e.value == "c") var d = time_c;

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
  <h3 style="font-weight:790px;">RESERVATION</h3>
   <table width="1000" align="center">
   <tr>
     <td> 
       <h2> 파라다이스호텔 부산에 오신 것을 환영합니다.</h2><br>
       <h2>ON THE PLATE</h2><br>
       <span id="info">안내사항<br></span>
     </td>
   </tr>
   </table>
 </div>
 <div id="section_left2"> 
  <form name="reser" method="post" action="dining_reserve_ok">
   <div id="1-1">
   <table width="1000" align="center" >
       <tr>
        <td id="info_con">
      - 예약 신청을 위한 페이지로 예약 신청 후 직원이 확인하여 예약 확정 문자를 보내드립니다.<br>
      - 온라인 예약은 이용시간 기준 1일 전 21시까지 신청 가능합니다.<br>
      - 좌석 배치는 사전 예약순에 따르며 특정 좌석 지정은 불가합니다.<br>
      - 홈페이지 예약은 최대 8인 이하 테이블에 한하며 9인 이상 단체는 유선으로 문의 부탁드립니다.<br>
      - 예약 취소 및 변경을 원하실 경우 최소 하루 전까지 온라인으로 예약 취소 후 다시 이용해주시기 바랍니다.<br>
      - 어린이 인원 예약 시 요청사항에 나이 정보를 입력해 주시기 바랍니다.<br>
      - 홈페이지 예약 할인 프로모션은 예약 상황에 따라 조기 마감 될 수 있으며 바우쳐,쿠폰사용 및 제휴 할인과 중복 적용되지 않습니다.
        </td>
      </tr>
   </table>
    <table width="1000" align="center" >
     <tr>
       <td>방문 희망 일자</td>
       <td>조식/중식/석식</td>
       <td>예약시간</td>
     </tr>
     <tr>
       <td>${ymd}</td>
       <td>
       <input type="hidden" id="changeInput">
        <select name="dine_type" onchange="categoryChange(this)">
         <option>선택</option>
         <option value="a">Breakfast</option>
         <option value="b">Lunch</option>
         <option value="c">Dinner</option>
        </select>
       </td>
       <td>
 
      <select id="time">
           
         <option value="0">선택</option>
          <c:if test="${dvo.dine_type == 'Breakfast' }">
            <option value="1">8:00</option>
            <option value="2">10:00</option>
          </c:if>
       
          <c:if test="${dvo.dine_type == 'Lunch' }">
            <option value="3">13:00</option>
            <option value="4">15:00</option>
          </c:if>
       
         <c:if test="${dvo.dine_type == 'Dinner' }">
            <option value="5">16:00</option>
            <option value="6">18:00</option>  
         </c:if>
       </select>
 
       

       </td>
     </tr> 
     <tr>
       <td>성인</td>
       <td>어린이</td>
       <td>유아</td>
     </tr>
     <tr>
       <td><input type="text" placeholder="성인select칸" readonly></td>
       <td><input type="text" placeholder="어린이select칸" readonly></td>
       <td><input type="text" placeholder="유아select칸" readonly></td>
     </tr>
     <tr>
       <td colspan="3"> 추가 요청사항(선택)</td>
     </tr>
     <tr>
       <td colspan="3"> <textarea cols="100" rows="5" name="content"></textarea> </td>
     </tr>
     <tr>
       <td colspan="3">
       * 요청사항은 레스토랑 사정에 따라 응대가 어려울 수 있으며 추가 문의는 전화 주시기 바랍니다.</td>
     </tr>
     <tr>
       <td>이름</td>
       <td>휴대폰 번호<input type="hidden" name="phone"></td>
     </tr>
     <tr>
       <td><input type="text" name="name" size="50"></td>
       <td>
        <input type="text" name="p1" class="inputs" maxlength="3" size="10" />-
        <input type="text" name="p2" class="inputs" maxlength="4" size="10"/>-
        <input type="text" name="p3" class="inputs" maxlength="4" size="10"/>
       </td>
     </tr>
 </table>
 <hr>
  <table width="900" align="center">
   <tr>
       <td><input type="text" name="name" size="50"></td>
       <td>
        <input type="text" name="p1" class="inputs" maxlength="3" size="10" />-
        <input type="text" name="p2" class="inputs" maxlength="4" size="10"/>-
        <input type="text" name="p3" class="inputs" maxlength="4" size="10"/>
       </td>
     </tr>
    </table>
   </div>
  </form>
 </div>
</div>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>
