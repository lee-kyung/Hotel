<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
/******************/
	#first{
	width:100%;
	height:400px;
	background:#F3F3F3;
	text-align:center;}
	
	#first #first_1{
	margin:auto;
	width:1800px;}
	
	#first #txt{
	text-align:left;
	font-size:40px;
	padding-top:50px;}
	
	#first #txt2{
	margin-bottom:20px;
	text-align:right;
	font-size:18px;}
	
	#first #txt2 span{
	cursor:pointer;}
	
	#first ul li{
	display:inline-block;
	border:1px solid #cccccc;
	width:450px;
	height:150px;
	margin-top:20px;
	background:white;
	border-right:none;
	text-align:center;
	font-size:25px;
	padding-top:50px;
	cursor:pointer;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
/******************/

	section{
	width:900px;
	margin:auto;
	margin-top:50px;
	margin-bottom:200px;}
	
	section #myprofile_pwd #txt{
	text-align:center;
	font-size:50px;}
	
	section #myprofile_pwd #txt1{
	margin-top:20px;
	text-align:center;
	font-size:20px;
	margin-bottom:70px;}
	
	section #myprofile_pwd .txt2{
	margin-top:30px;
	font-size:20px;
	font-weight:600;
	margin-bottom:20px;}
	
	section #myprofile_pwd input[type=password]{
	width:100%;
	height:70px;
	outline:none;
	font-size:20px;
	padding-left:20px;}
	
	section #myprofile_pwd #msg{
	padding-top:20px;}
	
	section #myprofile_pwd #bar{
	margin-top:20px;
	border-bottom:1px solid #cccccc;}
	
	section #myprofile_pwd input[type=submit]{
	width:450px;
	height:80px;
	margin-top:50px;}
	
	section #myprofile_pwd #msg4{
	margin-top:70px;}
	
	section #myprofile_pwd #btn_center{
	text-align:center;}
</style>
<script>

 var pre=0; 
	
	function prepwd_check(prepwd)
	{
		//var pwd=document.chk.pwd1.value;
		if(prepwd.trim().length==0)
		{
			document.getElementById("msg1").innerText="비밀번호 항목 입력이 필요합니다.";
			document.getElementById("msg1").style.color="red";
			pre=0; 
		}
		
		else if(prepwd.trim().length!=0)
		{
			var chk=new XMLHttpRequest();
			chk.open("get","myprofile_pwd_ok?pwd="+prepwd);
			chk.send();
			chk.onreadystatechange=function()
			{
				if(chk.readyState==4)
				{
					// alert(chk.responseText);
					
				 	if(chk.responseText=="0")
					{
						document.getElementById("msg1").innerText="비밀번호가 일치하지 않습니다.";
						document.getElementById("msg1").style.color="red";
						pre=0;
					}
					else
					{
						document.getElementById("msg1").innerText="비밀번호가 일치합니다";
						document.getElementById("msg1").style.color="blue";								
						pre=1;
					} 
				}
			}
		}
	}
	
 	var new1=0; 
	function newpwd_check(newpwd1)
	{
		
		var prepwd=document.chk.prepwd.value;
		var newpwd1=document.chk.newpwd1.value;
		var newpwd2=document.chk.newpwd2.value;
		
		var blank=newpwd1.search(/[\s]/g);
	
		var kor=(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(newpwd1);
		
		var spe =(/[~!@#$%^&*()_|<>?:{}]/gi).test(newpwd1);
		
		if((newpwd1.trim().length < 8) || (newpwd1.trim().length > 15))
		{
			document.getElementById("msg2").innerText="비밀번호는 8자 이상, 15자 이하입니다 .";
			document.getElementById("msg2").style.color="red";
			new1=0;
		}
		
		else if(blank>0){
			document.getElementById("msg2").innerText="비밀번호에 공백을 사용할 수 없습니다.";
			document.getElementById("msg2").style.color="red";
			new1=0;
		}
		
		else if(kor>0){
			document.getElementById("msg2").innerText="비밀번호에 한글을 사용할 수 없습니다.";
			document.getElementById("msg2").style.color="red";
			new1=0;
		}
		
		else if(spe<1){
			document.getElementById("msg2").innerText="비밀번호에 특수문자 하나 이상이 필요합니다. (+는 사용할 수 없습니다.)";
			document.getElementById("msg2").style.color="red";
			new1=0;
		}
		else{
			document.getElementById("msg2").innerText="";		
			new1=1;
		}
		
	
	} 

	
 // 비밀번호 일치여부	
	var new2=0;
	function newpwd_equal(newpwd2)
	{
		var newpwd1=document.chk.newpwd1.value;
		if(newpwd1!=newpwd2)
		{
			document.getElementById("msg3").innerText="비밀번호가 불일치합니다";
			document.getElementById("msg3").style.color="red";
			new2=0;
		}
		else
		{
			document.getElementById("msg3").innerText="비밀번호가 일치합니다";
			document.getElementById("msg3").style.color="blue";
			new2=1;
		}
	}
	
 
	
	function check(my)
 	{
		
		var prepwd=document.chk.prepwd.value;
		var newpwd1=document.chk.newpwd1.value;
		var newpwd2=document.chk.newpwd2.value;
		
 		if(pre==0)
 		{
 			document.getElementById("msg4").innerText="현재 비밀번호를 확인하세요";
 			document.getElementById("msg4").style.color="red";
 			return false;
 		}
 		
 		else if(new1==0)
 		{
 			document.getElementById("msg4").innerText="새로운 비밀번호를 확인하세요";
 			document.getElementById("msg4").style.color="red";
 			return false;
 		}
 		else if(new2==0)
 		{
 			document.getElementById("msg4").innerText="새로운 비밀번호를 다시 입력하세요";
 			document.getElementById("msg4").style.color="red";
 			return false;
 		}
 		else 
 			alert("비밀번호가 변경되었습니다.");
 			return true;
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
        <h3> 문구(자유롭게 변경하기) </h3>
    </div>
    
<!-- first -->    
<div id="first">
	<div id="first_1">
		<div id="txt">${name }님, 환영합니다.</div> 
		<div id="txt2">
			<span onclick="location='../mypage/myprofile_pwd'">회원정보 수정 > </span>&nbsp;&nbsp;
			<span onclick="location='../mypage/mypwd_change'">비밀번호 수정 > </span>
		</div> 
	</div>	
	<ul>
		<li>객실 예약 확인</li><li>레스토랑 예약 확인</li><li>E-SHOP 주문내역</li><li>웨딩 예약 확인</li>
	</ul>
</div>
<!-- first/ -->
	
	
<section>
<div id="myprofile_pwd">
<!-- mypage 내용 작성 -->
<form name="chk" method="post" action="mypwd_change_ok" onsubmit="return check(this)">
	<div id="txt"> 회원 정보 </div>
	<div id="txt1">고객님의 소중한 개인정보 보호를 위해 비밀번호를 변경해 주세요.</div>
	
	<div class="txt2">현재 비밀번호</div>
	<input type="password" name="prepwd" placeholder="비밀번호를 입력하세요" onblur="prepwd_check(this.value)">
	<div id="msg1" style="font-size:14px;"></div>
	
	<div class="txt2">새 비밀번호</div>
	<input type="password" name="newpwd1" placeholder="비밀번호를 입력하세요" onkeyup="newpwd_check(this.value)">
	<div id="msg2" style="font-size:14px;"></div>
	
	<div class="txt2">새 비밀번호 확인</div>
	<input type="password" name="newpwd2" placeholder="비밀번호를 입력하세요" onkeyup="newpwd_equal(this.value)">
	<div id="msg3" style="font-size:14px;"></div>
	
	<div id="msg4" style="font-size:14px;"></div>
	<div id="bar"></div>
	<div id="btn_center"><input type="submit" class="button button-contactForm btn_1 boxed-btn" value="확인"></div>
</form>
</div>
</section>




</body>