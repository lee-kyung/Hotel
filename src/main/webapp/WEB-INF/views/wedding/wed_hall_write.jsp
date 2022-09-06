<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>

</style>

<script>
	var size=1;
	function add_file()
	{
		size++;
		var outer=document.getElementById("outer");
		var inner="<p class='fname'><input type='file' name='wed_fname"+size+"'></p>";
		outer.innerHTML=outer.innerHTML+inner;
	}
	function del_file()
	{
		if(size>1)
		{
			document.getElementsByClassName("fname")[size-1].remove();
			size--;
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
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 웨딩홀 작성 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
    
      <section class="blog_area section-padding">
      <div class="container">
      
    	<form method="post" action="wed_hall_write_ok" enctype="multipart/form-data">
    	<table width="1100" border="1">
    	<tr>
    			<td>웨딩홀 이름</td>
    			<td><input type="text" name="wed_hall"></td>
    		</tr>
    		<tr>
    			<td>소개글</td>
    			<td><textarea name="wed_title"></textarea></td>
    		</tr>    		
    		<tr>
    			<td>사진(4장 등록가능)</td>
    			
    			<td id="outer">
    			
    				<span class="fname"><input type="file" name="wed_fname" id="file"></span>
					<input type="button" onclick="add_file()" value="+" class="btn">
					<input type="button" onclick="del_file()" value="-" class="btn">
    			</td>
    			
    		</tr>
    		<tr>
    			<td>특징</td>
    			<td><textarea name="wed_txt"></textarea></td>
    		</tr>
    		<tr>
    			<td>규모</td>
    			<td><input type="text" name="wed_size"></td>
    		</tr>
    		<tr>
    			<td>최소인원</td>
    			<td><input type="text" name="wed_min"></td>
    		</tr>
    		<tr>
    			<td>최대인원</td>
    			<td><input type="text" name="wed_max"></td>
    		</tr>
    		<tr>
    			<td>하객음식</td>
    			<td><input type="text" name="wed_food"></td>
    		</tr>
    		<tr>
    			<td>연출</td>
    			<td><textarea name="wed_direct"></textarea></td>
    		</tr>
    		<tr>
    			<td>예식타입</td>
    			<td><input type="wed_type" name="wed_type"></td>
    		</tr>
    		<tr>
    			<td>Special Benefit</td>
    			<td><textarea name="wed_txt2"></textarea></td>
    		</tr>
    		<tr>
    			<td colspan="2">
					<input type="submit" value="작성">
    			</td>
    		</tr>
    		
    	</table>
    	</form>
    	
    	</div>
    	</section>
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>