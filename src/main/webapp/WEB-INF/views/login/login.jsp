<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#login {
		width : 1000px;
		height : 500px;
		margin : auto;
		text-align : center;
		margin-top : 50px;
		margin-bottom:500px;
	}
	#login div {
		padding : 20px;
	}
	
	#login #title{
	font-size:50px;
	border-bottom:1px solid #887159;
	margin-bottom:60px;
	padding-bottom:30px;
	}
	#login input[type=text] {
		width : 600px;
		height : 70px;
		border : 1px solid #887159;
		outline : none;
	}
	#login input[type=password] {
		width : 600px;
		height : 70px;
		border : 1px solid #887159;
		outline : none;
	}
	#login input[type=submit] {
		font-size:20px;
		width : 602px;
		height : 74px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	
	#login #txt div{
	width:170px;
	display:inline-block;}
</style>
<script>

</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
       <br><br>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 로그인 Area Start ================= -->
	<section id="login">
		<div id="title">로그인</div>
		<form method="post" action="login_ok">
		<input type="hidden" name="ck" value="3">
			<div> <input type="text" name="userid" placeholder="아이디를 입력하세요"> </div>
			<div> <input type="password" name="pwd" placeholder="비밀번호를 입력하세요"> </div>
			<div> <input type="submit" value="LOGIN"> </div>
		</form>
		<div id="txt">
			<div onclick="location='find_IdPw'">아이디 찾기 ></div>
			<div onclick="location='find_IdPw'">비밀번호 찾기 ></div>
			<div onclick="location='../member/member_input'">회원가입 ></div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</section>
    	
    <!-- ================ 로그인 Area End ================= -->

</body>