<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#first{
	width:100%;
	height:400px;
	background:#F3F3F3;
	text-align:center;}
	
	#first #first_1{
	margin:auto;
	width:1800px;}
		
	#first #first_1 span{
	cursor:pointer;}
	
	#first #txt{
	text-align:left;
	font-size:40px;
	padding-top:50px;}
	
	#first .txt2{
	margin-bottom:20px;
	text-align:right;
	font-size:20px;
	cursor:pointer;}
	
	#first #list{
	width:100%;
	margin:auto;}
	
	#first ul li{
	display:inline-block;
	border:1px solid #cccccc;
	width:23%;
	height:150px;
	margin-top:20px;
	background:white;
	border-right:none;
	font-size:25px;
	padding-top:52px;
	cursor:pointer;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
	
	section{
	width:1300px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}

	section #dine #title{
	font-size:40px;
	text-align:center;
	margin-bottom:50px;}
	
	section #dine #txt1{
	margin-top:70px;
	font-size:18px;
	font-weight:600;
	margin-right:20px;}
	
	section #dine form{
	border:1px solid #887159;
	width:1100px;
	height:180px;
	text-align:center;
	margin:auto;}
	
	section #dine form div{
	display:inline-block;}
	
	section #dine form input[type=text]{
	width:300px;}
	
	section #dine form #btn1{
	width:100px;
	height:40px;
	border:1px solid #887159;
	background:white;
	margin-left:20px;
	color:#887159;
	cursor:pointer;}
	
	section #dine form #btn2{
	width:100px;
	height:40px;
	border:none;
	color:white;
	cursor:pointer;
	background:#887159;}
	
	section #dine #btn3{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;
	cursor:pointer;}
	
	section #dine .btn4{
	width:100px;
	height:40px;
	border:1px solid #887159;
	color:#887159;
	background:white;}
	
	section #dine table#first_t{
	margin-top:50px;
	width:1300px;
	text-align:center;}
	
	section #dine table#first_t tr:first-child{
	font-weight:600;}

	section #dine table#first_t td{
	padding-top:10px;
	padding-bottom:10px;}
	
	section #dine table#first_t tr:last-child{
	border-right-color:white;
	border-left-color:white;
	border-bottom-color:white}
	
	section #dine #txt3{
	text-align:center;
	font-size:35px;
	margin-top:30px;
	display:none;}
	
	section #dine table#second_t{
	margin-top:30px;
	width:1300px;
	text-align:center;}
	
	section #dine table#second_t tr:first-child{
	font-weight:600;}

	section #dine table#second_t td{
	padding-top:15px;
	padding-bottom:15px;}
	
	section #dine table#first_t #page{
	font-size:0px;}
	
	section #dine table#first_t #page .page_n{
	border:1px solid black;
	display:inline-block;
	width:60px;
	height:50px;
	padding-top:10px;
	font-size:16px;
	border:1px solid #887159;
	border-right:none;
	margin-top:30px;
	color:#887159;}
	
	section #dine table#first_t #page .page_n:last-child{
	border-right:1px solid #887159;}
	
	section #dine a:hover{
	text-decoration:underline;
	letter-spacing:1px;
	color:red;}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function(){
		
		$("#datepicker1").datepicker({
			format: "yyyy-mm-dd",	// ???????????? ?????? ?????? ?????? ???: mm/dd/yy
		});
		
		$("#datepicker2").datepicker({
			format: "yyyy-mm-dd",	// ???????????? ?????? ?????? ?????? ???: mm/dd/yy
		});
		
	});
	
	function cal_search(){
		var cal_in=document.cal.cal_in.value;
		var cal_out=document.cal.cal_out.value;
		
		var search=new XMLHttpRequest();
		search.open("get", "dine_resv_search?cal_in="+cal_in+"&cal_out="+cal_out);
		search.send();
		search.onreadystatechange=function()
		{
			if(search.readyState==4)
			{	
				// alert(search.responseText);
				var get=decodeURI(search.responseText.split(","));
				document.getElementById("inn").innerHTML=get;
				document.getElementById("first_t").style.display="none";
				document.getElementById("txt3").style.display="block";
				
			}
		}
	}
</script>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
    <!-- bradcam_area_start -->
    <!-- ??? ????????? ???????????? ???
    	???[webapp\resources\css]????????? ?????? [style.css]????????? ????????? ????????????
    	???[webapp\resources\img\banner]????????? ?????????????????? ???????????? -->
    <div class="bradcam_area mypage">	<!-- class="bradcam_area ????????????" -->
        <div id="h3">DINING</div>
    </div>
<div id="first">
	<div id="first_1">
		<div id="txt"><span onclick="location='mypage'">${name }???, ???????????????.</span></div>
		<div class="txt2">
			<span onclick="location='../mypage/myprofile_pwd'">???????????? ?????? > </span>&nbsp;&nbsp;
			<span onclick="location='../mypage/mypwd_change'">???????????? ?????? > </span>
		</div> 
	</div>	
	<div id="list">
		<ul>
			<li onclick="location='room_resv'">?????? ?????? ??????</li><li onclick="location='dine_resv'">???????????? ?????? ??????</li><li onclick="location='eshop_gumae'">E-SHOP ????????????</li><li onclick="location='wedding_resv'">?????? ?????? ??????</li>
		</ul>
	</div>
</div>

<section>
<div id="dine">
	<div id="title">???????????? ?????? ??????</div>
	<form method="post" name="cal">
	<div id="txt1">????????????</div>
		<div><input type="text" id="datepicker1" name="cal_in" readonly></div>
		<div> ~ <input type="text" id="datepicker2" name="cal_out" readonly></div>
		<div><input type="button" onclick="cal_search()" value="??????" id="btn1"></div>
		<div><input type="button" onclick="location='dine_resv'" value="????????????" id="btn2"></div>
	</form>
	<table border="1" id="first_t">
		<tr>
			<td width="190">????????????</td>
			<td>?????? ??????</td>
			<td>?????? ??????</td>
			<td>?????? ??????</td>
			<td width="300px">?????? ??????</td>
			<td>??? ??????</td>
			<td>????????? ???</td>
			<td width="120px;">?????? ??????</td>
		</tr>
 		<c:forEach items="${dlist }" var="dvo">
		<tr>
			<td><a href="dine_content?dr_id=${dvo.dr_id}">${dvo.bid }</a></td>
			<td>${dvo.dr_date}</td>
			<td>${dvo.dine_type}</td>
			<td>${dvo.dr_time}</td>
			<td>

 				<c:if test="${(dvo.child==0) && (dvo.baby==0) }">
					?????? ${dvo.adult }???
				</c:if>
				<c:if test="${(dvo.child !=0) && (dvo.baby==0) }">
					?????? ${dvo.adult }???, ????????? ${dvo.child }???
				</c:if>
				<c:if test="${(dvo.child ==0) && (dvo.baby!=0) }">
					?????? ${dvo.adult }???, ?????? ${dvo.baby }???
				</c:if>
				<c:if test="${(dvo.child !=0) && (dvo.baby !=0) }">
					?????? ${dvo.adult }???, ????????? ${dvo.child }???, ?????? ${dvo.baby }??? 
				</c:if>

			</td>
			<td><fmt:formatNumber value="${dvo.dr_total}"/>???</td>
			<td>${dvo.writeday}</td>
			<td>
	 			<c:if test="${dvo.dr_state==0 }">
					<input type="button" id="btn3" value="????????????" onclick="location='dineR_state_change?dr_state=2&dr_id=${dvo.dr_id}'">
				</c:if>
				<c:if test="${dvo.dr_state==1 }">
					<input type="button" class="btn4" value="????????????">
				</c:if>
				<c:if test="${dvo.dr_state==2 }">
					<input type="button" class="btn4" value="????????????">
				</c:if> 
			</td>
		</tr>
		</c:forEach> 
		<tr>
			<td colspan="8">
				<div id="page">
				<!-- 10?????????????????? ?????? -->
					<c:if test="${pstart==1 }">
						<a class="page_n"> << </a>
					</c:if>
					<c:if test="${pstart!=1 }">
						<a href="dine_resv?page=${pstart-1 }&pcnt=${pcnt}" class="page_n"> << </a>
					</c:if>	
					
				<!-- 1?????????????????? ?????? -->
					<c:if test="${page==1 }">
						<a class="page_n"> < </a>
					</c:if>
					<c:if test="${page!=1 }">
						<a href="dine_resv?page=${page-1 }&pcnt=${pcnt}" class="page_n"> < </a>
					</c:if>		
					
				<!-- ???????????????	 -->
					<c:forEach begin="${pstart }" end="${pend }" var="i">
						<!-- ??????????????? ?????? -->
						<c:if test="${page==i }">
							<c:set var="st" value="style='color:white; background:#887159;'"/>
						</c:if>
						<c:if test="${page!=i }">
							<c:set var="st" value=""/>
						</c:if>
						
						<!-- ?????? ????????? ?????? -->
						<a href="dine_resv?page=${i }&pcnt=${pcnt}" ${st } class="page_n"> ${i} </a><!--  -->
					</c:forEach>
				
				<!-- 1?????????????????? ?????? -->
					<c:if test="${page==chong }">
						<a class="page_n"> > </a>
					</c:if>
					<c:if test="${page!=chong }">
						<a href="dine_resv?page=${page+1 }&pcnt=${pcnt}" class="page_n"> > </a>
					</c:if>	
						
				<!-- 10?????????????????? ?????? -->
					<c:if test="${pend==chong }">
						<a class="page_n"> >> </a>
					</c:if>
					<c:if test="${pend!=chong }">
						<a href="dine_resv?page=${pend+1 }&pcnt=${pcnt}" class="page_n"> >> </a>
					</c:if>	
				</div>
			</td>
		</tr>
	</table>	
	<div id="txt3"> ?????? ?????? </div>
		<div id="inn"></div>
	
	
	
</div>
</section>
</body>