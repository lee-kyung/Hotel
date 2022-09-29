<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#adlist {
		margin : 50px auto 50px auto;
	}
	#adlist table {
		width : 900px;
		margin : auto;
		text-align : center;
		border-collapse : 0px;
		padding : 0px;
	}
	#adlist table th {
		height : 40px;
		border-top : 1px solid #887159;
		background : #f9f4ee;
	}
	#adlist table td {
		height : 70px;
		border-bottom : 1px solid #ececec;
	}
	#adlist #img_box {
		position : relative;
		width : 70px;
		text-align : right;
	}
	#adlist #img_txt {
		position : absolute;
		text-align : center;
		width : 20px;
		height : 20px;
		bottom : 10px;	/* 그때마다 조절하기 : 숫자가 작을수록 밑으로 이동 */
		right : 1px;	/* 그때마다 조절하기 : 숫자가 작을수록 오른쪽으로 이동 */
		background : rgba(0, 0, 0, 0.5);
		color : white;
	}
</style>
<script>
	function page_sel(psel){
		location="list?psel="+psel+"&ssel=${ssel}&sword=${sword}&osel=${osel}";
	}
	
	/* 사용자가 선택한 페이지목록수를 브라우저에 나타내기 */
	/*window.onload=function(){
		document.getElementById("psel").value="${psel}";
		
		<c:if test="${ssel != 'id'}">	//※[ServiceImpl.java]에서 [ssel="id";]처리한 건 제외시키기 
			document.getElementById("ssel").value="${ssel}";
		</c:if>
	}*/
	
	function search_sel(smsg){
		//if(smsg.ssel.selectedIndex != 0 && smsg.sword.value.trim().length != 0)
		if(smsg.ssel.value == "0") {	// if(smsg.ssel.selectedIndex == 0) {
			alert("검색 말머리를 선택하세요");
			return false;
			}
			else if(smsg.sword.value.trim() == "") {
				alert("검색 내용을 입력하세요");
				return false;
				}
				else
					return true;
	}
</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">
        <div id="h3"> 상 품 목 록 </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<c:if test="${userid != 'admin'}"> <c:redirect url="../main/index"/> </c:if>

	<!-- ================ 상품목록 Area Start ================= -->
    <section id="adlist">
    	<div class="default-select" id="default-select" style="display:inline-block;float:right;margin-right:5px;">
			<select onchange="page_sel(this.value)" id="psel">
				<c:if test="${psel == 15}">
					<option value="15" selected> 15개씩 </option>
				</c:if>
				<c:if test="${psel != 15}">
					<option value="15"> 15개씩 </option>
				</c:if>
				<c:if test="${psel == 30}">
					<option value="30" selected> 30개씩 </option>
				</c:if>
				<c:if test="${psel != 30}">
					<option value="30"> 30개씩 </option>
				</c:if>
				<c:if test="${psel == 45}">
					<option value="45" selected> 45개씩 </option>
				</c:if>
				<c:if test="${psel != 45}">
					<option value="45"> 45개씩 </option>
				</c:if>
				<c:if test="${psel == 60}">
					<option value="60" selected> 60개씩 </option>
				</c:if>
				<c:if test="${psel != 60}">
					<option value="60"> 60개씩 </option>
				</c:if>
			</select>
		</div>
    	<table>
    		<tr>
    			<th colspan="3">
    				<span onclick="location='pro_adlist?osel=title asc'" style="cursor:pointer;"> ▲ </span>
    				상품명
    				<span onclick="location='pro_adlist?osel=title desc'" style="cursor:pointer;"> ▼ </span>
    			</th>
    			<th width="150">
    				<span onclick="location='pro_adlist?osel=su asc'" style="cursor:pointer;"> ▲ </span>
    				재고
    				<span onclick="location='pro_adlist?osel=su desc'" style="cursor:pointer;"> ▼ </span>
    			</th>
    			<th width="150">
					<span onclick="location='pro_adlist?osel=sold asc'" style="cursor:pointer;"> ▲ </span>
    				판매량
    				<span onclick="location='pro_adlist?osel=sold desc'" style="cursor:pointer;"> ▼ </span>
				</th>
    			<th width="150">
    				<span onclick="location='pro_adlist?osel=buyday asc'" style="cursor:pointer;"> ▲ </span>
    				등록일
    				<span onclick="location='pro_adlist?osel=buyday desc'" style="cursor:pointer;"> ▼ </span>
    			</th>
    		</tr>
    		<c:forEach var="pvo" items="${plist}">
    			<tr>
    				<td id="img_box">
	    				<img src="../img/eshop/${pvo.img}" height="50" width="50">
		   				<c:if test="${pvo.cnt != 1}">
		   					<span id="img_txt"> +${pvo.cnt-1} </span>
		   				</c:if>
	   				</td>
	   				<td width="70"> <img src="../img/eshop/${pvo.simg}" height="50" width="50"> </td>
	   				<td width="310" style="text-align:left;padding-left:10px;"> <a href="pro_adcontent?id=${pvo.id}">${pvo.title}</a> </td>
	   				<td> ${pvo.su}개 </td>
	   				<td> ${pvo.sold}개 </td>
	   				<td> ${pvo.buyday} </td>
    			</tr>
    		</c:forEach>
    	</table>
    </section>
    <!-- ================ 상품목록 Area End ================= -->

</body>