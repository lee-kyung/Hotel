<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
  table{
    margin-bottom:20px;
    font-size:19px;
    line-height:2;
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
        <h3> 상품 목록 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
 <form name="dining_write" enctype="multipart/form-data" method="post" action="dining_write_ok">
  <br>
  <caption><h2 align="center">상품 목록</h2></caption>
  <br>
   <table width="900" align="center" border="1">
     
     <tr>
        <td>번 호</td>   
        <td>다이닝 타입</td> 
        <td>성인 가격</td>
        <td>어린이 가격</td>
        <td>상품 등록일</td>
     </tr>
   <c:forEach items="${list}" var="dvo">
     <tr>
        <td>${dvo.id}</td>   
        <td>${dvo.dine_type}</td> 
        <td><fmt:formatNumber value="${dvo.dine_adult}" pattern="#,###"/>원 </td>
        <td><fmt:formatNumber value="${dvo.dine_child}" pattern="#,###"/>원 </td>
        <td>${dvo.writeday}</td>
     </tr>
   </c:forEach>
   </table>
 </form>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>