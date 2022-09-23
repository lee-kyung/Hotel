<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
		width:1100px;
		margin:auto;
		border: 1px solid black;
		margin-top:100px;
		margin-bottom:200px;
	}
	
</style>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> ADMIN: MEMBER LIST</h3>
    </div>
    
<section>
<div id="first">
<!-- 내용 작성 -->
	<table>
		<tr>
			<td width="100"> 번호 </td>
			<td width="150"> 아이디 </td>
			<td width="100"> 이름 </td>
			<td width="200"> 이메일 </td>
			<td width="200"> 전화번호 </td>
			<td width="200" > 가입일 </td>
			<td width="150"> 가입상태 </td>
		</tr>
	<c:forEach items="${list}" var="mvo">
		<tr>
			<td> ${mvo.id} </td>
			<td> ${mvo.userid} </td>
			<td> ${mvo.name} </td>
			<td> ${mvo.email} </td>
			<td> ${mvo.phone} </td>
			<td> ${mvo.joinday} </td>
			<td> ${mvo.state} </td>
			
		</tr>		
	</c:forEach>	
	</table>
	

</div>
</section>




</body>