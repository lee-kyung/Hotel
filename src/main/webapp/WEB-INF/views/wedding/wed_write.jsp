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
	
	section #wed_write table{
	margin:auto;
	width:900px;
	border-collapse:separate;
    border-spacing:20px;}
    
    section #wed_write table td:first-child{
    font-weight:600;
    width:200px;}
    
    section #wed_write table input[type=text]{
    width:98%;
    height:50px;
    outline:none;}
    
    section #wed_write table textarea{
    width:98%;
    height:200px;
    outline:none;
    resize:none;}
    
    section #wed_write table tr:last-child{
    text-align:center;}
    
    section #wed_write table .btn{    
    width:300px;
    height:70px;
    background:white;
    margin-top:50px;
    border:1px solid #887159;
    color:#887159;
    cursor:pointer;}
    
    section #wed_write table .btn:hover{
    background:#887159;
    color:white;}
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
	
	
	function check(chk)
	{	
		var num=(chk.wed_size.value).search(/[0-9]/);
		var kor=(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(chk.wed_size.value);
		var eng=(/^[a-zA-Z]*$/).test(chk.wed_size.value); 
		var spe =(/[~!@#$%^&*()_+|<>?:{}]/gi).test(chk.wed_size.value);
		
		
		if(chk.wed_hall.value.trim().length==0)
		{
			alert("웨딩홀 이름을 작성하세요.");
			return false;
		}
		else if(chk.wed_title.value.trim().length==0)	
		{
			alert("소개글을 작성하세요.");
			return false;
		}
		else if(chk.fname1.value.trim().length==0)	
		{
			alert("사진을 등록하세요.");
			return false;
		}
		else if(chk.wed_txt.value.trim().length==0)	
		{
			alert("특징을 작성하세요.");
			return false;
		}
		else if(chk.wed_size.value.trim().length==0)	
		{
			alert("규모를 작성하세요.");
			return false;
		}
		else if( ((chk.wed_size.value).search(/[0-9]/) != 0) && ((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(chk.wed_size.value)>0))	
		{
			alert("숫자로 작성하세요.");
			return false;
		}
		else if(chk.wed_min.value.trim().length==0)	
		{
			alert("최소인원을 작성하세요 .");
			return false;
		}
		else if( ((chk.wed_min.value).search(/[0-9]/) != 0) && ((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(chk.wed_min.value)>0))	
		{
			alert("숫자로 작성하세요 .");
			return false;
		}
		else if(chk.wed_max.value.trim().length==0)	
		{
			alert("최대인원을 작성하세요.");
			return false;
		}
		else if( ((chk.wed_max.value).search(/[0-9]/) != 0) && ((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(chk.wed_max.value)>0))	
		{
			alert("숫자로 작성하세요.");
			return false;
		}
		else if(chk.wed_food.value.trim().length==0)	
		{
			alert("하객음식을 작성하세요.");
			return false;
		}
		else if(chk.wed_direct.value.trim().length==0)	
		{
			alert("연출을 작성하세요.");
			return false;
		}
		else if(chk.wed_type.value.trim().length==0)	
		{
			alert("예식타입을 작성하세요.");
			return false;
		}
		else if(chk.wed_txt2.value.trim().length==0)	
		{
			alert("Special Benefit을 작성하세요.");
			return false;
		}
		else if(chk.wed_price.value.trim().length==0)	
		{
			alert("웨딩홀 금액을 작성하세요.");
			return false;
		}
		else if(((chk.wed_price.value).search(/[0-9]/) != 0) && ((/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(chk.wed_price.value)>0))	
		{
			alert("숫자로 작성하세요.");
			return false;
		}
		else
		{
			alert("웨딩홀이 등록됐습니다.");
			return true;
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
        <div id="h3">WEDDING WRITE</div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
    
<section>
<div id="wed_write">

     	<form method="post" action="wed_write_ok" enctype="multipart/form-data" onsubmit="return check(this)">
    	<table>
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
    			
    				<input type="button" onclick="add_file()" value="+">
					<input type="button" onclick="del_file()" value="-">
				
					<p class="fname"><input type="file" name="fname1"></p>
    			</td>
    			
    		</tr>
    		<tr>
    			<td>특징</td>
    			<td><textarea name="wed_txt"></textarea></td>
    		</tr>
    		<tr>
    			<td>규모(m2)</td>
    			<td><input type="text" name="wed_size" placeholder="숫자만 입력해주세요"></td>
    		</tr>
    		<tr>
    			<td>최소인원(인)</td>
    			<td><input type="text" name="wed_min" placeholder="숫자만 입력해주세요"></td>
    		</tr>
    		<tr>
    			<td>최대인원(인)</td>
    			<td><input type="text" name="wed_max" placeholder="숫자만 입력해주세요"></td>
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
    			<td><input type="text" name="wed_type"></td>
    		</tr>
    		<tr>
    			<td>Special Benefit</td>
    			<td><textarea name="wed_txt2"></textarea></td>
    		</tr>
    		
    		<tr>
    			<td>금액(만원)</td>
    			<td><input type="text" name="wed_price" placeholder="숫자만 입력해주세요"></td>
    		</tr>
    		
    		<tr>
    			<td colspan="2">
					<input type="submit"  class="btn" value="작성">
					<input type="button"  class="btn" onclick="location='wed_list'" value="리스트">
    			</td>
    		</tr>
    		
    	</table>
    	</form>
</div>
</section>
    	

    	
    	
 
    	
    	
    	
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>