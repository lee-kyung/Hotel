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
	
	section #wed_chk #txt{
	font-size:80px;
	font-family:fantasy;}
	
	section #wed_chk table input[type=radio]{
	margin-left:30px;}
	
	section #wed_chk table:first-child{
	margin-top:100px;
	width:1100px;
	border-left:none;
	border-right:none;
	border-top:white;}
	
	section #wed_chk table:first-child td{
	padding:20px;
	border-left:none;
	border-right:none;}
	
	section #wed_chk table:first-child td:first-child{
	font-weight:600;}
	
	section #wed_chk table:first-child #txt2{
	font-weight:100;
	font-size:13px;}
	
	section #wed_chk table:first-child td:first-child{
	width:200px;}
	
	section #wed_chk table:first-child select{
	width:100px;
	height:50px;
	outline:none;
	border: 1px solid #cccccc;}
	
	section #wed_chk table:first-child select option{
	font-size:16px;}
	
	section #wed_chk table:last-child{
	width:1000px;
	margin-top:100px;
	border:1px solid #cccccc;
	border-spacing:25px;
    border-collapse:separate;
    border-radius:20px;}
	
	section #wed_chk table:last-child td{
	padding:20px;}
	
	section #wed_chk table:last-child td:first-child, td:nth-child(3){
	width:200px;
	font-weight:600;}
	
	section #wed_chk table:last-child td:nth-child(2), td:nth-child(4){
	width:250px;}
	
	section #wed_chk table:last-child td:nth-child(2), td:nth-child(4){
	text-align:right;}
	
	section #wed_chk table:last-child tr:last-child{
	height:150px;
	text-align:center;}
	
	section #wed_chk table:last-child #total{
	padding-left:100px;}
	
	#wed_hall3{
	margin-top:50px;
	text-align:right;
	width:100%;
	font-size:18px;
	padding-top:50px;
	padding-bottom:50px;
	background:#EAEAEA;
	margin-bottom:100px;}
	
	#wed_hall3 button{
	margin-top:20px;
	width:250px;
	height:70px;}
	
	#wed_chk2 img{
	width:100%;}
	
	section #wed_chk table:first-child #tr_food1, #tr_food2{
	display:none; }
	
	section #wed_chk table:first-child #btn1, #btn2{
	width:120px;
	height:30px;
	padding-left:30px;
	padding-bottom:30px;}
	
	section #wed_chk table:first-child #btn2{
	margin-left:30px;}
</style>

</head>

<body>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<script>

	function change_food1()
	{
  		document.getElementById("f_1").style.color="#cccccc";
  		document.getElementById("f_2").style.color="#cccccc";
  		document.getElementById("f_3").style.color="black";
  		document.getElementById("f_4").style.color="black";
  		document.getElementById("tr_food1").style.display="table-row";
  		document.getElementById("f_txt").innerText="동시예식";
  		document.pay.food1.value="0";
  		document.getElementById("f1").disabled=true;
  		document.getElementById("f2").disabled=true;
  		document.getElementById("f3").disabled=false;
  		document.getElementById("f4").disabled=false;
	}	

	function change_food2()
	{
		document.getElementById("f_3").style.color="#cccccc";
  		document.getElementById("f_4").style.color="#cccccc";
  		document.getElementById("f_1").style.color="black";
  		document.getElementById("f_2").style.color="black";
  		document.getElementById("tr_food1").style.display="table-row";
  		document.getElementById("f_txt").innerText="분리예식";
  		document.pay.food1.value="0";
  		document.getElementById("f1").disabled=false;
  		document.getElementById("f2").disabled=false;
  		document.getElementById("f3").disabled=true;
  		document.getElementById("f4").disabled=true;
	}
	
	function total_price()
	{
		var hall=document.pay.hall.value;
		document.getElementById("hall").innerText=new Intl.NumberFormat().format(hall);
		
		var day=document.pay.day.value;
		document.getElementById("day").innerText=new Intl.NumberFormat().format(day);
		
		var time=document.pay.time.value;
		document.getElementById("time").innerText=new Intl.NumberFormat().format(time);
		
		var inwon=document.pay.inwon.value;
		document.getElementById("inwon").innerText=new Intl.NumberFormat().format(inwon);
		
		
		var food_inwon1=document.pay.food_inwon1.value;
		var food1=document.pay.food1.value;
		var food_price1=food_inwon1*food1;
		document.getElementById("food1").innerText=new Intl.NumberFormat().format(food_price1);				

		var food3=document.pay.food3.value;
		document.getElementById("food3").innerText=new Intl.NumberFormat().format(food3);
		
		var mc=document.pay.mc.value;
		document.getElementById("mc").innerText=new Intl.NumberFormat().format(mc);
		
		var flower=document.pay.flower.value;
		document.getElementById("flower").innerText=new Intl.NumberFormat().format(flower);
		
		var bouquet=document.pay.bouquet.value;
		document.getElementById("bouquet").innerText=new Intl.NumberFormat().format(bouquet);
		
		var direct1=document.pay.direct1.value;
		document.getElementById("direct1").innerText=new Intl.NumberFormat().format(direct1);
		
		var direct2=document.pay.direct2.value;
		document.getElementById("direct2").innerText=new Intl.NumberFormat().format(direct2);
		
		var direct3=document.pay.direct3.value;
		document.getElementById("direct3").innerText=new Intl.NumberFormat().format(direct3);
		
		var total=Number(hall)+Number(day)+Number(time)+Number(inwon)+Number(food_price1)+Number(food3)+Number(mc)+Number(flower)+Number(bouquet)+Number(direct1)+Number(direct2)+Number(direct3);
		document.getElementById("total").innerText=new Intl.NumberFormat().format(total);
		
		document.pay.total.value=total;
		
	}
</script>


	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <h3> 사전견적 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

    <!--================ Single-Wedding Area Start =================-->



<section>
<div id="wed_chk">

	<div id="txt">WEDDINGz</div>

	 <form name="pay" method="post">   
          <table border="1" align="center">
          <tr>
          	<td>홀 <span id="txt2">(최소인원/최대인원)</span></td>
          	<td>
			<c:forEach items="${list }" var="wvo">
				<input type="radio" name="hall" value="${wvo.wed_price }" onchange="total_price()">${wvo.wed_hall } (${wvo.wed_min }/${wvo.wed_max })
			</c:forEach>
          	</td>
          </tr>
          <tr>
          	<td>평일/주말</td>
          	<td>
          	<input type="radio" name="day" onchange="total_price()" value="100">평일
          	<input type="radio" name="day" onchange="total_price()" value="150">주말
          	</td>
          </tr>
          <tr>
          	<td>시간</td>
          	<td>
          	<input type="radio" name="time" onchange="total_price()" value="100">12:00~15:00
          	<input type="radio" name="time" onchange="total_price()" value="150">18:00~21:00
          	</td>
          </tr>
          <tr>
          	<td>인원</td>
          	<td>
          	<input type="radio" name="inwon" onchange="total_price()" value="0" checked>최소인원
          	<input type="radio" name="inwon" onchange="total_price()" value="80">+50인
          	<input type="radio" name="inwon" onchange="total_price()" value="140">+100인
          	<input type="radio" name="inwon" onchange="total_price()" value="250">+200인
          	</td>
          </tr>
          <tr>
          	<td>하객음식</td>
          	<td>	
          		<input type="button" id="btn2" class="button button-contactForm btn_1 boxed-btn" onclick="change_food2()" value="분리예식">
          		<input type="button" id="btn1" class="button button-contactForm btn_1 boxed-btn" onclick="change_food1()" value="동시예식">
          	</td>
          </tr>
          <tr id="tr_food1">
          	<td><span id="f_txt"></span></td>
          	<td>
          	<input type="radio" name="food1" onchange="total_price()" value="0">선택안함
          	<input type="radio" name="food1" id="f1" onchange="total_price()" value="4"><span id="f_1">4만원</span>
          	<input type="radio" name="food1" id="f2" onchange="total_price()" value="6.5"><span id="f_2">6.5만원</span>
          	<input type="radio" name="food1" id="f3" onchange="total_price()" value="7"><span id="f_3">7만원</span>
          	<input type="radio" name="food1" id="f4" onchange="total_price()" value="10"><span id="f_4">10만원</span>
          	x
          	<select name="food_inwon1" onchange="total_price()">
          			<option value="100">100명</option>
          			<option value="150">150명</option>
          			<option value="200">200명</option>
          			<option value="300">300명</option>
          	</select>
          	</td>
          </tr>
          <tr>
          	<td>폐백음식</td>
          	<td>
          	<input type="radio" name="food3" onchange="total_price()" value="0" checked>선택안함
          	<input type="radio" name="food3" onchange="total_price()" value="10">10만원
          	<input type="radio" name="food3" onchange="total_price()" value="20">20만원
          	</td>
          </tr>
          <tr>
          	<td>사회자</td>
          	<td>
          	<input type="radio" name="mc" onchange="total_price()" value="0" checked>선택안함
          	<input type="radio" name="mc" onchange="total_price()" value="20">필요
          	</td>
          </tr>
          <tr>
          	<td>생화</td>
          	<td>
          	<input type="radio" name="flower" onchange="total_price()" value="0" checked>선택안함
          	<input type="radio" name="flower" onchange="total_price()" value="500">500만원
          	<input type="radio" name="flower" onchange="total_price()" value="800">800만원
          	<input type="radio" name="flower" onchange="total_price()" value="1200">1,200만원
          	</td>
          </tr>
          <tr>
          	<td>스크린상영</td>
          	<td>
          	<input type="radio" name="direct1" onchange="total_price()" value="0" checked>선택안함
          	<input type="radio" name="direct1" onchange="total_price()" value="30">스크린상영
          	</td>
          </tr>
          <tr>
          	<td>특수조명</td>
          	<td>
          	<input type="radio" name="direct2" onchange="total_price()" value="0" checked>선택안함
          	<input type="radio" name="direct2" onchange="total_price()" value="30">특수조명
          	</td>
          </tr>
          <tr>
          	<td>음향시스템</td>
          	<td>
          	<input type="radio" name="direct3" onchange="total_price()" value="0" checked>선택안함
          	<input type="radio" name="direct3" onchange="total_price()" value="30">음향시스템
          	</td>
          </tr>
          <tr>
          	<td>부케</td>
          	<td>
          	<input type="radio" name="bouquet" onchange="total_price()" value="0" checked>선택안함
          	<input type="radio" name="bouquet" onchange="total_price()" value="20">20만원
          	<input type="radio" name="bouquet" onchange="total_price()" value="30">30만원
          	</td>
          </tr>
          </table>     
          
          <table align="center">
          <tr>
          	<td>홀</td>
         	<td><span id="hall" >0</span>만원</td>
         	<td>평일/주말</td>
         	<td><span id="day" >0</span>만원</td>
          </tr>
          <tr>
          	<td>시간</td>
         	<td><span id="time">0</span>만원</td>
         	<td>인원</td>
         	<td><span id="inwon">0</span>만원</td>
          </tr>
          <tr>
          	<td>하객음식</td>
         	<td><span id="food1">0</span>만원</td>
         	<td>폐백음식</td>
         	<td><span id="food3">0</span>만원</td>
          </tr>
          <tr>
          	<td>사회자</td>
         	<td><span id="mc">0</span>만원</td>
         	<td>부케</td>
         	<td><span id="bouquet">0</span>만원</td>
          </tr>
          <tr>
          	<td>생화</td>
         	<td><span id="flower">0</span>만원</td>
         	<td>스크린상영</td>
         	<td><span id="direct1">0</span>만원</td>
          </tr>
          <tr>
          	<td>특수조명</td>
         	<td><span id="direct2">0</span>만원</td>
         	<td>음향시스셈</td>
         	<td><span id="direct3">0</span>만원</td>
          </tr>
          <tr>
         	 <td colspan="4">총 금액 <span id="total">0</span>만원</td>
          </tr>
          </table>
      </form>  
</div>
</section>

<div id="wed_chk2">
	<img src="../img/wedding/wedding_chk.jpg">
</div>
<div id="wed_hall3">
	 
	<div id="txt"> 운영일 : 월~일요일 &emsp;|&emsp; 운영시간 : 10:00 ~ 18:00 &emsp;|&emsp; Tel : 02-000-000</div>
			
	<button type="submit" class="button button-contactForm btn_1 boxed-btn" onclick="location='../wedding/wedding_reserve'">예약하기</button>
		
</div>
 
   <!--================ Single-Wedding Area end =================-->

</body>