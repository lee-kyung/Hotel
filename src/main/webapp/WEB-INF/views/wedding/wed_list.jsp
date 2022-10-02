<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
	width:1000px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section #wed_list #txt1{
	font-size:60px;
	font-weight:600;
	font-family:fantasy;
	letter-spacing:5px;
	text-align:center;
	margin-bottom:50px;}
	
	section #wed_list #bar{
	margin:auto;
	border-bottom:1px solid #887159;
	margin-bottom:80px;}
	
	section #wed_list #list{
	width:500px;
	margin:auto;}
	
	section #wed_list #list div{
	padding:15px;
	font-size:20px;}
	
	section #wed_list #list a:hover{
	color:#887159;
	letter-spacing:4px;}
	
	section #wed_list input[type=button]{
	width:300px;
	height:70px;
	border:1px solid #887159;
	background:white;
	color:#887159;
	cursor:pointer;}

	section #wed_list input[type=button]:hover{
	background:#887159;
	color:white;}
	
	section #wed_list #btn_right{
	text-align:right;
	margin-top:100px;}
	
	
</style>
</head>

<body>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3" onclick="location='../admin/admin'" style="cursor:pointer;">ADMIN</div>
    </div>
 
<section>
<div id="wed_list">

<div id="txt1">WEDDING LIST</div>
	<div id="bar"></div>
	<div id="list">
		<c:forEach items="${list }" var="wvo">
			<div><a href="wed_content?id=${wvo.id}">${wvo.wed_hall }</a></div>	
		</c:forEach>
	</div>
	<div id="btn_right"><input type="button" onclick="location='wed_write'" value="웨딩홀 작성"></div>
</div>
</section>

</body>