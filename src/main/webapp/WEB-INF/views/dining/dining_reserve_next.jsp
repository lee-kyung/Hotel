<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
  .flex-container{
    width:1300px;
    /* height:2800px; */
    margin:auto;
    display:inline-flex;
  }
  #section_left1 #info{
    font-size:18px;
    font-weight:700px;
    color:#887159;
    
    
  }
  #section_left1 #info_con{
    line-height:1.7;
  }
  #section_left1{
    float:left;
    width:600px;
    
  }
  #section_right{
    float:right;
    width:200px;
    /* height:900px; */
  } 
 </style>
</head>

<body>
    
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
<div class="flex-container">
   
    
 <div id="section_left1"> 
  <caption><h3 style="font-weight:790px;">RESERVATION</h3>
     <h2> 파라다이스호텔 부산에 오신 것을 환영합니다.</h2></caption>
     <hr>
     <caption><h2>ON THE PLATE</h2></caption>
       <span id="info">안내사항</span> 
 </div>
 <div id="section_left2"> 
   <div id="1-1">
    <!--   <table width="100%" align="center" border="1"> -->
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
   </div>
      <tr>
        <td>예약정보</td>
        <td>
          <!-- <select name="reserve_date">
           <option value="0"></option>
          </select>  -->       
        </td>
 <!--      </table> -->
 </tr>
 </div>
</div>
<div class="flex-container">    
    <div id="section_right">
     <caption><h3 style="font-weight:790px;">RESERVATION</h3>
     <h2> 파라다이스호텔 부산에 오신 것을 환영합니다.</h2></caption>
     <hr>
     <caption><h2>ON THE PLATE</h2></caption>
       <span id="info">안내사항</span>
  <!--     <table width="100%" align="center" border="1"> -->
       <tr>
        <td id="info_con">
      - 예약 신청을 위한 페이지로 예약 신청 후 직원이 확인하여 예약 확정 문자를 보내드립니다.<br>
     
        </td>
      </tr>
      <tr>
        <td>예약정보</td>
        <td>
          <!-- <select name="reserve_date">
           <option value="0"></option>
          </select>    -->     
        </td>
<!--       </table> -->
    </div>

</div>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>