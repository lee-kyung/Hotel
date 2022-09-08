<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>

</head>

<body>
<style>
	#pro_write {
		width : 1000px;
		height : 700px;
		margin : auto;
	}
</style>
<script>
	function getso(daecode){
		let chk=new XMLHttpRequest();
		chk.open("get", "getso?daecode="+daecode);
		chk.send()
		chk.onreadystatechange=function(){
			if(chk.readyState == 4) {
				document.inpro.so.innerHTML=decodeURI(chk.responseText.trim());
				document.inpro.pcode.value="";
			}
		}
	}

	function getpcode(){
		let dae=document.inpro.dae.value;
		let so=document.inpro.so.value;
		if(dae == "선택") {
			alert("대분류를 선택하세요")
			return false;
			}
			else if(so == "선택") {
				alert("소분류를 선택하세요")
				return false;
				}
				else {
					let pcode="p"+dae+so;
					let chk=new XMLHttpRequest();
					chk.open("get", "getpcode?pcode="+pcode)
					chk.send();
					chk.onreadystatechange=function(){
						if(chk.readyState == 4) {
							let code=chk.responseText;
							/* 1을 증가하여 상품코드를 완성하기 위해, Integer화하고 1을  더하기 */
							//code=parseInt(chk.responseText)+1;	// chk.responseText를 Integer화하기
						//alert(code);
							/* length를 알기 위해, 다시 String화하기(3가지) */
							//code=code+"";
							//String(code);
							//code.toString();
						//alert(code.length);
							/* code의 값을 3자리로 변경하기 */
							switch(code.length) {
								case 1 : code="00"+code; break;
								case 2 : code="0"+code; break;
							}
							/* pcode와 code를 연결하기 */
							document.inpro.pcode.value=pcode+code;
						}
					}
					return true;
		}
	}
</script>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 상품등록 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 상품등록 Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
   	<section id="pro_write">
	<form name="inpro" method="post" action="product_ok" enctype="multipart/form-data">
		<table width="600" align="center">
		<caption> <h2> 상품 등록 </h2> </caption>
			<tr>
				<td> 상품코드 </td>
				<td> <input type="text" name="pcode" readonly> </td>
				<td>	<!-- 대, 중, 소 -->
					<select name="dae" onchange="getjung(this.value)">
						<option> 선택 </option>
					<c:forEach var="dvo" items="${list}">
						<option value="${dvo.code}"> ${dvo.title} </option>
					</c:forEach>	
					</select>
					<select name="jung" onchange="getso(this.value)">
					
					</select>
					<select name="so">
					
					</select>
					<input type="button" onclick="return getpcode()" value="생성">
				</td>
			</tr>
			<tr>
				<td> 상품메인 이미지 </td>
				<td colspan="2"> <input type="file" name="pimg"> </td>
			</tr>
			<tr>
				<td> 상품상세 이미지 </td>
				<td colspan="2"> <input type="file" name="cimg"> </td>
			</tr>
			<tr>
				<td> 상품명 </td>
				<td colspan="2"> <input type="text" name="title"> </td>
			</tr>
			<tr>
				<td> 상품가격 </td>
				<td colspan="2"> <input type="text" name="price" value="0"> </td>
			</tr>
			<tr>
				<td> 상품제조사 </td>
				<td colspan="2"> <input type="text" name="made"> </td>
			</tr>
			<tr>
				<td> 상품할인율 </td>
				<td colspan="2"> <input type="text" name="halin" value="0"> </td>
			</tr>
			<tr>
				<td> 적립금 </td>
				<td colspan="2"> <input type="text" name="juk" value="0"> </td>
			</tr>
			<tr>
				<td> 상품수량 </td>
				<td colspan="2"> <input type="text" name="su" value="1"> </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td colspan="2"> <input type="text" name="baesong" value="0"> </td>
			</tr>
			<tr>
				<td> 배송일 </td>
				<td colspan="2"> <input type="text" name="baeday" value="2"> </td>
			</tr>
			<tr>
				<td colspan="3" align="center"> <input type="submit" value="등록하기"> </td>
			</tr>
		</table>
	</form>
	</section>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 상품등록 Area End ================= -->

</body>