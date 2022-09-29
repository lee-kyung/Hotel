<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
		width: 1300px;
		margin: auto;
		margin-top: 100px;
		margin-bottom: 200px;
	} 
	section #sec{
		width: 1000px;
		margin: auto;
	} 
	section #sec #title{
	 	text-align: center;
	 	font-size: 37px;
	 	font-weight: 700;
	 }
	#sec #txt2{
	 	/* border: 1px solid pink; */
	 	font-size: 20px;
	 }
	#sec #txt2 #stay{
		font-size: 24px;
		font-weight: 700;
	}
	#sec #txt2 #sta{
		font-size: 20px;
		color: orange;
	}
	section table{
	 	width: 1000px;
		margin: auto;
		margin-top: 10px;
		border-bottom: 1px solid #887159;
	}
	section table td{
		padding: 15px;
	}
	section table tr:first-child{
		font-size: 25px;
		font-weight: 600;
		text-align: left;
		border-bottom: 2px solid #887159;
	}
	section table td:first-child{
		width: 250px;
	}
</style>
</head>
<body>
<c:if test=" userid != 'admin' ">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3" onclick="location='../admin/admin'"> ADMIN </div>
    </div>
    
<section>
<div id="sec">
	<div id="title">예약상세</div>
	<c:if test="${rvo.bstate == 1}">
	  		<c:set var="bstate" value="예약"/>
	  	</c:if>
	  	<c:if test="${rvo.bstate == 2}">
	  		<c:set var="bstate" value="사용완료"/>
	  	</c:if>
	  	<c:if test="${rvo.bstate == 3}">
	  		<c:set var="bstate" value="취소됌"/>
	  	</c:if>
	<div id="txt2"> 
		예약번호 : ${rvo.bid} <br>
		<span id="stay">${rvo.checkin} - ${rvo.checkout}</span>&nbsp<span id="sta">${bstate}</span>
	</div>
	<table>
		<tr>
			<td id="name"> ${rvo.rname} </td>
		</tr>
		<tr>
			<td> 예약 인원 </td>
			<td> ${rvo.binwon}인 </td>
		</tr>
		<tr>
			<td> 추가침대 </td>
			<c:if test="${rvo.bextbed == 0}">
				<c:set var="bextbed" value="NO"/>
			</c:if>
			<c:if test="${rvo.bextbed == 1}">
				<c:set var="bextbed" value="YES"/>
			</c:if>
			<td> ${bextbed} </td>
		</tr>
		<tr>
			<td> 조식 </td>
			<c:if test="${rvo.bmeal == 0}">
				<c:set var="bmeal" value="NO"/>
			</c:if>
			<c:if test="${rvo.bmeal == 1}">
				<c:set var="bmeal" value="YES"/>
			</c:if>
			<td> ${bmeal} </td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td> ${rvo.spreq} </td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 예약자 정보 </td>
		</tr>
		<tr>
			<td> 예약자 </td>
			<td> ${rvo.bkname} </td>
		</tr>
		<tr>
			<td> 연락처 </td>
			<td> ${rvo.bkphone} </td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 결제 정보 </td>
		</tr>
		<tr>
			<td> 결제수단 </td>
			<td>
				간편결제
			</td>
		</tr>
		<tr>
			<td> 총 결제 금액 </td>
			<td> <fmt:formatNumber value="${rvo.btotal }"/>원 </td>
		</tr>
	</table>
	
</div>
</section>
</body>














