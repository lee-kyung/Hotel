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
	<div id="title">다이닝 예약상세</div>
		<c:if test="${dvo.dr_state == 0}">
			<c:set var="state" value="예약"/>
		</c:if>
		<c:if test="${dvo.dr_state == 1}">
			<c:set var="state" value="사용완료"/>
		</c:if>
		<c:if test="${dvo.dr_state == 2}">
			<c:set var="state" value="취소됌"/>
		</c:if>
	<div id="txt2"> 
		예약번호 : ${dvo.bid} <br>
		<span id="stay">체크인: ${dvo.dr_date}</span><span id="sta">${state}</span>
	</div>
	<table>
		<tr>
			<td> ${dvo.dine_type} </td>
		</tr>
		<tr>
			<td> 식사 시간 </td>
			<td> ${dvo.dr_time} </td>
		</tr>
		<tr>
			<td> 성인 </td>
			<td> ${dvo.adult} </td>
		</tr>
		<tr>
			<td> 어린이 </td>
			<td> ${dvo.child} </td>
		</tr>
		<tr>
			<td> 유아 </td>
			<td> ${dvo.baby} </td>
		</tr>
		<tr>
			<td> 요청사항 </td>
			<td> ${dvo.dr_extrarq} </td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 예약자 정보 </td>
		</tr>
		<tr>
			<td> 예약자 </td>
			<td> ${dvo.bkname} </td>
		</tr>
		<tr>
			<td> 연락처 </td>
			<td> ${dvo.p1}-${dvo.p2}-${dvo.p3} </td>
		</tr>
		<tr>
			<td> 이메일 </td>
			<td> ${dvo.email} </td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 결제 정보 </td>
		</tr>
		<tr>
			<td> 결제수단 </td>
			<td>
				<c:if test="${dvo.sudan == 0}">
					<c:set value="카드결제" var="sudan"/>
				</c:if>
				<c:if test="${dvo.sudan != 0}">
					<c:set value="무통장입금" var="sudan"/>
				</c:if>
				${sudan}
			</td>
		</tr>
		<tr>
			<td> 결제금액 </td>
			<td> <fmt:formatNumber value="${dvo.dr_total }"/>원 </td>
		</tr>
	</table>
</div>
</section>
</body>














