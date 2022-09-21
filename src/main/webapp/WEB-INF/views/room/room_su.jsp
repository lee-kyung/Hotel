<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
	roomsec table{
		border: 1px solid #887159;	
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
   	<span id="checkin"></span>
   			<caption><h3>
			<c:if test="${m == 1}"> <!-- 1월이면 -->
				<a href="room_su?y=${y-1}&m=12">◁</a>
			</c:if>
			<c:if test="${m != 1}"> <!-- 1월이 아니면 -->
				<a href="room_su?y=${y}&m=${m-1}">◁</a>
			</c:if>
			${y}년 ${m}월
			<c:if test="${m == 12}"> <!-- 12월이면 -->
				<a href="room_su?y=${y+1}&m=1">▷</a>
			</c:if>
			<c:if test="${m != 12}"> <!-- 12월이 아니면 -->
				<a href="room_su?y=${y}&m=${m+1}">▷</a>
			</c:if>
		</h3></caption>
		<table border="1" width="1000" align="center">
 			<tr height="50">
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
			<tr height="100">
			  <c:forEach var="j" begin="0" end="6"> <!-- 열 -->
				<c:if test="${(j < yoil && i == 1) || (chong < day)}">
					<td> &nbsp; </td>
				</c:if>
				<c:if test="${((j >= yoil && i == 1)|| i > 1 ) && (chong >= day)}">
				  	<td> ${day} <p>
				  	<!-- 방의 이름출력.. -->
				  	<!-- td에 출력되는 날짜가 오늘보다 이전이면 안보이게 -->
				  	<c:if test="${tt == 1}">	
					  <c:forEach items="${list}" var="rvo">
						 <span>${rvo.rname} : ${rvo.rsu}</span><p>
					  </c:forEach>
					 </c:if>
					</td>
				<c:set var="day" value="${day+1}"/> <!-- 날짜값을 1씩 증가 -->
				</c:if>
			   </c:forEach> 			
			  </tr>
			</c:forEach> 
		</table>
	</roomsec>
 	</div>
  </div>
</div>

    <!-- ================ Rooms Area End ================= -->


</body>