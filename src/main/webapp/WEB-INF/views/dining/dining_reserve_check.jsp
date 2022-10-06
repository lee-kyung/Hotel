<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
  section{
    width:1100px;
    margin:auto;
    border:1px solid #887159;
    margin-top:100px;
    margin-bottom:100px;
  }
  section #title{
    font-size:34px;
    margin-bottom:20px;
    margin-left:102px;
    margin-top:20px;
  }
  section #name{
    font-size:28px;
    margin-bottom:20px;
    margin-left:102px;
  }
  section table{
    margin:auto;
    text-align:left;
    height:600px;
    line-height:2;
    font-size:24px;
    border-bottom:2px solid black;
    border-top:2px solid black;
    margin-bottom:30px;
  }
  section #rq{
    font-size:19px;
    color:silver;
  }
  section input[type=button]{
    width:130px;
    height:40px;
    background:#887159;
    color:white;
    border:none;
    text-align:center;
    margin:auto;
    margin-left:490px;
    cursor:point;
    margin-bottom:20px;
  }
 </style>
 
</head>
<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area s7">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> Dining Reservation</div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
<section>
<div id="resv_check"> 
	
	<div id="title">RESERVATION</div>
	<div id="name">${drvo.bkname}님 !  <span id="txt">예약이 완료되었습니다.</span></div>
	<div id="border">
      <table width="900">
        <tr>
           <th>예약 일자</th>
           <td>${drvo.writeday}</td>
        </tr>
         <tr>
           <th>예약 번호</th>
           <td>${drvo.bid}</td>
         </tr>
         <tr>
           <th>예약자 성함</th>
           <td>${drvo.bkname}</td>
         </tr>
         <tr>
           <th>예약자 번호</th>
           <td>${drvo.p1}-${drvo.p2}-${drvo.p3}</td>
         </tr>
         <tr>
           <th>예약 상품</th>
           <td>${drvo.dine_type}</td>
         </tr>
         <tr>
           <th>입장 시간</th>
           <td>${drvo.dr_time}</td>
         </tr>
         <tr>
           <th>결제 방법</th>
           <td>
	       	   <c:if test="${drvo.sudan == 0}">
		         <c:set var="sudan" value="간편결제"/>
		       </c:if>
		       <c:if test="${drvo.sudan == 1}">
		         <c:set var="sudan" value="현장결제"/>
		       </c:if>    
           ${sudan}
           </td>
         </tr>
         <tr>
           <th>결제 금액</th>
           <td><fmt:formatNumber value="${drvo.dr_total}" pattern="#,###"/>원</td>
         </tr>
         <tr>
           <th>요청 사항</th>
           <td>
             <c:if test="${drvo.dr_extrarq == null}">
                      <span id="rq">요청사항 없음</span>
               </c:if> 

             <c:if test="${drvo.dr_extrarq != null}">
                      ${drvo.dr_extrarq}
             </c:if>
           </td>
           
        </tr>
       
      </table>
 
			<div><input type="button" value="Dining main" onclick="location='dining'"></div>

   
   </div> 
  </div> 

  </section>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>