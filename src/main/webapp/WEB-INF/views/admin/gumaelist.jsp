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
	#sec2 input[type=submit], input[type=button]{
		width: 100px;
		height: 28px;
		background: white;
		color: #887159;
		border: 1px solid #887159;
	}
	#sec2 input[type=submit]:hover, input[type=button]:hover{
		color: white;
		background: #887159;
		border: 1px solid #887159;
	}
	#sec2 #cal{
		width: 200px;
		margin: auto; 
	}
	#sec1 input[type=button]{
		width: 90px;
		height: 25px;
		border: 1px solid #887159;
		border-radius: 2px;
		background: white;
		color: #887159;
	}
	#sec1 input[type=button]:hover{
		font-weight: 700;
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
		location="gumaelist?pcnt="+my.value; // pcnt??? ??? ???????????? ????????? ?????? ???. 10???, 20??? ??????
	}
	window.onload=function()
	{
		document.getElementById("pcnt").value="${pcnt}";
		
		// ??????????????? ????????????
		document.getElementById("sel").value="${sel}";
	}
	function check(my)
	{
		if(my.sel.selectedIndex==0)
		{
			alert("??????????????? ???????????????")
			return false;
		}	
		else if(my.sword.value.trim()=="")
		{
			alert("???????????? ???????????????")
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
			
			location="gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1="+c1+"&c2="+c2;
		} 
</script>
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
    

<section>
<div id="sec1">
<!-- ?????? ?????? -->
	<div id="title"> <a href="gumaelist">ESHOP ????????? ?????????</a></div>
	<div id="list">
		??????
		<select onchange="move(this)" id="pcnt">
			<option value="10"> 10??? </option>		
			<option value="20"> 20??? </option>		
			<option value="30"> 30??? </option>		
			<option value="50"> 50??? </option>		
		</select>
		</div>
	<table id="gumae">
		<tr id="title2">
			<td> ?????? 
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id asc'">???</span>
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=id desc'">???</span>
			</td>
			<td> ????????? </td>
			<td> ???????????? </td>
			<td> ????????? </td>
			<td> ???????????? </td>
			<td> ????????? </td>
			<td> ????????? 
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=buyday asc'">???</span>
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=buyday desc'">???</span>
			</td>
			<td colspan="2"> ?????? 
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state asc'">???</span>
				<span onclick="location='gumaelist?page=${page}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=state desc'">???</span>
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
	  			<c:set var="state" value="????????????"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 1}">
		  		<c:set var="state" value="????????????"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 2}">
		  		<c:set var="state" value="????????????"/>
		  	</c:if>
		  	<c:if test="${gvo.state == 3}">
		  		<c:set var="state" value="????????????"/>
		  	</c:if>
	  		<td> ${state} </td>
	  		<td>
	  		<c:if test="${gvo.state == 0}">
	  			<input type="button" value="????????????" onclick="location='../admin/estatechange?state=3&id=${gvo.id}'">
	  		</c:if>
	  		<c:if test="${gvo.state == 1}">
	  			<input type="button" value="????????????" onclick="location='../admin/estatechange?state=2&id=${gvo.id}&pcode=${gvo.pcode}&su=${gvo.total_su}'">
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
			<a href="gumaelist?page=${pstart-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">???</a>
		</c:if>
		
		<!-- 1????????? ????????? ???????????? ?????? -->
		<c:if test="${page==1}"></c:if> <!-- 1???????????? -->
		<c:if test="${page!=1}"><!-- 1???????????? ????????? -->
			<a href="gumaelist?page=${page-1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">???</a>
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
			<b><a href="gumaelist?page=${i}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}"${st}>${i}</a></b><!-- ?????????????????? ???????????? -->
		</c:forEach>
		
		<!-- 1????????? ????????? ???????????? ?????? -->
		<c:if test="${page==chong}"></c:if>
		<c:if test="${page!=chong}">
			<a href="gumaelist?page=${page+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">???</a>
		</c:if>
		
		<!-- 10????????? ????????? ???????????? ?????? -->
		<c:if test="${pend==chong}"></c:if>
		<c:if test="${pend!=chong}">
			<a href="gumaelist?page=${pend+1}&pcnt=${pcnt}&sel=${sel}&sword=${sword}&oby=${oby}&c1=${c1}&c2=${c2}">???</a>
		</c:if>
		
	</div>
	<br>	
	<div id="search">
		<form method="post" action="gumaelist" onsubmit="return check(this)">
			<select name="sel" id="sel">
				<option value="0"> ??? ??? </option>
				<option value="userid"> ????????? </option>
				<option value="dr_date"> ????????? </option>
				<option value="dine_type"> ????????????  </option>
			</select>
			<input type="text" name="sword" size="20" value="${sword}">
			<input type="submit" value="??????">
		</form>
		<br> 
		<div id="dtsearch">
			<form name="cal" method="post">
			<div id="aa"><input type="text" name="c1" id="c1" placeholder="???????????????"></div> ~
			<div id="bb"><input type="text" name="c2" id="c2" placeholder="????????????"></div> &nbsp;&nbsp;&nbsp;<input id="csbtn" type="button" value="??????" onclick="csearch()">
			</form>
		</div> 
	</div>
</div>
</div>
</section>





</body>

