<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#rdwg {
		width : 1000px;
		height : 500px;
		margin : auto;
		margin-top : 80px;
		text-align : center;
	}
	#rdwg #mbox {
		width : 700px;
		height : 350px;
		border : 2px solid #887159;
		margin : auto;
		text-align : center;
	}
	#rdwg #msg {
		width : 420px;
		margin : auto;
		margin-bottom : 50px;
	}
	#rdwg #txt {
		margin : auto;
		text-align : left;
		width : 400px;
		height : 30px;
		font-weight : bold;
	}
	#rdwg #inp {
		width : 400px;
		height : 60px;
		border : 1px solid #887159;
		outline : none;
		padding-left : 10px;
		margin-bottom : 20px;
	}
	#rdwg #btn {
		width : 400px;
		height : 60px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		outline : none;
	}
</style>
<script>
	window.onload=function(){
		let err=${err};
		if(err != null) {
			switch(err) {
				case 1 : alert("예약번호를 잘못 입력하셨습니다."); break;
				case 2 : alert("주문번호를 잘못 입력하셨습니다."); break;
				case 3 : alert("잘못된 정보를 입력하셨습니다."); break;
				default : "";
			}
		}
	}
	
	function check(){
		if(document.info.bjcode.value.trim() == "") {
			alert("예약번호 또는 주문번호를 입력하세요.");
			return false;
		}
		else
			return true;
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area breadcam_bg">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3" style="font-size:70px;"> 예약·주문 조회 </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 비회원 주문내역 Area Start ================= -->
	<section id="rdwg">
   		<fieldset id="mbox">
   		<legend id="msg"> 예약번호 또는 주문번호를 입력하세요 </legend>
	   		<form name="info" method="post" action="rdwg_info" onsubmit="return check()">
				<div id="txt"> 예약/주문번호 </div>
				<input type="text" name="bjcode" placeholder="예약번호 또는 주문번호를 입력하세요." id="inp"> <p>
				<input type="submit" value="조회하기" id="btn">
	   		</form>
   		</fieldset>
   	</section>
    <!-- ================ 비회원 주문내역 Area End ================= -->

</body>