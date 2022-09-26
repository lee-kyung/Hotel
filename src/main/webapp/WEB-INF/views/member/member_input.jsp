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
	
	section #member_input #txt1{
	text-align:center;
	font-size:40px;}
	
	section #member_input #txt2{
	margin-top:30px;
	margin-bottom:60px;
	text-align:center;
	font-size:20px;}
	
	section #member_input form{
	border:1px solid #887159;
	padding-top:20px;
	padding-bottom:40px;}
	
	section #member_input form div{
	padding:10px;}
	
	section #member_input form span{
	margin-left:30px;}
	
	section #member_input form input[type=text], input[type=password]{
	margin-left:20px;
	width:300px;
	height:50px;
	outline:none}
	
	section #member_input #phone1{
	width:200px;
	height:44px;
	outline:none;}
	
	section #member_input #phone2{
	width:200px;
	margin-left:0px;
	height:44px;
	outline:none;}
	
	section #member_input select{
	width:130px;
	margin-left:20px;
	text-align:center;
	height:40px;
	outline:none;}
	
	section #member_input #email{
	margin-left:0px;}
	
	section #member_input #email_juso{
	width:250px;
	height:50px;
	outline:none;}
	
	section #member_input #select{
	width:200px;
	margin-left:0px;
	height:50px;
	outline:none;}
	
	section #member_input #zip{
	width:200px;}
	
	section #member_input #juso, #member_input #juso_etc{
	width:770px;
	margin-top:10px;}
	
	section #member_input input[type=button]{
	width:150px;
	margin-left:416px;
	background:#887159;
	color:white;
	border:none;
	height:50px;}
	
	section #member_input input[type=submit]{
	margin-top:70px;
	width:300px;
	background:#887159;
	color:white;
	border:none;
	height:60px;}
	
	section #member_input #btn_right{
	float:right;}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function () {
		setDateBox();
	});

	function setDateBox() {
		var dt = new Date();
		var year = "";
		var com_year = dt.getFullYear();

		$("#year").append("<option value=''>년도</option>");
		for (var y = (com_year - 50); y <= (com_year ); y++) 
		{
			$("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
		}

		var month;
		$("#month").append("<option value=''>월</option>");
		for (var i = 1; i <= 12; i++) 
		{
  			$("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
   	 	}

		var day;
		$("#day").append("<option value=''>일</option>");
		for (var i = 1; i <= 31; i++) 
		{
			$("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
		}
	}


	var id_chk=0;
	function userid_check(userid)
	{ 
		var blank=userid.search(/[\s]/g);
	
		var kor=(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(userid);
		
		var spe =(/[~!@#$%^&*()_+|<>?:{}]/gi).test(userid);
		
		if(userid.trim().length==0)
		{
			document.getElementById("msg").innerText="아이디를 적어주세요.";
			document.getElementById("msg").style.color="red";
			id_chk=0;
		}
		
		else if((userid.trim().length < 6) || (userid.trim().length > 12))
		{
			document.getElementById("msg").innerText="아이디는 6자 이상, 12자 이하입니다 .";
			document.getElementById("msg").style.color="red";
			id_chk=0;
		}
		
		else if(blank>0){
			document.getElementById("msg").innerText="아이디에 공백을 사용할 수 없습니다.";
			document.getElementById("msg").style.color="red";
			id_chk=0;
		}
		
		else if(kor>0){
			document.getElementById("msg").innerText="아이디에 한글을 사용할 수 없습니다.";
			document.getElementById("msg").style.color="red";
			id_chk=0;
		}
		
		else if(spe>0){
			document.getElementById("msg").innerText="아이디에 특수문자를 사용할 수 없습니다.";
			document.getElementById("msg").style.color="red";
			id_chk=0;
		} 
		
		else
		{
			var chk=new XMLHttpRequest();
			chk.open("get","userid_check?userid="+userid)
			chk.send();
			chk.onreadystatechange=function()
			{
				if(chk.responseText=="0")
				{
					document.getElementById("msg").innerText="사용가능한 아이디입니다";
					document.getElementById("msg").style.color="blue";
					id_chk=1;
				}
				else
				{
					document.getElementById("msg").innerText="사용 불가능한 아이디입니다";
					document.getElementById("msg").style.color="red";
					id_chk=0;
				}
			}
		}
	}

	var pwd_chk=0; 
	function pwd_check(pwd)
	{
		var blank=pwd.search(/[\s]/g);
	
		var kor=(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(pwd);
		
		var spe =(/[~!@#$%^&*()_|<>?:{}]/gi).test(pwd);
		
		if(pwd.trim().length==0)
		{
			document.getElementById("msg2").innerText="비밀번호를 적어주세요.";
			document.getElementById("msg2").style.color="red";
			pwd_chk=0;
		}
		
		else if((pwd.trim().length < 8) || (pwd.trim().length > 15))
		{
			document.getElementById("msg2").innerText="비밀번호는 8자 이상, 15자 이하입니다 .";
			document.getElementById("msg2").style.color="red";
			pwd_chk=0;
		}
		
		else if(blank>0){
			document.getElementById("msg2").innerText="비밀번호에 공백을 사용할 수 없습니다.";
			document.getElementById("msg2").style.color="red";
			pwd_chk=0;
		}
		
		else if(kor>0){
			document.getElementById("msg2").innerText="비밀번호에 한글을 사용할 수 없습니다.";
			document.getElementById("msg2").style.color="red";
			pwd_chk=0;
		}
		
		else if(spe<1){
			document.getElementById("msg2").innerText="비밀번호에 특수문자 하나 이상이 필요합니다.(+ 는 사용할 수 없습니다.)";
			document.getElementById("msg2").style.color="red";
			pwd_chk=0;
		}
		
		else
		{
			document.getElementById("msg2").innerText="";
			pwd_chk=1;
		}
		
	} 
	
	var pwd2_chk=0;
	function pwd_equal(pwd2)
	{
		var pwd=document.join.pwd.value;
		if(pwd==pwd2)
		{
			document.getElementById("msg3").innerText="비밀번호가 일치합니다";
			document.getElementById("msg3").style.color="blue";
			pwd2_chk=1;
		}
		else
		{
			document.getElementById("msg3").innerText="비밀번호가 불일치합니다";
			document.getElementById("msg3").style.color="red";
			pwd2_chk=0;
		}
	}

	
	var phone_chk=0
	function phone_check(phone)
	{
		var kor=(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(phone);
		var spe =(/[~!@#$%^&*()_+|<>?:{}]/gi).test(phone);
		var eng=(/^[a-zA-Z]*$/).test(phone); 
		if((kor > 0)||(spe > 0)||(eng > 0))
		{
			document.getElementById("msg4").innerText="전화번호는 숫자로 입력해주세요.";
			document.getElementById("msg4").style.color="red";
			phone_chk=0;
		}
		else
		{
			document.getElementById("msg4").innerText="";
			phone_chk=1;
		}	
	}
	
	
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


	var email_chk=0; 
	function email_check(email)
	{
		var blank=email.search(/[\s]/g);
	
		var kor=(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/).test(email);
		
		var spe =(/[~!@#$%^&*()_+|<>?:{}]/gi).test(email);
		
		if(email.trim().length==0)
		{
			document.getElementById("msg5").innerText="이메일을 적어주세요.";
			document.getElementById("msg5").style.color="red";
			email_chk=0;
		}
		
		else if(blank>0){
			document.getElementById("msg5").innerText="이메일에 공백을 사용할 수 없습니다.";
			document.getElementById("msg5").style.color="red";
			email_chk=0;
		}
		
		else if(kor>0){
			document.getElementById("msg5").innerText="이메일에 한글을 사용할 수 없습니다.";
			document.getElementById("msg5").style.color="red";
			email_chk=0;
		}
		else
		{
			document.getElementById("msg5").innerText="";
			email_chk=1;
		}
		
	}
	
	
	
	
	 $(function() {
		$('#select').change(function() {
			if ($('#select').val() == 'directly') 
			{
				$('#email_juso').attr("readonly", false);
	            $('#email_juso').val("");
	            $('#email_juso').focus();
	            $('#email_juso').css({"border": "1px solid #6C6C6C"});
	            $('#email_juso').css({"background": "white"});
	        } 
			else 
			{
	            $('#email_juso').val($('#select').val());
	            $('#email_juso').attr("readonly", true);
	            $('#email_juso').css({"background": "#F3F3F3"});
	            $('#email_juso').css({"border": "1px solid #6C6C6C"});
	        }
	    })
	});
	
	$(document).ready(function(){
	
		$("#phone1").on("keyup",function(){
			
			if(this.value.length == 4){
			
				$("#phone2").focus();
			}	
		});
	}); 

	function check(chk)
	{
		if(id_chk==0)
		{
			alert("아이디를 다시 확인하세요.");
			return false;
		}
		else if((pwd_chk==0) || (pwd2_chk==0))
		{
			alert("비밀번호를 다시 확인하세요.");
			return false;
		}
		else if(chk.name.value.trim().length==0)	
		{
			alert("이름을 입력하세요.");
			return false;
		}
		else if((phone_chk==0))	
		{
			alert("전화번호를  다시 확인하세요.");
			return false;
		}
		else if((chk.birth.value.trim().length==0) || (chk.birth1.value.trim().length==0) || (chk.birth2.value.trim().length==0))	
		{
			alert("생년월일을 입력하세요.");
			return false;
		}
		else if((email_chk==0) || (chk.email_juso.value.trim().length==0))	
		{
			alert("이메일을 다시 확인하세요.");
			return false;
		}
		else if(chk.juso.value.trim().length==0)	
		{
			alert("주소를 입력하세요.");
			return false;
		}
		else if(chk.juso_etc.value.trim().length==0)	
		{
			alert("상세주소를 입력하세요.");
			return false;
		}
		else
		{
			alert("가입이 완료되었습니다.");
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
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 문구(자유롭게 변경하기) </h3>
    </div>

<section>
<div id="member_input">
	<div id="txt1">호텔 멤버 가입</div>
	<div id="txt2">멤버가 되어 호텔이 제공하는 최고의 혜택을 만나보세요.</div>
	<form name="join" method="post" action="member_input_ok" onsubmit="return check(this)">
		
		<div>
			<div>아이디</div>
			<input type="text" name="userid" maxlength="12" onblur="userid_check(this.value)">
			<span id="msg" style="font-size:13px;"></span>
		</div>
		<div>
			<div>비밀번호</div>
			<input type="password" name="pwd" maxlength="15" onkeyup="pwd_check(this.value)">
			<span id="msg2" style="font-size:13px;"></span>
		</div>
		<div>
			<div>비밀번호 확인</div>
			<input type="password" name="pwd2" maxlength="15" onkeyup="pwd_equal(this.value)">
			<span id="msg3" style="font-size:13px;"></span>
		</div>
		<div>
			<div>이름</div>
			<input type="text" name="name">
		</div>
		<div>
			<div>휴대전화</div>
				<select name="phone">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select>
				<input type="text" name="phone1" id="phone1" maxlength="4" onblur="phone_check(this.value)">&nbsp;&nbsp;-
				<input type="text" name="phone2" id="phone2" maxlength="4" onblur="phone_check(this.value)">
				<span id="msg4" style="font-size:13px;"></span>
		</div>
		<div>
			<div>생년월일</div>
		
				<select name="birth" id="year" title="년도"></select>
				<select name="birth1" id="month" title="월"></select>
				<select name="birth2" id="day" title="일"></select>
		</div>
		<div>
			<div>이메일</div>
			
       		 	<input type="text" name="email_id" onkeyup="email_check(this.value)"> 
 				<span id="email">@</span>
 				<input name="email_juso" id="email_juso"> 
 				<select id="select">
	            	<option value="" disabled selected>E-Mail 선택</option>
	            	<option value="naver.com" id="naver.com">naver.com</option>
		           	<option value="hanmail.net" id="hanmail.net">hanmail.net</option>
		           	<option value="gmail.com" id="gmail.com">gmail.com</option>
		            <option value="nate.com" id="nate.com">nate.com</option>
		            <option value="directly" id="textEmail">직접 입력하기</option>
	        	</select>
			<span id="msg5" style="font-size:13px;"></span>
		</div>
		<div>
			<div>주소</div>
				<input type="text" name="zip" readonly  placeholder="우편번호" id="zip">
				<input type="button" value="주소찾기" onclick="juso_search()">
				<br>
				<input type="text" name="juso" placeholder="주소" readonly id="juso">
				<br>
				<input type="text" name="juso_etc" placeholder="상세주소" id="juso_etc">
		</div>
		<div id="btn_right">
				<input type="submit" value="가입">
		</div>
	</form>
	

</div>
</section>

</body>