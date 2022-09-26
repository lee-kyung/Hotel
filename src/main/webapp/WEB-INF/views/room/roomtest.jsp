<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	roomsec #room{
		width: 1300px;
		margin: auto;
		border:1px solid skyblue;
		padding-left: 0px;
		margin-bottom: 80px;
		
	}
	roomsec .single_slider{
		width: 1100px;
		height: 100px;
		/* border: 1px solid black; */
		/* background: gold; */
		padding-left: 0px;
		margin-left: 0px;
	}
	roomsec .about_active owl-carousel{
		 border: 2px solid red; 
		 background: gold;
		 width: 1000px;
		 height: 400px;
		 margin-left: -05px;
	}
	roomsec .about_info_area{
		 border: 2px solid purple; 
	}
</style>
<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
<!-- bradcam_area_start -->
<!-- 새 이미지 추가하는 법
   	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
   	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
<div class="bradcam_area rooms">
	<!-- class="bradcam_area 클래스명" -->
	<h3>객실예약</h3>
</div>
<!-- bradcam_area_end -->
<!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

<!-- ================ Rooms Area Start ================= -->
<!-- 객실 리스트 -->
<div class="features_room">
	<roomsec>
	<div id="room">
		<div class="about_info_area">
			 <div class="about_active owl-carousel"> 
				<div class="single_slider">
				G하하하
				</div>
		 	</div> 
		</div>
	</div>
	</roomsec>
</div>

<!-- ================ Rooms Area End ================= -->

</body>