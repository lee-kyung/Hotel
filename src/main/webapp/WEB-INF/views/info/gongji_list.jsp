<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#g_list{
	width:1200px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#g_list #txt1{
	font-size:40px;
	font-weight:600;
	letter-spacing:3px;
	text-align:center;}
	
	section#g_list #txt2{
	margin-top:20px;
	font-size:20px;
	text-align:center;}
	
	section#g_list table{
	margin:auto;
	margin-top:50px;
	width:1100px;
	text-align:center;
	border-left:none;
	border-right:none;
	border-top-color:white;}
	
	section#g_list table td{
	padding:15px;
	border-left:none;
	border-right:none;}
	
	section#g_list table tr:first-child{
	font-weight:600;}
	
	section#g_list table tr:last-child{
	border-bottom-color:white;}
	
	section#g_list table .title{
	text-align:left;}
	
	section#g_list table .title span{
	font-weight:600;}
	
	section#g_list table input[type=button]{
	margin-top:50px;
	float:right;
	width:200px;
	height:50px;
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
<section id="g_list">
	<div id="txt1">공지사항</div>
	<div id="txt2">M O N T A N A 호텔에 대한 공지사항입니다.</div>
	<table border="1">
		<tr>
			<td>제목</td>
			<td width="150">작성자</td>
			<td width="200">작성일</td>
		</tr>
		<c:forEach items="${glist }" var="gvo">
		<tr>
			<td class="title">
				<c:if test="${gvo.gubun==1 }">
					<img src="../img/info/gg.png" width="20" style="margin-right:10px;">
					<a href="gongji_content?id=${gvo.id }"><span>${gvo.title }</span></a>
				</c:if>
				
				<c:if test="${gvo.gubun==0 }">
					<a href="gongji_content?id=${gvo.id }">${gvo.title }</a>
				</c:if>
				
			</td>
			<td>관리자</td>
			<td>${gvo.writeday }</td>
		</tr>
		</c:forEach>
		<tr>
		<c:if test="${userid=='admin' }">
			<td colspan="3">
				<input type="button" value="작성" onclick="location='gongji_write'">
			</td>
		</c:if>
		</tr>
	</table>

</section>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#g_list{
	width:1200px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#g_list #txt1{
	font-size:40px;
	font-weight:600;
	letter-spacing:3px;
	text-align:center;}
	
	section#g_list #txt2{
	margin-top:20px;
	font-size:20px;
	text-align:center;}
	
	section#g_list table{
	margin:auto;
	margin-top:50px;
	width:1100px;
	text-align:center;
	border-left:none;
	border-right:none;
	border-top-color:white;}
	
	section#g_list table td{
	padding:15px;
	border-left:none;
	border-right:none;}
	
	section#g_list table tr:first-child{
	font-weight:600;}
	
	section#g_list table tr:last-child{
	border-bottom-color:white;}
	
	section#g_list table .title{
	text-align:left;}
	
	section#g_list table .title span{
	font-weight:600;}
	
	section#g_list table input[type=button]{
	margin-top:50px;
	float:right;
	width:200px;
	height:50px;
	border:1px solid #887159;
	background:#887159;
	color:white;}
	
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
<section id="g_list">
	<div id="txt1">공지사항</div>
	<div id="txt2">M O N T A N A 호텔에 대한 공지사항입니다.</div>
	<table border="1">
		<tr>
			<td>제목</td>
			<td width="150">작성자</td>
			<td width="200">작성일</td>
		</tr>
		<c:forEach items="${glist }" var="gvo">
		<tr>
			<td class="title">
				<c:if test="${gvo.gubun==1 }">
					<img src="../img/info/gg.png" width="20" style="margin-right:10px;">
					<a href="gongji_content?id=${gvo.id }"><span>${gvo.title }</span></a>
				</c:if>
				
				<c:if test="${gvo.gubun==0 }">
					<a href="gongji_content?id=${gvo.id }">${gvo.title }</a>
				</c:if>
				
			</td>
			<td>관리자</td>
			<td>${gvo.writeday }</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="3">
				<input type="button" value="작성" onclick="location='gongji_write'">
			</td>
		</tr>
	</table>

</section>

>>>>>>> branch 'main' of https://github.com/ey0k/hotel.git
</body>