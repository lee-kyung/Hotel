<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#g_content{
	width:1000px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#g_content #txt1{
	font-size:20px;
	font-weight:600;
	text-align:center;}
	
	section#g_content #title{
	margin-top:30px;
	font-size:30px;
	font-weight:600;
	letter-spacing:2px;
	text-align:center;}
	
	section#g_content #writeday{
	text-align:right;
	font-size:18px;}
	
	section#g_content #content_border{
	border:1px solid #887159;;
	width:900px;
	margin:auto;
	margin-top:30px;}
	
	section#g_content #content{
	width:800px;
	margin:auto;
	margin-top:50px;
	margin-bottom:50px;
	text-align:center;}
	
	section#g_content #btns{
	text-align:right;
	margin-top:30px;}
	
	section#g_content input[type=button]{
	width:100px;
	height:40px;
	border:1px solid #887159;
	background:#887159;
	color:white;
	cursor:pointer;}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> 공지 </div>
    </div>
<section id="g_content">
	<div id="txt1">M O N T A N A 호텔에 대한 공지사항입니다.</div>
	<hr>
	<div id="title">
		<c:if test="${gvo.gubun==1 }">
			<img src="../img/info/gg.png" width="25" style="margin-right:10px;">
			<span>${gvo.title }</span>
		</c:if>
				
		<c:if test="${gvo.gubun==0 }">
			<span>${gvo.title }</span>
		</c:if>
	</div>
	<div id="writeday">${gvo.writeday }</div>
	
	<div id="content_border">
		<div id="content">
			${gvo.content }
		</div>
	</div>
	<div id="btns">
		<input type="button" value="리스트" onclick="location='gongji_list'">
		<c:if test="${userid=='admin' }">
		<input type="button" value="수정" onclick="location='gongji_update?id=${gvo.id}'">
		<input type="button" value="삭제" onclick="location='gongji_delete?id=${gvo.id}'">
		</c:if>
	</div>
</section>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#g_content{
	width:1000px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;
	border:1px solid blue;}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> 공지 </div>
    </div>
<section id="g_content">
	<table border="1">
		<tr>
			<td>제목</td>
			<td>${gvo.title }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>관리자</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${gvo.content }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${gvo.writeday }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="리스트" onclick="location='gongji_list'">
				<input type="button" value="수정" onclick="location='gongji_update?id=${gvo.id}'">
				<input type="button" value="삭제" onclick="location='gongji_delete?id=${gvo.id}'">
			</td>
		</tr>
	</table>
</section>

>>>>>>> branch 'main' of https://github.com/ey0k/hotel.git
</body>