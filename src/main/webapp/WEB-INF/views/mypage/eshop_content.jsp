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

	section #eshop_content #title{
	font-size:40px;
	text-align:center;
	margin-bottom:50px;}
	
	section #eshop_content #txt1{
	margin-top:70px;
	font-size:30px;
	font-weight:600;
	margin-right:20px;}

	section #eshop_content  #btn1{
	width:100px;
	height:40px;
	border:1px solid #887159;
	background:white;
	margin-left:20px;
	color:#887159;}
	
	section #eshop_content  #btn2{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;}
	
	section #eshop_content .btn3{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;
	cursor:pointer;}
	
	section #eshop_content .btn4{
	width:100px;
	height:40px;
	border:1px solid #887159;
	color:#887159;
	background:white;}
	
	section #eshop_content #txt2{
	height:30px;
	width:1100px;
	margin:auto;
	margin-top:40px;
	font-size:20px;
	font-weight:600;
	margin-bottom:-20px;}
	
	section #eshop_content #txt2 #right{
	float:right;}
	
	section #eshop_content #txt2 #left{
	float:left;}
	
	section #eshop_content table{
	width:1000px;
	margin:auto;
	margin-top:60px;
	border-bottom:1px solid #887159;}
	
	section #eshop_content table td{
	padding:15px;}
	
	section #eshop_content table tr:first-child{
	font-size:25px;
	font-weight:600;
	text-align:left;
	border-bottom:2px solid #887159;}
	
	section #eshop_content table td:first-child{
	width:290px;}
	
	section #eshop_content table #name{
	font-weight:600;
	font-size:20px;}
	
	section #eshop_content #table1 td:first-child{
	width:50px;}
	
</style>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
    <!-- bradcam_area_start -->
    <!-- ??? ????????? ???????????? ???
    	???[webapp\resources\css]????????? ?????? [style.css]????????? ????????? ????????????
    	???[webapp\resources\img\banner]????????? ?????????????????? ???????????? -->
    <div class="bradcam_area mypage">	<!-- class="bradcam_area ????????????" -->
        <div id="h3">ESHOP</div>
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
<div id="eshop_content">
	<div id="title">ESHOP ?????? ?????? ??????</div>
	<div id="txt1">????????????</div>
	<div id="txt2">
	

		<div id="left">${gvo.buyday} ?????????</div>
		<div id="right">${gvo.jumuncode}</div>	
	</div>
		
	<table id="table1">
		<tr>
			<td colspan="2" >
				<c:if test="${gvo.state==0 }">
					????????????
				</c:if>
				<c:if test="${gvo.state==1 }">
					?????????????????????
				</c:if>
				<c:if test="${gvo.state==2 }">
					????????????
				</c:if>	
				<c:if test="${(gvo.state==3) && (gvo.bname !=null)}">
					????????????
				</c:if>	
			</td>
		</tr>
		<tr>
			<td id="name" colspan="2">${gvo.title }</td>
			<td align="right">
				<c:if test="${gvo.state==0 }">
					<input type="button" class="btn3" value="????????????" onclick="location='eshopG_state_change?state=1&id=${gvo.id}&jumuncode=${gvo.jumuncode }'">
<%-- 					<c:if test="${(gvo.state==0) && (gvo.bname!=null)}">
						<input type="button" class="btn3" value="????????????" onclick="location='eshopG_state_change?state=3&id=${gvo.id}&jumuncode=${gvo.jumuncode }'">
					</c:if> --%>
				</c:if>
				<c:if test="${gvo.state==1 }"> 
					<input type="button" class="btn4" value="???????????????">
				</c:if>
				<c:if test="${gvo.state==2 }">
					<input type="button" class="btn4" value="????????????">
				</c:if>
				<c:if test="${(gvo.state==3) && (gvo.bname !=null)}">
					<input type="button" class="btn4" value="????????????">
				</c:if>
			</td>
		</tr>
		<c:forEach items="${glist }" var="gvo">
 		<tr>	
 			<td></td>
			<td width="250">${gvo.title }</td>
			<td>${gvo.total_su } ???</td>
		</tr>
		</c:forEach>
	</table>
	
	
	<table>
		<tr>
			<td colspan="2">????????? ??????</td>
		</tr>
		<tr>
			<td>?????????</td>
			<td>${gvo.pname}</td>
		</tr>
		<tr>
			<td>?????????</td>
			<td>${gvo.pphone}</td>
		</tr>
		<tr>
			<td>?????????</td>
			<td>${gvo.pemail}</td>
		</tr>
	</table>
	
	<c:if test="${ gvo.bname!=null}">
	<table>
		<tr>
			<td colspan="2">????????? ??????</td>
		</tr>
		<tr>
			<td>?????? ??????</td>
			<td>${gvo.bname}</td>
		</tr>
		<tr>
			<td>?????????</td>
			<td>${gvo.bphone}</td>
		</tr>
		<tr>
			<td>??????</td>
			<td>${gvo.bjuso } ${gvo.bjuso_etc }</td>
		</tr>
	</table>
	</c:if>
	
	<table>
		<tr>
			<td colspan="2">?????? ??????</td>
		</tr>
		<tr>
			<td>????????????</td>
			<td>
				????????????
			</td>
		</tr>
		<tr>
			<td>????????????</td>
			<td><fmt:formatNumber value="${gvo.total_price }"/>???</td>
		</tr>
	</table>

</div>
</section>
</body>