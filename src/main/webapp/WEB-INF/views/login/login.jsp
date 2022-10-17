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
		margin-bottom : 150px;
	}
	#login div {
		padding : 5px;
	}
	#login #title{
		font-size : 50px;
		border-bottom : 1px solid #887159;
		margin-bottom : 50px;
		padding-bottom : 30px;
	}
	#login input[type=text] {
		width : 400px;
		height : 60px;
		border : 1px solid #887159;
		outline : none;
		padding-left : 10px;
	}
	#login input[type=password] {
		width : 400px;
		height : 60px;
		border : 1px solid #887159;
		outline : none;
		padding-left : 10px;
	}
	#login input[type=submit] {
		font-size:20px;
		width : 400px;
		height : 62px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#login #txt div{
		width:150px;
		display:inline-block;
		cursor:pointer;}
	#login #klogin {
		margin : auto;
		margin-top : 20px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
	$(function(){
		$("#klogin_btn").click(function(event){
			event.preventDefault();
			$("#klogin_alert").addClass("d-none");
			Kakao.init('8dfc3525b44ec9d9ada0dbda8f3711d9');
			Kakao.Auth.login({
				success : function(auth){
					Kakao.API.request({
						url : '/v2/user/me',
						success : function(response){
							var account=response.kakao_account;
							$('#klogin_form input[name=name]').val(account.profile.nickname);
							$('#klogin_form input[name=email]').val(account.email);						
							document.querySelector('#klogin_form').submit();
						},
						fail : function(error){
							$("#klogin_alert").removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
						}
					});
				},
				fail : function(error){
					$("#klogin_alert").removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
				}
			});
		})
	})
	
	/*window.onload=function(){
		if(${err != null})
			alert("입력하신 ID 또는 비밀번호가 잘못되었습니다.");
	}*/
</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
       <br><br>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 로그인 Area Start ================= -->
	<section id="login">
		<div id="title">로그인</div>
		<form method="post" action="login_ok">
		<input type="hidden" name="ck" value="${ck}">
		<input type="hidden" name="p" value="${p}">
			<div> <input type="text" name="userid" placeholder="아이디를 입력하세요"> </div>
			<div> <input type="password" name="pwd" placeholder="비밀번호를 입력하세요"> </div>
			<div style="margin:10px auto 10px auto;font-size:13px;color:red;">
				<c:if test="${err != null}">
				아이디 또는 비밀번호를 잘못 입력하셨습니다. <br> 입력하신 내용을 다시 확인하세요.
				</c:if>
			</div>
			<div> <input type="submit" value="LOGIN"> </div>
		</form>
		<div id="txt">
			<div onclick="location='find_IdPw'">아이디 찾기 ></div>
			<div onclick="location='find_IdPw'">비밀번호 찾기 ></div>
			<div onclick="location='../member/member_input'">회원가입 ></div>
		</div>
		<div id="klogin">
			<div id="klogin_alert"></div>			    		
 				<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼" id="klogin_btn" style="cursor:pointer;">
	   		<form method="post" action="klogin_ok" id="klogin_form">
	   		<input type="hidden" name="ck" value="${ck}">
			<input type="hidden" name="p" value="${p}">
	   			<input type="hidden" name="name">
	   			<input type="hidden" name="email">	   			
	   		</form>
		</div>	
	</section>    	
    <!-- ================ 로그인 Area End ================= -->

</body>