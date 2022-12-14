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
    
    section #wed_update table input[type=text].num_input{
    width:50%;}
    
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
    
    section #wed_update input[type=checkbox]{
    display:none;}
    
    section #wed_update input[type=checkbox]:checked+label:before{
    content:"D E L E T E";
    font-size:30px;
    font-family:fantasy ;
    color:white;
    text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
    text-align:center;
    padding-top:95px;
    margin-top:4px; 
    width:310px; 
    height:220px; 
    position: absolute; 
    background: rgba(0,0,0,.5)}
    
    section #wed_update #outer #left{
    float:left;}
     
    section #wed_update #outer #right{
    float:right;}
    
    section #wed_update .file_btn{
    width:30px;
    height:30px;
    background:#887159;
    border:1px solid #887159;
    color:white;
    cursor:pointer;}
    
    
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	function add_file()
	{
		var fname=document.getElementsByClassName("fname");
		var len=fname.length;	// ?????? type="file"??? ??????
		if(len < 4)
		{
		len++;		// ?????? ??? ????????? file??? ????????? ????????? ????????? ?????? ????????? ????????? ??????. 
		var inner="<p class='fname'> <input type='file' name='fname"+len+"'> </p> "; // ????????? ??????
															// fname+?????? : ?????????????????? ???????????????????????? ????????? 
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
	
	
	var num_chk1=1;
	function num_check1(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg1").innerText="???????????? ??????????????????";
			document.getElementById("msg1").style.color="red";
			num_chk1=0;
		}
		else
		{
			document.getElementById("msg1").innerText="";
			num_chk1=1;
		}
	} 
	
	var num_chk2=1;
	function num_check2(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg2").innerText="???????????? ??????????????????";
			document.getElementById("msg2").style.color="red";
			num_chk2=0;
		}
		else
		{
			document.getElementById("msg2").innerText="";
			num_chk2=1;
		}
	} 
	
	var num_chk3=1;
	function num_check3(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg3").innerText="???????????? ??????????????????";
			document.getElementById("msg3").style.color="red";
			num_chk3=0;
		}
		else
		{
			document.getElementById("msg3").innerText="";
			num_chk3=1;
		}
	} 
	
	var num_chk4=1;
	function num_check4(num)
	{
		var num=(/^[0-9]+$/).test(num);
		
		if(num==0)
		{
			document.getElementById("msg4").innerText="???????????? ??????????????????";
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
	   	 var chk_pic=document.getElementsByName("chk_pic"); 
	   	 var len=chk_pic.length; 
	   	 var del="";  
	   	 var save="";
	   	 for(i=0; i<len; i++)	
	   	 {	 
	   	     if(chk_pic[i].checked)
	   		 {
	   	    	 del=del+chk_pic[i].value+",";
	   		 }
	   	     else   
	   	     {
	   	    	 save=save+chk_pic[i].value+",";
	   	     }	 
	   		
	   	 }	
		
		var num=(/^[0-9]+$/).test(num);

		if(chk.wed_hall.value.trim().length==0)
		{
			alert("????????? ????????? ???????????????.");
			return false;
		}
		else if(chk.wed_title.value.trim().length==0)	
		{
			alert("???????????? ???????????????.");
			return false;
		}
		else if(chk.wed_txt.value.trim().length==0)	
		{
			alert("????????? ???????????????.");
			return false;
		}
		else if(chk.wed_size.value.trim().length==0)	
		{
			alert("????????? ???????????????.");
			return false;
		}
		else if(num_chk1==0)	
		{
			alert("????????? ???????????????.");
			return false;
		}
		else if(chk.wed_min.value.trim().length==0)	
		{
			alert("??????????????? ??????????????? .");
			return false;
		}
		else if(num_chk2==0)	
		{
			alert("????????? ???????????????.");
			return false;
		}
		else if(chk.wed_max.value.trim().length==0)	
		{
			alert("??????????????? ???????????????.");
			return false;
		}
		else if(num_chk3==0)	
		{
			alert("????????? ???????????????.");
			return false;
		}
		else if(chk.wed_food.value.trim().length==0)	
		{
			alert("??????????????? ???????????????.");
			return false;
		}
		else if(chk.wed_direct.value.trim().length==0)	
		{
			alert("????????? ???????????????.");
			return false;
		}
		else if(chk.wed_type.value.trim().length==0)	
		{
			alert("??????????????? ???????????????.");
			return false;
		}
		else if(chk.wed_txt2.value.trim().length==0)	
		{
			alert("Special Benefit??? ???????????????.");
			return false;
		}
		else if(chk.wed_price.value.trim().length==0)	
		{
			alert("????????? ????????? ???????????????.");
			return false;
		}
		else if(num_chk4==0)	
		{
			alert("????????? ???????????????.");
			return false;
		}
		else
		{
			alert("???????????? ?????????????????????.");
			//alert("del="+del+"save="+save);
			chk.del.value=del;
			chk.save.value=save;
			return true;
		} 
	} 
	
	
	

</script>


</head>

<body>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
    <!-- bradcam_area_start -->
    <!-- ??? ????????? ???????????? ???
    	???[webapp\resources\css]????????? ?????? [style.css]????????? ????????? ????????????
    	???[webapp\resources\img\banner]????????? ?????????????????? ???????????? -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area ????????????" -->
        <div id="h3">WEDDING UPDATE</div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area ????????? End ================= -->


	<!-- ================ ?????????(???????????? ??????) Area Start ================= -->
    <!-- ????????????(???????????? ??????)_area_start -->
    
<section>
<div id="wed_update">
<form method="post" action="wed_update_ok" enctype="multipart/form-data"  onsubmit="return check(this)">
<input type="hidden" name="id" value="${wvo.id }">
<input type="hidden" name="del">
<input type="hidden" name="save">
    <table border="1">
    	<tr>
    		<td>????????? ??????</td>
    		<td><input type="text" name="wed_hall" value="${wvo.wed_hall }"></td>
    	</tr>
    	<tr>
    		<td>?????????</td>
    		<td><textarea name="wed_title">${wvo.wed_title }</textarea></td>
    	</tr>    		
    	<tr>
    		<td>??????(4??? ??????)</td>
    		<td>
    		<c:set var="i" value="0"/>
    			<c:forEach items="${img}" var="pic">
					<input type="checkbox" id="checkbox${i }" name="chk_pic" value="${pic }">					
    				<label for="checkbox${i }" >
						<div id="img"><img src="../img/wedding/${pic}" width="310" height="220"></div>		
					</label>
				<c:set var="i" value="${i+1}"/>
				</c:forEach>
				
				<hr>
				<div id="outer">
					<div id="right">
	    				<input type="button" onclick="add_file()" value="+" class="file_btn">
						<input type="button" onclick="del_file()" value="-" class="file_btn">
					</div>
					<div id="left">
						<p class="fname"><input type="file" name="fname1"></p>
					</div>
				</div>
    		</td>	
    	</tr>
    	<tr>
    		<td>??????</td>
    		<td><textarea name="wed_txt">${wvo.wed_txt }</textarea></td>
    	</tr>
    	<tr>
    		<td>??????</td>
    		<td>
				<input type="text" name="wed_size" class="num_input" value="${wvo.wed_size }" onkeyup="num_check1(this.value)">
				<span id="msg1" style="font-size:13px; margin-left:10px;"></span>
			</td>
    	</tr>
    	<tr>
    		<td>????????????(???)</td>
    		<td>
    			<input type="text" name="wed_min" class="num_input" value="${wvo.wed_min }" onkeyup="num_check2(this.value)">
    			<span id="msg2" style="font-size:13px; margin-left:10px;"></span>
    		</td>
    	</tr>
    	<tr>
    		<td>????????????(???)</td>
    		<td>
    			<input type="text" name="wed_max" class="num_input" value="${wvo.wed_max }" onkeyup="num_check3(this.value)">
    			<span id="msg3" style="font-size:13px; margin-left:10px;"></span>
    		</td>
    	</tr>
    	<tr>
    		<td>????????????</td>
    		<td><input type="text" name="wed_food" value="${wvo.wed_food }"></td>
    	</tr>
    	<tr>
    		<td>??????</td>
    		<td><textarea name="wed_direct">${wvo.wed_direct }</textarea></td>
    	</tr>
    	<tr>
    		<td>????????????</td>
    		<td><input type="text" name="wed_type" value="${wvo.wed_type }"></td>
    	</tr>
    	<tr>
    		<td>Special Benefit</td>
    		<td><textarea name="wed_txt2">${wvo.wed_txt2 }</textarea></td>
    	</tr>
    	<tr>
    		<td>??????(??????)</td>
    		<td>
    			<input type="text" name="wed_price" class="num_input" value="${wvo.wed_price }" onkeyup="num_check4(this.value)">
    			<span id="msg4" style="font-size:13px; margin-left:10px;"></span>
    		</td>
    	</tr> 		
    	<tr>
    		<td colspan="2">
				<input type="submit" class="btn" value="??????">
				<input type="button" class="btn" onclick="location='wed_list'" value="?????????">
    		</td>
    	</tr>
    </table>
</form> 
</div>
</section>
    	

    	
    	
 
    	
    	
    	
    <!-- ????????????(???????????? ??????)_area_end -->
    <!-- ================ ?????????(???????????? ??????) Area End ================= -->

</body>