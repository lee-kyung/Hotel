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
	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
    <!-- bradcam_area_start -->
    <!-- ??? ????????? ???????????? ???
    	???[webapp\resources\css]????????? ?????? [style.css]????????? ????????? ????????????
    	???[webapp\resources\img\banner]????????? ?????????????????? ???????????? -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area ????????????" -->
        <div id="h3"> <a href="../admin/admin">ADMIN</a></div>
    </div>
<div id="sec1">
<!-- ?????? ?????? -->
	<div id="title"> <a href="memberlist">????????????</a></div>
	<div id="list">
		??????
		<select onchange="move(this)" id="pcnt">
			<option value="10"> 10??? </option>		
			<option value="20"> 20??? </option>		
			<option value="30"> 30??? </option>		
			<option value="50"> 50??? </option>		
		</select>
		</div>
	<table id="member">
		<tr id="title2">
			<td> ?????? 
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id asc'">???</span>
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id desc'">???</span>
			</td>
			<td> ????????? </td>
			<td> ?????? </td>
			<td> ????????? 
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=joinday asc'">???</span>
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=joinday desc'">???</span>
			</td>
			<td colspan="2"> ???????????? 
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state asc'">???</span>
				<span onclick="location='memberlist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state desc'">???</span>
			</td>		
		</tr>
	  <c:forEach items="${mlist}" var="mvo">
	    <tr>
	  		<td>${mvo.id}</td>	    	
	  		<td><a href="../admin/meminfo?id=${mvo.id}&userid=${mvo.userid}"> ${mvo.userid}</a> </td>
	  		<td> ${mvo.name} </td>
	  		<td> ${mvo.joinday} </td>
	  	<c:if test="${mvo.state == 0}">
	  		<c:set var="state" value="??????"/>
	  	</c:if>
	  	<c:if test="${mvo.state == 1}">
	  		<c:set var="state" value="????????? ??????"/>
	  	</c:if>
	  		<td> ${state} </td>
	  		<td>
	  		<c:if test="${mvo.state != 1}">
	  			<input type="button" value="??????" onclick="location='../admin/mstatechange?state=1&id=${mvo.id}'">
	  		</c:if>
	  		</td>
	  	</tr>
	  </c:forEach>
	</table>
<div id="sec2">
	<div id="pg">
		<!-- 10????????? ????????? ???????????? ?????? -->
		<c:if test="${pstart==1}"></c:if> <!-- ????????? ????????? 1?????? -->
		<c:if test="${pstart!=1}"><!-- 1????????? ????????? -->
			<a href="memberlist?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">???</a>
		</c:if>
		
		<!-- 1????????? ????????? ???????????? ?????? -->
		<c:if test="${page==1}"></c:if> <!-- 1???????????? -->
		<c:if test="${page!=1}"><!-- 1???????????? ????????? -->
			<a href="memberlist?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">???</a>
		</c:if>
		
		<!-- ????????? ?????? -->
		<c:forEach begin="${pstart}" end="${pend}" var="i"> 
			<!-- ??????????????? ?????? ???????????? -->
			<c:if test="${page==i}">
				<c:set var="st" value="style='color:red;'"/>
			</c:if>
			<c:if test="${page!=i}">
				<c:set var="st" value=""/>
			</c:if>
			<b><a href="memberlist?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}"${st}>${i}</a></b><!-- ?????????????????? ???????????? -->
		</c:forEach>
		
		<!-- 1????????? ????????? ???????????? ?????? -->
		<c:if test="${page==chong}"></c:if>
		<c:if test="${page!=chong}">
			<a href="memberlist?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">???</a>
		</c:if>
		
		<!-- 10????????? ????????? ???????????? ?????? -->
		<c:if test="${pend==chong}"></c:if>
		<c:if test="${pend!=chong}">
			<a href="memberlist?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}">???</a>
		</c:if>
		
	</div>
	<br>	
	<div id="search">
		<div id="left">
		<form method="post" action="memberlist" onsubmit="return check(this)">
			<select name="sel" id="sel">
				<option value="0"> ??? ??? </option>
				<option value="name"> ?????? </option>
				<option value="joinday"> ????????? </option>
				<option value="userid"> ?????????  </option>
			</select>
			<input type="text" name="sword" size="20" value="${sword}">
			<input type="submit" value="??????">
		</form>
		</div>	
	</div>
</div>
</div>
</section>



</body>