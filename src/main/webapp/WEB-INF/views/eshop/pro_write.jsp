<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_write {
		margin : 50px auto 50px auto;
	}
	#pro_write table {
		font-size : 14px;
		border-top : 2px solid #887159;
		padding : 10px;
	}
	#pro_write table tr {
		height : 70px;
	}
	#pro_write table td {
		padding-top : 10px;
		padding-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
	#pro_write table tr:last-child td {
		border : none;
	}
	#pro_write table tr td:first-child {
		font-weight : bold;
		padding-left : 10px;
	}
	#pro_write table tr td:nth-child(2) {
		padding-left : 20px;
	}
	#pro_write table tr td:last-child {
		padding-left : 20px;
	}
	#pro_write #size {
		width : 100px;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
	}
	#pro_write input {
		outline : none;
	}
	#pro_write p {
		font-size : 14px;
	}
	#pro_write input[type=file] {
        font-size : 14px;
	}
	#pro_write input::file-selector-button {
		width : 80px;
		height : 30px;
		padding-top : 2px;
        border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
		
	}
	#pro_write #btn0 {
		width : 120px;
		height : 30px;
		padding-top : 1px;
		border : 1px solid #887159;
		border-radius : 3px;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#pro_write #btn1 {
		width : 120px;
		height : 41px;
		padding-top : 4px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#pro_write #btn2 {
		width : 120px;
		height : 41px;
		padding-top : 4px;
		border : 1px solid #887159;
		background : white;
		color : #887159;
		cursor : pointer;
	}
	#pro_write #btn3 {
		width : 50px;
		height : 29px;
		padding-top : 3px;
		border : 1px solid #887159;
		background : #887159;
		color : white;
		cursor : pointer;
	}
	#pro_write #btn4 {
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
	function getso(daecode){
		let chk=new XMLHttpRequest();
		chk.open("get", "getso?daecode="+daecode);
		chk.send();
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
		if(dae == "메인분류") {
			alert("메인분류를 선택하세요.")
			return false;
			}
			else if(so == "하위분류") {
				alert("하위분류를 선택하세요.")
				return false;
				}
				else {
					let pcode1="p"+dae+so;
					let chk=new XMLHttpRequest();
					chk.open("get", "getpcode?pcode1="+pcode1)
					chk.send();
					chk.onreadystatechange=function(){
						if(chk.readyState == 4) {
							let pcode2=chk.responseText;
							switch(pcode2.length) {
								case 1 : pcode2="00"+pcode2; break;
								case 2 : pcode2="0"+pcode2; break;
							}
							document.inpro.pcode.value=pcode1+pcode2;
						}
					}
					return true;
				}
	}
	
	function check(){
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
										else
											return true;
	}

	function add_file(){
		let len=document.getElementsByClassName("imgs").length;
		if(len < 3) {
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
	
	function checkNum(e){
		let keyVal=event.keyCode;
		if((keyVal >= 48) && (keyVal <= 57))
			return true;
		else {
			alert("숫자만 입력가능합니다");
			return false;
		}
	}
</script>
</head>
<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
		<div class="bradcam_area basic">
	        <div id="h3" onclick="location='pro_write'" style="cursor:pointer;"> 상 품 등 록 </div>
	    </div>
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
    
    <c:if test="${userid != 'admin'}"> <c:redirect url="../main/index"/> </c:if>
    
	<!-- ================ 상품등록 Area Start ================= -->
	<section id="pro_write">
	<form name="inpro" method="post" action="pro_write_ok" enctype="multipart/form-data" onsubmit="return check()">
		<table width="700" align="center">
			<tr>
				<td width="120"> 상품코드 </td>
				<td width="200"> <input type="text" name="pcode" readonly placeholder="상품코드를 생성하세요." onclick="alert('[상품코드 생성]버튼을 눌러서 상품코드를 생성하세요.');"> </td>
				<td>
					<!-- 메인분류 -->
					<select name="dae" onchange="getso(this.value)">
							<option> 메인분류  </option>
						<c:forEach var="pdvo" items="${list}">
							<option value="${pdvo.code}"> ${pdvo.title} </option>
						</c:forEach>
					</select>
					<!-- 하위분류 -->
					<select name="so"> </select>
					<input type="button" onclick="return getpcode()" value="상품코드 생성" id="btn0">
				</td>
			</tr>
			<tr>
				<td> 메인이미지 </td>
				<td id="outer" colspan="2">
				<div style="float:right;">
					<input type="button" onclick="add_file()" value="추가" id="btn3">
					<input type="button" onclick="del_file()" value="삭제" id="btn4">
				</div>			
					<div style="font-size:12px;color:red;"> ※메인이미지는 최대 3개까지 등록 가능합니다. </div>
					<p class="imgs"> <span class="img"></span> <input type="file" name="fimg1" onchange="setview(0)"> </p>	
				</td>
			</tr>
			<tr>
				<td> 상세이미지 </td>
				<td colspan="2">
					<img src="" width="100" id="simg"> <input type="file" name="simg" onchange="preview()">
				</td>
			</tr>
			<tr>
				<td> 상품명 </td>
				<td colspan="2"> <input type="text" name="title" size="55" placeholder="상품명을 입력하세요."> </td>
			</tr>
			<tr>
				<td> 판매가 </td>
				<td colspan="2"> <input type="number" name="price"  min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)"> </td>
			</tr>
			<tr>
				<td> 할인율 </td>
				<td colspan="2"> <input type="number" name="halin" min="0" max="100" placeholder="0~100" id="size"> </td>
			</tr>
			<tr>
				<td> 적립율 </td>
				<td colspan="2"> <input type="number" name="juk" min="0" max="100" placeholder="0~100" id="size"> </td>
			</tr>
			<tr>
				<td> 재고 </td>
				<td colspan="2"> <input type="number" name="su" min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)"> </td>
			</tr>
			<tr style="border-bottom:2px solid #887159">
				<td> 배송비 </td>
				<td colspan="2"> <input type="number" name="baefee" min="0" placeholder="숫자만 입력하세요."> </td>
			</tr>
			<tr height="100">
				<td colspan="3" align="center">
					<input type="button" value="이전으로" onclick="location='pro_adlist'" id="btn2">
					<input type="submit" value="등록하기" id="btn1">
				</td>
			</tr>
		</table>
	</form>
	</section>
    <!-- ================ 상품등록 Area End ================= -->

</body>