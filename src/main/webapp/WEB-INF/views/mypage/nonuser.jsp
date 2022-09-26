<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#nouser {
		width : 1000px;
		height : 500px;
		margin : auto;
		margin-top : 100px;
		text-align : center;
	}
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 비회원 예약/주문 조회 </h3>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 비회원 주문내역 Area Start ================= -->

   	<div id="nouser">
   		<div>
   		<form method="post" action="nonuser_rdwglist">
   			<div> 예약번호/주문번호 </div>
   			<div> <input type="text" name="bjcode" placeholder="예약번호/주문번호를 입력하세요."> </div>
   			<div> <input type="submit" value="비회원 예약/주문조회"> </div>
   		</form>
   		</div>
   	</div>
    <!-- ================ 비회원 주문내역 Area End ================= -->

</body>