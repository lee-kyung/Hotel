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
	<div id="title"> ESHOP 구매 상세 </div>
		<c:if test="${gvo.state == 0}">
  			<c:set var="state" value="결제완료"/>
	  	</c:if>
	  	<c:if test="${gvo.state == 1}">
	  		<c:set var="state" value="취소요청"/>
	  	</c:if>
	  	<c:if test="${gvo.state == 2}">
	  		<c:set var="state" value="취소완료"/>
	  	</c:if>
	  	<c:if test="${gvo.state == 3}">
	  		<c:set var="state" value="배송완료"/>
	  	</c:if>
	<div id="txt2"> 
		주문번호 : ${gvo.jumuncode} <br>
		<span id="stay">구매일: ${gvo.buyday}</span>&nbsp<span id="sta">${state}</span>
	</div>
	<table>
		<tr>	
			<td colspan="2">${gvo.title} 외 </td>
		</tr>
		<c:forEach items="${glist}" var="glvo">
 		<tr>	
			<td width="280"> ${glvo.title} </td>
			<td> ${glvo.total_su} 개 </td>
		</tr>
		</c:forEach>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 구매자 정보 </td>
		</tr>
		<tr>
			<td>구매자</td>
			<td>${gvo.pname}</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${gvo.pphone}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${gvo.pemail}</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2">배송지 정보</td>
		</tr>
		<tr>
			<td>받는 사람</td>
			<td>${gvo.bname}</td>
		</tr>
		<tr>
			<td>연락처</td>
			<td>${gvo.bphone}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${gvo.bjuso } ${gvo.bjuso_etc }</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="2"> 결제 정보 </td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td>
				간편결제
			</td>
		</tr>
		<tr>
			<td> 결제금액 </td>
			<td> <fmt:formatNumber value="${gvo.total_price}"/>원 </td>
		</tr>
	</table>
</div>
</section>
</body>














