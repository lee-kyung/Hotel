<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
	width:1100px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section #wed_content table{
	margin:auto;
	width:900px;
	border-left:none;
	border-right:none;
	border-top-color:white;}
    
    section #wed_content table td{
    padding:25px;
    border-left:none;
	border-right:none;}
    
    section #wed_content table td:first-child{
    font-weight:600;
    width:180px;}
    
    section #wed_content table tr:last-child{
    text-align:center;
    border-bottom-color:white;}
    
    section #wed_content table input[type=button]{    
    width:200px;
    height:60px;
    background:white;
    margin-top:50px;
    border:1px solid #887159;
    color:#887159;
    cursor:pointer;}
    
    section #wed_content table input[type=button]:hover{
    background:#887159;
    color:white;}
    
    section #wed_content #img{
    display:inline-block;
    margin-top:5px;}
</style>

<script>

</script>


</head>

<body>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3">WEDDING CONTENT</div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
    
<section>
<div id="wed_content">

    <table border="1">
    	<tr>
    			<td>웨딩홀 이름</td>
    			<td>${wvo.wed_hall }</td>
    	</tr>
    	<tr>
    		<td>소개글</td>
    		<td>${wvo.wed_title }</td>
    	</tr>    		
    	<tr>
    		<td>사진</td>
    			
    		<td>
    			<c:forEach items="${img}" var="pic">
					<div id="img"><img src="../img/wedding/${pic}" width="330" height="220"></div>
					
				</c:forEach>
    		</td>
    			
    	</tr>
    	<tr>
    		<td>특징</td>
    		<td>${wvo.wed_txt }</td>
    	</tr>
    	<tr>
    		<td>규모</td>
    		<td>${wvo.wed_size }m2</td>
    	</tr>
    	<tr>
    		<td>최소인원</td>
    		<td>${wvo.wed_min }인</td>
    	</tr>
    	<tr>
    		<td>최대인원</td>
    		<td>${wvo.wed_max }인</td>
    	</tr>
    	<tr>
    		<td>하객음식</td>
    		<td>${wvo.wed_food }</td>
    	</tr>
    	<tr>
    		<td>연출</td>
    		<td>${wvo.wed_direct }</textarea></td>
    	</tr>
    	<tr>
    		<td>예식타입</td>
    		<td>${wvo.wed_type }</td>
    	</tr>
    	<tr>
    		<td>Special Benefit</td>
    		<td>${wvo.wed_txt2 }</td>
    	</tr>
    	<tr>
    		<td>금액</td>
    		<td>${wvo.wed_price }만원</td>
    	</tr> 		
    	<tr>
    		<td colspan="2">
				<input type="button" onclick="location='wed_update?id=${wvo.id}'" value="수정">
				<input type="button" onclick="location='wed_delete?id=${wvo.id}'" value="삭제">
				<input type="button" onclick="location='wed_list'" value="리스트">
    		</td>
    	</tr>
    </table>
</div>
</section>
    	

    	
    	
 
    	
    	
    	
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>