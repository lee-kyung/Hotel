
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section#g_update{
	width:1000px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#g_update{
	width:1200px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section#g_update #txt1{
	font-size:28px;
	font-weight:600;
	letter-spacing:3px;
	text-align:center;}
	
	section#g_update table{
	margin:auto;
	margin-top:50px;
	width:800px;
	border-left:none;
	border-right:none;
	border-top-color:white;}
	
	section#g_update table td{
	padding:15px;
	border-left:none;
	border-right:none;}
	
	section#g_update table td:first-child{
	width:100px;}
	
	section#g_update table tr:last-child{
	border-bottom-color:white;}
	
	section#g_update table input[type=text]{
	width:99%;
	height:50px;
	outline:none;}
	
	section#g_update table textarea{
	width:99%;
	height:400px;
	outline:none;
	resize:none;}
	
	section#g_update table input[type=submit], input[type=button]{
	margin-top:50px;
	float:right;
	width:150px;
	height:40px;
	border:1px solid white;
	background:#887159;
	color:white;
	cursor:pointer;}
	
</style>
<script>
	function check(chk)
	{
		if(chk.title.value.trim().length==0)
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

<body>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3">NOTICE</div>
    </div>
<section id="g_update">
<div id="txt1">공지사항 수정</div>
<form method="post" action="gongji_update_ok" onsubmit="return check(this)">
<input type="hidden" value="${gvo.id }" name="id">
	<table border="1">
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" value="${gvo.title }"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>관리자</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea name="content">${gvo.content }</textarea></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${gvo.writeday }</td>
		</tr>
		<tr>
			<td colspan="2">
			<c:if test="${gvo.gubun==1 }">
				<c:set var="gu" value="checked"/>
			</c:if>
				<div style="float:left; margin-left:350px;"><input type="checkbox" name="gubun" value="1" ${gu }></div>
				<div style="float:right;">이 글이 첫번째 공지로 보이길 원하는 경우 체크해주세요</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="button" value="리스트" onclick="location='gongji_list'">
			</td>
		</tr>
	</table>
</form>
</section>

</body>