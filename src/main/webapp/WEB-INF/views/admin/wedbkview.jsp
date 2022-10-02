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
<c:if test="${userid != 'admin'}">
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
	<div id="title">웨딩 예약상세</div>
	<c:if test="${wvo.state == 0}">
	  		<c:set var="state" value="예약완료"/>
	  	</c:if>
	  	<c:if test="${wvo.state == 1}">
	  		<c:set var="state" value="예약취소"/>
	  	</c:if>
	  	<c:if test="${wvo.state == 2}">
	  		<c:set var="state" value="상담완료"/>
	  	</c:if>
	<div id="txt2"> 
		예약번호 : ${wvo.wresv_code} <br>
		<span id="stay">상담일: ${wvo.wresv_cday}</span><span id="sta">${state}</span>
	</div>
	<table>
		<tr>
			<td> ${wvo.wresv_hall} </td>
		</tr>
		<tr>
			<td> 상담 시간 </td>
			<td> ${wvo.wresv_time} </td>
		</tr>
		<tr>
			<td> 예식 희망일 </td>
			<td> ${wvo.wresv_wday} </td>
		</tr>
		<tr>
			<td> 예상 참석자 </td>
			<td> ${wvo.wresv_inwon} </td>
		</tr>
		<tr>
			<td> 문의사항 </td>
			<td> ${wvo.wresv_content} </td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 예약자 정보 </td>
		</tr>
		<tr>
			<td> 상담 예약자 </td>
			<td> ${wvo.wresv_name} </td>
		</tr>
		<tr>
			<td> 연락처 </td>
			<td> ${wvo.wresv_phone} </td>
		</tr>
		<tr>
			<td> 이메일 </td>
			<td> ${wvo.wresv_email} </td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 결제 정보 </td>
		</tr>
		<tr>
			<td> 결제수단 </td>
			<td>
				<c:if test="${wvo.wresv_pay ==0}">
					<c:set value="카드결제" var="pay"/>
				</c:if>
				<c:if test="${wvo.wresv_pay !=0}">
					<c:set value="무통장입금" var="pay"/>
				</c:if>
				${pay}
			</td>
		</tr>
		<tr>
			<td> 결제금액 </td>
			<td> 5,000원 </td>
		</tr>
	</table>
	
</div>
</section>
</body>














