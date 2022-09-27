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
	section{
		width:1100px;
		margin:auto;
		margin-top:100px;
		margin-bottom:200px;
	}
	section table{
		margin: auto;
	}
</style>
<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <h3> 객실예약 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
<section>
<div id="title">RESERVATION</div>
	<div id="name">예약이 완료되었습니다.</div>
	<table border="1" width="600">
		<tr>
			<td> 예약번호 </td>
			<td> 체크인 </td>
			<td> 체크아웃 </td>
			<td> 예약자 </td>
		</tr>
		<tr>
			<td> ${rsvo.bid} </td>
			<td> ${rsvo.checkin} </td>
			<td> ${rsvo.checkout} </td>
			<td> ${rsvo.bkname} </td>
		</tr>
	</table>
	<div id="txt2">비회원은 이름과 주문코드로 조회가 가능합니다.</div>
	</div>
	<div id="btn_center"><input type="button" onclick="location='../main/index'" value="확 인"></div>
</section>
</body>
</html>