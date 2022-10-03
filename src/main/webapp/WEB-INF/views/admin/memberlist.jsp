<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#sec1{
		width:1300px;
		margin:auto;
		margin-top:100px;
		margin-bottom:200px;
	}
	#h3 a{
		color: white;
	}
	#sec1 #title{
		width: 1000px;		
		margin: auto;
	}
	#sec1 #title a{
		font-size: 25px;
		color: #887159;
		font-weight: 700;
	}
	#sec1 #title a:hover{
		color: black;
	}
	#sec1 #list{
		width: 1000px;
		text-align: right;
		margin: auto;
	}
	#sec1 table{
		width: 1000px;
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
	#sec1 table th{
		font-size: 20px;
		font-weight: 700;
		color: #887159;
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
	#sec2 input[type=text]{
		width: 200px;
		height: 28px;
		border: 1px solid #887159;
	}
	#sec2 select{
		width: 80px;
		height: 26px;
		border: 1px solid #887159;
	}
	#sec2 input[type=submit]{
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
	#sec1 input[type=button]{
		width: 70px;
		height: 25px;
		border: 1px solid #887159;
		border-radius: 2px;
		background: white;
		color: #887159;
	}
	#sec1 input[type=button]:hover{
		font-weight: 700; 
	}
</style>

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
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> <a href="../admin/admin">ADMIN</a></div>
    </div>
<div id="sec1">
<!-- 내용 작성 -->
	<div id="title"> <a href="memberlist">회원목록</a></div>
	<div id="list">
		목록
		<select onchange="move(this)" id="pcnt">
			<option value="10"> 10개 </option>		
			<option value="20"> 20개 </option>		
			<option value="30"> 30개 </option>		
			<option value="50"> 50개 </option>		
		</select>
		</div>
	<table id="member">
		<tr id="title2">
			<td> 번호 
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id asc'">∧</span>
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id desc'">∨</span>
			</td>
			<td> 아이디 </td>
			<td> 이름 </td>
			<td> 가입일 
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=joinday asc'">∧</span>
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=joinday desc'">∨</span>
			</td>
			<td colspan="2"> 가입상태 
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state asc'">∧</span>
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state desc'">∨</span>
			</td>		
		</tr>
	  <c:forEach items="${mlist}" var="mvo">
	    <tr>
	  		<td>${mvo.id}</td>	    	
	  		<td><a href="../admin/meminfo?id=${mvo.id}&userid=${mvo.userid}"> ${mvo.userid}</a> </td>
	  		<td> ${mvo.name} </td>
	  		<td> ${mvo.joinday} </td>
	  	<c:if test="${mvo.state == 0}">
	  		<c:set var="state" value="가입"/>
	  	</c:if>
	  	<c:if test="${mvo.state == 1}">
	  		<c:set var="state" value="탈퇴된 회원"/>
	  	</c:if>
	  		<td> ${state} </td>
	  		<td>
	  		<c:if test="${mvo.state != 1}">
	  			<input type="button" value="강퇴" onclick="location='../admin/mstatechange?state=1&id=${mvo.id}'">
	  		</c:if>
	  		</td>
	  	</tr>
	  </c:forEach>
	</table>
<div id="sec2">
	<div id="pg">
		<!-- 10페이지 단위로 이전으로 가기 -->
		<c:if test="${pstart==1}"></c:if> <!-- 페이지 그룹이 1일때 -->
		<c:if test="${pstart!=1}"><!-- 1그룹이 아니면 -->
			<a href="memberlist?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">◀</a>
		</c:if>
		
		<!-- 1페이지 단위로 이전으로 가기 -->
		<c:if test="${page==1}"></c:if> <!-- 1페이지면 -->
		<c:if test="${page!=1}"><!-- 1페이지가 아니면 -->
			<a href="memberlist?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">◁</a>
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
			<b><a href="memberlist?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}"${st}>${i}</a></b><!-- 누른페이지로 이동걸기 -->
		</c:forEach>
		
		<!-- 1페이지 단위로 다음으로 가기 -->
		<c:if test="${page==chong}"></c:if>
		<c:if test="${page!=chong}">
			<a href="memberlist?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">▷</a>
		</c:if>
		
		<!-- 10페이지 단위로 다음으로 가기 -->
		<c:if test="${pend==chong}"></c:if>
		<c:if test="${pend!=chong}">
			<a href="memberlist?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">▶</a>
		</c:if>
		
	</div>
	<br>	
	<div id="search">
		<div id="left">
		<form method="post" action="memberlist" onsubmit="return check(this)">
			<select name="sel" id="sel">
				<option value="0"> 선 택 </option>
				<option value="name"> 이름 </option>
				<option value="joinday"> 가입일 </option>
				<option value="userid"> 아이디  </option>
			</select>
			<input type="text" name="sword" size="20" value="${sword}">
			<input type="submit" value="검색">
		</form>
		</div>	
	</div>
</div>
</div>
</section>





</body>