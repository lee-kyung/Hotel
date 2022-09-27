<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
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
     font-size:40px;
  }
  .genric-btn.default{
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
                            <div id="logo"> L A  M E R </div>
                        </div>
                        <p>파라다이스호텔 부산의 다양한 레스토랑에서
마스터 쉐프들이 펼치는 화려한 미식의 세계로 초대합니다.</p>
                        <!-- <a href="../dining/dining_reserve" class="line-button">예약하기</a> -->
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
        <div class="about_active owl-carousel">
            <div class="single_slider s1"></div>
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
    <!-- about_info_area_start -->

    <!-- about_main_info_start -->
    <div class="about_main_info">
        <!-- <div class="container">
            <div class="row">
                <div class="col-xl-6 col-md-6">
                    <div class="single_about_info">
                        <h3>천혜의 자연경관인 해운대 바다와 해변 그리고 초록빛 가든의 멋진 경치를 감상하며 미식을 즐길 수 있는 공간 <br>
                            </h3>
                            <p>야외 테라스 다이닝 공간과 모든 섹션이 라이브로 운영되는 올 오픈 키친(All Open Kitchen) <br>
                                       그리고 마스터 셰프들이 전국 각지의 진귀하고 독특한 제철 식재료만을 직접 엄선, 발굴하여 각 지역 본연의 맛을 살린 럭셔리한 미식을 경험하세요.
                            </p>
                    </div>
                </div>
                <div class="col-xl-6 col-md-6">
                    <div class="single_about_info">
                        <h3>We Serve Fresh and <br>
                            Delicious Food</h3>
                            <p> 레스토랑 한 가운데 들어선 오픈 키친은<br>
                                          더 건강하고 더 신선한 음식을 선사하겠다는<br>
                                            라메르의 약속입니다.<br><br>
                            바다를 닮은 여유로운 공간은 이국적이고 우아한 인테리어, 편안함을 강조한 가구,<br>
                            푸르른 식물, 광활한 바다와 조화를 이뤄 탄성을 자아냅니다.
                            </p>
                    </div>
                </div>
            </div>
        </div> -->
  <b> 아난티가 직접 가꾼 채소로 만든 식탁</b><br>
    아난티 농장은 농약 없이 수경 재배를 통해 채소들을 키웁니다.<br>
채소들이 가장 좋아하는 온습도를 맞춰주고, 아픈 곳은 없는지 살피며 튼튼하게 자라도록 돕습니다.<br>
<br>
무럭무럭 자라난 식재료는<br>
샐러드로, 쌈채소로, 깊은 향을 내는 허브로, 숲을 옮겨온 듯 건강한 식탁을 만들죠.<br>
<br>
자연이 우리 삶에 좀더 가까워졌으면 하는 바람 위에<br>
아난티 코드는 오늘도 건강한 식탁을, 건강한 내일을 만들어 갑니다.
    </div>
    <!-- about_main_info_end -->
<!--     <div class="img_3">
      <img src="../img/about/fee.JPG" width="1100" height="800" text-align="center">
    </div> -->
     <div class="about">
        	<table width="900" align="center">
        		<tr>
        			<th>이용안내</th>
        		</tr>
        		<tr>
        			<td><b>운영시간</b></td>
        			<td>아침 08:00 - 10:50 (마지막 입장 10:10)<br>
점심 13:00 - 15:50 (LAST ORDER 14:00)<br>
* 중식은 런치 코스 또는 한식 코스, 키즈세트 메뉴로 운영합니다.<br>
저녁 16:00 - 19:50 (LAST ORDER 18:30)<br>
* 석식은 디너 코스 또는 한식 코스, 키즈세트 메뉴로 운영합니다.<br></td>
        		</tr>
        	</table>
        </div>
    <!-- ================ Dining Area End ================= -->

</body>