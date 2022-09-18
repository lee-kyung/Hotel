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
    <div class="bradcam_area dining2">	<!-- class="bradcam_area 클래스명" -->
        <h3> 다이닝 등록 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
 <form name="dining_write" enctype="multipart/form-data" method="post" action="dining_write_ok">
  <caption><h2>다이닝 등록</h2></caption>
   <table width="800" align="center" border="1">
     
     <tr>
       <td>다이닝메인 이미지</td>
       <td colspan="2"> <input type="file" name="dine_pimg"> </td>
     </tr>
     <tr>
       <td>다이닝상세 이미지</td>
       <td colspan="2"> <input type="file" name="dine_cimg"> </td>
     </tr>
     <tr>
       <td>다이닝제목</td>
       <td colspan="2"> <input type="text" name="dine_type"> </td>
     </tr>
<!--      <tr>
       <td>다이닝시간</td>
       <td colspan="2"> <input type="text" name="dine_time"> </td>
     </tr> -->
     <tr>
       <td>다이닝가격(성인기준)</td>
       <td colspan="2"> <input type="text" name="dine_adult"> </td>
     </tr>
     <tr>
       <td>다이닝가격(어린이기준)</td>
       <td colspan="2"> <input type="text" name="dine_child"> </td>
     </tr>
     <tr>
       <td>다이닝 할인율</td>
       <td colspan="2"> <input type="text" name="dine_halin">%</td>
     </tr>
     
     <tr>
       <td colspan="3"> <input type="submit" value="등록하기"> </td>
       <td></td>
     </tr>     
   </table>
 </form>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>