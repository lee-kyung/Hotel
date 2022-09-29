
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#faq_list{
	width:1100px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#faq_list #txt1{
	font-size:40px;
	font-weight:600;
	letter-spacing:3px;
	text-align:center;}
	
	section#faq_list #txt2{
	margin-top:20px;
	font-size:20px;
	text-align:center;
	margin-bottom:80px;}
	
	section#faq_list .Q{
	border-top:1px solid #887159;;
	font-weight:600;
	padding:20px;}
	
	section#faq_list .A{
	background:#f3f0ec;
	padding:27px;
	font-size:14px;}
	
	section#faq_list #border{
	border-bottom:1px solid #887159;}
	
	section#faq_list input[type=button]#write{
	margin-top:50px;
	float:right;
	width:200px;
	height:50px;
	border:1px solid #887159;
	background:#887159;
	color:white;
	cursor:pointer;}
	
	section#faq_list input[type=button].btns{
	margin-top:20px;
	width:100px;
	height:30px;
	border:1px solid white;
	background:#887159;
	color:white;
	cursor:pointer;}
	
	section#faq_list #page{
	margin-top:50px;
	text-align:center;
	font-size:0px;}
	
	section#faq_list #page .page_n{
	border:1px solid black;
	display:inline-block;
	width:50px;
	height:40px;
	padding-top:7px;
	font-size:16px;
	text-align:center;
	border:1px solid #887159;
	border-right:none;
	margin-top:30px;
	color:#887159;}
	
	section#faq_list #page .page_n:last-child{
	border-right:1px solid #887159;}
	 
</style>
<script>
	
	$(document).ready(function () {
	    
	    let collapses = $('div.container').find('.collapse');  //collapse라는 자식을 찾아서 배열을 불러온다.
	    collapses.each(function () {
	    $(this).collapse('toggle');

	    });
	   
	});

</script>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3">FAQ</div>
    </div>
<section id="faq_list">
	<div id="txt1">FAQ</div>
	<div id="txt2">M O N T A N A 호텔에 대한 FAQ입니다.</div>
	
	<div id="border">
		<c:set var="i" value="0"/>
		<c:forEach items="${flist }" var="fvo">
		
		<div>
	      <a data-toggle="collapse" href="#collapseExample${i }"><div class="Q">Q. ${fvo.title }</div></a>
	    </div>
	    
	    <div class="collapse" id="collapseExample${i }">
	    	<div class="A">${fvo.content }
	    	<div style="text-align:right;">
	    	<c:if test="${userid=='admin' }">
	    		<input type="button" onclick="if(confirm('정말 삭제하시겠습니까?')){location='faq_delete?id=${fvo.id}'}" class="btns" value="삭제">
	    		<input type="button" onclick="location='faq_update?id=${fvo.id}'" class="btns" value="수정">
	    	</c:if>
	    	</div>
	    	</div>
	    </div>
	    
	    <c:set var="i" value="${i+1}"/>
		</c:forEach>
	</div>
	
	
	<div id="page">
	<!-- 10페이지단위로 이동 -->
	<c:if test="${pstart==1 }">
		<a class="page_n"> << </a>
	</c:if>
	<c:if test="${pstart!=1 }">
		<a href="faq_list?page=${pstart-1 }&pcnt=${pcnt}" class="page_n"> << </a>
	</c:if>	
					
	<!-- 1페이지단위로 이동 -->
	<c:if test="${page==1 }">
		<a class="page_n"> < </a>
	</c:if>
	<c:if test="${page!=1 }">
		<a href="faq_list?page=${page-1 }&pcnt=${pcnt}" class="page_n"> < </a>
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
		<a href="faq_list?page=${i }&pcnt=${pcnt}" ${st } class="page_n"> ${i} </a><!--  -->
	</c:forEach>
				
	<!-- 1페이지단위로 이동 -->
	<c:if test="${page==chong }">
		<a class="page_n"> > </a>
	</c:if>
	<c:if test="${page!=chong }">
		<a href="faq_list?page=${page+1 }&pcnt=${pcnt}" class="page_n"> > </a>
	</c:if>	
						
	<!-- 10페이지단위로 이동 -->
	<c:if test="${pend==chong }">
		<a class="page_n"> >> </a>
	</c:if>
	<c:if test="${pend!=chong }">
		<a href="faq_list?page=${pend+1 }&pcnt=${pcnt}" class="page_n"> >> </a>
	</c:if>	
	</div>
	
	
		
	<c:if test="${userid=='admin' }">
	<div style="text-align:right;">
		<input type="button" value="작성" id="write" onclick="location='faq_write'">
	</div>	
	</c:if>
	

</section>

</body>