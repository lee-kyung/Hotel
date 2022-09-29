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
		width: 1200px;
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
	#sec2 #cal{
		width: 200px;
		margin: auto; 
	}
</style>
<script>
	function move(my)
	{
		location="gumaelist?pcnt="+my.value; // pcnt는 한 페이지에 표시할 글의 수. 10개, 20개 등등
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
        <div id="h3"> <a href="../admin/admin">ADMIN</a></div>
    </div>
    

<section>
<div id="sec1">
<!-- 내용 작성 -->
	<div id="title"> <a href="gumaelist">구매자 리스트</a></div>
	<div id="list">
		목록
		<select onchange="move(this)" id="pcnt">
			<option value="10"> 10개 </option>		
			<option value="20"> 20개 </option>		
			<option value="30"> 30개 </option>		
			<option value="50"> 50개 </option>		
		</select>
		</div>
	<table id="gumae">
		<tr>
			<td> 번호 
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id asc'">∧</span>
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id desc'">∨</span>
			</td>
			<td> 구매자 </td>
			<td> 주문번호 </td>
			<td> 상품명 </td>
			<td> 상품코드 </td>
			<td> 구매일 
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=buyday asc'">∧</span>
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=buyday desc'">∨</span>
			</td>
			<td> 총결제금액 </td>
			<td colspan="2"> 상태 
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state asc'">∧</span>
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state desc'">∨</span>
			</td>			
		</tr>
	  <c:forEach items="${glist}" var="gvo">
		<tr>
			<td> ${gvo.id} </td>
			<td> ${gvo.pname} </td>
			<td><a href="../admin/gumaeview?id=${gvo.id}&jumuncode=${gvo.jumuncode}"> ${gvo.jumuncode}</a></td>
			<td> ${gvo.title} </td>
			<td> ${gvo.pcode} </td>
			<td> ${gvo.total_price} </td>
			<td> ${gvo.buyday} </td>
			<c:if test="${gvo.state == 0}">
	  			<c:set var="state" value="결제완료"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 1}">
		  		<c:set var="state" value="취소요청"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 2}">
		  		<c:set var="state" value="취소완료"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 3}">
		  		<c:set var="state" value="배송완료"/>
		  	</c:if>
	  		<td> ${state} </td>
	  		<td>
	  		<c:if test="${gvo.state == 0}">
	  			<input type="button" value="배송완료" onclick="location='../admin/estatechange?state=3&id=${gvo.id}'">
	  		</c:if>
	  		<c:if test="${gvo.state == 1}">
	  			<input type="button" value="취소승인" onclick="location='../admin/estatechange?state=2&id=${gvo.id}&pcode=${gvo.pcode}&su=${gvo.total_su}'">
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
			<a href="gumaelist?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">◀</a>
		</c:if>
		
		<!-- 1페이지 단위로 이전으로 가기 -->
		<c:if test="${page==1}"></c:if> <!-- 1페이지면 -->
		<c:if test="${page!=1}"><!-- 1페이지가 아니면 -->
			<a href="gumaelist?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">◁</a>
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
			<b><a href="gumaelist?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}"${st}>${i}</a></b><!-- 누른페이지로 이동걸기 -->
		</c:forEach>
		
		<!-- 1페이지 단위로 다음으로 가기 -->
		<c:if test="${page==chong}"></c:if>
		<c:if test="${page!=chong}">
			<a href="gumaelist?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">▷</a>
		</c:if>
		
		<!-- 10페이지 단위로 다음으로 가기 -->
		<c:if test="${pend==chong}"></c:if>
		<c:if test="${pend!=chong}">
			<a href="gumaelist?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">▶</a>
		</c:if>
		
	</div>
	<br>	
	<div id="search">
		<form method="post" action="gumaelist" onsubmit="return check(this)">
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
</div>
</section>





</body>

