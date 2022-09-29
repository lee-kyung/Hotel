<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
  <style>
    /* #title{
	    color:white;
	    font-weight:600;
	    cursor: pointer;
	    display: inline-block;
	    text-transform: capitalize;
	    font-family: "Raleway",sans-serif;
	    padding: 0px 0px 10px 0px;
	    outline: medium none;
	    background-color: transparent;
	    text-decoration: none;
	   
	}
	#title :-webkit-any-link{
	    /* text-decoration: underline; */
	}
	#title i{
	    font-size: 9px;
	} */
  </style>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Montana</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/themify-icons.css">
    <link rel="stylesheet" href="../css/nice-select.css">
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/gijgo.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/slicknav.css">
    <link rel="stylesheet" href="../css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    
</head>

<body>	
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->
    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid p-0">
                    <div class="row align-items-center no-gutters">
                        <div class="col-xl-5 col-lg-6">
                            <div class="main-menu  d-none d-lg-block">
                                <nav>
                                    <ul id="navigation">
                                        <li><a href="../main/index">Hotel<i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="../info/info">호텔 소개</a></li>
                                                <li><a href="../info/gongji_list">공지사항</a></li>
                                                <li><a href="../info/faq_list">FAQ</a></li>
                                            </ul>
                                        <li><a href="../room/rooms">rooms</a></li>
                                        <li><a href="">dining<i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="../dining/dining">레스토랑 소개</a></li>
                                                <li><a href="../dining/dining_reserve">레스토랑 예약</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="../wedding/wedding">wedding<i class="ti-angle-down"></i></a>
                                            <ul class="submenu">
                                                <li><a href="../wedding/wedding_hall?id=15">웨딩홀</a></li>
                                                <li><a href="../wedding/wedding_reserve">상담예약</a></li>
                                                <li><a href="../wedding/wedding_check">견적</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="../eshop/eshop">eshop<i class="ti-angle-down"></i></a>
                                        	<ul class="submenu">
                                                <li><a href="../eshop/pro_list?pcode=p01">product</a></li>
                                                <li><a href="../eshop/pro_list?pcode=p02">voucher</a></li>
                                            </ul>                                        
                                        </li>
                                        <li><a href="../etc/contact">etc<i class="ti-angle-down"></i></a>
                                        	<ul class="submenu">
                                                <li><a href="../etc/basic">basic</a></li>
                                                <li><a href="../etc/elements">elements</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2">
                            <div class="logo-img">
                                <a href="../main/index">
                                    <img src="../img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-4 d-none d-lg-block">
                            <div class="book_room">
                                <div class="socail_links">
                                    <ul>
                                       <!--  <li>
                                            <a href="#">
                                                <i class="fa fa-facebook-square"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-twitter"></i>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="fa fa-instagram"></i>
                                            </a>
                                        </li> -->
                                        <li>
		                                <c:if test="${userid == null}">
                                            <a href="../eshop/cart?p=p01"> <i class="fa fa-cart-arrow-down"></i> </a>
											<a href="../login/login?ck=4">로그인</a>
											<a href="../member/member_input">회원가입</a>
											<a href="../mypage/rdwg_check?err=0">비회원조회</i> </a>
										</c:if>
										<c:if test="${(userid != null) && (userid != 'admin')}">
											<a href="../mypage/mypage"> ${name}님
											<a href="../eshop/cart?p=p01"> <i class="fa fa-cart-arrow-down"></i> </a>
                                            <a href="../eshop/wish"> <i class="fa fa-heart-o"></i> </a>
											<a href="../login/logout">로그아웃</a>
										</c:if>
										<c:if test="${userid == 'admin'}">
											<a href="../admin/admin"> ${name}님</a>
											<a href="../login/logout">로그아웃</a>
										</c:if>
		                                </li>
                                    </ul>
                                </div>
                                <div class="book_btn d-none d-lg-block">
                                <c:if test="${userid==null}">
                                     <a href="#" onclick="logcheck()">객실예약</a>
                                </c:if>
                                <c:if test="${userid!=null}">
                                	<a href="../room/room_resv">객실예약</a>
                                </c:if>
                              </div>
<style>
	#loglayer{
		position: absolute;
		visibility: hidden;
		width: 650px;
		height: 750px;
		border: 1px solid black;
		background: white;
		text-align: center;
	}
	#loglayer #txt2{
		margin-top: 50px;
	}
	#loglayer #logform{
		margin-top: 200px;
	}
	#loglayer #gologin{
		width: 400px;
		height: 50px;
		border: none;
		border-bottom: 2px solid #887159;
		background: white;
		color: #887159;
	}
	#loglayer input[type=button]{
		width: 400px;
		height: 80px;
		border: 1px solid #887159;
		background: white;
		color: #887159;
	}
	#loglayer input[type=button]{
		width: 400px;
		height: 80px;
		border: 1px solid #887159;
		background: white;
		color: #887159;
	}
	#loglayer #keepgo{
		width: 400px;
		height: 80px;
		border: 1px solid #887159;
		background: #887159;
		color: white;
	}
	#loglayer #txt{
		margin-top: 150px;
		font-size: 20px;
		color: #887159
	}
	#dine #logo{
     font-family:fantasy;
     color:#887159;
     font-size:60px;
  }
  	#dine .genric-btn.default{
     background:#a28d78;
     color:#f2f1ef;
     width:200px;
     height:50px;
     font-size:16px;
     text-align:center;
     vertical-align:center;
     padding: 5px 0px;
  }
  	#dine .genric-btn.default:hover{
     background: #887159;
  }
</style>
<script>
	function logcheck()
	{
		document.getElementById("loglayer").style.visibility="visible";
		position_chg();
	}
	function position_chg() // 브라우저의 중앙에 레이어를 위치 시키기 위한 좌표
	{
		var x=innerWidth; // 브라우저 가로 크기
		var y=innerHeight; // 브라우저 세로 크기
		
		var left=(x/2)-1500; 
		var top=(y/2)-350;
		
		document.getElementById("loglayer").style.left=left+"px";
		document.getElementById("loglayer").style.top=top+"px";
	}
	window.onresize=position_chg;
</script>
<div id="loglayer">
	<div>
		<div id="txt">객실 예약을 진행하려면 로그인 또는 비회원으로 진행 선택을 해주세요.</div>
		<br>
		<div id="txt2">
			<div>
				<input type="button" value="로그인" onclick="location='../login/login?ck=2'">
				<hr>
				<input type="button" value="비회원으로 계속" id="keepgo" onclick="location='../room/room_resv'">
			</div>
		</div>
	</div> 
</div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->

    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <h3>Montana Resort</h3>
                                <p>Unlock to enjoy the view of Martine</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center justify-content-center slider_bg_2">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <h3>Life is Beautiful</h3>
                                <p>Unlock to enjoy the view of Martine</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider d-flex align-items-center justify-content-center slider_bg_1">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <h3>Montana Resort</h3>
                                <p>Unlock to enjoy the view of Martine</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center justify-content-center slider_bg_2">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="slider_text text-center">
                                <h3>Life is Beautiful</h3>
                                <p>Unlock to enjoy the view of Martine</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->

   

    <!-- 룸 -->
    <div class="offers_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-100">
                        <span>Our Offers</span>
                        <h3>Ongoing Offers</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4 col-md-4">
                    <div class="single_offers">
                        <div class="about_thumb">
                            <img src="../img/offers/1.png" alt="">
                        </div>
                        <h3>Up to 35% savings on Club <br>
                            rooms and Suites</h3>
                        <ul>
                            <li>Luxaries condition</li>
                            <li>3 Adults & 2 Children size</li>
                            <li>Sea view side</li>
                        </ul>
                        <a href="#" class="book_now">book now</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4">
                    <div class="single_offers">
                        <div class="about_thumb">
                            <img src="../img/offers/2.png" alt="">
                        </div>
                        <h3>Up to 35% savings on Club <br>
                            rooms and Suites</h3>
                        <ul>
                            <li>Luxaries condition</li>
                            <li>3 Adults & 2 Children size</li>
                            <li>Sea view side</li>
                        </ul>
                        <a href="#" class="book_now">book now</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4">
                    <div class="single_offers">
                        <div class="about_thumb">
                            <img src="../img/offers/3.png" alt="">
                        </div>
                        <h3>Up to 35% savings on Club <br>
                            rooms and Suites</h3>
                        <ul>
                            <li>Luxaries condition</li>
                            <li>3 Adults & 2 Children size</li>
                            <li>Sea view side</li>
                        </ul>
                        <a href="#" class="book_now">book now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- offers_area_end -->





    <!-- video_area_start -->
    <div class="video_area video_bg overlay">
        <div class="video_area_inner text-center">
            <span>Montana Sea View</span>
            <h3>Relax and Enjoy your <br>
                Vacation </h3>
            <a href="https://www.youtube.com/watch?v=vLnPwxZdW4Y" class="video_btn popup-video">
                <i class="fa fa-play"></i>
            </a>
        </div>
    </div>
    <!-- video_area_end -->





  
   <!-- 다이닝 -->
    <!-- about_area_start -->
    <div id="dine">
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
    </div>
    <!-- about_area_end -->
    <!-- about_area_end -->
  

    

   

    <!-- instragram_area_start -->
    <div class="instragram_area">
        <div class="single_instagram">
            <img src="../img/instragram/1.png" alt="">
            
        </div>
        <div class="single_instagram">
            <img src="../img/instragram/2.png" alt="">
          
        </div>
        <div class="single_instagram">
            <img src="../img/instragram/3.png" alt="">
            
        </div>
        <div class="single_instagram">
            <img src="../img/instragram/4.png" alt="">
           
        </div>
        <div class="single_instagram">
            <img src="../img/instragram/5.png" alt="">
            
        </div>
    </div>
    <!-- instragram_area_end -->

    <!-- footer -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                
                    <div class="col-xl-3 col-md-6 col-lg-3" style="margin-left:30px;">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                address
                            </h3>
                            <p class="footer_text"> 200, Green road, Mongla, <br>
                                New Yor City USA</p>
                            <a href="#" class="line-button">Get Direction</a>
                        </div>
                    </div>
                    
                    <div class="col-xl-3 col-md-6 col-lg-3" style="margin-left:180px;">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Reservation
                            </h3>
                            <p class="footer_text">+10 367 267 2678 <br>
                                reservation@montana.com</p>
                        </div>
                    </div>
                    
                    <div class="col-xl-2 col-md-6 col-lg-2" style="margin-left:160px;">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Navigation
                            </h3>
                            <ul>
                                <li><a href="#">Hotel</a></li>
                                <li><a href="../room/rooms">Rooms</a></li>
                                <li><a href="../dining/dining">Dining</a></li>
                                <li><a href="../wedding/wedding">Wedding</a></li>
                                <li><a href="../eshop/eshop">Eshop</a></li>
                            </ul>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-8 col-md-7 col-lg-9">
                        <p class="copy_right">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                    <div class="col-xl-4 col-md-5 col-lg-3">
                        <div class="socail_links">
                            <ul>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-facebook-square"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- link that opens popup -->

    <!-- form itself end-->
        <form id="test-form" class="white-popup-block mfp-hide">
                <div class="popup_box ">
                        <div class="popup_inner">
                            <h3>Check Availability</h3>
                            <form action="#">
                                <div class="row">
                                    <div class="col-xl-6">
                                        <input id="datepicker" placeholder="Check in date">
                                    </div>
                                    <div class="col-xl-6">
                                        <input id="datepicker2" placeholder="Check out date">
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="Adult">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="Children">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="Room type">Room type</option>
                                            <option value="1">Laxaries Rooms</option>
                                            <option value="2">Deluxe Room</option>
                                            <option value="3">Signature Room</option>
                                            <option value="4">Couple Room</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <button type="submit" class="boxed-btn3">Check Availability</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </form>
    <!-- form itself end -->

    <!-- JS here -->
    <script src="../js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="../js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/isotope.pkgd.min.js"></script>
    <script src="../js/ajax-form.js"></script>
    <script src="../js/waypoints.min.js"></script>
    <script src="../js/jquery.counterup.min.js"></script>
    <script src="../js/imagesloaded.pkgd.min.js"></script>
    <script src="../js/scrollIt.js"></script>
    <script src="../js/jquery.scrollUp.min.js"></script>
    <script src="../js/wow.min.js"></script>
    <script src="../js/nice-select.min.js"></script>
    <script src="../js/jquery.slicknav.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/plugins.js"></script>
    <script src="../js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="../js/contact.js"></script>
    <script src="../js/jquery.ajaxchimp.min.js"></script>
    <script src="../js/jquery.form.js"></script>
    <script src="../js/jquery.validate.min.js"></script>
    <script src="../js/mail-script.js"></script>

    <script src="../js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
             rightIcon: '<span class="fa fa-caret-down"></span>'
         }

        });
    </script>

</body>

</html>