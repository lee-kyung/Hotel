<<<<<<< HEAD
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
		location="dinelist?pcnt="+my.value; // pcnt는 한 페이지에 표시할 글의 수. 10개, 20개 등등
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
        <h3> <a href="../admin/admin">레스토랑 예약 리스트 </a></h3>
    </div>
    

<section>
<div>
<!-- 내용 작성 -->

	<table id="dining" border="1">
	<tr>
		<h3> <a href="dinelist">레스토랑 예약 리스트</a></h3>
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
			<td> 번호 </td>
			<td> 아이디 </td>
			<td> 예약번호 </td>
			<td> 예약자 </td>
			<td> 연락번호 </td>
			<td> 식사날짜 </td>
			<td> 식사유형 </td>
			<td> 식사시간 </td>
			<td> 성인 </td>
			<td> 어린이 </td>
			<td> 유아 </td>
			<td> 총 금액 </td>
			<td> 요청사항 </td>
			<td> 예약일 </td>
			<td> 예약상태 </td>
		</tr>
 	  <c:forEach items="${dlist}" var="dvo">
	  	<tr>
	  		<td> ${dvo.dr_id} </td>
	  		<td> ${dvo.userid} </td>
	  		<td> ${dvo.bid} </td>
	  		<td> ${dvo.bkname} </td>
	  		<td> ${dvo.p1}-${dvo.p2}-${dvo.p3} </td>
	  		<td> ${dvo.dr_date} </td>
	  		<td> ${dvo.dine_type} </td>
	  		<td> ${dvo.dr_time} </td>
	  		<td> ${dvo.adult} </td>
	  		<td> ${dvo.child} </td>
	  		<td> ${dvo.baby} </td>
	  		<td> ${dvo.dr_total} </td>
	  		<td> ${dvo.dr_extrarq} </td>
	  		<td> ${dvo.writeday} </td>
	  		<c:if test="${dvo.dr_state == 0}">
	  			<c:set var="state" value="예약"/>
		  	</c:if>
		  	<c:if test="${dvo.dr_state == 1}">
		  		<c:set var="state" value="사용완료"/>
		  	</c:if>
		  	<c:if test="${dvo.dr_state == 2}">
		  		<c:set var="state" value="취소됌"/>
		  	</c:if>
		  		<td> ${state} </td>
	  	</tr>
	  </c:forEach> 
	</table>
	<div id="lis">
		<!-- 10페이지 단위로 이전으로 가기 -->
		<c:if test="${pstart==1}"></c:if> <!-- 페이지 그룹이 1일때 -->
		<c:if test="${pstart!=1}"><!-- 1그룹이 아니면 -->
			<a href="dinelist?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">◀</a>
		</c:if>
		
		<!-- 1페이지 단위로 이전으로 가기 -->
		<c:if test="${page==1}"></c:if> <!-- 1페이지면 -->
		<c:if test="${page!=1}"><!-- 1페이지가 아니면 -->
			<a href="dinelist?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">◁</a>
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
			<b><a href="dinelist?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}"${st}>${i}</a></b><!-- 누른페이지로 이동걸기 -->
		</c:forEach>
		
		<!-- 1페이지 단위로 다음으로 가기 -->
		<c:if test="${page==chong}"></c:if>
		<c:if test="${page!=chong}">
			<a href="dinelist?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">▷</a>
		</c:if>
		
		<!-- 10페이지 단위로 다음으로 가기 -->
		<c:if test="${pend==chong}"></c:if>
		<c:if test="${pend!=chong}">
			<a href="dinelist?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}">▶</a>
		</c:if>
		
	</div>
	<br>	
	<div id="search">
		<form method="post" action="dinelist" onsubmit="return check(this)">
			<select name="sel" id="sel">
				<option value="0"> 선 택 </option>
				<option value="userid"> 아이디 </option>
				<option value="dr_date"> 식사일 </option>
				<option value="dine_type"> 식사유형  </option>
			</select>
			<input type="text" name="sword" size="20" value="${sword}">
			<input type="submit" value="검색">
		</form> 
	</div>
</div>
</section>





</body>
