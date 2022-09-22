<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	.container{
		width: 1100px;
		margin: auto;
	}
	#rtype{
		font-size: 15px;
	}
	#rname{
		margin-top: 50px;
		font-size: 28px;
	}
	roomsec{
		margin-bottom: 80px;
		
	}
	roomsec #ro_outer{
		outline:1px solid black;
		width: 920px;
		height:374px;
	}
	roomsec #subr{
		width: 100px;
		display: inline-block;
		color: black;
	}
	roomsec input[type=button]{
		color: #887159;
		background: white;
		border: 1px solid #887159;
		width: 100px;
		height: 40px;
	}
	roomsec input[type=button]:hover{
		cursor: pointer;
		background: #887159;
		color: white;
	}
	roomsec #rmenu{
		width: 1000px;
		height: 60px;
		margin: auto;
		position: relative; // 스크롤 관련
	}
	roomsec #rname{
	margin-left:100px;
	margin-bottom:100px;}

	roomsec #rname li{
	display:inline-block;
	padding-right:30px;
	font-size:33px;
	font-family:fantasy;
	border: 1px solid black;
	}
</style>
<script>


</script>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <h3> R O O M S </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
<div class="features_room">
    <div class="container">
    <div class="row"> 
    <roomsec>
    	<div style="font-size: 20px;" id="rmenu"> 
    	<ul id="rname">
    		<c:forEach items="${list}" var="rvo"> 
    			<li><a href="../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}">${rvo.rname}</a></li>
    		</c:forEach>
    	</ul>
    	</div>
    	<br>
  		<c:forEach items="${list}" var="rvo"> 
 		<input type="hidden" name="rcode" value="${rvo.rcode}">
 		<div class="rr" style="font-size:35px; font-weight: 900; color: #887159">${rvo.rname}</div>
		<div style="border:1px solid #887159">
			<div style="margin:auto;"><img src="../img/rooms/${rvo.rpimg}" width="980px"></div>
			<img src="../img/rooms/${rvo.rcimg}" width="980px"> <p>
			<br>
		</div>
		<br>
		</c:forEach> 
 	</roomsec>
 	</div>
 	</div>
 </div>

    <!-- ================ Rooms Area End ================= -->

</body>
