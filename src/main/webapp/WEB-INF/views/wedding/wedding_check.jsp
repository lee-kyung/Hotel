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
	height:50px;
	border:1px solid #887159;
	background:white;
	color:#887159;
	cursor:pointer;}
	
	section #wed_chk table:first-child #btn1:hover, #btn2:hover{
	background:#887159;
	color:white;}
	
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
  		document.getElementById("f_txt").innerText="????????????";
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
  		document.getElementById("f_txt").innerText="????????????";
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


	<!-- ================ (Sitemesh) Top Area ????????? Start ================= -->
    <!-- bradcam_area_start -->
    <!-- ??? ????????? ???????????? ???
    	???[webapp\resources\css]????????? ?????? [style.css]????????? ????????? ????????????
    	???[webapp\resources\img\banner]????????? ?????????????????? ???????????? -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area ????????????" -->
        <div id="h3">WEDDING</div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area ????????? End ================= -->

    <!--================ Single-Wedding Area Start =================-->



<section>
<div id="wed_chk">

	<div id="txt">WEDDING</div>
	<div style="text-align:right;">?????? ????????? ???????????? ????????? ?????? ????????? ????????? ????????? ??? ??? ????????????.</div>
	 <form name="pay" method="post">   
          <table border="1" align="center">
          <tr>
          	<td>??? <span id="txt2">(????????????/????????????)</span></td>
          	<td>
			<c:forEach items="${list }" var="wvo">
				<input type="radio" name="hall" value="${wvo.wed_price }" onchange="total_price()">${wvo.wed_hall } (${wvo.wed_min }/${wvo.wed_max })
			</c:forEach>
          	</td>
          </tr>
          <tr>
          	<td>??????/??????</td>
          	<td>
          	<input type="radio" name="day" onchange="total_price()" value="100">??????
          	<input type="radio" name="day" onchange="total_price()" value="150">??????
          	</td>
          </tr>
          <tr>
          	<td>??????</td>
          	<td>
          	<input type="radio" name="time" onchange="total_price()" value="100">12:00~15:00
          	<input type="radio" name="time" onchange="total_price()" value="150">18:00~21:00
          	</td>
          </tr>
          <tr>
          	<td>??????</td>
          	<td>
          	<input type="radio" name="inwon" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="inwon" onchange="total_price()" value="80">+50???
          	<input type="radio" name="inwon" onchange="total_price()" value="140">+100???
          	<input type="radio" name="inwon" onchange="total_price()" value="250">+200???
          	</td>
          </tr>
          <tr>
          	<td>????????????</td>
          	<td>	
          		<input type="button" id="btn2"  onclick="change_food2()" value="????????????">
          		<input type="button" id="btn1"  onclick="change_food1()" value="????????????">
          	</td>
          </tr>
          <tr id="tr_food1">
          	<td><span id="f_txt"></span></td>
          	<td>
          	<input type="radio" name="food1" onchange="total_price()" value="0">????????????
          	<input type="radio" name="food1" id="f1" onchange="total_price()" value="4"><span id="f_1">4??????</span>
          	<input type="radio" name="food1" id="f2" onchange="total_price()" value="6.5"><span id="f_2">6.5??????</span>
          	<input type="radio" name="food1" id="f3" onchange="total_price()" value="7"><span id="f_3">7??????</span>
          	<input type="radio" name="food1" id="f4" onchange="total_price()" value="10"><span id="f_4">10??????</span>
          	x
          	<select name="food_inwon1" onchange="total_price()">
          			<option value="100">100???</option>
          			<option value="150">150???</option>
          			<option value="200">200???</option>
          			<option value="300">300???</option>
          	</select>
          	</td>
          </tr>
          <tr>
          	<td>????????????</td>
          	<td>
          	<input type="radio" name="food3" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="food3" onchange="total_price()" value="10">10??????
          	<input type="radio" name="food3" onchange="total_price()" value="20">20??????
          	</td>
          </tr>
          <tr>
          	<td>?????????</td>
          	<td>
          	<input type="radio" name="mc" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="mc" onchange="total_price()" value="20">??????
          	</td>
          </tr>
          <tr>
          	<td>??????</td>
          	<td>
          	<input type="radio" name="flower" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="flower" onchange="total_price()" value="500">500??????
          	<input type="radio" name="flower" onchange="total_price()" value="800">800??????
          	<input type="radio" name="flower" onchange="total_price()" value="1200">1,200??????
          	</td>
          </tr>
          <tr>
          	<td>???????????????</td>
          	<td>
          	<input type="radio" name="direct1" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="direct1" onchange="total_price()" value="30">???????????????
          	</td>
          </tr>
          <tr>
          	<td>????????????</td>
          	<td>
          	<input type="radio" name="direct2" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="direct2" onchange="total_price()" value="30">????????????
          	</td>
          </tr>
          <tr>
          	<td>???????????????</td>
          	<td>
          	<input type="radio" name="direct3" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="direct3" onchange="total_price()" value="30">???????????????
          	</td>
          </tr>
          <tr>
          	<td>??????</td>
          	<td>
          	<input type="radio" name="bouquet" onchange="total_price()" value="0" checked>????????????
          	<input type="radio" name="bouquet" onchange="total_price()" value="20">20??????
          	<input type="radio" name="bouquet" onchange="total_price()" value="30">30??????
          	</td>
          </tr>
          </table>     
          
          <table align="center">
          <tr>
          	<td>???</td>
         	<td><span id="hall" >0</span>??????</td>
         	<td>??????/??????</td>
         	<td><span id="day" >0</span>??????</td>
          </tr>
          <tr>
          	<td>??????</td>
         	<td><span id="time">0</span>??????</td>
         	<td>??????</td>
         	<td><span id="inwon">0</span>??????</td>
          </tr>
          <tr>
          	<td>????????????</td>
         	<td><span id="food1">0</span>??????</td>
         	<td>????????????</td>
         	<td><span id="food3">0</span>??????</td>
          </tr>
          <tr>
          	<td>?????????</td>
         	<td><span id="mc">0</span>??????</td>
         	<td>??????</td>
         	<td><span id="bouquet">0</span>??????</td>
          </tr>
          <tr>
          	<td>??????</td>
         	<td><span id="flower">0</span>??????</td>
         	<td>???????????????</td>
         	<td><span id="direct1">0</span>??????</td>
          </tr>
          <tr>
          	<td>????????????</td>
         	<td><span id="direct2">0</span>??????</td>
         	<td>???????????????</td>
         	<td><span id="direct3">0</span>??????</td>
          </tr>
          <tr>
         	 <td colspan="4">??? ?????? <span id="total">0</span>??????</td>
          </tr>
          </table>
      </form>  
</div>
</section>

<div id="wed_chk2">
	<img src="../img/wedding/wedding_chk.jpg">
</div>
<div id="wed_hall3">
	 
	<div id="txt"> ????????? : ???~????????? &emsp;|&emsp; ???????????? : 10:00 ~ 18:00 &emsp;|&emsp; Tel : 02-000-000</div>
			
	<button type="submit" class="button button-contactForm btn_1 boxed-btn" onclick="location='../wedding/wedding_reserve'">????????????</button>
		
</div>
 
   <!--================ Single-Wedding Area end =================-->

</body>