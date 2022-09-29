<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	#sec{
		width:1100px;
		margin:auto;
		margin-top: 80px;
		margin-bottom: 80px;
	}
	#sec2{
		width: 700px;
		margin: auto;
	}
	#sec2 #title{
		text-decoration: underline;
		color: #887159;
		font-family: fantasy;
		font-size: 50px;
		text-align: center;
	}
	#sec2 #name{
		text-align: center;
	}
	#sec table{
		width: 500px;
		margin: auto;
		margin-top: 50px;
		font-size: 20px;
		border: 1px solid #887159;
		border-radius: 25px;
	}
	#sec table tr td{
		padding: 15px;
	}
	
</style>
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
   <!-- 객실 리스트 -->
<div id="sec">
	<div id="sec2">
	<div id="title">BOOKING CONFIRMED!</div>
		<table>
			<tr>
				<th> 예약번호 </th>
				<td> ${rsvo.bid} </td>
			</tr>
			<tr>
				<th> 예약자 </th>
				<td> ${rsvo.bkname} </td>
			</tr>
			<tr>
				<th> 체크인 </th>
				<td> ${rsvo.checkin} </td>
			</tr>
			<tr>
				<th> 체크아웃 </th>
				<td> ${rsvo.checkout} </td>
			</tr>
		</table>
		<div id="txt2">자세한 사항은  마이페이지에서 확인 가능하며 비회원의 경우 예약번호로 조회가 가능합니다.</div>
		<div><input type="button" onclick="location='../main/index'" value="확 인"></div>
	</div>
</div>