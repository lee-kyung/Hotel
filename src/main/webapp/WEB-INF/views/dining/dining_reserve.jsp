<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 <style>
  #section{
    width:100%;
    height:100%;
  }
  #section table{
    border:1px solid black;
    padding-left:30px;
    line-height:2;
    height:800px;
    padding-right:50px;
    text-align:center;
    border-collapse:collapse;
    margin-top:20px;
  }
 </style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area dining">	<!-- class="bradcam_area 클래스명" -->
        <h3> ON THE PLATE </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->

    	<div style="margin:auto;text-align:center;"> 당당한  <input type="button" value="버튼"> 하나 </div>
  <div id="section">
   <table width="900" align="center" border="1">
    <caption>
     <c:if test="${m==1}">
      <a href="dining_reserve?"y=${y-1}&m=12"> << </a>
     </c:if>
     
     <c:if test="${m!=1}">
      <a href="dining_reserve?y=${y}&m=${m-1}"> << </a>
     </c:if> 
     
     <span id="tit"> ${y}년 ${m}월 </span>
     <c:if test="${m==12}">
      <a href="dining_reserve?y=${y+1}&m=1"> >> </a>
     </c:if>
     
     <c:if test="${m!=12}">
      <a href="dining_reserve?y=${y}&m=${m+1}"> >> </a>
     </c:if>
    </caption>
    
    <tr id="week">
      <td> sun </td>
      <td> mon </td>
      <td> tue </td>
      <td> wed </td>
      <td> thu </td>
      <td> fri </td>
      <td> sat </td>
    </tr>
    
    <c:set var="day" value="1"/>
        <c:forEach var="i" begin="1" end="6"> <!-- 행 -->
         <tr id="cell" width="130" height="120">
          <c:forEach var="j" begin="0" end="6">  <!-- 열 -->
           <c:if test="${(j < yoil && i==1) || (chong < day) }">
             <td> &nbsp; </td>
           </c:if>
           
           <c:if test="${ ((j < yoil && i==1) || i>1) && (chong >= day) }">
             <td id="cell">
              <span style="font-weight:600"> ${day} </span>
		   <!-- 방의 이름을 출력 -->
           <!-- td에 출력되는 날짜가  오늘 이전인지 이후인지를 체크 -->
           <c:if test="${tt==1}">
          <c:forEach items="${dlist}" var="dvo">
           
           <c:set var="id" value="${dvo.dine_time}"/>
            <a href="dining_reserve_next?y=${y}&m=${m}&d=${day}&id=${dvo.id}"> ${dvo.dine_time}</a><br>
          </c:forEach>   <!-- 방 목록 출력 for -->
           </c:if>
             </td>
               <c:set var="day" value="${day+1}"/> <!-- 날짜값을 1씩 증가 -->
                          
           </c:if>
          </c:forEach>
         </tr>
        </c:forEach>
   </table>
  </div>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>