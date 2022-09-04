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

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <h3> 상담예약 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

    <!--================ Single-Wedding Area Start =================-->
    
    <section class="blog_area single-post-area section-padding">

      <div class="container" style="margin-top:100px;">
         <div class="row">
            <div class="col-lg-8 posts-list">
            
          <table width="1100" border="1">
          <tr>
          <td colspan="7">
          <c:if test="${m==1 } }">	<!-- 1월 -->
          	<a href="wedding_reserve?y=${y-1 }&m=12">이전</a>
          </c:if>
          <c:if test="${m!=1 }">	<!-- 1월아님 -->
            <a href="wedding_reserve?y=${y }&m=${m-1}">이전</a>
          </c:if>
          	${y }년 ${m }월
          <c:if test="${m==12 }">	<!-- 12월 -->
          	<a href="wedding_reserve?y=${y+1 }&m=1">다음</a>
          </c:if>
          <c:if test="${m!=12 }">	<!-- 12월아님 -->
            <a href="wedding_reserve?y=${y }&m=${m+1}">다음</a>
          </c:if>
          </td>
          
          </tr>
         <tr>
         	<td>sun</td>
         	<td>mon</td>
         	<td>tue</td>
         	<td>wed</td>
         	<td>thu</td>
         	<td>fri</td>
         	<td>sat</td>
         </tr> 
         <c:set var="day" value="1"/>
          
          <c:forEach var="i" begin="1" end="${ju }">	<!-- 행 -->
          
          <tr>
          		<c:forEach var="j" begin="0" end="6">	<!-- 열 -->
          		<c:if test="${(j < yoil && i==1) || (chong <day)}">	<!-- 1일 이전의 빈칸(열(주)이 1일의해당요일보다 작고(1일이전의 열들을 빈칸) && 모든 행이 아닌 첫번째 행만 포함) -->
          			<td> &nbsp;</td>								<!-- 해당 달의 총 일수 이후도 빈칸을 주기위해서 : 총일수(30,31)가 숫자(30~, 31~)보다 작다면  빈칸 -->
          		</c:if>
          		<c:if test="${((j >= yoil && i==1) || i>1 ) && (chong >=day)}"><!-- 열이 1일의해당요일보다 크고(1일 이후~) 첫번째 행이거나 || 또는 2번째 행부터는 모두 숫자로 표시-->
         	 		<td>${day }</td>						<!-- 날짜 -->			<!-- 위의 조건과 맞추기 위해 밑에도 총의 조건을 작성해야한다. (&& 총일수가 숫자보다 같거나 큰 경우 출력) -->
         	 	<c:set var="day" value="${day+1 }"/>	<!-- 날짜값을 1씩 증가 -->
         	 	</c:if>
          		</c:forEach>
          		
          </tr>
          
          </c:forEach>
          
          </table>
          
          <!-- 예약을 위한 정보 -->
          <!-- 객실의 이름을 출력 :get room-->
          <div></div>
          
          
          
          
          
          
          
          
          
          
          
            
             
               
     
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