<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
/******************/
	#first{
	width:100%;
	height:400px;
	background:#F3F3F3;
	text-align:center;}
	
	#first #first_1{
	margin:auto;
	width:1800px;}
	
	#first #txt{
	text-align:left;
	font-size:40px;
	padding-top:50px;}
	
	#first .txt2{
	text-align:right;
	font-size:18px;}
	
	#first .txt2 span{
	cursor:pointer;}
	
	#first ul li{
	display:inline-block;
	border:1px solid #cccccc;
	width:450px;
	height:150px;
	margin-top:20px;
	background:white;
	border-right:none;
	text-align:center;
	font-size:25px;
	padding-top:50px;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
/******************/

	section{
		width:1300px;
		margin:auto;
		margin-top:100px;
		margin-bottom:200px;
		border: 1px solid blue;
	}
	section table{
		width: 1300px;
	}

</style>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 객실 예약 리스트 </h3>
    </div>
    

<section>
<div>
<!-- 내용 작성 -->
	
	<table border="1">
		<tr>
			<td colspan="14"><h2>LIST</h2></td>
		</tr>
		<tr>
			<td> ID </td>
			<td> 아이디 </td>
			<td> 예약자 </td>
			<td> 체크인 </td>
			<td> 체크아웃 </td>
			<td> 객실명 </td>
			<td> 예약일 </td>
			<td> 예약인원 </td>
			<td> 추가침대 </td>
			<td> 조식 </td>
			<td> 총 결제금액</td>
			<td> 특별요청사항 </td>
			<td> 예약상태 </td>		
		</tr>
	  <c:forEach items="${rlist}" var="rvo">
	    <tr> 
	  		<td> ${rvo.id} </td>
	  		<td> ${rvo.userid} </td>
	  		<td> ${rvo.bkname} </td>
	  		<td> ${rvo.checkin} </td>
	  		<td> ${rvo.checkout} </td>
	  		<td> ${rvo.rname} </td>
	  		<td> ${rvo.bkdate} </td>
	  		<td> ${rvo.binwon} </td>
	  		<td> ${rvo.bextbed} </td>
	  		<td> ${rvo.bmeal} </td>
	  		<td> ${rvo.btotal} </td>	  		
	  		<td> ${rvo.spreq} </td>
	  		<td> ${rvo.bstate} </td>
	  	<tr>
	  </c:forEach>
	</table>
	
</div>
</section>





</body>

