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
	}
</style>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <h3> R E S E R V A T I O N </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
<div class="features_room">
  <div class="container">
    <div class="row"> 
   	<roomsec>
   	<h2>객실 수량</h2>
		<table border="1">
			
			
 			<tr>
 				<th> 일 </th>
 				<th> 월 </th>
				<th> 화 </th>
				<th> 수 </th>
				<th> 목 </th>
				<th> 금 </th>
				<th> 토 </th>
 			</tr>
			<c:set var="day" value="1"/>
			<c:forEach var="i" begin="1" end="6"> <!-- 행 -->
			<tr>
			  <c:forEach var="j" begin="0" end="6"> <!-- 열 -->
				<c:if test="${(j < yoil && i == 1) || (chong < day)}">
					<td> &nbsp; </td>
				</c:if>
				<c:if test="${((j >= yoil && i == 1)|| i > 1 ) && (chong >= day)}">
				  	<c:if test="${j != 0 && j != 6 }">
						<td> ${day} <p>
				  	</c:if>
				  	<c:if test="${j == 0}">
				  		<td style='color:red'> ${day} <p>
				  	</c:if>
				  	<c:if test="${j == 6}">
				  		<td style='color:blue'> ${day} <p>
				  	</c:if>
				  	<!-- 방의 이름출력..? -->
				  	<!-- td에 출력되는 날짜가 오늘보다 이전이면 안보이게 -->
				  	<%
				 		// 년,월은 request영역, 일은 pageContext영역 => 스크립트릿변수로 변경해야함
  						// getAttribute는 object니까 toString으로 문자열로 바꾸기
  						String y=request.getAttribute("y").toString();
				  	%>
				</c:if>
			  </c:forEach> 			
			</c:forEach>
			
		</table>
	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->



















</body>