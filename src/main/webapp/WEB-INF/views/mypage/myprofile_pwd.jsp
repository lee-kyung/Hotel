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
		
	#first #first_1 span{
	cursor:pointer;}
	
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
	
	#first #list{
	width:1820px;
	margin:auto;}
	
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
	font-size:20px;}
	
	section #myprofile_pwd #txt2{
	margin-top:70px;
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
	margin-top:70px;
	border-bottom:1px solid #cccccc;}
	
	section #myprofile_pwd input[type=button]{
	width:450px;
	height:80px;
	margin-top:50px;
	border:1px solid #887159;
	color:#887159;
	background:white;
	cursor:pointer;}
	
	section #myprofile_pwd input[type=button]:hover{
	color:white;
	background:#887159;}
	
	section #myprofile_pwd #btn_center{
	text-align:center;}
</style>
<script>
	function check()
	{
		var pwd=document.pwd2.pwd.value;
		if(pwd.trim().length==0)
		{
			document.getElementById("msg").innerText="비밀번호 항목 입력이 필요합니다.";
			document.getElementById("msg").style.color="red";
			return false;
		}
		
		else
		{
			var pwd=document.pwd2.pwd.value;
			var chk=new XMLHttpRequest();
			chk.open("get","myprofile_pwd_ok?pwd="+pwd);
			chk.send();
			chk.onreadystatechange=function()
			{
				if(chk.readyState==4)
				{
					// alert(chk.responseText);
					
					if(chk.responseText=="0")
					{
						document.getElementById("msg").innerText="비밀번호가 일치하지 않습니다.";
						document.getElementById("msg").style.color="red";
					}
					else
					{
						location="../mypage/myprofile";									
					}
				}
			}
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
        <h3> 문구(자유롭게 변경하기) </h3>
    </div>
    
<!-- first -->    
<div id="first">
	<div id="first_1">
		<div id="txt"><span onclick="location='mypage'">${name }님, 환영합니다.</span></div>
		<div id="txt2">
			<span onclick="location='../mypage/myprofile_pwd'">회원정보 수정 > </span>&nbsp;&nbsp;
			<span onclick="location='../mypage/mypwd_change'">비밀번호 수정 > </span>
		</div> 
	</div>	
	<div id="list">
		<ul>
			<li onclick="location='room_resv'">객실 예약 확인</li><li onclick="location='dine_resv'">레스토랑 예약 확인</li><li onclick="location='eshop_gumae'">E-SHOP 주문내역</li><li onclick="location='wedding_resv'">웨딩 예약 확인</li>
		</ul>
	</div>
</div>
<!-- first/ -->
	
	
<section>
<div id="myprofile_pwd">
<!-- mypage 내용 작성 -->
<form name="pwd2" method="post">
	<div id="txt"> 회원 정보 </div>
	<div id="txt1">외부로부터 고객님의 정보를 안전하게 보고하기 위해 비밀번호를 다시 한 번 확인합니다.</div>
	
	<div id="txt2">비밀번호</div>
	<input type="password" name="pwd" placeholder="비밀번호를 입력하세요">
	<div id="msg" style="font-size:14px;"></div>
	<div id="bar"></div>
	<div id="btn_center"><input type="button" onclick="check()" value="확인"></div>
</form>
</div>
</section>




</body>