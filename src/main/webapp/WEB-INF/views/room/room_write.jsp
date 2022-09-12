<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>

</head>

<body>
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
        <h3> 객실예약 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
    <!-- offers_area_start -->
    <div class="offers_area padding_top">
        <div class="container">
    <form name="inroom" enctype="multipart/form-data" method="post" action="room_write_ok">
	<table>
	<caption><h2>객실 등록</h2></caption>
		<tr>
			<td> 객실 코드 </td>
			<td> <input type="text" name="rcode" readonly> </td>
			<td> <!-- 대분류(객실타입) -->
			  <select name="rdae">
			  	<option> 선택 </option>
			  	<c:forEach items="${list}" var="rvo">	
					<option value="${rvo.code}"> ${rvo.rtype} </option>			  				  		
			  	</c:forEach>
			  </select>
			  <input type="button" onclick="bunho()" value="객실코드생성">
			</td>
		</tr>
		<tr>
			<td> 객실타입 설명 </td>
			<td colspan="2"> <input type="text" name="rtxt"> </td>
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
			<td colspan="3"> <input type="submit" value="등록하기"> </td>
		</tr>
	</table>
  </form>

    </div>
    </div>
    <!-- offers_area_end -->

 
    <!-- ================ Rooms Area End ================= -->

</body>