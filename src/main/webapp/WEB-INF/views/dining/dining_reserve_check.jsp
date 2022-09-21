<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 문구(자유롭게 변경하기) </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
    <section>
   <table width="900" align="center">
    <caption><h3> 주 문 내 역</h3></caption>
    <tr>
      <td> 예약 일자 </td>
      <td> 예약 상품 </td>
      <td> 예약 타입 </td>
      <td> 입장 시간 </td>
      <td> 결제 금액 </td>
      <td> 상태 </td>
      <td> 변경 </td>
      <td> 상품평 </td>
    </tr>
    
    <c:forEach items="${list}" var="drvo">
     <tr>
       <td> ${drvo.writeday} </td>
       <%-- <td> <img src="../resources/img/${dvo.pimg}" width="70" height="70"> </td> --%>
       <td> ${drvo.dine_type} </td>
       <td> ${drvo.dine_time} </td>
      <%--  <td> <fmt:formatNumber value="${gvo.chong}" pattern="#,###"/>원 </td>
       
       <!-- state 관련 if -->
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
    </tr> --%>
    </c:forEach>
   </table>
  </section>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>