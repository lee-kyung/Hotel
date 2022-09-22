<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
	width:1100px;
	margin:auto;
	border:1px solid red;
	margin-top:100px;
	margin-bottom:200px;}
</style>
<script>
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
					document.getElementById("txt1").innerText="입력하신 정보와 일치하는 회원이 없습니다. 다시 시도해주세요.";
					document.getElementById("txt1").style.color="red";
				}
				else
				{
					var id=us.responseText.trim();
				//	document.getElementById("userid_search").style.display:none;
					document.getElementById("txt1").innerText="회원님의 아이디는"+id+"입니다.";
					
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
					document.getElementById("txt2").innerText="입력하신 정보와 일치하는 회원이 없습니다. 다시 시도해주세요.";
					document.getElementById("txt2").style.color="red";
				}
				else
				{
					var pw=ps.responseText.trim();
					document.getElementById("txt2").innerText="회원님의 비밀번호는"+pw+"입니다.";
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
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
  <section>
  <div>
  	<div>아이디 /비밀번호 찾기</div>
  	<div>아이디 찾기</div>
  	<div>비밀번호 찾기</div>
  	<div>아이디를 잊으셨나요?<br>회원가입 시 작성하신 이메일로 찾으실 수 있습니다.</div>
  	<div>비밀번호를 잊으셨나요?<br>회원가입 시 작성하신 이메일로 찾으실 수 있습니다.</div>
  	<form method="post" name="userid_search">
	  	<div>이름</div>
	  	<div><input type="text" name="name"></div>
	  	<div>이메일</div>
	  	<div><input type="text" name="email"></div>
	  	<div><input type="button" value="아이디 찾기" onclick="userid_search_fn()"></div>
	  	<div id="txt1"></div>
  	</form>
  	<form method="post" name="pwd_search">
	  	<div>아이디</div>
	  	<div><input type="text" name="userid"></div>
	  	<div>이름</div>
	  	<div><input type="text" name="name"></div>
	  	<div>이메일</div>
	  	<div><input type="text" name="email"></div>
	  	<div><input type="button" value="비밀번호 찾기" onclick="pwd_search_fn()"></div>
	  	<div id="txt2"></div>
  	</form>
  </div>
  </section>
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>