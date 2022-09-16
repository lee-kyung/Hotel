<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>

	 #hall li{
	display:inline-block;	
	width:150px;}
	#aa{
	width:1100px;
	margin:auto;}
	
	#bb .blog_right_sidebar{
	width:1100px;}
	#bb .blog_right_sidebar ul li{
	display:inline-block;	}
	#bb .blog_right_sidebar img{
	width:120px;}
	
	.c{
	height:400px;}
	
	.widget_title{
	}
</style>

</head>

<body>
<script>
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
	
	var food_inwon2=document.pay.food_inwon2.value;
	var food2=document.pay.food2.value;
	var food_price2=food_inwon2*food2;
	document.getElementById("food2").innerText=new Intl.NumberFormat().format(food_price2);
	
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
	
	var total=Number(hall)+Number(day)+Number(time)+Number(inwon)+Number(food_price1)+Number(food_price2)+Number(food3)+Number(mc)+Number(flower)+Number(bouquet)+Number(direct1)+Number(direct2)+Number(direct3);
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
    
    <section class="blog_area single-post-area section-padding">

 <div class="container" style="margin-top:100px;">

         <div class="row">
            <div class="col-lg-8 posts-list">
       <form name="pay" method="post">   
          <table width="1100" border="1">
          <tr>
          	<td>홀</td>
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
          	<td>인원(최소인원/최대인원)</td>
          	<td>
          	<input type="radio" name="inwon" onchange="total_price()" value="0" checked>최소인원
          	<input type="radio" name="inwon" onchange="total_price()" value="80">+50인
          	<input type="radio" name="inwon" onchange="total_price()" value="140">+100인
          	<input type="radio" name="inwon" onchange="total_price()" value="250">+200인
          	</td>
          </tr>
          <tr>
          	<td>하객음식_동시예식</td>
          	<td>
          	<input type="radio" name="food1" onchange="total_price()" value="0">선택안함
          	<input type="radio" name="food1" onchange="total_price()" value="7">7만원
          	<input type="radio" name="food1" onchange="total_price()" value="10">10만원
          	x<input type="text" name="food_inwon1" onchange="total_price()" placeholder="인원수 입력">
          	
          	</td>
          </tr>
          <tr>
          	<td>하객음식_분리예식</td>
          	<td>
          	<input type="radio" name="food2" onchange="total_price()" value="0">선택안함
          	<input type="radio" name="food2" onchange="total_price()" value="4">4만원
          	<input type="radio" name="food2" onchange="total_price()" value="6.5">6.5만원
          	x<input type="text" name="food_inwon2" onchange="total_price()" placeholder="인원수 입력">
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
          
          <!-- 비용보이기 -->
          <table width="1100" border="1">
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
          	<td>동시예식</td>
         	<td><span id="food1">0</span>만원</td>
         	<td>분리예식</td>
         	<td><span id="food2">0</span>만원</td>
          </tr>
          <tr>
          	<td>폐백음식</td>
         	<td><span id="food3">0</span>만원</td>
         	<td>사회자</td>
         	<td><span id="mc">0</span>만원</td>
          </tr>
          <tr>
          	<td>생화</td>
         	<td><span id="flower">0</span>만원</td>
         	<td>부케</td>
         	<td><span id="bouquet">0</span>만원</td>
          </tr>
          <tr>
          	<td>스크린상영</td>
         	<td><span id="direct1">0</span>만원</td>
         	<td>특수조명</td>
         	<td><span id="direct2">0</span>만원</td>
          </tr>
          <tr>
          	<td>음향시스셈</td>
         	<td colspan="3"><span id="direct3">0</span>만원</td>
          </tr>
          <tr>
         	 <td>총 금액</td>
         	 <td colspan="3"><span id="total">0</span>만원</td>
          </tr>
          </table>
      </form>      
          
          
          
          
          
          
          
            
             
               
     
<div class="container">
         <div class="row">
    
    <div class="col-lg-4">
    <div id="bb">
               <div class="blog_right_sidebar">
    <aside class="single_sidebar_widget instagram_feeds">
                     <h4 class="widget_title">pic</h4>
                     <ul class="b">
                        <li>
                           <a href="#">
                              <img src="../img/post/post_5.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img  src="../img/post/post_6.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img  src="../img/post/post_7.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img src="../img/post/post_8.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img src="../img/post/post_9.png" alt="">
                           </a>
                        </li>
                        <li>
                           <a href="#">
                              <img src="../img/post/post_10.png" alt="">
                           </a>
                        </li>
                     </ul>
                  </aside>
         </div>
         </div>         
                 </div> 
         </div></div>            
               
               
               
        
         
<div class="form-group">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn">예약하기</button>
                     </div>
                     <div style="border-bottom:1px solid #f0e9ff; width:1100px;"></div>
          </div>     

            
            
            
            
        <div id="c">
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
               
                   
         <table width="1100">
         <tr>
         <td colspan="3" style="background:#f9f9ff; border-bottom:1px solid #f0e9ff; height:60px;">
         
        
         <h4 >웨딩홀이름</h4>
        
         
         </td>
         </tr>
         	<tr>
         		<td><aside class="single_sidebar_widget post_category_widget">
         		<div class="c">
                     
                     <ul class="list cat-list">
                        <li>
                           <a href="#" class="d-flex">
                              <p>Resaurant food</p>
                              <p>(37)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Travel news</p>
                              <p>(10)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Modern technology</p>
                              <p>(03)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Product</p>
                              <p>(11)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Inspiration</p>
                              <p>(21)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Health Care</p>
                              <p>(21)</p>
                           </a>
                        </li>
                     </ul></div>
                  </aside></td>
         	
         		<td><aside class="single_sidebar_widget post_category_widget">
                     <div class="c">
                     <ul class="list cat-list">
                     
                        <li>
                           <a href="#" class="d-flex">
                              <p>Resaurant food</p>
                              <p>(37)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Travel news</p>
                              <p>(10)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Modern technology</p>
                              <p>(03)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Product</p>
                              <p>(11)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Inspiration</p>
                              <p>(21)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Health Care</p>
                              <p>(21)</p>
                           </a>
                        </li>
                     </ul></div>
                  </aside></td>
         
         		<td><aside class="single_sidebar_widget post_category_widget">
                     <div class="c">
                     <ul class="list cat-list">
                        <li>
                           <a href="#" class="d-flex">
                              <p>Resaurant food</p>
                              <p>(37)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Travel news</p>
                              <p>(10)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Modern technology</p>
                              <p>(03)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Product</p>
                              <p>(11)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Inspiration</p>
                              <p>(21)</p>
                           </a>
                        </li>
                        <li>
                           <a href="#" class="d-flex">
                              <p>Health Care</p>
                              <p>(21)</p>
                           </a>
                        </li>
                     </ul></div>
                  </aside></td>
         	</tr>
         
         </table>   
            
            
            
            
                  
                  
 
                  
               
               </div>
            </div>
         </div>
         </div>
      </div>
   </section>
   <!--================ Single-Wedding Area end =================-->

</body>