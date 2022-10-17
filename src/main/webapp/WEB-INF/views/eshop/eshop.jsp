<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#eshop {
		
		margin : 100px auto 150px auto;
	}
	#eshop #eshop_img1 {
		margin-top : 30px;
		width : 450px;
		height : 450px;
		padding-top : 10px;
	}
	#eshop table td {
		padding-left : 10px;
		padding-right : 10px;
	}
	#eshop #cate {
		width : 1390px;
		margin : auto;
		color : #887159;
	}
	#eshop #title {
		display : inline-block;
		font-size : 22px;
		letter-spacing : -2px;
		word-spacing : 2px;
		margin : 10px auto 10px auto;
		cursor : pointer;
	}
	#eshop #content {
		color : #887159;
		letter-spacing : -1px;
		cursor : pointer;
	}
	#eshop #eshop_img2 {
		width : 100%;
		height : 50%;
		margin : 100px auto 100px auto;
	}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area eshop0">
        <!-- <div id="h3" onclick="location='eshop'" style="cursor:pointer;"> E S H O P </div> -->
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ eshop Area Start ================= -->
	<div id="eshop">
	
    <!-- 인기상품_area_start -->
    <h1 id="cate"> 인기상품 </h1>
    <table align="center">
	<c:set var="n" value="3"/>
	<c:set var="i" value="0"/>
		<tr>
		<c:forEach var="pvo" items="${plist1}">
			<td>
				<!-- 상품이미지 -->
				<div class="offers_area padding_top" id="eshop_img1"><div class="single_offers"><div class="about_thumb">
					<img src="../img/eshop/${pvo.img}" height="430" width="440" style="cursor:pointer;" onclick="location='pro_content?pcode=${pvo.pcode}'">	
				</div></div></div>
				<!-- 상품명 -->
				<div id="title" onclick="location='pro_content?pcode=${pvo.pcode}'"> ${pvo.title} </div>
				<!-- 상품상세로 이동 -->
				<div id="content" onclick="location='pro_content?pcode=${pvo.pcode}'"> 자세히보기 > </div>
			</td>
			<c:set var="i" value="${i+1}"/>
			<c:if test="${i%n == 0}">
				</tr>
				<tr>
			</c:if>
		</c:forEach>
		</tr>
	</table>    
    <!-- 인기상품_area_end -->
    
    <img src="../img/eshop/eshop1.jpg" id="eshop_img2">
    
    <!-- 추천상품_area_start -->    
    <h1 id="cate"> 추천상품 </h1>
    <table align="center">
	<c:set var="n" value="3"/>
	<c:set var="i" value="0"/>
		<tr>
		<c:forEach var="pvo" items="${plist2}">
			<td>
				<!-- 상품이미지 -->
				<div class="offers_area padding_top" id="eshop_img1"><div class="single_offers"><div class="about_thumb">
					<img src="../img/eshop/${pvo.img}" height="430" width="440" style="cursor:pointer;" onclick="location='pro_content?pcode=${pvo.pcode}'">	
				</div></div></div>
				<!-- 상품명 -->
				<div id="title" onclick="location='pro_content?pcode=${pvo.pcode}'"> ${pvo.title} </div>
				<!-- 상품상세로 이동 -->
				<div id="content" onclick="location='pro_content?pcode=${pvo.pcode}'"> 자세히보기 > </div>
			</td>
			<c:set var="i" value="${i+1}"/>
			<c:if test="${i%n == 0}">
				</tr>
				<tr>
			</c:if>
		</c:forEach>
		</tr>
	</table>
    <!-- 추천상품_area_end -->
    
    </div>
    <!-- ================ eshop Area End ================= -->

</body>