<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_cart {
		width : 1100px;
		margin : auto;
	}

</style>
<script>
	/* 수량을 변경하면 [총 상품금액]도 변하게 하기 */
	function change_total(su){
		let total=parseInt(${pvo.price} * su);
		if(${pvo.halin != 0})
			total=parseInt(${pvo.price - (pvo.price * (pvo.halin / 100) ) } * su);
	
		total=new Intl.NumberFormat().format(total);
		document.getElementById("total_price").innerText=total;
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
	    <div class="bradcam_area eshop1">
	        <h3> 장 바 구 니 </h3>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 장바구니 Area Start ================= -->
    <div id="pro_cart">
		
	</div>
    <!-- ================ 장바구니 Area End ================= -->

</body>