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
		margin-top : 100px;
	}
	#login div {
		margin-top : 15px;
	}
	#login input[type=text] {
		width : 300px;
		height : 40px;
		border : 1px solid #887159;
		outline : none;
	}
	#login input[type=password] {
		width : 300px;
		height : 40px;
		border : 1px solid #887159;
		outline : none;
	}
	#login input[type=submit] {
		width : 302px;
		height : 44px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
</style>
<script>

</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 로 그 인 </h3>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 로그인 Area Start ================= -->
	<section id="login">
		<form method="post" action="login_ok">
		<input type="hidden" name="ck" value="3">
			<div> <input type="text" name="userid" placeholder="아이디"> </div>
			<div> <input type="password" name="pwd" placeholder="비밀번호"> </div>
			<div> <input type="submit" value="로그인"> </div>
		</form>
		<div>
			<div onclick="location='find_IdPw'">아이디 찾기 ></div>
			<div onclick="location='find_IdPw'">비밀번호 찾기 ></div>
		</div>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</section>
    	
    <!-- ================ 로그인 Area End ================= -->

</body>