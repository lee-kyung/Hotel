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
	
	#btn{
	width:1100px;}
	#btn .form-group{
	display:inline-block;}
	
	#btn #right{
	float:right;}
	
	#mm #main{
	width:1100px;
	height:550px;
	overflow:hidden;}
	#mm #main #sub{
	width:4500px;
	height:550px;}
	
	#mm{
	width:1100px;
	height:550px;}
	
	
	
.slider{
    width: 1100px;
    height: 550px;
    position: relative;
    margin: 0 auto;
    overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
}
.slider input[type=radio]{
    display: none;
}ul.imgs{
    padding: 0;
    margin: 0;
    list-style: none;    
}
ul.imgs li{
    position: absolute;
    left: 640px;
    transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */

    padding: 0;
    margin: 0;
}.bullets{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    bottom: 20px;
    z-index: 2;
}
.bullets label{
    display: inline-block;
    border-radius: 50%;
    background-color: rgba(0,0,0,0.55);
    width: 20px;
    height: 20px;
    cursor: pointer;
}
/* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
    background-color: #fff;
}.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
    left: 0;
    transition: 0.5s;
    z-index:1;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex-1].style.display = "block";
}


function a_hall()
{
	document.getElementById("aa").innertext="dmdm";
}

</script>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <h3> 웨딩홀 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

    <!--================ Single-Wedding Area Start =================-->
    

  <div id="aa" style="margin-top:50px;">
<div style="border-bottom:1px solid #f0e9ff; width:1100px;">  
                <div style="margin-bottom:50px;">       
                     <ul id="hall">
                     	<li><h2><a onclick="a_hall()">a홀</a></h2></li>
                     	<li><h2><a href="">b홀</a></h2></li>
                     	<li><h2><a href="">c홀</a></h2></li>
                     	<li><h2><a href="">d홀</a></h2></li>
                     </ul>
</div></div>
                     </div>
    
     
   
     
     
     
    
    <section class="blog_area single-post-area section-padding">


      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
                  <div class="feature-img">
                  
           <div class="slider">
    <input type="radio" name="slide" id="slide1" checked>
    <input type="radio" name="slide" id="slide2">
    <input type="radio" name="slide" id="slide3">
    <input type="radio" name="slide" id="slide4">
    <ul id="imgholder" class="imgs">
        <li><img src="../img/post/post_7.png" width="1100" height="550"></li>
        <li><img src="../img/post/post_8.png" width="1100" height="550"></li>
        <li><img src="../img/post/post_9.png" width="1100" height="550"></li>
        <li><img src="../img/post/post_10.png" width="1100" height="550"></li>
    </ul>
    <div class="bullets">
        <label for="slide1">&nbsp;</label>
        <label for="slide2">&nbsp;</label>
        <label for="slide3">&nbsp;</label>
        <label for="slide4">&nbsp;</label>
    </div>
</div>
           
           
           
           <img class="mySlides" src="../img/post/post_10.png" width="1100" height="550">
<img class="mySlides" src="../img/post/post_4.png" width="1100" height="550">
<img class="mySlides" src="../img/post/post_3.png" width="1100" height="550">
<img class="mySlides" src="../img/post/post_2.png" width="1100" height="550">
<a class="w3-btn-floating" onclick="plusDivs(-1)">&#10094;</a>
<a class="w3-btn-floating" onclick="plusDivs(+1)">&#10095;</a>


   <!--                 
                  <div id="mm">
                  <div id="main">
                     <div id="sub">
                    <img src="../img/blog/single_blog_2.png" width="1100" height="550"><img src="../img/post/post_8.png"   width="1100" height="550"><img src="../img/post/post_9.png"  width="1100" height="550"><img src="../img/post/post_10.png"  width="1100" height="550">
                     </div>
                     </div>
                  </div>
         -->         
               </div>
               
               <div id="btn">
     <div class="form-group" id="left">
                        <button type="submit" class="button button-contactForm btn_1 boxed-btn" id="be"><-</button>
                     </div>
       <div class="form-group" id="right">
      <button type="submit" class="button button-contactForm btn_1 boxed-btn" id="af">-></button>
          </div>
<<<<<<< HEAD
         
=======
>>>>>>> branch 'main' of https://github.com/ey0k/hotel.git
                    </div> 
                     
                     
                     
         
                     
                   
                     
                     



                    
                     
                     <!--  
                     
<div class="container">
         <div class="row">
    
   
    <div id="bb">
               <div class="blog_right_sidebar">
    <aside class="single_sidebar_widget instagram_feeds">
                    
                     <ul class="b">
                        <li>
                          
                              <img src="../img/post/post_5.png" alt="">
                         
                        </li>
                        <li>
                          
                              <img  src="../img/post/post_6.png" alt="">
                          
                        </li>
                        <li>
                           
                              <img  src="../img/post/post_7.png" alt="">
                           
                        </li>
                        <li>
                          
                              <img src="../img/post/post_8.png" alt="">
                         
                        </li>
                        <li>
                          
                              <img src="../img/post/post_9.png" alt="">
                          
                        </li>
                        <li>
                           
                              <img src="../img/post/post_10.png" alt="">
                      
                        </li>
                     </ul>
                  </aside>
         </div>
         </div>         
                
         </div></div>           
         
         -->
        
         
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
         
        
        
        >
    
    
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