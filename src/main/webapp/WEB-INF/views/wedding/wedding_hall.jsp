<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
	width:1800px;
	margin:auto;
	margin-top:100px;}
	
	section #wed_hall #wed_hall_name{
	margin-left:100px;
	margin-bottom:100px;}

	section #wed_hall #wed_hall_name li{
	display:inline-block;
	padding-right:30px;
	font-size:50px;
	font-family:fantasy;}
	
	section #wed_hall #wed_hall_name a:hover{
	color:orange;}
	
	/***************************/	
	section #wed_hall .slider{
    width: 1800px;
    height: 900px;
    position: relative;
    margin: 0 auto;
    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */}
    
	section #wed_hall .slider input[type=radio]{
    display: none;}

	section #wed_hall .slider ul.imgs{
    padding: 0;
    margin: 0;
    list-style: none;}

	section #wed_hall .slider ul li img{
	width: 1800px;
	height:900px;}
	 
	section #wed_hall .slider ul.imgs li{
    position: absolute;
    left: 1800px;
    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */
    padding: 0;
    margin: 0;}

	section #wed_hall .slider .bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;}
    
	section #wed_hall .slider .bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 20px;
    height: 20px;
    cursor: pointer;}
    
/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */

	section #wed_hall .slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;}
    
	section #wed_hall .slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;}
    
	section #wed_hall .slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;}
    
	section #wed_hall .slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #fff;}
    
	section #wed_hall .slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    left: 0;
    transition: 0.5s;
    z-index:1;}
    
	section #wed_hall .slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    left: 0;
    transition: 0.5s;
    z-index:1;}
    
	section #wed_hall .slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    left: 0;
    transition: 0.5s;
    z-index:1;}
    
	section #wed_hall .slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.5s;
    z-index:1;}

	/**************************************/
	
	section #wed_hall2{
	width:1600px;
	margin:auto;
	margin-top:100px;
	margin-bottom:100px;}
	
	section #wed_hall2 #hall_name{
	font-size:50px;
	font-family:cursive;
	color:orange;}
	
	section #wed_hall2 #hall_sogae{
	}
	
	section #wed_hall2 #info{
	margin-top:100px;
	font-size:40px;
	font-family:fantasy ;}
	
	section #wed_hall2 table{
	width:1600px;
	margin-top:30px;
	margin-left:20px;
	border:1px solid #cccccc;}
	
	section #wed_hall2 table tr:first-child{
	height:150px;
	vertical-align:top;}
	
	section #wed_hall2 table td:first-child{
	padding-left:20px;}
	
	section #wed_hall2 table tr:nth-child(2), tr:nth-child(4){
	font-weight:600;}
	
	section #wed_hall2 table tr:nth-child(2), tr:nth-child(3), tr:nth-child(4), tr:nth-child(5){
	height:70px;}
	
	#wed_hall3{
	text-align:right;
	width:100%;
	font-size:18px;
	padding-top:50px;
	padding-bottom:50px;
	margin-bottom:100px;
	background:#EAEAEA;}
	
	#wed_hall3 button{
	margin-top:20px;
	width:250px;
	height:70px;}
	
	#wed_chk2 img{
	width:100%;
	margin-top:150px;
	margin-bottom:50px;}
	
</style>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <h3> 웨딩홀 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

    <!--================ Single-Wedding Area Start =================-->
    
<section>
<div id="wed_hall">
	
	<ul id="wed_hall_name">
	
		<c:forEach items="${list }" var="wvo">
		
			<li><a href="../wedding/wedding_hall?id=${wvo.id }">${wvo.wed_hall }</a></li>
			
		</c:forEach>
                     
	</ul>
	
	
	<div class="slider">
	
		<input type="radio" name="slide" id="slide1" checked>
		<input type="radio" name="slide" id="slide2">
		<input type="radio" name="slide" id="slide3">
		<input type="radio" name="slide" id="slide4">
		
		<ul id="imgholder" class="imgs">
			<c:forEach items="${img}" var="pic">
				<li><img src="../img/wedding/${pic}" width="1100" height="550"></li>
			</c:forEach>
		</ul>
		
		<div class="bullets">
			<label for="slide1">&nbsp;</label>
			<label for="slide2">&nbsp;</label>
			<label for="slide3">&nbsp;</label>
			<label for="slide4">&nbsp;</label>
		</div>
		
	</div>

</div>

<div id="wed_hall2">               
	<div id="hall_name">${wvo.wed_hall }</div>
    
    <div id="hall_sogae">${wvo.wed_title }</div>
                    
                     
    <div id="info">INFORMATION</div>  
                  
	<table>	

		<tr>
			<td colspan="3"><div id="sogae"><br>${wvo.wed_txt }</div></td>
		</tr>
		<tr>
			<td width="450">규모</td>
			<td width="450">수용인원</td>
			<td>하객음식</td>
		</tr>
		<tr>
			<td>${wvo.wed_size }m²</td>
			<td>${wvo.wed_min }~${wvo.wed_max }명</td>
			<td>${wvo.wed_food }</td>
		</tr>
		<tr>
			<td>연출</td>
			<td>예식타입</td>
			<td>Special Benefit</td>
		</tr>
		<tr>
			<td>${wvo.wed_direct }</td>
			<td>${wvo.wed_type }</td>
			<td>${wvo.wed_txt2 }</td>
		</tr>
	</table>
 </div>
</section>        

<div id="wed_chk2">
	<img src="../img/wedding/wedding_chk.jpg">
</div>

<div id="wed_hall3">
	 
	<div id="txt"> 운영일 : 월~일요일 &emsp;|&emsp; 운영시간 : 10:00 ~ 18:00 &emsp;|&emsp; Tel : 02-000-000</div>
			
	<button type="submit" class="button button-contactForm btn_1 boxed-btn" onclick="location='../wedding/wedding_reserve'">예약하기</button>
		
</div>


   <!--================ Single-Wedding Area end =================-->

</body>