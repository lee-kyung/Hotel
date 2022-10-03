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
	margin-bottom:200px;
	height:1000px;}
	
	section #search #center{
	text-align:center;}
	
	section #search #title{
	font-size:40px;
	margin-bottom:30px;}
	
	section #search #txt1 #userid{
	display:inline-block;
	padding-top:20px;
	font-size:25px;
	border:1px solid #887159;
	border-bottom:none;
	width:400px;
	height:70px;
	border-right:1px solid #887159;
	color:#887159;;}
	
	section #search #txt1 #pwd{
	border-right:1px solid #DCDCDC;
	display:inline-block;
	padding-top:20px;
	font-size:25px;
	border:1px solid #DCDCDC;
	border-bottom:1px solid #887159;
	width:400px;
	height:70px;
	color:#9E9E9E;}
	
	section #search #txt2, #txt3{
	margin-top:40px;
	font-size:20px;}
	
	section #search #txt3{
	display:none;}
	
	section #search #us_form, #ps_form{
	padding-top:50px;
	margin:auto;
	width:700px;
	font-size:18px;}
	
	section #search #ps_form{
	display:none;}
	
	section #search #us_form div, #ps_form div{
	padding:10px;}
	
	section #search input[type=text], input[type=password]{
	width:99%;
	height:60px;
	outline:none;}
	
	section #search input[type=button]{
	width:670px;
	margin-top:30px;
	background:#887159;
	border:none;
	color:white;
	font-size:18px;
	height:70px;}
	
	section #search #msg1{
	margin-top:20px;
	text-align:center;}
	
	section #search #result{
	width:600px;
	height:200px;
	margin:auto;
	margin-top:30px;
	padding-top:30px;
	text-align:center;
	background:#887159;
	display:none;}
	
	section #search #result div{
	padding:10px;}
	
	section #search #result .txt1{
	font-size:25px;
	color:#EAEAEA;}
	
	section #search #result .txt2{
	font-size:30px;
	color:#BDBDBD;}
	
	
</style>
<script>

	function userid_fn()
	{
		document.getElementById("userid").style.color="#887159";
		document.getElementById("pwd").style.color="#9E9E9E";
		document.getElementById("txt3").style.display="none";
		document.getElementById("txt2").style.display="block";
		document.getElementById("us_form").style.display="block";
		document.getElementById("ps_form").style.display="none";
		document.getElementById("result").style.display="none";
		document.pwd_search.name.value="";
		document.pwd_search.userid.value="";
		document.pwd_search.email.value="";
		document.getElementById("msg1").innerText="";
		document.getElementById("userid").style.border="1px solid #887159";
		document.getElementById("userid").style.borderBottom="none";
		document.getElementById("pwd").style.border="1px solid #DCDCDC";
		document.getElementById("pwd").style.borderBottom="1px solid #887159";
	}
	
	function pwd_fn()
	{
		document.getElementById("pwd").style.color="#887159";
		document.getElementById("userid").style.color="#9E9E9E";
		document.getElementById("txt2").style.display="none";
		document.getElementById("txt3").style.display="block";
		document.getElementById("ps_form").style.display="block";
		document.getElementById("us_form").style.display="none";
		document.getElementById("result").style.display="none";
		document.userid_search.name.value="";
		document.userid_search.email.value="";
		document.getElementById("msg1").innerText="";
		document.getElementById("pwd").style.border="1px solid #887159";
		document.getElementById("pwd").style.borderBottom="none";
		document.getElementById("userid").style.border="1px solid #DCDCDC";
		document.getElementById("userid").style.borderBottom="1px solid #887159";
	}
	
	
	function userid_search_fn()
	{
		var name=document.userid_search.name.value;
		var email=document.userid_search.email.value;
		var us=new XMLHttpRequest();
		us.open("get","userid_search_ok?name="+name+"&email="+email);
		us.send();
		us.onreadystatechange=function()
		{
			if(us.readyState==4)
			{
				if(us.responseText=="0")
				{
					document.getElementById("msg1").innerText="입력하신 정보와 일치하는 회원이 없습니다. 다시 시도해주세요.";
					document.getElementById("msg1").style.color="red";
				}
				else
				{
					var id=us.responseText.trim();
					document.getElementById("result").style.display="block";
				//	document.getElementById("userid_search").style.display:none;
					document.getElementById("msg2").innerText="아이디";
					document.getElementById("msg3").innerText="아이디";
					document.getElementById("msg4").innerText=id;
					document.getElementById("msg4").style.color="white";
					
				}
			}
		}
	}
	
	function pwd_search_fn()
	{
		var userid=document.pwd_search.userid.value;
		var name=document.pwd_search.name.value;
		var email=document.pwd_search.email.value;
		var ps=new XMLHttpRequest();
		ps.open("get", "pwd_search_ok?userid="+userid+"&name="+name+"&email="+email);
		ps.send();
		ps.onreadystatechange=function()
		{
			if(ps.readyState==4)
			{
				if(ps.responseText=="0")
				{
					document.getElementById("msg1").innerText="입력하신 정보와 일치하는 회원이 없습니다. 다시 시도해주세요.";
					document.getElementById("msg1").style.color="red";
				}
				else
				{
					var pw=ps.responseText.trim();
					document.getElementById("result").style.display="block";
					document.getElementById("msg2").innerText="비밀번호";
					document.getElementById("msg3").innerText="비밀번호";
					document.getElementById("msg4").innerText=pw;
					document.getElementById("msg4").style.color="white";
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
     <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
        <br><br>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
  <section>
  <div id="search">
	  <div id="center">
	  	 <div id="title">아이디 /비밀번호 찾기</div>
	  	 <div id="txt1">
		  	<div onclick="userid_fn()" id="userid">아이디 찾기</div><div onclick="pwd_fn()" id="pwd">비밀번호 찾기</div>
		 </div>	
	  	 <div id="txt2">아이디를 잊으셨나요?<br>회원가입 시 작성하신 이메일로 아이디를 찾으실 수 있습니다.</div>
	  	 <div id="txt3">비밀번호를 잊으셨나요?<br>회원가입 시 작성하신 이메일로 비밀번호를 찾으실 수 있습니다.</div>
	  </div>
	  
	 <div id="us_form">
  	<form method="post" name="userid_search">
	  	<div>이름</div>
	  	<div><input type="text" name="name"></div>
	  	<div>이메일</div>
	  	<div><input type="text" name="email"></div>
	  	<div><input type="button" value="아이디 찾기" onclick="userid_search_fn()"></div>
	  	<div style="text-align:center; font-size:16px; cursor:pointer;" onclick="location='../login/login?ck=4'">로그인하기</div>
  	</form>
  	</div>
  	
  	<div id="ps_form">
  	<form method="post" name="pwd_search">
	  	<div>아이디</div>
	  	<div><input type="text" name="userid"></div>
	  	<div>이름</div>
	  	<div><input type="text" name="name"></div>
	  	<div>이메일</div>
	  	<div><input type="text" name="email"></div>
	  	<div><input type="button" value="비밀번호 찾기" onclick="pwd_search_fn()"></div>
	  	<div style="text-align:center; font-size:16px; cursor:pointer;" onclick="location='../login/login?ck=4'">로그인하기</div>
  	</form>
  	</div>
  	
  		<div id="msg1"></div>
  	
  	<div id="result">
  		<div class="txt1"><span id="msg2"></span> 조회 결과</div>
  		<div class="txt2">회원님의 <span id="msg3"></span> <span id="msg4"></span> 입니다.</div>
  	</div>
  	
  	
  </div>
  </section>
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>