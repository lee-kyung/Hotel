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
		width: 990px;
		margin: auto;
	}
	#rtype{
		font-size: 20px;
		font-family:fantasy;
		font-weight: 900;
	}
	#rname{
		margin-top: 20px;
		font-size: 24px;
	}
	roomsec{
		margin-bottom: 80px;
		color: #887159;
	}
	roomsec #ro_outer{
		outline:1px solid #887159;
		width: 920px;
		height:374px;
	}
/* 	roomsec #ro_outer #right{
		background: pink;
	}
	roomsec #ro_outer #left{
		background: gold;
	} */
	roomsec #subr{
		width: 100px;
		display: inline-block;
		color: #887159;
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
	roomsec #r1{
		font-size:50px;
		font-family:fantasy;
	}
</style>

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
 		<div id="r1">ROOMS</div>
 		<div style="font-size:20px;">호텔 부산에서 격이 다른 휴식과 여유를 경험해보세요.</div>
 		<br>
 	 <c:forEach items="${list}" var="rvo">
		<div id="rtype">${rvo.rtype}</div>
		<div>${rvo.rtxt}</div><p>
		<div id="ro_outer">
			<div id="left" style="float:left;height:374px;width:650px">
				<img src="../img/rooms/${rvo.rpimg}" width="642px" height="374px">
			</div>
			<div id="right" style="float:right;height:290px;width:270px">
				<div id="rname">${rvo.rname}</div> <p>
				<div>${rvo.rtxt2}</div> <p>
				<hr style="width:220px;"> 
				<div>
				  <div><span id="subr">전망</span>${rvo.rview}</div>
				  <div><span id="subr">인원</span>${rvo.rmin}</div>
				  <div><span id="subr">베드타입</span>${rvo.rbed}</div>
				  <br>
				  <br>
				  <input type="button" value="상세보기" onclick="location='../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}'">
				</div>
			</div> <br>
		</div>
		<br>
 	  </c:forEach>
 	  </roomsec>
 	</div>
  
  
  
 </div>

    <!-- ================ Rooms Area End ================= -->

</body>