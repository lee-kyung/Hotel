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
</style>
</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area dining">	<!-- class="bradcam_area 클래스명" -->
        <h3> DINE & DRINK </h3>
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
                            <h3> BUFFET <br>
                                    On the plate</h3>
                        </div>
                        <p>파라다이스호텔 부산의 다양한 레스토랑에서
마스터 쉐프들이 펼치는 화려한 미식의 세계로 초대합니다.</p>
                        <a href="../dining/dining_reserve" class="line-button">예약하기</a>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7">
                    <div class="about_thumb d-flex">
                        <div class="img_1">
                            <img src="../img/about/about_1.jpg" alt="" width="200">
                        </div>
                        <div class="img_2">
                            <img src="../img/about/about_2.jpg" alt="">
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
            <div class="single_slider about_bg_1"></div>
            <div class="single_slider about_bg_1"></div>
            <div class="single_slider about_bg_1"></div>
            <div class="single_slider about_bg_1"></div>
        </div>
    </div>
    <!-- about_info_area_start -->

    <!-- about_main_info_start -->
    <div class="about_main_info">
        <div class="container">
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
                            <p>Suscipit libero pretium nullam potenti. Interdum, blandit <br> phasellus consectetuer dolor ornare dapibus enim ut tincidunt <br> rhoncus tellus sollicitudin pede nam maecenas, dolor sem. <br> Neque sollicitudin enim. Dapibus lorem feugiat facilisi <br> faucibus et. Rhoncus.
                            </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- about_main_info_end -->
    <div class="img_3">
      <img src="../img/about/fee.JPG" width="1100" height="800" text-align="center">
    </div>
    <!-- ================ Dining Area End ================= -->

</body>