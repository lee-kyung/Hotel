<<<<<<< HEAD
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
		border: 1px solid #887159;
	}
	roomsec td{
		height:40px;
	}
	roomsec table input[type=text]{
		height: 42px;
		margin-top: 17px;
		border-radius: 5px;
	}
	roomsec table input[type=select]{
		height: 40px;
	}
	roomsec #ro_info{
		width: 800px;
		height: 250px;
		border: 1px solid #887159;	
		margin-bottom: 30px;
		margin-top: 30px;
	}
	roomsec #roomdiv{
		visibility: hidden;
	}
	roomsec #ro_info #right{
		padding-top: 35px;
		padding-left: 20px;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function(){
		
		$("#checkin").datepicker({
			format: "yyyy-mm-dd",
			
			minDate: new Date() 
		});
		$("#checkout").datepicker({
			format: "yyyy-mm-dd",
			minDate: new Date()
		});
	});
	
   function form_submit(n)
   {
	   //alert(document.room.rcode2[n].value);
	   document.room.rcode.value=document.room.rcode2[n].value;
	   document.room.submit();
   }
   
   function getRoomAvail()
   {  
	   
	   document.getElementById("roomdiv").style.visibility="visible";
	   
	   var checkin=document.room.checkin.value;
	   var checkout=document.room.checkout.value;
	   
	   var chk=new XMLHttpRequest();
	   chk.open("get","getRoomAvail?checkin="+checkin+"&checkout="+checkout);
	   chk.send();
	   chk.onreadystatechange=function()
	   {
		   if(chk.readyState==4)
		   {
			   //alert(chk.responseText);
			   document.getElementById("ccc").innerText=chk.responseText;
			   var aa=chk.responseText.split(",");

			   //alert(chk.responseText.length);
			   var cbtn=document.getElementsByClassName("cbtn");
			   alert(aa.length);
			   if(aa.length==1)
			   {
				   for(i=0;i<cbtn.length;i++)
			       {
					//   alert(cbtn[i].enabled);
					  // document.getElementsByClassName("cbtn")[i].setAttribute("disabled","false");
			       }	   
				 
			   }	 
			   else
			   {	   
			     var crcode=document.getElementsByClassName("crcode");
			    
			   
			     for(i=0;i<aa.length;i+=2)
			     {
				   for(j=0;j<crcode.length;j++)
				   {
					   if(aa[i]==crcode[j].innerText.trim())
					   {
						   if(aa[i+1]>=2)
						     cbtn[j].disabled=true;
					   }	
				   }	   
			     }	   
			   }
		   }	
	   }
	   //alert(document.room.checkin.value);
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
 			<div> RESERVATION </div>
 			<div> 호텔에 오신것을 환영합니다 </div>
				<form name="room" method="post" action="room_resvnext">
				 <input type="hidden" name="rcode">
				<table id="tb">
					<tr> 
						<th> 체크인 </th>
						<th> 체크아웃 </th>
						<th> 성인 </th>
						<th> 어린이 </th>
						<th rowspan="2"><input type="button" value="검색" onclick="getRoomAvail(${my.index})"> </th>
					</tr> 
					<tr>
						<td><input type="text" name="checkin" id="checkin"></td>
						<td><input type="text" name="checkout" id="checkout"></td>
						<td> 
							<select name="adult" id="adult">
								<option value="0"> 선택 </option>
								<option value="1"> 1 </option>
								<option value="2"> 2 </option>
								<option value="3"> 3 </option>
								<option value="4"> 4 </option>
								<option value="5"> 5 </option>
								<option value="6"> 6 </option>
							</select>
						</td>
						<td> 
							<select name="child" id="child">
								<option value="0"> 선택 </option>
								<option value="1"> 1 </option>
								<option value="2"> 2 </option>
								<option value="3"> 3 </option>
								<option value="4"> 4 </option>
							</select>
						</td>	
					</tr>
				</table>
				<div id="ccc"></div>
				<div id="roomdiv">
				<c:forEach items="${list}" var="rvo" varStatus="my">
				<div id="ro_info">
 				<input type="hidden" name="rcode2" value="${rvo.rcode}">
					<div id="left" style="float:left;height:250px;width:500px">
						<img src="../img/rooms/${rvo.rpimg}" width="500px" height="248px">
					</div>
					<div id="right" style="float:right;height:250px;width:270px">
						<div id="rname">${rvo.rname}</div> <span class="crcode">${rvo.rcode}</span> <p>
						<div><span id="subr">전망</span>${rvo.rview}</div>
						<div><span id="subr">베드타입</span>${rvo.rbed}</div>
						<div><span id="subr">가격</span>${rvo.rprice}</div>						
						<br>
					
						<input type="button" value="객실선택" class="cbtn" onclick="form_submit(${my.index})">
					
					</div>
				</div>
				</c:forEach> 
				</div>
			</form>	
 	  	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->

</body>