<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#g_write{
	width:1000px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;
	border:1px solid blue;}
	
	section#g_write{
	width:1200px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#g_write #txt1{
	font-size:40px;
	font-weight:600;
	letter-spacing:3px;
	text-align:center;}
	
	section#g_write table{
	margin:auto;
	margin-top:50px;
	width:800px;
	border-left:none;
	border-right:none;
	border-top-color:white;}
	
	section#g_write table td{
	padding:15px;
	border-left:none;
	border-right:none;}
	
	section#g_write table td:first-child{
	width:100px;}
	
	section#g_write table tr:last-child{
	border-bottom-color:white;}
	
	section#g_write table input[type=text]{
	width:99%;
	height:50px;
	outline:none;}
	
	section#g_write table textarea{
	width:99%;
	height:200px;
	outline:none;
	resize:none;}
	
	section#g_write table input[type=submit]{
	margin-top:50px;
	float:right;
	width:200px;
	height:50px;
	border:1px solid #887159;
	background:#887159;
	color:white;}
	
</style>
<script>
	function check()
	{
		if(document.chk.title.value.trim()=="")
		{
			alter("제목을 작성해주세요");
			return false;
		}
		else if(document.chk.content.value.trim()=="")
		{
			alter("내용을 작성해주세요");
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
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> 공지 </div>
    </div>
<section id="g_write">
<form method="post" name="chk" action="gongji_write_ok" onsubmit="return check()">
<div id="txt1">공지사항 작성</div>
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<div style="float:left; margin-left:350px;"><input type="checkbox" name="gubun" value="1"></div>
				<div style="float:right;">이 글이 첫번째 dd공지로 보이길 원하는 경우 체크해주세요</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="작성"></td>
		</tr>
	</table>
</form>
</section>

</body>