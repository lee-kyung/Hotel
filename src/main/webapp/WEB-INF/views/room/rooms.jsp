<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<style>
.container {
	width: 1300px;
	margin: auto;
}

#rtype {
	font-size: 35px;
	font-weight: 900;
}

#rname {
	margin-top: 20px;
	font-size: 33px;
	font-weight: 500;
}

roomsec {
	margin-bottom: 80px;
	width: 1300px;
	color: #887159;
}

roomsec #ro_outer {
/* 	outline: 1px solid #887159; */
	width: 1200px;
	height: 500px;
	margin: auto;
}

roomsec #ro_outer #left {
	background: gold;
	float: left;  
	width: 800px;
	height: 500px;
}

roomsec #ro_outer #left > img{
	width: 800px;
	height: 500px;
}

roomsec #ro_outer #right {
	/* background: pink; */
	float: right;  
	width: 390px; 
	height: 500px;
}

roomsec #ro_outer #right #right_outer{
	margin-top: 50px;
}

roomsec hr{
	width: 380px;
	margin: auto;
	border: 1px solid #887159;
}
roomsec #subr {
	font-weight: 900;
	width: 100px;
	display: inline-block;
	color: #887159;
	margin-top: 10px;
}

roomsec input[type=button] {
	color: #887159;
	background: white;
	border: 1px solid #887159;
	width: 100px;
	height: 40px;
}

roomsec input[type=button]:hover {
	cursor: pointer;
	background: #887159;
	color: white;
}

roomsec #r1 {
	font-size: 50px;
	font-family: fantasy;
}

section #room_list .slider {
	width: 1200px;
	height: 500px;
	position: relative;
	margin: 0 auto;
	overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
}

section #room_list .slider input[type=radio] {
	display: none;
}

section #room_list .slider ul.imgs {
	padding: 0;
	margin: 0;
	list-style: none;
}

section #room_list .slider ul li img {
	width: 800px;
	height: 500px;
}

section #room_list .slider ul.imgs li {
	position: absolute;
	left: 1200px;
	transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
	padding: 0;
	margin: 0;
}

section #room_list .slider .bullets {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	bottom: 20px;
	z-index: 2;
}

section #room_list .slider .bullets label {
	display: inline-block;
	border-radius: 50%;
	background-color: rgba(0, 0, 0, 0.55);
	width: 20px;
	height: 20px;
	cursor: pointer;
}

/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
section #room_list .slider input[type=radio]:nth-child(1):checked ~.bullets>label:nth-child(1)
	{
	background-color: #fff;
}

section #room_list .slider input[type=radio]:nth-child(2):checked ~.bullets>label:nth-child(2)
	{
	background-color: #fff;
}

section #room_list .slider input[type=radio]:nth-child(3):checked ~.bullets>label:nth-child(3)
	{
	background-color: #fff;
}

section #room_list .slider input[type=radio]:nth-child(4):checked ~.bullets>label:nth-child(4)
	{
	background-color: #fff;
}

section #room_list .slider input[type=radio]:nth-child(1):checked ~ul.imgs>li:nth-child(1)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

section #room_list .slider input[type=radio]:nth-child(2):checked ~ul.imgs>li:nth-child(2)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

section #room_list .slider input[type=radio]:nth-child(3):checked ~ul.imgs>li:nth-child(3)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

section #room_list .slider input[type=radio]:nth-child(4):checked ~ul.imgs>li:nth-child(4)
	{
	left: 0;
	transition: 0.5s;
	z-index: 1;
}

/**************************************/
</style>

<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
<!-- bradcam_area_start -->
<!-- 새 이미지 추가하는 법
   	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
   	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
<div class="bradcam_area rooms">
	<!-- class="bradcam_area 클래스명" -->
	<div id="h3">R O O M S</div>
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
			<div style="font-size: 20px;">호텔 부산에서 격이 다른 휴식과 여유를 경험해보세요.</div>
		<br>
		<section>
		<div id="room_list">
			<div class="slider">
				<input type="radio" name="slide" id="slide1" checked> <input
					type="radio" name="slide" id="slide2"> <input
					type="radio" name="slide" id="slide3">
				<ul id="imgholder" class="imgs">
					<c:forEach items="${list}" var="rvo">
						<c:if test="${rvo.code=='05'}"> 
							<li>
								<div id="rtype">${rvo.rtype}</div>
								<div style="background: white">${rvo.rtxt}</div>
								<p>
								<div id="ro_outer">
									<div id="left">
										<img src="../img/rooms/${rvo.rpimg}">
									</div>
									<div id="right">
										<div id="rname">${rvo.rname}</div>
										<p>
										<div>${rvo.rtxt2}</div>
										<p>
										<hr>
										<div>
											<div>
												<span id="subr">전망</span>${rvo.rview}</div>
											<div>
												<span id="subr">인원</span>${rvo.rmin}</div>
											<div>
												<span id="subr">베드타입</span>${rvo.rbed}</div>
											<br> <br> <input type="button" value="객실더보기" 	onclick="location='../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}'">
										</div>
									</div>
									<br>
								</div> 
							</li>
					 	</c:if> 
					</c:forEach>
				</ul>
				<div class="bullets">
					<label for="slide1">&nbsp;</label> 
					<label for="slide2">&nbsp;</label>
					<label for="slide3">&nbsp;</label>
				</div>
			</div>
		</div>
		<br>
		</section>
		<br>
	<!-- 객실 타입 하나씩  -->
		<c:forEach items="${list}" var="rvo">
			<c:if test="${rvo.code == '01'}">
				<div id="rtype">${rvo.rtype}</div>
				<div>${rvo.rtxt}</div>
				<p>
				<div id="ro_outer">
					<div id="left">
						<img src="../img/rooms/${rvo.rpimg}">
					</div>
					<div id="right">
					  <div id="right_outer">
						<div id="rname">${rvo.rname}</div>
						<p>
						<div>${rvo.rtxt2}</div>
						<p>
						<hr>
						<div>
							<div>
								<span id="subr">전망</span>${rvo.rview}</div>
							<div>
								<span id="subr">인원</span>${rvo.rmin}</div>
							<div>
								<span id="subr">베드타입</span>${rvo.rbed}</div>
							<br> <br> <input type="button" value="객실더보기"	onclick="location='../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}'">
						</div>
					</div>
				  </div>
				</div>
				<br>
			</c:if>
		</c:forEach> 
			<br>
		<c:forEach items="${list}" var="rvo">
			<c:if test="${rvo.code=='02'}">
				<div id="rtype">${rvo.rtype}</div>
				<div>${rvo.rtxt}</div>
				<p>
				<div id="ro_outer">
					<div id="left">
						<img src="../img/rooms/${rvo.rpimg}">
					</div>
					<div id="right">
						<div id="rname">${rvo.rname}</div>
						<p>
						<div>${rvo.rtxt2}</div>
						<p>
						<hr>
						<div>
							<div>
								<span id="subr">전망</span>${rvo.rview}</div>
							<div>
								<span id="subr">인원</span>${rvo.rmin}</div>
							<div>
								<span id="subr">베드타입</span>${rvo.rbed}</div>
							<br> <br> <input type="button" value="객실더보기"	onclick="location='../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}'">
						</div>
					</div>
					<br>
				</div>
				<br>
			</c:if>
		</c:forEach> 
			<br>
		<c:forEach items="${list}" var="rvo">
			<c:if test="${rvo.code=='03'}">
				<div id="rtype">${rvo.rtype}</div>
				<div>${rvo.rtxt}</div>
				<p>
				<div id="ro_outer">
					<div id="left">
						<img src="../img/rooms/${rvo.rpimg}">
					</div>
					<div id="right">
						<div id="rname">${rvo.rname}</div>
						<p>
						<div>${rvo.rtxt2}</div>
						<p>
						<hr>
						<div>
							<div>
								<span id="subr">전망</span>${rvo.rview}</div>
							<div>
								<span id="subr">인원</span>${rvo.rmin}</div>
							<div>
								<span id="subr">베드타입</span>${rvo.rbed}</div>
							<br> <br> <input type="button" value="객실더보기" onclick="location='../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}'">
						</div>
					</div>
					<br>
				</div>
				<br>
			</c:if>
		</c:forEach>
			<br>
		<c:forEach items="${list}" var="rvo">
			<c:if test="${rvo.code=='04'}">
				<div id="rtype">${rvo.rtype}</div>
				<div>${rvo.rtxt}</div>
				<p>
				<div id="ro_outer">
					<div id="left">
						<img src="../img/rooms/${rvo.rpimg}">
					</div>
					<div id="right">
						<div id="rname">${rvo.rname}</div>
						<p>
						<div>${rvo.rtxt2}</div>
						<p>
						<hr>
						<div>
							<div>
								<span id="subr">전망</span>${rvo.rview}</div>
							<div>
								<span id="subr">인원</span>${rvo.rmin}</div>
							<div>
								<span id="subr">베드타입</span>${rvo.rbed}</div>
							<br> <br> <input type="button" value="객실더보기" onclick="location='../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}'">
						</div>
					</div>
					<br>
				</div>
				<br>
			</c:if>
		</c:forEach> </roomsec>
	</div>



</div>

<!-- ================ Rooms Area End ================= -->
</body>