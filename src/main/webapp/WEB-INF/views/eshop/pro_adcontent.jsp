<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#adcon {
		margin : 50px auto 50px auto;
	}
	#adcon #btnbox {
		width : 1000px;
		height : 50px;
		margin : auto;		
	}
	#adcon #btn1 {
		width : 120px;
		height : 41px;
		padding-top : 4px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#adcon #btn2 {
		width : 120px;
		height : 41px;
		padding-top : 4px;
		border : 1px solid #887159;
		background : white;
		color : #887159;
		cursor : pointer;
	}
	#adcon table {
		width : 1000px;
		margin : 0px auto 20px auto;
		border-top : 2px solid #887159;
		padding : 10px;
	}
	#adcon table tr {
		height : 70px;
	}
	#adcon table td {
		padding-top : 10px;
		padding-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
	#adcon table tr td:first-child {
		font-weight : bold;
		padding-left : 10px;
	}
	#adcon table tr td:last-child {
		padding-left : 20px;
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
    	<div id="btnbox">
    		<div style="float:right;">
				<input type="button" value="수정" onclick="location='pro_adupdate?id=${pvo.id}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'" id="btn1">
				<input type="button" value="삭제" onclick="if(confirm('삭제하시겠습니까?')){location='pro_addelete?id=${pvo.id}&fimg=${pvo.fimg}&simg=${pvo.simg}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'}"  id="btn2">
			</div>
    	</div>    
    	<table>
			<tr>
				<td width="100"> 상품코드 </td>
				<td> ${pvo.pcode} </td>
			</tr>
			<tr>
				<td> 상품명 </td>
				<td> ${pvo.title} </td>
			</tr>
			<tr>
				<td> 판매가 </td>
				<td> <fmt:formatNumber value="${pvo.price}" pattern=",###"/> 원 </td>
			</tr>
			<tr>
				<td> 할인율 </td>
				<td> ${pvo.halin} % </td>
			</tr>
			<tr>
				<td> 적립율 </td>
				<td> ${pvo.juk} % </td>
			</tr>
			<tr>
				<td> 재고 </td>
				<td> <fmt:formatNumber value="${pvo.su}" pattern=",###"/> 개 </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td> <fmt:formatNumber value="${pvo.baefee}" pattern=",###"/> 원 </td>
			</tr>
			<tr>
				<td> 메인이미지 </td>
				<td>
					<c:if test="${pvo.fimg != ''}">
					<c:forEach var="imgs" items="${pvo.imgs}">
						<img src="../img/eshop/${imgs}" width="425">
					</c:forEach>
					</c:if>
				</td>
			</tr>
			<tr style="border-bottom:2px solid #887159">
				<td> 상세이미지 </td>
				<td>
				<c:if test="${pvo.simg != ''}">
					<img src="../img/eshop/${pvo.simg}" width="850">
				</c:if>
				</td>
			</tr>
			<tr height="100">
				<td colspan="2" align="center" style="border:none;">
					<input type="button" value="목록" onclick="location='pro_adlist?page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'" id="btn1">
				</td>
			</tr>
		</table>
    </section>
    <!-- ================ 상품상세 Area End ================= -->

</body>