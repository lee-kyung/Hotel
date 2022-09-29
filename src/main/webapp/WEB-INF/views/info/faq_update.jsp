
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#faq_update{
	width:1100px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#faq_update #txt1{
	font-size:40px;
	font-weight:600;
	letter-spacing:3px;
	text-align:center;}
	
	section#faq_update #txt2{
	margin-top:20px;
	font-size:20px;
	text-align:center;
	margin-bottom:80px;}
	
	section#faq_update form{
	width:900px;
	margin:auto;
	padding:40px;}
	
	section#faq_update form div{
	padding:10px;
	display:inline-block;}
	
	section#faq_update form input[type=text]{
	width:700px;
	height:50px;
	outline:none;}
	
	section#faq_update form textarea{
	width:700px;
	height:300px;
	outline:none;
	resize:none;}
	
	section#faq_update input[type=submit]{
	margin-top:50px;
	width:200px;
	height:50px;
	border:1px solid #887159;
	background:#887159;
	color:white;
	cursor:pointer;}
	
	
</style>
<script>
	function check(chk)
	{
		if(chk.title.value.trim()=="")
		{
			alert("제목을 작성해주세요");
			return false;
		}
		else if(chk.content.value.trim()=="")
		{
			alert("내용을 작성해주세요");
			return false;
		}
		else
		{
			return true;
		}
	}
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
<section id="faq_update">
	<div id="txt1">FAQ</div>
	<div id="txt2">M O N T A N A 호텔에 대한 FAQ입니다.</div>
	<hr>
	<form method="post" action="faq_update_ok" onsubmit="return check(this)">
	<input type="hidden" value="${fvo.id }" name="id">
		<div>제목</div>
		<div><input type="text" name="title" value="${fvo.title }"></div><br>
		<div style="vertical-align:top">내용</div>
		<div><textarea name="content">${fvo.content }</textarea></div><br>
		
		<c:if test="${userid=='admin' }">
		<div style="margin-left:600px;">
			<input type="submit" value="작성">
		</div>	
		</c:if>
	
	</form>

</section>

</body>