<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#adup {
		margin : 50px auto 50px auto;
	}
	#adup table {
		width : 1000px;
		margin : 0px auto 20px auto;
		border-top : 2px solid darkgray;
		border-bottom : 2px solid darkgray;
		padding : 10px;
	}
	#adup table td {
		padding-top : 10px;
		padding-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
	}
</style>
<script>
	/* 상품코드, 메인이미지, 상세이미지, 상품명, 판매가, 재고가 입력됐는지 체크하기 */
	function del_check(upform){
		let dom=document.inpro;
		if(dom.pcode.value.trim() == "") {
			alert("상품코드를 생성하세요.");
			return false;
			}
			else if(dom.fimg1.value.trim() == "") {
				alert("메인이미지를 등록하세요.");
				return false;
				}
				else if(dom.simg.value.trim() == "") {
					alert("상세이미지를 등록하세요.");
					return false;
					}
					else if(dom.title.value.trim() == "") {
						alert("상품명을 입력하세요.");
						return false;
						}
						else if(dom.price.value.trim() == "") {
							alert("판매가를 입력하세요.");
							return false;
							}
							else if(dom.su.value.trim() == "") {
								alert("재고를 입력하세요.");
								return false;
							}
							else {
								/* checkbox가 체크된 그림파일명과 체크가 안된 그림파일명을 각각 저장 */
								let cbx=document.getElementsByName("cbx"); // 요소의 이름을 변수에 전달
								let len=cbx.length; // 체크박스의 길이
								let del="";  // 삭제할 파일을 저장
							   	let keep="";  // 유지할 파일을 저장
							   	for(i=0;i<len;i++) {	 
									if(cbx[i].checked) // 삭제할 파일
										del=del+cbx[i].value+",";
									else   // 유지할 파일
										keep=keep+cbx[i].value+",";	 	
								}   
								upform.del.value=del; // 삭제파일 목록
								upform.keep.value=keep; // 유지파일 목록
								
								return true;
							}
	}
	
	/* 이미지 첨부파일 추가 & 삭제 */
	function add_file(){
		let len=document.getElementsByClassName("imgs").length;
		if(len < 3) {
			len++;
			let inner="<p class='imgs'> <input type='file' name='fimg"+len+"'> </p>";
			document.getElementById("outer").innerHTML=document.getElementById("outer").innerHTML+inner;
		}
	}
	function del_file(){
		let len=document.getElementsByClassName("imgs").length;
		if(len > 1) {
			len--;
			document.getElementsByClassName("imgs")[len].remove();
		}
	}
	
	/* 숫자만 입력했는지 체크하기 */
	function checkNum(e){
		let keyVal=event.keyCode;
		if((keyVal >= 48) && (keyVal <= 57))
			return true;
		else {
			alert("숫자만 입력가능합니다");
			return false;
		}
	}
	
	/* 100이하의 숫자만 입력했는지 체크하기 */
	function checkNum1(e, n){
		let keyVal=event.keyCode;
		if((keyVal >= 48) && (keyVal <= 57) && (n <= 100))
			return true;
		else {
			alert("100이하의 숫자만 입력가능합니다");
			return false;
		}
	}
	
	/* 삭제하기 위해 체크된 이미지에 음영주기 */
	function del_color(n, cb){	//checkbox의 index값, checkbox자체를 매개변수로 받기 
		if(cb.checked)
			document.getElementsByClassName("fimgs")[n].style.opacity="0.5";
		else
			document.getElementsByClassName("fimgs")[n].style.opacity="1";
	}
</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <div class="bradcam_area basic">
        <div id="h3" onclick="location='pro_adupdate?id=${pvo.id}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'" style="cursor:pointer;"> 상 품 수 정 </div>
    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<c:if test="${userid != 'admin'}"> <c:redirect url="../main/index"/> </c:if>

	<!-- ================ 상품수정 Area Start ================= -->
    <section id="adup">
    <form name="adup" method="post" action="pro_adupdate_ok" enctype="multipart/form-data" onsubmit="return del_check(this)">
    <input type="hidden" name="id" value="${pvo.id}">
	<input type="hidden" name="del">	<!-- 삭제할 그림의 이름을 가지고 갈 변수 -->
	<input type="hidden" name="keep"> <!-- 계속 남겨둘 사진의 이름을 가지고 갈 변수 -->
		<table>
			<tr>
				<tr>
					<td width="100"> 상품코드 </td> 
					<td> ${pvo.pcode} </td>
				</tr>
			</tr>
			<tr>
				<td rowspan="2"> 메인이미지 </td>
				<td id="aa">
				<c:set var="t" value="0"/>	<!-- 0을 넣은 이유 : checkbox에 index값을 0부터 부여하기 위해 -->
					<c:forEach var="imgs" items="${pvo.imgs}">
						<img src="../img/eshop/${imgs}" height="50" class="fimgs">
						<input type="checkbox" name="cbx" value="${imgs}" onclick="del_color(${t}, this)" class="cbxs">
					<c:set var="t" value="${t+1}"/>	<!-- checkbox의 index값을 1씩 증가시키기 -->
					</c:forEach>
				</td>
			<tr>
				<td id="outer">
					<input type="button" onclick="add_file()" value="추가">
					<input type="button" onclick="del_file()" value="삭제">
					<p class="imgs"> <input type="file" name="fimg1"> </p>
				</td>
			</tr>
			<tr>
				<td> 상세이미지 </td>
				<td>
					<img src="../img/eshop/${pvo.simg}" height="50">
					<input type="file" name="simg">
				</td>
			</tr>
			<tr>
				<td> 상품명 </td>
				<td> <input type="text" name="title" size="55" placeholder="상품명을 입력하세요." value="${pvo.title}"> </td>
			</tr>
			<tr>
				<td> 판매가 </td>
				<td> <input type="number" name="price"  min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)" value="${pvo.price}"> </td>
			</tr>
			<tr>
				<td> 할인율 </td>
				<td> <input type="number" name="halin" min="0" max="100" placeholder="0~100" id="size" onKeyPress="return checkNum1(event, this.value)" value="${pvo.halin}"> </td>
			</tr>
			<tr>
				<td> 적립율 </td>
				<td> <input type="number" name="juk" min="0" max="100" placeholder="0~100" id="size" onKeyPress="return checkNum1(event, this.value)" value="${pvo.juk}"> </td>
			</tr>
			<tr>
				<td> 재고 </td>
				<td> <input type="number" name="su" min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)" value="${pvo.su}"> </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td> <input type="number" name="baefee" min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)" value="${pvo.baefee}"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
    </section>
    <!-- ================ 상품수정 Area End ================= -->

</body>