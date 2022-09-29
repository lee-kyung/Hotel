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
<section id="g_update">
<form method="post" action="gongji_update_ok">
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
				<input type="checkbox" name="gubun" value="1" ${gu }>
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