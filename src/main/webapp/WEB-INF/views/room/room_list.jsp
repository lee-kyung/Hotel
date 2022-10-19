<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	.container {
		width: 1300px;
		margin: auto;
		margin-bottom: 80px;
	}
 	section {
		margin-bottom: 80px;
		margin: auto;
		width: 1200px;
		/* border: 1px solid #887159; */
		margin-top: 50px;
		height: 1400px;
	}
	#h3 a{
		color: white;
	}
	
/* 메뉴 */ 
	section #menu{
		width: 1000px;
		height: 60px;
		margin: auto;
		position: relative;
		font-size: 17px; 
	}
	section #menu ul{
		padding-left: 0px;
	}
	section #menu ul li{
		list-style-type: none;
		display: inline-block;
		width: 143px;
		height: 50px;
		text-align: center;
		border: 1px solid #887159;
		border-top: 3px solid #887159;
		padding-top: 7px;
		margin-left: 0px;
		border-right: none;
		/* margin-bottom: 20px; */
		background: #887159;
	}
	section #menu ul li:last-child{
		border-right: 1px solid #887159;
	}
	section #menu ul li:first-child{
		border-bottom: none;
		background: white;
	}
	
	.sub:hover{
		cursor: pointer;
		font-weight: 900;
	}
/* 테이블 */
	section table{
		width: 1000px;
		margin: auto;
		/* border: 1px solid #887159;  */
		border-bottom: 1px solid black;		
	}
	section table img{
		width: 40px;
	}
	section tr td{
		padding: 10px;
	}
	section tr:first-child td{
		border-bottom: 2px solid black;
		border-top: 2px solid black;
		height: 40px;
	}
	section td{
		border-bottom: 1px solid #887159;
	}

/* sec2 시작 */
	section #sec2{
		width: 1000px;
		margin-top: 10px;
		text-align: center;
		margin: auto;
	}
	section input[type=button]{
		width: 300px;
		height: 50px;
		color: #887159;
		background: white;
		border: 1px solid #887159;		
	}
	section input[type=button]:hover{
		width: 300px;
		height: 50px;
		background: #887159;
		color: white;
		border: 1px solid #887159;		
	}
	section #sec{
		width: 1000px;
		text-decoration: underline;
		font-size: 25px;
		font-weight: 700;
		margin: auto;
	}
	section #a2{
		display: none; 
	}
	section a:hover{
		font-weight: 700;
	}
	
</style>
<script>
	function change_sub(n)
	{
		// 배경색, 밑줄 생기기
		var sub=document.getElementsByClassName("sub")
		var len=sub.length;
		for(i=0;i<len;i++)
		{
			sub[i].style.background="#887159";
			sub[i].style.borderBottom="1px solid #887159";
		}
		// 선택된 li 배경색 : white, 밑줄 X
		sub[n].style.background="white";
		sub[n].style.borderBottom="none";
	}
	function showd()
	{
		document.getElementById("a2").style.display="block";
		document.getElementById("a1").style.display="none";
	}
	function showa()
	{
		document.getElementById("a1").style.display="block";
		document.getElementById("a2").style.display="none";
	}
</script>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
<!-- bradcam_area_start -->
<!-- 새 이미지 추가하는 법
   	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
   	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
<div class="bradcam_area rooms">
	<!-- class="bradcam_area 클래스명" -->
	<div id="h3"><a href="../admin/admin">ROOM LIST</a></div>
</div>
<!-- bradcam_area_end -->
<!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

<!-- ================ Rooms Area Start ================= -->
<!-- 객실 리스트 -->
<div class="container">
	<div class="row">
		<section>
		<div id="menu">
		<ul>
	 		<li class="sub" onclick="change_sub(0);showa()">활성</li><li class="sub" onclick="change_sub(1);showd()">비활성</li>
		</ul>
		</div>
	
		<div id="sec">ROOM LIST</div>
		<div id="a1">
			<table>
				<tr>
					<th> 번호 </th>					
					<th> 사진 </th>					
					<th> 객실코드 </th>					
					<th> 객실명 </th>		
					<th> 뷰 </th>								
					<th> 상태 </th>		
					<th> 수정/비활성 </th>								
				</tr> 
			  <c:forEach items="${list}" var="rvo">
			  <c:if test="${rvo.rstate==0}">
			  	<tr>
			  		<td> ${rvo.id} </td>
			  		<td> <img src="../img/rooms/${rvo.rpimg}"> </td> 
			  		<td> ${rvo.rcode} </td>
			  		<td> ${rvo.rname} </td>
			  		<td> ${rvo.rview} </td>
			  		<c:if test="${rvo.rstate==0}">
			  			<c:set var="rstate" value="활성"/>
			  		</c:if>
			  		<c:if test="${rvo.rstate==1}">
			  			<c:set var="rstate" value="비활성"/>
			  		</c:if>
			  		<td> ${rstate} </td>
			  		<td>
			  			<a href="../room/room_update?id=${rvo.id}">수정</a> /
			  		<c:if test="${rvo.rstate==0}">
			  			<a href="../room/room_disable?id=${rvo.id}">비활성</a>
			  		</c:if>			  			
			  		</td>
			  	</tr>
			  </c:if>
			  </c:forEach>
			</table>
	</div>
	<div id="a2">
			<table>
				<tr>
					<th> 번호 </th>					
					<th> 사진 </th>					
					<th> 객실코드 </th>					
					<th> 객실명 </th>										
					<th> 상태 </th>		
					<th> 수정/활성화 </th>								
				</tr> 
			  <c:forEach items="${list}" var="rvo">
			  <c:if test="${rvo.rstate==1}">
			  	<tr>
			  		<td> ${rvo.id} </td>
			  		<td> <img src="../img/rooms/${rvo.rpimg}"> </td> 
			  		<td> ${rvo.rcode} </td>
			  		<td> ${rvo.rname} </td>
			  		<c:if test="${rvo.rstate==0}">
			  			<c:set var="rstate" value="활성"/>
			  		</c:if>
			  		<c:if test="${rvo.rstate==1}">
			  			<c:set var="rstate" value="비활성"/>
			  		</c:if>
			  		<td> ${rstate} </td>
			  		<td>
			  			<a href="../room/room_update?id=${rvo.id}">수정</a> / 
			  			<a href="../room/room_enable?id=${rvo.id}">활성화</a>
			  		<%-- <c:if test="${rvo.rstate==0}">
			  			<a href="../room/room_disable?id=${rvo.id}">삭제</a>
			  		</c:if> --%>			  			
			  		</td>
			  	</tr>
			  </c:if>
			  </c:forEach>
			</table>
	</div>
			<br>
			<div id="sec2">
				<a href="../room/room_write"><input type="button" value="객실생성"></a>
			</div>
		</section>
	</div>
</div>

<!-- ================ Rooms Area End ================= -->

</body>