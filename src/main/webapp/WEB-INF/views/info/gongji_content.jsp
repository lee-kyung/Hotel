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

</body>