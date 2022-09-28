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
	
	section #wed_update table{
	margin:auto;
	width:900px;
	border-left:none;
	border-right:none;
	border-top-color:white;}
    
    section #wed_update table td{
    padding:25px;
    border-left:none;
	border-right:none;}
    
    section #wed_update table td:first-child{
    font-weight:600;
    width:180px;}
    
    section #wed_update table tr:last-child{
    text-align:center;
    border-bottom-color:white;}
    
    section #wed_update table input[type=text]{
    width:96%;
    height:50px;
    outline:none;}
    
    section #wed_update table textarea{
    width:97%;
    height:200px;
    outline:none;
    resize:none;}
    
    section #wed_update table .btn{    
    width:200px;
    height:60px;
    background:white;
    margin-top:50px;
    border:1px solid #887159;
    color:#887159;
    cursor:pointer;}
    
    section #wed_update table .btn:hover{
    background:#887159;
    color:white;}
    
    section #wed_update #img{
    display:inline-block;
    margin-top:5px;}
</style>

<script>
	function add_file()
	{
		var fname=document.getElementsByClassName("fname");
		var len=fname.length;	// 현재 type="file"의 개수
		if(len < 4)
		{
		len++;		// 추가 될 때마다 file의 개수가 하나씩 늘어야 하기 때문에 증가를 준다. 
		var inner="<p class='fname'> <input type='file' name='fname"+len+"'> </p> "; // 추가될 내용
															// fname+숫자 : 추가될때마다 숫자변경해야하기 때문에 
		document.getElementById("outer").innerHTML=document.getElementById("outer").innerHTML+inner;
		// jqurty : $("#outer").html($("outer").html()+inner);
		}
	}
	
	function del_file()
	{
		var len=document.getElementsByClassName("fname").length;
		if(len > 1)
		{
			len--;
			document.getElementsByClassName("fname")[len].remove();
		}
	}
</script>


</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <h3> 등록 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
    
<section>
<div id="wed_update">
<form method="post" action="wed_update_ok" enctype="multipart/form-data">
<input type="hidden" name="id" value="${wvo.id }">
    <table border="1">
    	<tr>
    		<td>웨딩홀 이름</td>
    		<td><input type="text" name="wed_hall" value="${wvo.wed_hall }"></td>
    	</tr>
    	<tr>
    		<td>소개글</td>
    		<td><textarea name="wed_title">${wvo.wed_title }</textarea></td>
    	</tr>    		
    	<tr>
    		<td>사진(4장 등록)</td>
    		<td id="outer">
    			
    			<c:forEach items="${img}" var="pic">
					<div id="img"><img src="../img/wedding/${pic}" width="330" height="220"></div>		
				</c:forEach>
				
    				<input type="button" onclick="add_file()" value="+">
					<input type="button" onclick="del_file()" value="-">
				
					<p class="fname"><input type="file" name="fname1"></p>
    		</td>	
    	</tr>
    	<tr>
    		<td>특징</td>
    		<td><textarea name="wed_txt">${wvo.wed_txt }</textarea></td>
    	</tr>
    	<tr>
    		<td>규모</td>
    		<td><input type="text" name="wed_size" value="${wvo.wed_size }">m2</td>
    	</tr>
    	<tr>
    		<td>최소인원</td>
    		<td><input type="text" name="wed_min" value="${wvo.wed_min }">인</td>
    	</tr>
    	<tr>
    		<td>최대인원</td>
    		<td><input type="text" name="wed_max" value="${wvo.wed_max }">인</td>
    	</tr>
    	<tr>
    		<td>하객음식</td>
    		<td><input type="text" name="wed_food" value="${wvo.wed_food }"></td>
    	</tr>
    	<tr>
    		<td>연출</td>
    		<td><textarea name="wed_direct">${wvo.wed_direct }</textarea></td>
    	</tr>
    	<tr>
    		<td>예식타입</td>
    		<td><input type="text" name="wed_type" value="${wvo.wed_type }"></td>
    	</tr>
    	<tr>
    		<td>Special Benefit</td>
    		<td><textarea name="wed_txt2">${wvo.wed_txt2 }</textarea></td>
    	</tr>
    	<tr>
    		<td>금액</td>
    		<td><input type="text" name="wed_price" value="${wvo.wed_price }">만원</td>
    	</tr> 		
    	<tr>
    		<td colspan="2">
				<input type="submit" class="btn" value="수정">
				<input type="button" class="btn" onclick="location='wed_list'" value="리스트">
    		</td>
    	</tr>
    </table>
</form> 
</div>
</section>
    	

    	
    	
 
    	
    	
    	
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>