<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	#sec{
		width:1100px;
		margin:auto;
		margin-top:100px;
		margin-bottom:200px;
		border: 1px solid red;
	}
	#sec #conf{
		width: 600px;
		margin: auto;
		margin-auto: 50px;
		border: 2px solid black;
	}
</style>
<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <div id="h3"> CONFIRMATION </div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
<div id="sec">
<div id="title">RESERVATION</div>
	<div id="name">예약이 완료되었습니다.</div>
	<table id="conf" border="1">
		<tr>
			<th> 예약번호 </th>
			<td> ${rsvo.bid} </td>
		</tr>
		<tr>
			<th> 예약자 </th>
			<td> ${rsvo.bid} </td>
		</tr>
		<tr>
			<th> 체크인 </th>
			<td> ${rsvo.bid} </td>
		</tr>
		<tr>
			<th> 체크아웃 </th>
			<td> ${rsvo.bid} </td>
		</tr>
	</table>
	<div id="txt2">자세한 사항은  마이페이지에서 확인 가능하며 비회원의 경우 예약번호로 조회가 가능합니다.</div>
	<div id="btn_center"><input type="button" onclick="location='../main/index'" value="확 인"></div>
</div>
</body>
