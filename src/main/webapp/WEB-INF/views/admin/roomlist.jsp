<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
		width:1300px;
		margin:auto;
		margin-top:100px;
		margin-bottom:200px;
		border: 1px solid blue;
	}
	section table{
		width: 1300px;
	}

</style>
<script>
	function move(my)
	{
		location="roomlist?pcnt="+my.value; // pcnt는 한 페이지에 표시할 글의 수. 10개, 20개 등등
	}
	window.onload=function()
	{
		document.getElementById("pcnt").value="${pcnt}";
		
		// 검색필드를 보여주기
		document.getElementById("sel").value="${sel}";
	}
	function check(my)
	{
		if(my.sel.selectedIndex==0)
		{
			alert("검색필드를 선택하세요")
			return false;
		}	
		else if(my.sword.value.trim()=="")
		{
			alert("검색어를 입력하세요")
			return false;
		}
		else
			return true;		
	}
</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3>  <a href="../admin/admin">객실 예약 리스트 </a></h3>
    </div>
    

<section>
<div>
<!-- 내용 작성 -->

	<table id="dining" border="1">
	<tr>
		<h3> <a href="roomlist">객실 예약 리스트</a></h3>
		<h5>
		<div>
		목록
		<select onchange="move(this)" id="pcnt">
			<option value="10"> 10개 </option>		
			<option value="20"> 20개 </option>		
			<option value="30"> 30개 </option>		
			<option value="50"> 50개 </option>		
		</select>
		</div></h5>
		</tr>
		<tr>
			<td> ID </td>
			<td> 아이디 </td>
			<td> 예약자 </td>
			<td> 연락처 </td>
			<td> 체크인 </td>
			<td> 체크아웃 </td>
			<td> 객실명 </td>
			<td> 예약일 </td>
			<td> 예약인원 </td>
			<td> 추가침대 </td>
			<td> 조식 </td>
			<td> 총 결제금액</td>
			<td> 특별요청사항 </td>
			<td> 예약상태 </td>		
		</tr>
	  <c:forEach items="${rlist}" var="rvo">
	    <tr>
	  		<td> ${rvo.id} </td>
	  		<td> ${rvo.userid} </td>
	  		<td> ${rvo.bkname} </td>
	  		<td> ${rvo.bkphone} </td>	  		
	  		<td> ${rvo.checkin} </td>
	  		<td> ${rvo.checkout} </td>
	  		<td> ${rvo.rname} </td>
	  		<td> ${rvo.bkdate} </td>
	  		<td> ${rvo.binwon} </td>
	  		<td> ${rvo.bextbed} </td>
	  		<td> ${rvo.bmeal} </td>
	  		<td> ${rvo.btotal} </td>	  		
	  		<td> ${rvo.spreq} </td>
	  		<td> ${rvo.bstate} </td>
	  	<tr>
	  </c:forEach>
	</table>
	<div id="lis">
		<!-- 10페이지 단위로 이전으로 가기 -->
		<c:if test="${pstart==1}"></c:if> <!-- 페이지 그룹이 1일때 -->
		<c:if test="${pstart!=1}"><!-- 1그룹이 아니면 -->
			<a href="roomlist?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">◀</a>
		</c:if>
		
		<!-- 1페이지 단위로 이전으로 가기 -->
		<c:if test="${page==1}"></c:if> <!-- 1페이지면 -->
		<c:if test="${page!=1}"><!-- 1페이지가 아니면 -->
			<a href="roomlist?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">◁</a>
		</c:if>
		
		<!-- 페이지 출력 -->
		<c:forEach begin="${pstart}" end="${pend}" var="i"> 
			<!-- 현재페이지 색을 빨강으로 -->
			<c:if test="${page==i}">
				<c:set var="st" value="style='color:red;'"/>
			</c:if>
			<c:if test="${page!=i}">
				<c:set var="st" value=""/>
			</c:if>
			<b><a href="roomlist?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"${st}>${i}</a></b><!-- 누른페이지로 이동걸기 -->
		</c:forEach>
		
		<!-- 1페이지 단위로 다음으로 가기 -->
		<c:if test="${page==chong}"></c:if>
		<c:if test="${page!=chong}">
			<a href="roomlist?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">▷</a>
		</c:if>
		
		<!-- 10페이지 단위로 다음으로 가기 -->
		<c:if test="${pend==chong}"></c:if>
		<c:if test="${pend!=chong}">
			<a href="roomlist?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">▶</a>
		</c:if>
		
	</div>
	<br>	
	<div id="search">
		<form method="post" action="roomlist" onsubmit="return check(this)">
			<select name="sel" id="sel">
				<option value="0"> 선 택 </option>
				<option value="bkname"> 예약자 </option>
				<option value="checkin"> 체크인 </option>
				<option value="bkphone"> 연락처  </option>
			</select>
			<input type="text" name="sword" size="20" value="${sword}">
			<input type="submit" value="검색">
		</form> 
	</div>
</div>
</section>





</body>

