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
        <div id="h3" onclick="location='../admin/admin'"> ADMIN </div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
 <form method="post" action="dining_update_ok">
 <input type="hidden" name="id" value="${dvo.id}">
  <br>
  <caption><h2 align="center">상품 수정</h2></caption>
  <br>
   <table width="900" align="center" border="1">
     
     <tr>
        <th>번 호</th>
        <td>${dvo.id}</td>
     </tr>
     <tr>   
        <th>다이닝 타입</th> 
        <td><input type="text" name="dine_type" value="${dvo.dine_type}"></td>
     </tr>
     <tr>
        <th>성인 가격</th>
        <td><input type="text" name="dine_adult" value="${dvo.dine_adult}">원</td>
     </tr>
     <tr>
        <th>어린이 가격</th>
        <td><input type="text" name="dine_child" value="${dvo.dine_child}">원</td>
     </tr>
     <tr>
        <th>상품 등록일</th>
        <td>${dvo.writeday}</td>
     </tr>
     <tr>
        <td colspan="2" align="center">
        <input type="submit" value="수정">
  <%--       <input type="button" onclick="location='dining_delete?id=${dvo.id}'" value="삭제"> --%>
        <input type="button" onclick="location='dining_list'" value="다이닝 목록">
        </td>
     </tr>
   
   </table>
  </form>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>