<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
/*   .about_info_area .about_active owl-carousel {
    display: block;
    margin-left: auto;
    margin-right: auto 
  } */

  .img_3{
     text-align:center;
     margin:auto;
  }
  .about{
     text-align:left;
     margin:auto;
  }
  #logo{
     font-family:fantasy;
     color:#887159;
     font-size:60px;
  }
  .genric-btn .default{
     background:#a28d78;
     color:#f2f1ef;
     width:200px;
     height:50px;
     font-size:16px;
     text-align:center;
     vertical-align:center;
     padding: 5px 0px;
  }
  .genric-btn.default:hover{
     background: #887159;
  }
  .section_title span{
     color:black;
     font-size:17px;
  }
  #h3{
     text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
  }

  .about_main_info{
     margin:auto;
     text-align:center;
  }
  #middle{
	 font-family:fantasy;
	 font-size:50px;
	 color:#887159;
	 text-align:center;
  }
  .container{
	/* width: 990px; */
	margin: auto;
  }
  diningsec{
     margin:auto;
  }
  diningsec #outer{
  	 margin:auto;
     outline:1px solid #887159;
     width:1000px;
     height:950px;
     background:#e5e4e2;
     margin-top:40px;
     margin-bottom:100px;
  }
  diningsec #outer #left{
     /* background:gold; */ 
	 width:240px;
	 padding:15px;
	 padding-top:24px;
	 float:left;
	 margin:auto;
	 /* border:1px solid red; */
	 text-align:center;
  }
  diningsec #outer #left b{
     color:black;
     font-size:20px;

  } 
  diningsec #outer #right{
     /* background:orange; */
	 width:760px;
	 float:right;
	 /* border:1px solid blue; */
  }
  diningsec #info_con{
    line-height:2;
    text-align:left;
    margin-left:47px;
    margin-right:10px;
    margin-top:25px;
    font-size:15px;
  }
  diningsec #info_con b{
    font-size:17px;
    color:black;
  }
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area s7">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> DINE & DRINK </div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
         <!-- <img src="../img/banner/dining2.jpg" width="700"> -->
	<!-- ================ Dining Area Start ================= -->
    <!-- about_area_start -->
    <div class="about_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-5">
                    <div class="about_info">
                        <div class="section_title mb-20px">
                            <span>About Us</span>
                            <div id="logo"> L A&nbsp;&nbsp;M E R </div>
                        </div>
                        <p>호텔 부산의 다양한 레스토랑에서
						    마스터 쉐프들이 펼치는 화려한 미식의 세계로 초대합니다.</p>
                        <a href="../dining/dining_reserve" class="genric-btn default">온라인 예약</a>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7">
                    <div class="about_thumb d-flex">
                        <div class="img_1">
                            <img src="../img/about/m1.jpg" alt="" width="250" height="280">
                        </div>
                        <div class="img_2">
                            <img src="../img/about/m2.jpg" alt="" width="500" height="250">
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
    <!-- about_area_end -->

    <!-- about_info_area_start -->
    <div class="about_info_area">
              <div id="middle">Gallery</div>
<div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider d-flex align-items-center justify-content-center s1"></div>
            <div class="single_slider s2"></div>
            <div class="single_slider s3"></div>
            <div class="single_slider s5"></div>
            <div class="single_slider lunch"></div>
            <div class="single_slider s6"></div>
            <div class="single_slider s7"></div>
            <div class="single_slider s8"></div>
            <div class="single_slider s"></div>
        </div>
</div>
</div>
    <!-- about_info_area_start -->

    <!-- about_main_info_start -->
    <div class="about_main_info">
  		<b>직접 가꾼 채소로 만든 식탁</b><br>
    	저희 농장은 농약 없이 수경 재배를 통해 채소들을 키웁니다.<br>
		채소들이 가장 좋아하는 온습도를 맞춰주고, 아픈 곳은 없는지 살피며 튼튼하게 자라도록 돕습니다.<br>
		<br>
		무럭무럭 자라난 식재료는<br>
		샐러드로, 쌈채소로, 깊은 향을 내는 허브로, 숲을 옮겨온 듯 건강한 식탁을 만들죠.<br>
		<br>
		자연이 우리 삶에 좀더 가까워졌으면 하는 바람 위에<br>
		저희 호텔은 오늘도 건강한 식탁을, 건강한 내일을 만들어 갑니다.
    </div>
<div class="container">
 <div id="row">
   <diningsec>
    <div id="outer">
      	<div id="left">
    	   <b>이용안내</b>		  
     	 </div>

      <div id="right">
		<div id="info_con">

		      <div><b>운영시간</b><br><br></div>
		      <div id="time">
    			아침 08:00 - 10:50 (마지막 입장 10:10)<br>
				점심 13:00 - 15:50 (LAST ORDER 14:00)<br>
				* 중식은 런치 코스 또는 한식 코스, 키즈세트 메뉴로 운영합니다.<br>
				저녁 16:00 - 19:50 (LAST ORDER 18:30)<br>
				* 석식은 디너 코스 또는 한식 코스, 키즈세트 메뉴로 운영합니다.<br><br>
		      </div>
		      <div><b>가격</b><br><br></div>
		      	<div id="pri">
    			아침 : 성인 60,000원 / 소인(49개월~13세) 30,000원<br>
				점심 : 런치코스 105,000원 / 소인(49개월~13세) 52,500원<br>
				저녁 : 디너코스 120,000원 / 소인(49개월~13세) 60,000원<br><br>
		      	</div>

		     <div><b>그릴 BBQ 다이닝</b><br><br></div>
		      	<div id="bbq">
				[ 운영 시간 ]<br>
				18:00~22:00 (Last Order 20:00)<br>
				<br>
				[ 그릴 BBQ 세트 (200,000원) ]<br>
				- 브래드, 애피타이저<br>
				- 그릴 미트 앤 씨푸드 플래터 (한우 채끝, 양갈비, 폭립, 삼겹, 닭구이, 가리비, 새우, 전복, 구운 야채, 소시지)<br>
				- 바틀 와인 1병(레드 또는 스파클링)<br>
				- 에이드 1잔<br>
				- 소르베<br><br>
				*신선한 식재료 준비를 위해 사전예약 및 당일 한정 수량으로 판매합니다.<br>
				*상기 메뉴는 식재료에 따라 변동될 수 있습니다.<br><br>
		   		</div>

		</div>
      </div>
      
    </div>
   </diningsec>
 </div>
</div>

    <!-- about_main_info_end -->

    <!-- ================ Dining Area End ================= -->

</body>