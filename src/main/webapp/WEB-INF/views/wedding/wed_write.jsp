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
    
    section #wed_write table input[type=text].num_input{
    width:50%;}
    
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
 
	var num_chk1=0;
	function num_check1(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg1").innerText="숫자로만 입력해주세요";
			document.getElementById("msg1").style.color="red";
			num_chk1=0;
		}
		else
		{
			document.getElementById("msg1").innerText="";
			num_chk1=1;
		}
	} 
	
	var num_chk2=0;
	function num_check2(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg2").innerText="숫자로만 입력해주세요";
			document.getElementById("msg2").style.color="red";
			num_chk2=0;
		}
		else
		{
			document.getElementById("msg2").innerText="";
			num_chk2=1;
		}
	} 
	
	var num_chk3=0;
	function num_check3(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg3").innerText="숫자로만 입력해주세요";
			document.getElementById("msg3").style.color="red";
			num_chk3=0;
		}
		else
		{
			document.getElementById("msg3").innerText="";
			num_chk3=1;
		}
	} 
	
	var num_chk4=0;
	function num_check4(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg4").innerText="숫자로만 입력해주세요";
			document.getElementById("msg4").style.color="red";
			num_chk4=0;
		}
		else
		{
			document.getElementById("msg4").innerText="";
			num_chk4=1;
		}
	} 
	
	function check(chk)
	{	
		var num=(/^[0-9]+$/).test(num);
		
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
		else if(num_chk1==0)	
		{
			alert("숫자로 작성하세요.");
			return false;
		}
		else if(chk.wed_min.value.trim().length==0)	
		{
			alert("최소인원을 작성하세요 .");
			return false;
		}
		else if(num_chk2==0)	
		{
			alert("숫자로 작성하세요.");
			return false;
		}
		else if(chk.wed_max.value.trim().length==0)	
		{
			alert("최대인원을 작성하세요.");
			return false;
		}
		else if(num_chk3==0)	
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
		else if(num_chk4==0)	
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
    			<td>
    				<input type="text" name="wed_size" class="num_input" onkeyup="num_check1(this.value)">
    				<span id="msg1" style="font-size:13px; margin-left:10px;"></span>
    			</td>
    		</tr>
    		<tr>
    			<td>최소인원(인)</td>
    			<td>
    				<input type="text" name="wed_min" class="num_input" onkeyup="num_check2(this.value)">
    				<span id="msg2" style="font-size:13px; margin-left:10px;"></span>
    			</td>
    		</tr>
    		<tr>
    			<td>최대인원(인)</td>
    			<td>
    				<input type="text" name="wed_max" class="num_input" onkeyup="num_check3(this.value)">
    				<span id="msg3" style="font-size:13px; margin-left:10px;"></span>
    			</td>
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
    			<td>
    				<input type="text" name="wed_price" class="num_input" onkeyup="num_check4(this.value)">
    				<span id="msg4" style="font-size:13px; margin-left:10px;"></span>
    			</td>
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