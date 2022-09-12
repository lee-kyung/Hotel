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
	.container{
		width: 990px;
		margin: auto;
	}
	roomsec{
		margin-bottom: 80px;
		margin: auto;
	}
	roomsec table{
		width: 800px;
		height: 80px;
		background: #f1f2f3;
	}
	roomsec #ro_info{
		width: 800px;
		height: 250px;
		border: 1px solid #887159;	
		margin-bottom: 30px;
		margin-top: 30px;
	}
	roomsec #ro_info #right{
		padding-top: 35px;
		padding-left: 20px;
	}
</style>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <h3> Reservation </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
<div class="features_room">
  <div class="container">
    <div class="row"> 
    	<roomsec>
 			<div> RESERVATION </div>
 			<div> 파라다이스호텔에 오신것을 환영합니다 </div>
				<form method="post" action="room_resvnext?checkin={}&checkout={}">
				<table>
					<tr> 
						<th> 체크인 </th>
						<th> 체크아웃 </th>
						<th> 성인 </th>
						<th> 어린이 </th>
					</tr> 
					<tr>
						<td><input type="text" name="checkin" value=""></td>
						<td><input type="text" name="checkout" value=""></td>
						<td> 
							<select>
								<option value="-1"> 선택 </option>
								<option value="0"> 1 </option>
								<option value="1"> 2 </option>
								<option value="2"> 3 </option>
								<option value="3"> 4 </option>
								<option value="4"> 5 </option>
								<option value="5"> 6 </option>
							</select>
						</td>
						<td> 
							<select>
								<option value="-1"> 선택 </option>
								<option value="0"> 1 </option>
								<option value="1"> 2 </option>
								<option value="2"> 3 </option>
								<option value="3"> 4 </option>
							</select>
						</td>					
					</tr>
				</table>
			<c:forEach items="${list}" var="rvo">
 				<div id="ro_info">
					<div id="left" style="float:left;height:250px;width:500px">
						<img src="../img/rooms/${rvo.rpimg}" width="500px" height="250px">
					</div>
					<div id="right" style="float:right;height:250px;width:270px">
						<div id="rname">${rvo.rname}</div> <p>
						<div><span id="subr">전망</span>${rvo.rview}</div>
						<div><span id="subr">베드타입</span>${rvo.rbed}</div>
						<div><span id="subr">가격</span>${rvo.rprice}</div>
						<div></div>
						<br>
						<input type="submit" value="객실선택">
					</div>
				</div>
			</c:forEach> 
				</form>
 	  	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->

</body>