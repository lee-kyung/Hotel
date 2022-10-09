<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#err {
		width : 1000px; 
		height : 500px;
		margin : auto;
		font : 돋움;
		font-size : 14px;
	}
	#err #msg {
		width : 500px;
		height : 200px;
		padding-top : 50px;
		border : 10px double darkgray;
		margin : 150px auto 0px auto;
		text-align : center;
		font-weight : bold;
	}
	#err #msg #back {
		width : 80px;
		height : 30px;
		padding-top : 5px;
		border : 1px solid black;
		background : black;
		color : white;
		cursor : pointer;
		margin : 30px auto 0px auto;
		text-align : center;
	}
</style>
<script>
	function goback(){
		window.history.back();
	}
</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area black">
        <h3> 시 스 템 오 류 </h3>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <div id="err">
    	<div id="msg">
    		오류가 발생했습니다. 관리자에게 문의하세요. <p>
    		<div id="back" onclick="goback()"> 이전화면 </div>
    	</div>    	
    </div>
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>