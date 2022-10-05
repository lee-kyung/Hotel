<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#okmsg {
		width : 1000px; 
		height : 500px;
		margin : 100px auto 50px auto;
	}
	#okmsg #mbox {
		width : 700px;
		height : 300px;
		border : 2px solid #887159;
		margin : auto;
		text-align : center;
	}
	#okmsg #msg {
		width : 330px;
		margin : 20px auto 35px auto;
		text-align : center;
		font-size : 30px;
		font-weight : bold;
	}
	#okmsg #msg1 {
		font-size : 20px;
		margin : 20px auto 10px auto;
	}
	#okmsg #msg2 {
		color : gray;
	}
	#okmsg #msg3 {
		font-size : 20px;
		margin : 30px auto 70px auto;
	}
	#okmsg #btn1 {
		width : 150px;
		height : 41px;
		padding-top : 9px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		text-align : center;
		cursor : pointer;
		margin : 40px auto 30px auto;
	}
	#okmsg #btn2 {
		display : inline-block;
		width : 150px;
		height : 41px;
		padding-top : 9px;
		border : 1px solid #887159;
		color : #887159;
		cursor : pointer;
	}
	#okmsg #btn3 {
		display : inline-block;
		width : 150px;
		height : 41px;
		padding-top : 9px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		text-align : center;
		cursor : pointer;
	}
	#okmsg b {
		color : #887159;
		cursor : pointer;
		font-family : TimesNewRoman;
	}
	#okmsg b:hover {
		text-decoration : underline;
	}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area eshop1">
        <div id="h3"> T H A N K &nbsp; Y O U </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 주문 완료 Area Start ================= -->
	<section id="okmsg">
		<c:if test="${userid == null}">
			<fieldset id="mbox">
				<legend id="msg"> 주문이 완료되었습니다 </legend>
				<div id="msg1"> $j{name}님의 주문번호는 <b onclick="location='../mypage/rdwg_info?bjcode=${jumuncode}'">${jumuncode}</b>입니다. </div>
				<div id="msg2"> ※위의 주문번호는 비회원 주문조회 시 필요하오니 꼭 메모해 두시길 바랍니다. </div>
				<div onclick="location='../eshop/eshop'" id="btn1"> 계속 쇼핑하기 </div>
			</fieldset>
		</c:if>
		<c:if test="${userid != null}">
			<fieldset id="mbox">
				<legend id="msg"> 주문이 완료되었습니다 </legend>
					<div id="msg3"> ${jname}님 구매해주셔서 감사합니다. </div>
					<div onclick="location='../eshop/eshop'" id="btn2"> 계속 쇼핑하기 </div>
					<div onclick="location='../mypage/eshop_gumae'" id="btn3"> 주문내역 확인 </div>
			</fieldset>
		</c:if>
	</section>
    <!-- ================ 주문 완료 Area End ================= -->

</body>