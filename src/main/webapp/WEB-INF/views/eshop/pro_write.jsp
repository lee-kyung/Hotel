<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#pro_write {
		width : 1000px;
		margin : 50px auto 50px auto;
	}
	#pro_write table {
		font-size : 14px;
		border-top : 2px solid darkgray;
		border-bottom : 2px solid darkgray;
		padding : 10px;
	}
	#pro_write table td {
		padding-top : 10px;
		padding-bottom : 10px;
		border-bottom : 1px solid lightgray;
	}
	#pro_write table tr:last-child td {
		border : none;
	}
	#pro_write #size {
		width : 100px;
	}
	input[type=number]::-webkit-inner-spin-button,
	input[type=number]::-webkit-outer-spin-button {
		opacity: 1;
	}
	#pro_write p {
		font-size : 14px;
	}
</style>
<script>
	/* pdae테이블의 daecode를 이용하여 pso테이블의 socode를 가져오기 */
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
	
	/* p와 daecode와 socode를 합치고(5자리), 뒤의 3자리가 1씩 증가하는 상품코드(8자리) 완성하기 */
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
					let pcode1="p"+dae+so;	// pcode 앞5자리 완성
					let chk=new XMLHttpRequest();
					chk.open("get", "getpcode?pcode1="+pcode1)
					chk.send();
					chk.onreadystatechange=function(){
						if(chk.readyState == 4) {
							/* pcode 뒤3자리 완성 */
							let pcode2=chk.responseText;
							switch(pcode2.length) {
								case 1 : pcode2="00"+pcode2; break;
								case 2 : pcode2="0"+pcode2; break;
							}
							/* pcode 총8자리 완성 */
							document.inpro.pcode.value=pcode1+pcode2;
						}
					}
					return true;
				}
	}
	
	/* 상품코드, 메인이미지, 상세이미지, 상품명, 판매가, 재고가 입력됐는지 체크하기 */
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
							else if(dom.su.value.trim() == "") {
								alert("재고를 입력하세요.");
								return false;
							}
							else
								return true;
	}

	/* 이미지 첨부파일 추가(+미리보기) & 삭제 */
	function add_file(){
		let len=document.getElementsByClassName("imgs").length;
		if(len < 3) {
			len++;
			let inner="<p class='imgs'> <span class='img'></span> <input onchange='setview("+(len-1)+")' type='file' name='fimg"+len+"'> </p>";
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
	function setview(n){
		document.getElementsByClassName("img")[n].innerHTML="";
		
		for(var image of event.target.files) {
			var reader = new FileReader(); 
			reader.onload=function(){
				var img = document.createElement("img"); 

				img.setAttribute("src", event.target.result); 
				img.setAttribute("height", "50");
				img.setAttribute("valign", "middle");

				document.getElementsByClassName("img")[n].appendChild(img);  //새로 선택한 이미지 div에 출력
			};
			reader.readAsDataURL(image); 
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
		<table width="650" align="center">
			<tr>
				<td width="80"> 상품코드 </td>
				<td width="100"> <input type="text" name="pcode" readonly placeholder="상품코드를 생성하세요."> </td>
				<td>
					<select name="dae" onchange="getso(this.value)">	<!-- 메인분류 -->
							<option> 메인분류  </option>
						<c:forEach var="pdvo" items="${list}">
							<option value="${pdvo.code}"> ${pdvo.title} </option>
						</c:forEach>
					</select>
					<select name="so"> </select>	<!-- 하위분류 -->					
					<input type="button" onclick="return getpcode()" value="상품코드 생성">
				</td>
			</tr>
			<tr>
				<td> 메인이미지 </td>
				<td id="outer" colspan="2">
					<input type="button" onclick="add_file()" value="추가">
					<input type="button" onclick="del_file()" value="삭제"> <p>
					<p class="imgs"> <span class="img"></span> <input type="file" name="fimg1" onchange="setview(0)"> </p>
				</td>
			</tr>
			<tr>
				<td> 상세이미지 </td>
				<td colspan="2"> <input type="file" name="simg"> </td>
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
				<td colspan="2"> <input type="number" name="halin" min="0" max="100" placeholder="0~100" id="size" onKeyPress="return checkNum1(event, this.value)"> </td>
			</tr>
			<tr>
				<td> 적립율 </td>
				<td colspan="2"> <input type="number" name="juk" min="0" max="100" placeholder="0~100" id="size" onKeyPress="return checkNum1(event, this.value)"> </td>
			</tr>
			<tr>
				<td> 재고 </td>
				<td colspan="2"> <input type="number" name="su" min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)"> </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td colspan="2"> <input type="number" name="baefee" min="0" placeholder="숫자만 입력하세요." onKeyPress="return checkNum(event)"> </td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="이전으로" onclick="location='pro_adlist'">
					<input type="submit" value="등록하기">
				</td>
			</tr>
		</table>
	</form>
	</section>
    <!-- ================ 상품등록 Area End ================= -->

</body>