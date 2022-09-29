<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#adcon {
		width : 1000px;
		margin : auto;
	}
</style>
<script>

</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">
        <div id="h3"> 상 품 상 세 </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<c:if test="${userid != 'admin'}"> <c:redirect url="../main/index"/> </c:if>

	<!-- ================ 상품상세 Area Start ================= -->
    <section id="adcon">
    	
    </section>
    <!-- ================ 상품상세 Area End ================= -->

</body>