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
	function check(upform)
	{
		// checkbox가 체크된 그림파일명과 체크가 안된 그림파일명을 각각 저장
		var chk=document.getElementsByName("chk"); // 요소의 이름을 변수에 저장
		var len=chk.length; // 체크박스의 길이
		var del=""; // 삭제할 파일을 저장
		var str=""; // 삭제하지 않을 파일을 저장
		for(i=0;i<len;i++)
		{
			if(chk[i].checked)
			{
				del=del+chk[i].value+",";
			}
			else
			{
				str=str+chk[i].value+",";
			}
		}
		upform.del.value=del; // 삭제파일 목록
		upform.str.value=str; // 보존파일 목록
	//	alert(del+" "+str);
		return true;
	}
/* 	function add_file() // file추가
	{
		var rpimg=document.getElementsByClassName("rpimg");
		var len=rpimg.length; // 현재 type="file"의 갯수
		len++;
		var inner="<p class='rpimg'><input type='file' name='rpimg"+len+"'></p>"; // 추가할내용
		
		document.getElementById("outer").innerHTML=document.getElementById("outer").innerHTML+inner;
	}
	function del_file() // file삭제
	{
		
		var len=document.getElementsByClassName("rpimg").length;
		if(len > 1)
		{
			len--;
			document.getElementsByClassName("rpimg")[len].remove();
		}
	} */
</script>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
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
 		<form name="inroom" enctype="multipart/form-data" method="post" action="room_update_ok" onsubmit="return check(this)">
 		<input type="hidden" value="${rvo.id}" name="id">
 		<input type="hidden" name="del"> <!-- 삭제할 그림의 이름을 가지고 갈 변수 -->
  		<input type="hidden" name="str"> <!-- 계속 남겨둘 사진의 이름을 가지고 갈 변수 -->
		<table width="700">
			<tr>
				<td> 객실 코드 </td>
				<td> <input type="text" name="rcode" readonly value="${rvo.rcode}" style="border:none;background:#efefef"> </td>
<%-- 				<td> <!-- 대분류(객실타입) -->
				&nbsp
				  <select id="default-select" name="rdae" readonly>
				  	<option> 선택 </option>
				  	<c:forEach items="${list}" var="rdvo">	
						<option value="${rdvo.code}"> ${rdvo.rtype} </option>			  				  		
				  	</c:forEach>
				  </select> &nbsp&nbsp
				  <input type="button" onclick="bunho()" value="객실코드생성">
				</td> --%>
			</tr>
			<tr>
				<td> 객실명 </td>
				<td colspan="2"> <input type="text" name="rname" value="${rvo.rname}"> </td>
			</tr>
			<tr>
				<td> 객실 설명 </td>
				<td colspan="2"> <input type="text" name="rtxt2" value="${rvo.rtxt2}"> </td>
			</tr>
			<tr>
				<td> 이벤트 설명 </td>
				<td colspan="2"> <input type="text" name="rtxt3" value="${rvo.rtxt3}"> </td>
			</tr>
			<tr>
				<td> 객실메인 이미지 </td>
				<td colspan="2"> <span>사진 변경 시 기존사진 체크 후 새로 추가하세요</span><p>
				  <c:forEach items="${rvo.rpimg}" var="tt">
					<img src="../img/rooms/${tt}" width="130px"> 
					<input type="checkbox" onclick="del_add(${t},this)" name="chk" value="${tt}">
				  </c:forEach>
				  </td>
			</tr>
			<tr>
				<td> 파일 </td>
				<td id="outer">
					<p class="rpimg"><input type="file" name="rpimg"></p>
				</td>
			</tr>
			<tr>
				<td> 객실상세 이미지 </td>
				<td colspan="2"> <span>사진 변경 시 기존사진 체크 후 새로 추가하세요</span><p>
				  <c:forEach items="${rvo.rcimg}" var="tt">
					<img src="../img/rooms/${tt}" width="130px"> 
					<input type="checkbox" onclick="del_add(${t},this)" name="chk" value="${tt}">
				  </c:forEach>
				  </td>
			</tr>
			<tr>
				<td> 파일 </td>
				<td id="outer">
					<p class="rcimg"><input type="file" name="rcimg"></p>
				</td>
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
				<td colspan="2"> <input type="text" name="rprice" value="${rvo.rprice}"> </td>
			</tr>
			<tr>
				<td> 객실수량 </td>
				<td colspan="2"> <input type="text" name="rsu" value="${rvo.rsu}"> </td>
			</tr>
			<tr>
				<td> 최소인원 </td>
				<td colspan="2"> <input type="text" name="rmin" value="${rvo.rmin}"> </td>
			</tr>
			<tr>
				<td> 최대인원 </td>
				<td colspan="2"> <input type="text" name="rmax" value="${rvo.rmax}"> </td>
			</tr>
			<tr>
				<td> 베드타입 </td>
				<td colspan="2"> <input type="text" name="rbed" value="${rvo.rbed}"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"> 
					<input type="submit" value="수정하기"> 
					<a href="../room/room_list"><input type="button" value="목록"></a> 
				</td>
			</tr>
	</table>
  </form>
 	  	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->

</body>