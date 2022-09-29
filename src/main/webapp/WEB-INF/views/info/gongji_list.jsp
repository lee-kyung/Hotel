
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
	
	section#g_list input[type=button]{
	margin-top:50px;
	float:right;
	width:200px;
	height:50px;
	border:1px solid #887159;
	background:#887159;
	color:white;
	cursor:pointer;}
	
	section#g_list table #page{
	font-size:0px;}
	
	section#g_list table #page .page_n{
	border:1px solid black;
	display:inline-block;
	width:50px;
	height:40px;
	padding-top:7px;
	font-size:16px;
	border:1px solid #887159;
	border-right:none;
	margin-top:30px;
	color:#887159;}
	
	section#g_list table #page .page_n:last-child{
	border-right:1px solid #887159;}
	
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3">NOTICE</div>
    </div>
<section id="g_list">
	<div id="txt1">공지사항</div>
	<div id="txt2">M O N T A N A 호텔에 대한 공지사항입니다.</div>
	<table border="1">
		<tr>
			<td style="text-align:left;">제목</td>
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
		
		<tr style="border-bottom-color:white;">
			<td colspan="3">
				<div id="page">
				<!-- 10페이지단위로 이동 -->
					<c:if test="${pstart==1 }">
						<a class="page_n"> << </a>
					</c:if>
					<c:if test="${pstart!=1 }">
						<a href="gongji_list?page=${pstart-1 }&pcnt=${pcnt}" class="page_n"> << </a>
					</c:if>	
					
				<!-- 1페이지단위로 이동 -->
					<c:if test="${page==1 }">
						<a class="page_n"> < </a>
					</c:if>
					<c:if test="${page!=1 }">
						<a href="gongji_list?page=${page-1 }&pcnt=${pcnt}" class="page_n"> < </a>
					</c:if>		
					
				<!-- 페이지출력	 -->
					<c:forEach begin="${pstart }" end="${pend }" var="i">
						<!-- 현재페이지 강조 -->
						<c:if test="${page==i }">
							<c:set var="st" value="style='color:white; background:#887159;'"/>
						</c:if>
						<c:if test="${page!=i }">
							<c:set var="st" value=""/>
						</c:if>
						
						<!-- 선택 페이지 이동 -->
						<a href="gongji_list?page=${i }&pcnt=${pcnt}" ${st } class="page_n"> ${i} </a><!--  -->
					</c:forEach>
				
				<!-- 1페이지단위로 이동 -->
					<c:if test="${page==chong }">
						<a class="page_n"> > </a>
					</c:if>
					<c:if test="${page!=chong }">
						<a href="gongji_list?page=${page+1 }&pcnt=${pcnt}" class="page_n"> > </a>
					</c:if>	
						
				<!-- 10페이지단위로 이동 -->
					<c:if test="${pend==chong }">
						<a class="page_n"> >> </a>
					</c:if>
					<c:if test="${pend!=chong }">
						<a href="gongji_list?page=${pend+1 }&pcnt=${pcnt}" class="page_n"> >> </a>
					</c:if>	
				</div>
			</td>
		</tr>
	</table>
	
		
		<c:if test="${userid=='admin' }">
		<div style="text-align:right;">
			<input type="button" value="작성" onclick="location='gongji_write'">
		</div>	
		</c:if>
	

</section>

</body>