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
		margin-top : 50px;
	}
	#pro_write table {
		font-family : 돋움;
		font-size : 14px;
	}
	#pro_write table td {
		padding-bottom : 10px;
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
							document.inpro.pcode.value=pcode1+pcode2;	// pcode 총8자리 완성
						}
					}
					return true;
				}
	}
	
	function goback(){
		window.history.back();
	}
	
	/* 상품코드, 메인이미지, 상세이미지, 상품명, 판매가, 재고가 입력됐는지 체크하기 */
	function check(){
		let dom=document.inpro;
		if(dom.pcode.value.trim() == "") {
			alert("상품코드를 생성하세요.")
			return false;
			}
			else if(dom.img1.value.trim() == "") {
				alert("메인이미지를 등록하세요.")
				return false;
				}
				else if(dom.img2.value.trim() == "") {
					alert("상세이미지를 등록하세요.")
					return false;
					}
					else if(dom.title.value.trim() == "") {
						alert("상품명을 입력하세요.")
						return false;
						}
						else if(dom.price.value.trim() == "") {
							alert("판매가를 입력하세요.")
							return false;
							}
							else if(dom.su.value.trim() == "") {
								alert("재고를 입력하세요.")
								return false;
							}
							else
								return true;
	}
</script>
</head>
<body>
	<!-- ================ 상품등록 Area Start ================= -->
	<section id="pro_write">
	<form name="inpro" method="post" action="pro_write_ok" enctype="multipart/form-data" onsubmit="return check()">
		<table width="600" align="center">
		<caption> <h2> 상품 등록 </h2> </caption>
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
				<td colspan="2"> <input type="file" name="img1"> </td>
			</tr>
			<tr>
				<td> 상세이미지 </td>
				<td colspan="2"> <input type="file" name="img2"> </td>
			</tr>
			<tr>
				<td> 상품명 </td>
				<td colspan="2"> <input type="text" name="title" size="55"> </td>
			</tr>
			<tr>
				<td> 판매가 </td>
				<td colspan="2"> <input type="number" name="price"  min="0" placeholder="숫자만 입력하세요."> </td>
			</tr>
			<tr>
				<td> 할인율 </td>
				<td colspan="2"> <input type="number" name="halin" min="0" max="100" placeholder="0~100"> </td>
			</tr>
			<tr>
				<td> 적립율 </td>
				<td colspan="2"> <input type="number" name="juk" min="0" max="100" placeholder="0~100"> </td>
			</tr>
			<tr>
				<td> 재고 </td>
				<td colspan="2"> <input type="number" name="su" min="0" placeholder="숫자만 입력하세요."> </td>
			</tr>
			<tr>
				<td> 배송비 </td>
				<td colspan="2"> <input type="number" name="baefee" min="0" placeholder="숫자만 입력하세요."> </td>
			</tr>
			<tr>
				<td colspan="2" style="font-size:13px;"> ※옵션이 있다면 입력하세요. </td>
			</tr>
			<tr>
				<td> 옵션1 </td>
				<td colspan="2"> <input type="text" name="opt1" placeholder="옵션값은 쉼표(,)로 구분하세요. 예)빨강,주황,노랑 또는  1,2,3" size="55"> </td>
			</tr>
			<tr>
				<td> 옵션2 </td>
				<td colspan="2"> <input type="text" name="opt2" placeholder="옵션값은 쉼표(,)로 구분하세요. 예)빨강,주황,노랑 또는  1,2,3" size="55"> </td>
			</tr>
			<tr>
				<td> 옵션3 </td>
				<td colspan="2"> <input type="text" name="opt3" placeholder="옵션값은 쉼표(,)로 구분하세요. 예)빨강,주황,노랑 또는  1,2,3" size="55"> </td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="이전으로" onclick="goback()">
					<input type="submit" value="등록하기">
				</td>
			</tr>
		</table>
	</form>
	</section>
    <!-- ================ 상품등록 Area End ================= -->

</body>