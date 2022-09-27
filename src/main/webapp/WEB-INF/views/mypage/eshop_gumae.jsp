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
	
	#first ul li{
	display:inline-block;
	border:1px solid #cccccc;
	width:450px;
	height:150px;
	margin-top:20px;
	background:white;
	border-right:none;
	text-align:center;
	font-size:25px;
	padding-top:50px;
	cursor:pointer;}
	
	#first ul li:last-child{
	border-right:1px solid #cccccc;}
	
	section{
	width:1300px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}

	section #eshop #title{
	font-size:40px;
	text-align:center;
	margin-bottom:50px;}
	
	section #eshop #txt1{
	margin-top:70px;
	font-size:18px;
	font-weight:600;
	margin-right:20px;}
	
	section #eshop form{
	border:1px solid #887159;
	width:1100px;
	height:180px;
	text-align:center;
	margin:auto;}
	
	section #eshop form div{
	display:inline-block;}
	
	section #eshop form input[type=text]{
	width:300px;}
	
	section #eshop form #btn1{
	width:100px;
	height:40px;
	border:1px solid #887159;
	background:white;
	margin-left:20px;
	color:#887159;}
	
	section #eshop form #btn2{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;}
	
	section #eshop .btn3{
	width:100px;
	height:40px;
	border:none;
	color:white;
	background:#887159;
	cursor:pointer;}
	
	section #eshop .btn4{
	width:100px;
	height:40px;
	border:1px solid #887159;
	color:#887159;
	background:white;}
	
	section #eshop table#first_t{
	margin-top:50px;
	width:1300px;
	text-align:center;}
	
	section #eshop table#first_t tr:first-child{
	font-weight:600;}

	section #eshop table#first_t td{
	padding-top:10px;
	padding-bottom:10px;}
	
	section #eshop table#first_t tr:last-child{
	border-right-color:white;
	border-left-color:white;
	border-bottom-color:white}
	
	section #eshop #txt3{
	text-align:center;
	font-size:35px;
	margin-top:30px;
	display:none;}
	
	section #eshop table#second_t{
	margin-top:30px;
	width:1300px;
	text-align:center;}
	
	section #eshop table#second_t tr:first-child{
	font-weight:600;}

	section #eshop table#second_t td{
	padding-top:10px;
	padding-bottom:10px;}
	
	section #eshop table#first_t #page{
	font-size:0px;}
	
	section #eshop table#first_t #page .page_n{
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
	
	section #eshop table#first_t #page .page_n:last-child{
	border-right:1px solid #887159;}
	
	section #eshop a:hover{
	text-decoration:underline;
	color:red;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function(){
		
		$("#datepicker1").datepicker({
			format: "yyyy-mm-dd",	// 작성되지 않은 경우 기본 값: mm/dd/yy
		});
		
		$("#datepicker2").datepicker({
			format: "yyyy-mm-dd",	// 작성되지 않은 경우 기본 값: mm/dd/yy
		});
		
	});
	
	function cal_search(){
		var cal_in=document.cal.cal_in.value;
		var cal_out=document.cal.cal_out.value;
		
		var search=new XMLHttpRequest();
		search.open("get", "eshop_gumae_search?cal_in="+cal_in+"&cal_out="+cal_out);
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

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <h3> 문구(자유롭게 변경하기) </h3>
    </div>
<div id="first">
	<div id="first_1">
		<div id="txt"><span onclick="location='mypage'">${name }님, 환영합니다.</span></div>
		<div class="txt2">
			<span onclick="location='../mypage/myprofile_pwd'">회원정보 수정 > </span>&nbsp;&nbsp;
			<span onclick="location='../mypage/mypwd_change'">비밀번호 수정 > </span>
		</div> 
	</div>	
	<ul>
		<li onclick="location='room_resv'">객실 예약 확인</li><li onclick="location='dine_resv'">레스토랑 예약 확인</li><li onclick="location='eshop_gumae'">E-SHOP 주문내역</li><li onclick="location='wedding_resv'">웨딩 예약 확인</li>
	</ul>
</div>

<section>
<div id="eshop">
	<div id="title">ESHOP 구매 내역 조회</div>
	<form method="post" name="cal">
	<div id="txt1">구매일자</div>
		<div><input type="text" id="datepicker1" name="cal_in" readonly></div>
		<div> ~ <input type="text" id="datepicker2" name="cal_out" readonly></div>
		<div><input type="button" onclick="cal_search()" value="조회" id="btn1"></div>
		<div><input type="button" onclick="location='eshop_gumae'" value="전체보기" id="btn2"></div>
	</form>
	<table border="1" id="first_t">
		<tr>
			<td width="200px;">주문번호</td>
			<td>상품명</td>
			<td width="100px;">추가상품</td>
			<td width="150px;">총 결제금액</td>
			<td width="150px">구매한 날</td>
			<td width="240px">상태 변경</td>
		</tr>
		<c:forEach items="${glist }" var="gvo">
		<tr>
			<td><a href="eshop_content?id=${gvo.id}&jumuncode=${gvo.jumuncode }">${gvo.jumuncode }</a></td>
			<td>${gvo.title }</td>
			<c:if test="${gvo.cnt==1 }">			
				<td></td>
			</c:if>	
			<c:if test="${gvo.cnt!=1 }">			
				<td>${gvo.cnt-1}개</td>
			</c:if>			
			<td>${gvo.total_price }</td>
			<td>${gvo.buyday }</td>
			<td>
				<c:if test="${gvo.state==0 }">
					<input type="button" class="btn3" value="결제취소" onclick="location='eshopG_state_change?state=1&id=${gvo.id}&jumuncode=${gvo.jumuncode }'">
					<c:if test="${(gvo.state==0) && (gvo.bname==null)}">
						<input type="button" class="btn3" value="사용완료" onclick="location='eshopG_state_change?state=3&id=${gvo.id}&jumuncode=${gvo.jumuncode }'">
					</c:if>
				</c:if>
				<c:if test="${gvo.state==1 }"> 
					<input type="button" class="btn4" value="취소진행중">
				</c:if>
				<c:if test="${gvo.state==2 }">
					<input type="button" class="btn4" value="취소완료">
				</c:if>
				<c:if test="${(gvo.state==3) && (gvo.bname !=null)}">
					<input type="button" class="btn4" value="배송완료">
				</c:if>
				<c:if test="${(gvo.state==3) && (gvo.bname==null)}">
					<input type="button" class="btn4" value="사용완료">
				</c:if>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6">
				<div id="page">
				<!-- 10페이지단위로 이동 -->
					<c:if test="${pstart==1 }">
						<a class="page_n"> << </a>
					</c:if>
					<c:if test="${pstart!=1 }">
						<a href="eshop_gumae?page=${pstart-1 }&pcnt=${pcnt}" class="page_n"> << </a>
					</c:if>	
					
				<!-- 1페이지단위로 이동 -->
					<c:if test="${page==1 }">
						<a class="page_n"> < </a>
					</c:if>
					<c:if test="${page!=1 }">
						<a href="eshop_gumae?page=${page-1 }&pcnt=${pcnt}" class="page_n"> < </a>
					</c:if>		
					
				<!-- 페이지출력	 -->
					<c:forEach begin="${pstart }" end="${pend }" var="i">
						<!-- 현재페이지 강조 -->
						<c:if test="${page==i }">
							<c:set var="st" value="style='color:white; background:#887159;'"/>
						</c:if>
						<c:if test="${page!=i }">
							<c:set var="st" value=""/>
						</c:if>
						
						<!-- 선택 페이지 이동 -->
						<a href="eshop_gumae?page=${i }&pcnt=${pcnt}" ${st } class="page_n"> ${i} </a><!--  -->
					</c:forEach>
				
				<!-- 1페이지단위로 이동 -->
					<c:if test="${page==chong }">
						<a class="page_n"> > </a>
					</c:if>
					<c:if test="${page!=chong }">
						<a href="eshop_gumae?page=${page+1 }&pcnt=${pcnt}" class="page_n"> > </a>
					</c:if>	
						
				<!-- 10페이지단위로 이동 -->
					<c:if test="${pend==chong }">
						<a class="page_n"> >> </a>
					</c:if>
					<c:if test="${pend!=chong }">
						<a href="eshop_gumae?page=${pend+1 }&pcnt=${pcnt}" class="page_n"> >> </a>
					</c:if>	
				</div>
			</td>
		</tr>
	</table>	
	<div id="txt3"> 조회 결과 </div>
		<div id="inn"></div>
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</div>
</section>
</body>