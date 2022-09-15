<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
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
		margin: auto;
		margin-bottom: 120px;
	}
	roomsec table{
		width: 800px;
		height: 80px;
		border: 1px solid #887159;
		margin-bottom: 30px;
	}
	roomsec input[type=text]{
		width: 260px;
		height: 30px;
		border: 1px solid #887159;
	}
	roomsec #pay{
		margin: auto;
		text-align: center;
	}
	roomsec #pay input[type=submit]{
		width: 240px;
		height: 50px;
		border: 1px solid #887159;
		color: #887159;
		background: white;
		pointer: cursor;
	}
	roomsec #pay input[type=submit]:hover{
		background: #887159;
		color: white;
	}
	roomsec #tb input[type=text]{
		border: none;
		width: 100px;
	}
</style>
<script>
	
	function total_price()
	{
	 	// 인원
		var binwon=document.getElementById("binwon").value;
				
		// 투숙일
		var suk=document.getElementById("suk").value;
		
		// 추가침대
		var bb=document.resv.bextbed.value;
		if(bb==1)
		{ 
			bbprice=65000*bb*suk;
			document.getElementById("bed").innerText=bbprice;
		}
		
		// 조식
		var bf=document.resv.bmeal.value;
		if(bf==1)
		{
			bfprice=30000*bf*binwon*suk;
			document.getElementById("bfp").innerText=bfprice;
		}
		
		// 객실가격
		var rprice=document.getElementById("rprice").innerText;
		
		// 총 가격
		var total=(bbprice+bfprice)+rprice;
	//	alert(total);
		document.getElementById("btotal").innerText=total;
		
		document.resv.btotal.value=total;
	
		
		
	}
</script>

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
 			<form name="resv" method="post" action="room_resv_ok">
 			 예약자 정보
 			<table>
 				<tr> 
 					<td> 예약자 성함 </td> 
 					<td><input type="text" name="bkname"></td>
 				</tr>
 				<tr> 
 					<td> 예약자 전화번호 </td> 
 					<td><input type="text" name="bkphone"></td>
 				</tr>
 			</table>
 			객실명: ${rvo.rname}<input type="text" name="rcode" value="${rvo.rcode}" readonly></span>
 			<table id="tb">
 				 <tr>
 				   <td> 체크인 </td>
 				   <td><input type="text" name="bcin" value="${checkin}" readonly> </td>
 				   <td> 체크아웃 </td>
 				   <td> <input type="text" name="bcout" value="${checkout}" readonly></td>
 				 </tr>
 				 <tr>
 				   <td> 기준인원/최대인원 </td>
 				   <td> ${rvo.rmin}/${rvo.rmax} </td>
 				   <td> 투숙인원 </td>
 				   <td><input type="text" name="binwon" id="binwon" value="${adult+child}" readonly>명</td>
 				 </tr>
 				 <tr>
 				 	<td> 추가 침대(1박65000원)</td>
 				 	<td>
 				 		예<input type="radio" value="1" name="bextbed" onchange="total_price()">
 				 		아니오 <input type="radio" value="0" name="bextbed" onchange="total_price()"> <span id="bed"></span>원
 				 	</td>
 				 	<td> 투숙일 </td>
 				 	<td><input type="text" id="suk" name="suk" value="${suk}">일</span></td>
 				 </tr>
 				 <tr>
 				 	<td> 조식(1인 1박당 30000원) </td>
 				 	<td>
 				 		예<input type="radio" value="1" name="bmeal" onchange="total_price()">
 				 		아니오 <input type="radio" value="0" name="bmeal" onchange="total_price()"> <span id="bfp"></span>원
 				 	</td>
 				 </tr>
 				 <tr>
 				 	<td> 숙박 가격 </td>
 				 	<td><span id="rprice">${rvo.rprice}</span>원</td>
 				 </tr>
 				 <tr>
 				 	<td> 총 가격 </td>
 				 	<td colspan="3"><span id="btotal"></span>원</td> 
 				 </tr>
				</table>
				<div id="pay"><input type="submit" value="예약하기"></div>
 			</form>
 	  	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->

</body>