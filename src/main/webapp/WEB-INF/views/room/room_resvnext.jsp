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
</style>
<script>
	
	function total_price()
	{
		// 인원
		var ii=document.resv.totinwon.value;
		alert(ii);
		ii=ii-${rvo.rmin} // 총 인원수 - 기준인원 해서 추가인원비 구하기
		var iiprice=ii*20000;
		document.getElementById("binwon").innerText=iiprice;
		
		// 조식
		var bb=document.resv.bmeal.value;
		if(bb.checked==0)
		{		
			var bbprice=30000*binwon;
			document.getElementById("bf").innerText=bbprice;
		}
				
		// 추가침대
		
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
 					<td><input type="text" name="bname"></td>
 				</tr>
 				<tr> 
 					<td> 예약자 전화번호 </td> 
 					<td><input type="text" name="bphone"></td>
 				</tr>
 			</table>
 			객실명: ${rvo.rname} ${rvo.rcode}
 			<table>
 				 <tr>
 				   <td> 체크인 </td>
 				   <td> ${checkin} </td>
 				   <td> 체크아웃 </td>
 				   <td> ${checkout} </td>
 				 </tr>
 				 <tr>
 				   <td> 기준인원/최대인원 </td>
 				   <td> ${rvo.rmin}/${rvo.rmax} </td>
 				   <td> 투숙인원 </td>
 				   <td id="totinwon"> 총 ${adult+child}명</td>
 				 </tr>
 				 <tr>
 				 	<td> 추가 침대 </td>
 				 	<td>
 				 		예<input type="radio" value="예" name="bextbed">
 				 		아니오 <input type="radio" value="아니오" name="bextbed">
 				 	</td>
 				 </tr>
 				 <tr>
 				 	<td> 조식(1인 1박당 30000원) </td>
 				 	<td>
 				 		예<input type="radio" value="0" name="bmeal" onclick="total_price(0)">
 				 		아니오 <input type="radio" value="1" name="bmeal" onclick="total_price(1)"><p>
 				 		<span id="bf">원</span>
 				 	</td>
 				 </tr>
 				 <tr>
 				 	<td> 숙박 가격 </td>
 				 	<td><span id="rprice">${rvo.rprice}</span>원</td>
 				 </tr>
 				 <tr>
 				 	<td> 인원 추가 </td>
 				 	<td><span id="binwon">0</span>원 </td>
 				 </tr>
 				 <tr>
 				 	<td> 총 가격 </td>
 				 	<td colspan="3"><span id="total"></span>원</td> 
 				 </tr>
				</table>
				<div id="pay"><input type="submit" value="결제하기"></div>
 			</form>
 	  	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->

</body>