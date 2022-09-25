<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
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
	
	#first .txt2{
	margin-bottom:20px;
	text-align:right;
	font-size:20px;
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
	
	section{
	width:1100px;
	margin:auto;
	margin-top:50px;
	margin-bottom:200px;}
	
	section #profile_edit form{
	margin-top:70px;
	margin-bottom:70px;
	border:1px solid #887159;
	padding-top:20px;
	padding-bottom:40px;}
	
	section #profile_edit div{
	padding:10px;}
	
	section #profile_edit #title{
	text-align:center;
	font-size:35px;}
	
	section #profile_edit .my{
	border:1px solid #887159;
	width:500px;
	height:50px;
	margin-left:20px;
	background:#F6F6F6;}
	
	section #profile_edit input[type=text]{
	margin-left:20px;
	width:490px;
	height:50px;
	outline:none;}
	
	section #profile_edit #zip{
	width:200px;
	outline:none;}
	
	section #profile_edit #juso, #profile_edit #juso_etc{
	width:650px;
	margin-top:10px;
	outline:none;}
	
	section #profile_edit input[type=button]{
	width:150px;
	margin-left:296px;
	background:#887159;
	color:white;
	border:none;
	height:50px;}
	
	section #profile_edit #btn_right{
	float:right;}
	
	section #profile_edit input[type=submit]{
	margin-top:70px;
	width:300px;
	height:60px;
	background:#887159;
	border:none;
	color:white;}

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
	{
		new daum.Postcode({
			
			oncomplete: function(data) {
				
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					
					addr = data.roadAddress;
				} 
				
				else { // 사용자가 지번 주소를 선택했을 경우(J)
				
					addr = data.jibunAddress;
				}
	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.join.zip.value = data.zonecode; // 우편번호
				document.join.juso.value = addr;  // 주소
				
				// 커서를 상세주소 필드로 이동한다.
				document.join.juso_etc.focus();
				
			}
		
		}).open();
		
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
<div id="first">
	<div id="first_1">
		<div id="txt"><span onclick="location='mypage'">${name }님, 환영합니다.</span></div>
		<div class="txt2">
			<span onclick="location='../mypage/myprofile_pwd'">회원정보 수정 > </span>&nbsp;&nbsp;
			<span onclick="location='../mypage/mypwd_change'">비밀번호 수정 > </span>
		</div> 
	</div>	
	<ul>
		<li>객실 예약 확인</li><li>레스토랑 예약 확인</li><li>E-SHOP 주문내역</li><li>웨딩 예약 확인</li>
	</ul>
</div>

<section>
<div id="profile_edit">

	<div id="title">회원 정보 수정</div>
	<form method="post" action="myprofile_edit_ok">
		<div>
			<div>아이디</div>
			<div class="my">${mvo.userid }</div>
		</div>
		<div>
			<div>이름</div>
			<div class="my">${mvo.name }</div>
		</div>
		<div>
			<div>휴대전화</div>
			<div><input type="text" name="phone" value="${mvo.phone }"></div>
		</div>
		<div>
			<div>생년월일</div>
			<div><input type="text" name="birth" value="${mvo.birth }"></div>
		</div>
		<div>
			<div>이메일</div>
			<div><input type="text" name="email" value="${mvo.email }"></div>
		</div>
		<div>
			<div>주소</div>
			<div>
				<input type="text" name="zip" readonly  placeholder="우편번호" id="zip" value="${mvo.zip }">
				<input type="button" value="주소찾기" onclick="juso_search()">
				<input type="text" name="juso" placeholder="주소" readonly id="juso" value="${mvo.juso }">
				<input type="text" name="juso_etc" placeholder="상세주소" id="juso_etc" value="${mvo.juso_etc }">
			
			</div>
		</div>
		<div id="btn_right">
			<input type="submit" value="정보수정완료">
		</div>
	</form>		
		
</div>
</section>
</body>