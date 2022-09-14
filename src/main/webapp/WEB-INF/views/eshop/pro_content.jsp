<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>

</style>
<script>

</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	 <c:if test="${pvo.subpcode == 'p0101'}">
	    <div class="bradcam_area eshop2">
	        <h3> 고 급 베 딩 </h3>
	    </div>
    </c:if>
	 <c:if test="${pvo.subpcode == 'p0102'}">
	    <div class="bradcam_area eshop2">
	        <h3> 라 이 프 스 타 일 </h3>
	    </div>
    </c:if>
    <c:if test="${pvo.subpcode == 'p0201'}">
	    <div class="bradcam_area eshop3">
	        <h3> 레 스 토 랑 이 용 권 </h3>
	    </div>
    </c:if>
    <c:if test="${pvo.subpcode == 'p0202'}">
	    <div class="bradcam_area eshop3">
	        <h3> 호 텔 상 품 권 </h3>
	    </div>
    </c:if>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 상품 상세 Area Start ================= -->
    <div id="pro_cnt">
    <form name="pro_cnt" method="post" action="pro_gumae">
    <input type="hidden" name="pcode" value="${pvo.pcode},">
    	<div></div>
    </div>
    <!-- ================ 상품 상세 Area End ================= -->

</body>