<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#okmsg {
		width : 1000px; 
		height : 500px;
		margin : auto;
		font : 돋움;
		font-size : 14px;
	}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 주문 완료 </h3>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 주문 완료 Area Start ================= -->
	
	<div id="okmsg">
		<c:if test="${userid == null}">
			<div>
				<div> 주문이 완료되었습니다. </div>
				<div> ${name}님의 주문번호는 ${jumuncode}입니다. </div>
				<div> ※위의 주문번호는 비회원 고객님의 주문내역을 확인하실 때 필요하오니 꼭 메모해 두시길 바랍니다. </div>
				<div onclick="location='../eshop/eshop'"> 계속 쇼핑하기 </div>
			</div>
		</c:if>
		<c:if test="${userid != null}">
			<div>
				<div> 주문이 완료되었습니다. </div>
				<div>
					<div onclick="location='../eshop/eshop'"> 계속 쇼핑하기 </div>
					<div onclick="location='../mypage/eshop_gumae'"> 주문내역 </div>
				</div>
			</div>
		</c:if>
	</div>
	
    <!-- ================ 주문 완료 Area End ================= -->

</body>