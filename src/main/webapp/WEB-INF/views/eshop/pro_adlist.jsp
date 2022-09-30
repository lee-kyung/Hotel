<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#adlist {
		margin : 70px auto 100px auto;
	}
	#adlist #selbox {
		width : 900px;
		margin : auto auto 10px auto;
	}
	#adlist #selbox #sbox {
		display : inline-block;
		margin-left : 140px;
	}
	#adlist #selbox #pwrite {
		float : right;
		width : 120px;
		height : 41px;
		padding-top : 9px;
		text-align : center;
		margin : 1px 0px 0px 10px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
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
		location="pro_adlist?psel="+psel+"&page=${page}&ssel=${ssel}&sword=${sword}&osel=${osel}";
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
		/*if(smsg.ssel.value == "su" && smsg.ssel.value == "sold") {
			alert("검색 말머리를 선택하세요");
			return false;
			}
			else*/ if(smsg.sword.value.trim() == "") {
				alert("검색할 단어 및 숫자를 입력하세요");
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
        <div id="h3" onclick="location='../admin/admin'" style="cursor:pointer;"> ADMIN </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<c:if test="${userid != 'admin'}"> <c:redirect url="../main/index"/> </c:if>

	<!-- ================ 상품목록 Area Start ================= -->
    <section id="adlist">
    	<div id="selbox">
    	<div class="default-select" id="default-select" style="float:left;">
			<select onchange="page_sel(this.value)" id="psel">
				<c:if test="${psel == 10}">
					<option value="10" selected> 10개씩 </option>
				</c:if>
				<c:if test="${psel != 10}">
					<option value="10"> 10개씩 </option>
				</c:if>
				<c:if test="${psel == 20}">
					<option value="20" selected> 20개씩 </option>
				</c:if>
				<c:if test="${psel != 20}">
					<option value="20"> 20개씩 </option>
				</c:if>
				<c:if test="${psel == 30}">
					<option value="30" selected> 30개씩 </option>
				</c:if>
				<c:if test="${psel != 30}">
					<option value="30"> 30개씩 </option>
				</c:if>
				<c:if test="${psel == 40}">
					<option value="40" selected> 40개씩 </option>
				</c:if>
				<c:if test="${psel != 40}">
					<option value="40"> 40개씩 </option>
				</c:if>
				<c:if test="${psel == 50}">
					<option value="50" selected> 50개씩 </option>
				</c:if>
				<c:if test="${psel != 50}">
					<option value="50"> 50개씩 </option>
				</c:if>
			</select>
		</div>
		<div id="sbox">
		<form method="post" action="pro_adlist" onsubmit="return search_sel(this)">
		<input type="hidden" name="psel" value="${psel}">	<!-- ssel변경후 검색해도 psel유지시키기 -->
		<input type="hidden" name="osel" value="${osel}">	<!-- ssel변경후 검색해도 osel유지시키기 -->
			<select name="ssel" id="ssel">
				<c:if test="${ssel == 'title'}">
					<option value="title" selected> 상품명 </option>
				</c:if>
				<c:if test="${ssel != 'title'}">
					<option value="title"> 상품명 </option>
				</c:if>
				<c:if test="${ssel == 'su'}">
					<option value="su" selected> 재고 </option>
				</c:if>
				<c:if test="${ssel != 'su'}">
					<option value="su"> 재고 </option>
				</c:if>
				<c:if test="${ssel == 'sold'}">
					<option value="sold" selected> 판매량 </option>
				</c:if>
				<c:if test="${ssel != 'sold'}">
					<option value="sold"> 판매량 </option>
				</c:if>
			</select>
			<div class="form-group" style="display:inline-block;margin:0 0 0 5px;">
		        <div class="input-group mb-3">
		            <input type="text" class="form-control" name="sword" value="${sword}" placeholder="검색할 단어 및 숫자 입력" onfocus="this.placeholder = ''" onblur="this.placeholder = '검색할 단어 및 숫자 입력'">
		            <div class="input-group-append">
		                <button class="btn" type="submit"><i class="ti-search"></i></button>
		            </div>
		        </div>
		    </div>
			<%-- <div id="sbtn"><input type="text" name="sword" value="${sword}" placeholder="검색 단어 또는 숫자" id="stext"><input type="submit" value="검색" id="sbutton"></div> --%>
		</form>
		</div>
		<div id="pwrite" onclick="location='pro_write'"> 상품등록 </div>
		</div>
    	<table>
    		<tr>
    			<th colspan="3">
    				<span onclick="location='pro_adlist?osel=title asc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▲ </span>
    				상품명
    				<span onclick="location='pro_adlist?osel=title desc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▼ </span>
    			</th>
    			<th width="150">
    				<span onclick="location='pro_adlist?osel=su asc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▲ </span>
    				재고
    				<span onclick="location='pro_adlist?osel=su desc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▼ </span>
    			</th>
    			<th width="150">
					<span onclick="location='pro_adlist?osel=sold asc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▲ </span>
    				판매량
    				<span onclick="location='pro_adlist?osel=sold desc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▼ </span>
				</th>
    			<th width="150">
    				<span onclick="location='pro_adlist?osel=buyday asc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▲ </span>
    				등록일
    				<span onclick="location='pro_adlist?osel=buyday desc&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}'" style="cursor:pointer;"> ▼ </span>
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
	   				<td width="310" style="text-align:left;padding-left:10px;"> <a href="pro_adcontent?id=${pvo.id}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}">${pvo.title}</a> </td>
	   				<td> ${pvo.su}개 </td>
	   				<td> ${pvo.sold}개 </td>
	   				<td> ${pvo.buyday} </td>
    			</tr>
    		</c:forEach>
    	</table>
    		
   		<!-- 페이지 이동 -->
		<nav class="blog-pagination justify-content-center d-flex" style="margin-top:30px;">
		<ul class="pagination">
			<!-- 5페이지 이전 이동 -->
			<c:if test="${pstart == 1}">
				<li class="page-item">
					<span class="page-link" aria-label="Previous" style="cursor:default;">
						<i class="ti-angle-left"></i>
					</span>
				</li>
			</c:if>
			<c:if test="${pstart != 1}">
				<li class="page-item">
					<a href="pro_adlist?page=${pstart-1}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}" class="page-link" aria-label="Previous">
				    	<i class="ti-angle-left"></i>
				    </a>
				</li>
			</c:if>
			
			<!-- 페이지 이동범위 출력 -->
			<c:forEach var="pnow" begin="${pstart}" end="${pend}">
			<c:if test="${page == pnow}">
				<li class="page-item active">
					<a href="pro_adlist?page=${pnow}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}" class="page-link">${pnow}</a>
				</li>
			</c:if>
			<c:if test="${page != pnow}">
				<li class="page-item">
					<a href="pro_adlist?page=${pnow}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}" class="page-link">${pnow}</a>
				</li>
			</c:if>
			</c:forEach>
			
			<!-- 5페이지 다음 이동 -->
			<c:if test="${pend == ptotal}">
				<li class="page-item">
					<span class="page-link" aria-label="Next">
					    <i class="ti-angle-right"></i>
					</span>
				</li>
			</c:if>
			<c:if test="${pend != ptotal}">
				<li class="page-item">
					<a href="pro_adlist?page=${pend+1}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}" class="page-link" aria-label="Next">
				    	<i class="ti-angle-right"></i>
				    </a>
				</li>
			</c:if>
		</ul>
		</nav>	
    </section>
    <!-- ================ 상품목록 Area End ================= -->

</body>