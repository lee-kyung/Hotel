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
		margin-bottom: 80px;
	}
	roomsec{
		margin-bottom: 80px;
		margin: auto;
		width: 700px;
		border: 1px solid #887159;
	}
	roomsec input[type=button], input[type=submit]{
		color: #887159;
		background: white;
		border: 1px solid #887159;
		width: 120px;
		height: 40px;
	}
	roomsec input[type=button]:hover{
		cursor: pointer;
		background: #887159;
		color: white;
	}
	roomsec input[type=submit]:hover{
		cursor: pointer;
		background: #887159;
		color: white;
	}
	roomsec select{
		width: 120px;
		color: #887159;
		border: 1px solid #887159;
	}
	roomsec tr td{
		padding: 6px;
	}
</style>
<script>
	function bunho()
		{
			// 대 의 value 값 을 가져와서 객실코드 생성하기
			var rdae=document.inroom.rdae.value;
			var code="r"+rdae;
			
			var chk=new XMLHttpRequest();
			chk.open("get","getbunho?code="+code);
			chk.send();
			chk.onreadystatechange=function()
			{
				if(chk.readyState==4)
				{
					// alert(chk.responseText);
					// 1을 증가 후 상품코드를 완성한 다음 텍스트에 전달
					var bunho=parseInt(chk.responseText)+1;
					// alert(bunho);
					// bunho의 값을 3자리로 변경
					bunho=bunho+""; // bunho를 숫자에서 문자로 변경하기.
					// String(bunho); , bunho.toString(); 도 가능.
					// alert(bunho.length);
					if(bunho.length==1)
					{
						bunho="00"+bunho;
					}
					else if(bunho.length==2)
					{
						bunho="0"+bunho;
					}
					// p 대 중 소 bunho를 연결
					document.inroom.rcode.value=code+bunho;
				}
			}
		}
</script>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <h3> 객실추가 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
<div class="features_room">
  <div class="container">
    <div class="row"> 
    	<roomsec>
 		<form name="inroom" enctype="multipart/form-data" method="post" action="room_write_ok">
		<table width="700">
			<tr>
				<td> 객실 코드 </td>
				<td> <input type="text" name="rcode" readonly> </td>
				<td> <!-- 대분류(객실타입) -->
				&nbsp
				  <select name="rdae">
				  	<option> 선택 </option>
				  	<c:forEach items="${list}" var="rdvo">	
						<option value="${rdvo.code}"> ${rdvo.rtype} </option>			  				  		
				  	</c:forEach>
				  </select> &nbsp&nbsp
				  <input type="button" onclick="bunho()" value="객실코드생성">
				</td>
			</tr>
			<tr>
				<td> 객실명 </td>
				<td colspan="2"> <input type="text" name="rname"> </td>
			</tr>
			<tr>
				<td> 객실 설명 </td>
				<td colspan="2"> <input type="text" name="rtxt2"> </td>
			</tr>
			<tr>
				<td> 객실메인 이미지 </td>
				<td colspan="2"> <input type="file" name="rpimg"> </td>
			</tr>
			<tr>
				<td> 객실상세 이미지 </td>
				<td colspan="2"> <input type="file" name="rcimg"> </td>
			</tr>
			<tr>
				<td> 객실뷰 </td>
				<td colspan="2"> 
					<select name="rview">
						<option value="-1"> 선택 </option>
						<option value="0"> 시티뷰 </option>
						<option value="1"> 마운틴뷰 </option>
						<option value="2"> 오션뷰 </option>
					</select>
				</td>
			</tr>
			<tr>
				<td> 객실가격 </td>
				<td colspan="2"> <input type="text" name="rprice"> </td>
			</tr>
			<tr>
				<td> 객실수량 </td>
				<td colspan="2"> <input type="text" name="rsu"> </td>
			</tr>
			<tr>
				<td> 최소인원 </td>
				<td colspan="2"> <input type="text" name="rmin"> </td>
			</tr>
			<tr>
				<td> 최대인원 </td>
				<td colspan="2"> <input type="text" name="rmax"> </td>
			</tr>
			<tr>
				<td> 베드타입 </td>
				<td colspan="2"> <input type="text" name="rbed"> </td>
			</tr>
			<tr>
				<td colspan="3" align="center"> <input type="submit" value="등록하기"> </td>
			</tr>
	</table>
  </form>
 	  	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->

</body>