<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
  section{
    width:1100px;
/*     height:1000px; */
    margin:auto;
  }
  section #resv_check #left{
    margin-top:20px;
    display:inline-block;
    margin-left:20px;
    width:150px;
    float:left;
  }
  section #resv_check #right{
    margin-top:30px;
    display:inline-block;
    /* margin-left:20px; */
    width:150px;

  }
  section #title{
    font-size:34px;
    margin-bottom:20px;
  }
  section #name{
    font-size:28px;
    margin-bottom:20px;
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
	<!-- <div id="left"> -->
      <!-- <div> 예약 일자 </div>
      <div> 예약 번호</div>
      <div> 예약자 성함 </div>
      <div> 예약자 번호</div>
      <div> 예약 상품 </div>
      <div> 입장 시간 </div>
      <div> 결제 방법 </div>
      <div> 결제 금액 </div>
      <div> 요청 사항</div> -->
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
   <!--  </div> -->   
    <%-- <div id="right">
      <div> ${drvo.writeday} </div>
      <div> ${drvo.bid}</div>
      <div> ${drvo.bkname} </div>
      <div> ${drvo.p1}-${drvo.p2}-${drvo.p3} </div>
      <div> ${drvo.dine_type} </div>
      <div> ${drvo.dr_time} </div>
      <div> 
	      <c:if test="${drvo.sudan == 0}">
	         <c:set var="sudan" value="간편결제"/>
	       </c:if>
	       <c:if test="${drvo.sudan == 1}">
	         <c:set var="sudan" value="현장결제"/>
	       </c:if>
      <div>${sudan}</div>
      </div> 
      <div> <fmt:formatNumber value="${drvo.dr_total}" pattern="#,###"/>원 </div>
       
      <div>
      
	      <c:if test="">
	        <c:set var="extrarq" value="요청 사항 없음"/>
	        <input type="text" name="extra" value="요청 사항 없음" readonly>
	      </c:if>
      ${drvo.dr_extrarq}
      
      </div> 
      
   
   </div> --%>
  </div> 

       
              
  <%-- <!-- state 관련 if -->
       <c:if test="${gvo.state == 0}">
         <c:set var="state" value="결제완료"/>
       </c:if>
       <c:if test="${gvo.state == 1}">
         <c:set var="state" value="취소신청"/>
       </c:if>
       <c:if test="${gvo.state == 2}">
         <c:set var="state" value="취소완료"/>
       </c:if>
       <c:if test="${gvo.state == 3}">
         <c:set var="state" value="배송중"/>
       </c:if>
       <c:if test="${gvo.state == 4}">
         <c:set var="state" value="배송완료"/>
       </c:if>
       <c:if test="${gvo.state == 5}">
         <c:set var="state" value="반품신청"/>
       </c:if>
       <c:if test="${gvo.state == 6}">
         <c:set var="state" value="반품완료"/>
       </c:if>
       <c:if test="${gvo.state == 7}">
         <c:set var="state" value="교환신청"/>
       </c:if>
       <c:if test="${gvo.state == 8}">
         <c:set var="state" value="교환완료"/>
       </c:if>
       
       <td> ${state} </td>
       <td>
         <!-- 취소신청버튼 -->
          <c:if test="${gvo.state==0}"> 
           <input type="button" value="취소신청" onclick="location='change_state?state=1&id=${gvo.id}'"> <br> <!-- state를 1로 변경 -->
          </c:if>
           
         <!-- 취소철회버튼 -->
          <c:if test="${gvo.state==1}">
           <input type="button" value="취소철회" onclick="location='change_state?state=0&id=${gvo.id}'"> <br> <!-- state를 0으로 변경 -->
          </c:if>
          
         <!-- 반품신청버튼 -->
          <c:if test="${gvo.state==3 || gvo.state==4}">
           <input type="button" value="반품신청" onclick="location='change_state?state=5&id=${gvo.id}'"> <br> <!-- state를 5로 변경 -->
          </c:if>
           
         <!-- 교환신청버튼 -->
          <c:if test="${gvo.state==0 || gvo.state==1 || gvo.state==3 || gvo.state==4}">
           <input type="button" value="교환신청" onclick=""> <br> <!-- state를 7로 변경 -->
          </c:if>
       </td>
       <td>
        <c:if test="${gvo.state == 4}"> <!-- 배송완료일 때 보이게 하기 -->
           <c:if test="${gvo.hugi == 0}">
             <input type="button" value="상품평 작성" onclick="location='review?pcode=${gvo.pcode}&gid=${gvo.id}'">
           </c:if>
           <c:if test="${gvo.hugi == 1}">
             <input type="button" value="상품평 보기"  >
           </c:if>
        </c:if>
        
           <c:if test="${gvo.state != 4}">
             <input type="button" value="상품평 작성" disabled>
           </c:if>
       </td>
    </tr> 
    </c:forEach> --%>
  </section>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>