<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#adcon {
		margin : 50px auto 50px auto;
	}
	#adcon table {
		width : 1000px;
		margin : 0px auto 20px auto;
		border-top : 2px solid darkgray;
		border-bottom : 2px solid darkgray;
		padding : 10px;
	}
	#adcon table td {
		padding-top : 10px;
		padding-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
</style>
<script>

</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">
        <div id="h3" onclick="location='pro_adcontent?id=${pvo.id}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'" style="cursor:pointer;"> 상 품 상 세 </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<c:if test="${userid != 'admin'}"> <c:redirect url="../main/index"/> </c:if>

	<!-- ================ 상품상세 Area Start ================= -->
    <section id="adcon">
    	<table>
			<tr>
				<td width="80"> 상품코드 </td>
				<td> ${pvo.pcode} </td>
			</tr>
			<tr>
				<td> 상품명 </td>
				<td> ${pvo.title} </td>
			</tr>
			<tr>
				<td> 판매가 </td>
				<td> ${pvo.price} </td>
			</tr>
			<tr>
				<td> 할인율 </td>
				<td> ${pvo.halin} </td>
			</tr>
			<tr>
				<td> 적립율 </td>
				<td> ${pvo.juk} </td>
			</tr>
			<tr>
				<td> 재고 </td>
				<td> ${pvo.su} </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td> ${pvo.baefee} </td>
			</tr>
			<tr>
				<td> 메인<br>이미지 </td>
				<td>
					<c:forEach var="imgs" items="${pvo.imgs}">
						<img src="../img/eshop/${imgs}" height="300">
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td> 상세<br>이미지 </td>
				<td> <img src="../img/eshop/${pvo.simg}" width="900"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="목록" onclick="location='pro_adlist?page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'">
					<input type="button" value="수정" onclick="location='pro_adupdate?id=${pvo.id}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'">
					<input type="button" value="삭제" onclick="location='pro_addelete?id=${pvo.id}&fimg=${pvo.fimg}&simg=${pvo.simg}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'">
				</td>
			</tr>
		</table>
    </section>
    <!-- ================ 상품상세 Area End ================= -->

</body>