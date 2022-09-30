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
		width : 700px;
		margin : 0px auto 20px auto;
		border-top : 2px solid #887159;
		padding : 10px;
	}
	#adup table tr {
		height : 70px;
	}
	#adup table td {
		padding-top : 10px;
		padding-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
	#adup table tr:last-child td {
		border : none;
	}
	#adup table tr td:first-child {
		font-weight : bold;
		padding-left : 10px;
	}
	#adup table tr td:nth-child(2) {
		padding-left : 10px;
	}
	#adup #size {
		width : 100px;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
	}
	#adup input {
		outline : none;
	}
	#adup p {
		font-size : 14px;
	}
	#adup input[type=file] {
        font-size : 14px;
	}
	#adup input::file-selector-button {
		width : 80px;
		height : 30px;
		padding-top : 2px;
        border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
		
	}
	#adup #btn0 {
		width : 120px;
		height : 30px;
		padding-top : 1px;
		border : 1px solid #887159;
		border-radius : 3px;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#adup #btn1 {
		width : 120px;
		height : 41px;
		padding-top : 4px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#adup #btn2 {
		width : 120px;
		height : 41px;
		padding-top : 4px;
		border : 1px solid #887159;
		background : white;
		color : #887159;
		cursor : pointer;
	}
	#adup #btn3 {
		width : 50px;
		height : 29px;
		padding-top : 3px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#adup #btn4 {
		width : 50px;
		height : 29px;
		padding-top : 3px;
		border : 1px solid #887159;
		background : white;
		color : #887159;
		cursor : pointer;
	}
</style>
<script>
	/* 상품코드, 메인이미지, 상세이미지, 상품명, 판매가, 재고가 입력됐는지 체크하기 */
	function del_check(upform){
		/* fimg의 checkbox가 체크된 그림파일명과 체크가 안된 그림파일명을 각각 저장 */
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
	   	
		/* simg의 checkbox가 체크된 그림파일명과 체크가 안된 그림파일명을 각각 저장 */
	   	let scbx=document.getElementsByName("scbx");
	   	let skeep="";
	   	let sdel="";
	   	if(scbx[0].checked)
			sdel=scbx[0].value;
		else
			skeep=scbx[0].value;
		
	   	/* 빈칸 체크하기 */
		let dom=document.adup;
		if(dom.title.value.trim() == "") {
			alert("상품명을 입력하세요.");
			return false;
			}
			else if(dom.price.value.trim() == "") {
				alert("판매가를 입력하세요.");
				return false;
				}
				else if(dom.halin.value.trim() == "") {
					alert("할인율을 입력하세요. 할인이 없다면 0을 입력하세요.");
					return false;
					}
					else if(dom.juk.value.trim() == "") {
						alert("적립율을 입력하세요. 적립금이 없다면 0을 입력하세요.");
						return false;
						}
						else if(dom.su.value.trim() == "") {
							alert("재고를 입력하세요.");
							return false;
							}
							else if(dom.baefee.value.trim() == "") {
								alert("배송비를 입력하세요. 배송비가 없거나 모바일상품은 0을 입력하세요.");
								return false;
							}
							else {
								upform.del.value=del; // 삭제파일 목록
								upform.keep.value=keep; // 유지파일 목록
								upform.skeep.value=skeep;
								upform.sdel.value=sdel;
								return true;
							}
	}
	
	/* 이미지 첨부파일 추가(+미리보기) & 삭제 */
	function add_file(){
		let cbx=document.getElementsByName("cbx");
		let cnt=0;
		for(i=0;i<cbx.length;i++) {
			if(!cbx[i].checked)
				cnt++;
			console.log(cnt);
		}
		let len=document.getElementsByClassName("imgs").length;
		let num=3-cnt;
		if(len < num) {
			len++;
			let inner="<p class='imgs'> <span class='img'></span> <input onchange='setview("+(len-1)+")' type='file' name='fimg"+len+"'> </p>";
			document.getElementById("outer").innerHTML=document.getElementById("outer").innerHTML+inner;
		}
		
		for(i=0;i<len;i++) {
			document.getElementsByClassName("img")[i].innerHTML="";
		}
	}
	function del_file(){
		let len=document.getElementsByClassName("imgs").length;
		if(len > 1) {
			len--;
			document.getElementsByClassName("imgs")[len].remove();
		}
	}
	function setview(n){
		document.getElementsByClassName("img")[n].innerHTML="";
		
		for(var image of event.target.files) {
			var reader=new FileReader(); 
			reader.onload=function(){
				var img=document.createElement("img"); 

				img.setAttribute("src", event.target.result); 
				img.setAttribute("width", "100");
				img.setAttribute("valign", "middle");

				document.getElementsByClassName("img")[n].appendChild(img);  //새로 선택한 이미지 span에 출력
			};
			reader.readAsDataURL(image); 
		}
	}
	function preview(){
		simg.src=URL.createObjectURL(event.target.files[0]);
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
	function sdel_color(n, cb){	//checkbox의 index값, checkbox자체를 매개변수로 받기 
		if(cb.checked)
			document.getElementsByClassName("simg")[n].style.opacity="0.5";
		else
			document.getElementsByClassName("simg")[n].style.opacity="1";
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
    <input type="hidden" name="page" value="${page}">
    <input type="hidden" name="psel" value="${psel}">
    <input type="hidden" name="ssel" value="${ssel}">
    <input type="hidden" name="sword" value="${sword}">
    <input type="hidden" name="osel" value="${osel}">
	<input type="hidden" name="del">	<!-- 삭제할 fimg그림의 이름을 가지고 갈 변수 -->
	<input type="hidden" name="keep"> <!-- 계속 남겨둘 fimg사진의 이름을 가지고 갈 변수 -->
	<input type="hidden" name="skeep"> <!-- 계속 남겨둘 simg사진의 이름을 가지고 갈 변수 -->
	<input type="hidden" name="sdel"> <!-- 삭제할 simg사진의 이름을 가지고 갈 변수 -->
	<input type="hidden" name="olds" value="${pvo.simg}">
		<table>
			<tr>
				<td width="120"> 상품코드 </td> 
				<td> ${pvo.pcode} </td>
			</tr>
			<tr>
				<td rowspan="2"> 메인이미지 </td>
				<c:if test="${pvo.fimg != ''}">
				<td id="aa">
					<div style="font-size:12px;color:red;"> ※삭제할 메인이미지를 체크하세요. </div>
					<c:forEach var="imgs" items="${pvo.imgs}" varStatus="n">
						<img src="../img/eshop/${imgs}" height="100" class="fimgs">
						<input type="checkbox" name="cbx" value="${imgs}" onclick="del_color(${n.index}, this)">
					</c:forEach>
				</td>
				</c:if>
			<tr>
				<td id="outer">
				<div style="float:right;">
					<input type="button" onclick="add_file()" value="추가" id="btn3">
					<input type="button" onclick="del_file()" value="삭제" id="btn4">
				</div>
					<div style="font-size:12px;color:red;font-weight:normal;"> ※메인이미지는 기존 이미지를 포함하여 최대 3개까지 등록 가능합니다. </div>
					<p class="imgs"> <span class="img"></span> <input type="file" name="fimg1" onchange="setview(0)"> </p>
				</td>
			</tr>
			<tr>
				<td rowspan="2"> 상세이미지 </td>
				<c:if test="${pvo.simg != ''}">
				<td id="aa">
					<div style="font-size:12px;color:red;"> ※삭제할 상세이미지를 체크하세요. </div>
					<img src="../img/eshop/${pvo.simg}" height="100" class="simg">
					<input type="checkbox" name="scbx" value="${pvo.simg}" onclick="sdel_color(0, this)">
				</td>
				</c:if>
			</tr>
			<tr>
				<td>
					<div style="font-size:12px;color:red;font-weight:normal;"> ※상세이미지는 기존 이미지를 포함하여 최대 1개까지 등록 가능합니다. </div>
					<img src="" width="100" id="simg"> <input type="file" name="simg" onchange="preview()"> </p>
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
			<tr style="border-bottom:2px solid #887159">
				<td> 배송비 </td>
				<td> <input type="number" name="baefee" min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)" value="${pvo.baefee}"> </td>
			</tr>
			<tr height="100">
				<td colspan="2" align="center">
					<input type="button" value="이전으로" onclick="location='pro_adcontent?id=${pvo.id}&page=${page}&psel=${psel}&ssel=${ssel}&sword=${sword}&osel=${osel}'" id="btn2">
					<input type="submit" value="수정하기" id="btn1">
				</td>
			</tr>
		</table>
	</form>
    </section>
    <!-- ================ 상품수정 Area End ================= -->

</body>