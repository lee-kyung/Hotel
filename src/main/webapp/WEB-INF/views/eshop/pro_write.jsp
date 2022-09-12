<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_write {
		width : 1000px;
		height : 600px;
		margin : auto;
		margin-top : 100px;
		font : 돋움;
		font-size : 14px;
	}
	#pro_write table td {
		padding-bottom : 10px;
	}
</style>
<script>
	function getso(daecode){
		let chk=new XMLHttpRequest();
		chk.open("get", "getso?daecode="+daecode);
		chk.send();
		chk.onreadystatechange=function(){
			if(chk.readyState == 4) {
				//alert(decodeURI(chk.responseText).trim());
				document.inpro.so.innerHTML=decodeURI(chk.responseText.trim());
				document.inpro.pcode.value="";
			}
		}
	}
</script>
</head>
<body>

	<!-- ================ 상품등록 Area Start ================= -->
	
	<section id="pro_write">
	<form name="inpro" method="post" action="pro_write_ok" enctype="multipart/form-data">
		<table width="600" align="center">
		<caption> <h3> 상품 등록 </h3> </caption>
			<tr>
				<td width="100"> 상품코드 </td>
				<td width="100"> <input type="text" name="pcode" readonly> </td>
				<td>
					<select name="dae" onchange="getso(this.value)">	<!-- 메인분류 -->
						<option> 선택  </option>
					<c:forEach var="pdvo" items="${list}">
						<option value="${pdvo.code}"> ${pdvo.title} </option>
					</c:forEach>
					</select>
					<select name="so">	<!-- 하위분류 -->
					
					</select>
					<input type="button" onclick="return getpcode()" value="상품코드 생성">
				</td>
			</tr>
			<tr>
				<td> 메인 이미지 </td>
				<td colspan="2"> <input type="file" name="img1"> </td>
			</tr>
			<tr>
				<td> 상세 이미지 </td>
				<td colspan="2"> <input type="file" name="img"2> </td>
			</tr>
			<tr>
				<td> 상품명 </td>
				<td colspan="2"> <input type="text" name="title"> </td>
			</tr>
			<tr>
				<td> 판매가 </td>
				<td colspan="2"> <input type="text" name="price" value="0"> </td>
			</tr>
			<tr>
				<td> 할인율 </td>
				<td colspan="2"> <input type="text" name="halin" value="0"> </td>
			</tr>
			<tr>
				<td> 적립금 </td>
				<td colspan="2"> <input type="text" name="juk" value="0"> </td>
			</tr>
			<tr>
				<td> 재고 </td>
				<td colspan="2"> <input type="text" name="su" value="1"> </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td colspan="2"> <input type="text" name="baefee" value="0"> </td>
			</tr>
			<tr>
				<td> 옵션1 </td>
				<td colspan="2"> <input type="text" name="opt1" value="0"> </td>
			</tr>
			<tr>
				<td> 옵션2 </td>
				<td colspan="2"> <input type="text" name="opt2" value="0"> </td>
			</tr>
			<tr>
				<td> 옵션3 </td>
				<td colspan="2"> <input type="text" name="opt3" value="0"> </td>
			</tr>
			<tr>
				<td colspan="3" align="center"> <input type="submit" value="등록하기"> </td>
			</tr>
		</table>
	</form>
	</section>
    <!-- ================ 상품등록 Area End ================= -->

</body>