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
	}
	#h3 a{
		color: white;
	}
	#sec1 #title a{
		width: 1200px;
	}
	#sec1 #title a{
		font-size: 25px;
		color: #887159;
		font-weight: 700;
	}
	#sec1 #list{
		width: 1200px;
		text-align: right;
		margin: auto;
	}
	#sec1 table{
		width: 1300px;
		margin-top: 20px;
		margin: auto;
	}
	#sec1 table tr:first-child td{
		border-bottom: 2px solid #887159;
	}
	#sec1 table tr th{
		border-bottom: 1px solid #887159;
	}
	#sec1 table tr:last-child td{
		border-bottom: 1px solid #887159;
	}
	#sec1 table tr td{
		padding: 15px;
	}
	#sec1 table tr:nth-child(even){
		background: #f9f3ed;
	}
	#sec1 table #title2{
		font-weight: 800;
		font-size: 18px;
	}
	#sec1 table span:hover{
		cursor: pointer;
		color: #887159;
	}
	#sec1 table a:hover{
		font-weight: 700;
		color: #887159;
	}
	#sec1 #sec2{
		margin: auto;
		width: 1200px;
		text-align: center;
	}
	#sec2 #search>input[type=text]{
		width: 200px;
		height: 28px;
		border: 1px solid #887159;
	}
	#sec2 select{
		width: 80px;
		height: 26px;
		border: 1px solid #887159;
	}
	#sec2 input[type=submit],input[type=button]{
		width: 100px;
		height: 28px;
		background: white;
		color: #887159;
		border: 1px solid #887159;
	}
	#sec2 input[type=submit]:hover{
		color: white;
		background: #887159;
		border: 1px solid #887159;
	}
	#sec2 #cal{
		width: 200px;
		margin: auto;
	}
	#dtsearch{
		width: 1000px;
		margin: auto;
		display:inline-block;
		margin-top: 20px;
	}
	#aa,#bb{
		width: 200px;
		display:inline-block;
	}
	#aa input[type=text],#bb input[type=text]{
		height: 15px;
	}
	#csbtn{
		border-radius: 4px;
	}
	#csbtn:hover{
		color: white;
		background: #887159;
		height: 24px;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
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
	
	$(function(){
		   $("#c1").datepicker({
			   format: "yyyy-mm-dd",
		   });
		   $("#c2").datepicker({
		      format: "yyyy-mm-dd",
		   });  
		});
		
		function csearch(c1,c2){
			var c1=document.getElementById("c1").value;
			var c2=document.getElementById("c2").value;
			// alert(c1+""+c2);
			
			location="dinelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1="+c1+"&c2="+c2;
		} 
</script>
</head>

<body>

<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> <a href="../admin/admin">ADMIN</a></div>
    </div>
    

<section>
<div id="sec1">
<!-- 내용 작성 -->
	<div id="title"> <a href="dinelist">다이닝 예약 리스트</a></div>
	<div id="list">
		목록
		<select onchange="move(this)" id="pcnt">
			<option value="10"> 10개 </option>		
			<option value="20"> 20개 </option>		
			<option value="30"> 30개 </option>		
			<option value="50"> 50개 </option>		
		</select>
		</div>
	<table id="dining">
		<tr id="title2">
			<td> 번호 
				<span onclick="location='dinelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=dr_id asc'">∧</span>
				<span onclick="location='dinelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=dr_id desc'">∨</span>
			</td>
			<td> 예약자 </td>
			<td> 예약번호 </td>
			<td> 식사날짜 
				<span onclick="location='dinelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=dr_date asc'">∧</span>
				<span onclick="location='dinelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=dr_date desc'">∨</span>
			</td>
			<td> 식사유형 </td>
			<td> 식사시간 </td>
			<td> 예약일 </td>
			<td> 총 금액 </td>
			<td> 예약상태 
				<span onclick="location='dinelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=dr_state asc'">∧</span>
				<span onclick="location='dinelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=dr_state desc'">∨</span>
			</td>
		</tr>
 	  <c:forEach items="${dlist}" var="dvo">
	  	<tr>
	  		<td> ${dvo.dr_id} </td>
	  		<td> ${dvo.bkname} </td>	  		
	  		<td> <a href="../admin/dinebkview?dr_id=${dvo.dr_id}"> ${dvo.bid} </a></td>
	  		<td> ${dvo.dr_date} </td>
	  		<td> ${dvo.dine_type} </td>
	  		<td> ${dvo.dr_time} </td>
	  		<td> ${dvo.dr_total} </td>
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
<div id="sec2">
	<div id="pg">
		<!-- 10페이지 단위로 이전으로 가기 -->
		<c:if test="${pstart==1}"></c:if> <!-- 페이지 그룹이 1일때 -->
		<c:if test="${pstart!=1}"><!-- 1그룹이 아니면 -->
			<a href="dinelist?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">◀</a>
		</c:if>
		
		<!-- 1페이지 단위로 이전으로 가기 -->
		<c:if test="${page==1}"></c:if> <!-- 1페이지면 -->
		<c:if test="${page!=1}"><!-- 1페이지가 아니면 -->
			<a href="dinelist?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">◁</a>
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
			<b><a href="dinelist?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}"${st}>${i}</a></b><!-- 누른페이지로 이동걸기 -->
		</c:forEach>
		
		<!-- 1페이지 단위로 다음으로 가기 -->
		<c:if test="${page==chong}"></c:if>
		<c:if test="${page!=chong}">
			<a href="dinelist?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">▷</a>
		</c:if>
		
		<!-- 10페이지 단위로 다음으로 가기 -->
		<c:if test="${pend==chong}"></c:if>
		<c:if test="${pend!=chong}">
			<a href="dinelist?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">▶</a>
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
		<div id="dtsearch">
			<form name="cal" method="post">
			<div id="aa"><input type="text" name="c1" id="c1" placeholder="식사날짜"></div> ~
			<div id="bb"><input type="text" name="c2" id="c2" placeholder="기간검색"></div> &nbsp;&nbsp;&nbsp;<input id="csbtn" type="button" value="검색" onclick="csearch()">
			</form>
		</div> 
	</div>
</div>
</div>
</section>





</body>
