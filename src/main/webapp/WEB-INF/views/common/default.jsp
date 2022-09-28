<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<style>
	.bradcam_area{
		height: 300px;
	}
	.bradcam_area #h3{
		margin-top: -70px;
		font-family: fantasy;
		font-size: 80px;
		letter-spacing: 4px;
		color: white;
        /*글씨 테두리*/	
        text-shadow: -1px 0 #000, 0 1px #000, 1px 0 #000, 0 -1px #000;
	}
	/* #title{
	    color:white;
	    font-weight:600;
	} */
</style>
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
    
    <script>

    </script>
    
    	<decorator:head/>
   
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
                                                <li><a href="../info/info">호텔 소개</a></li>
                                            </ul>
                                        <li><a href="../room/rooms">rooms</a></li> <!-- class="active" -->
                                        <li id="title"><a href="">dining<i class="ti-angle-down"></i></a>
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
                                        <!-- <li>
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
											<a href="../mypage/nonuser">예약주문조회</i> </a>
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
		<!-- <form method="post" action="../login/login_ok" id="logform">
		<input type="hidden" name="ck" value="2">
			<div><input type="text" name="userid" placeholder="아이디" id="gologin"></div>
			<div><input type="password" name="pwd" placeholder="비밀번호" id="gologin"></div> -->
			<p>
			<div><input type="button" value="로그인" onclick="location='../login/login?ck=2'"></div>
			<hr>
			<a href="../room/room_resv"><input type="button" value="비회원으로 계속" id="keepgo"></a>
		<!-- </form> -->
		<br>
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
    
    
		<decorator:body/>
		
		
    <!-- footer -->
    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                address
                            </h3>
                            <p class="footer_text"> 200, Green road, Mongla, <br>
                                New Yor City USA</p>
                            <a href="#" class="line-button">Get Direction</a>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Reservation
                            </h3>
                            <p class="footer_text">+10 367 267 2678 <br>
                                reservation@montana.com</p>
                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-2">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Navigation
                            </h3>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">Rooms</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">News</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6 col-lg-4">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Newsletter
                            </h3>
                            <form action="#" class="newsletter_form">
                                <input type="text" placeholder="Enter your mail">
                                <button type="submit">Sign Up</button>
                            </form>
                            <p class="newsletter_text">Subscribe newsletter to get updates</p>
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
        <!-- <form id="test-form" name="dtpick" class="white-popup-block mfp-hide">
                <div class="popup_box ">
                        <div class="popup_inner">
                            <h3>Check Availability</h3>
                            <form action="../room/room_resv">
                                <div class="row">
                                    <div class="col-xl-6">
                                        <input id="datepicker" placeholder="체크인 날짜" >
                                    </div>
                                    <div class="col-xl-6">
                                        <input id="datepicker2" placeholder="체크아웃 날짜">
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="성인">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-6">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="어린이">1</option>
                                            <option value="1">2</option>
                                            <option value="2">3</option>
                                            <option value="3">4</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <select class="form-select wide" id="default-select" class="">
                                            <option data-display="객실타입">객실타입</option>
                                            <option value="1">디럭스 룸</option>
                                            <option value="2">프리미엄 디럭스 룸</option>
                                            <option value="3">스위트</option>
                                            <option value="4">스페셜 스위트</option>

                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <button type="submit" class="boxed-btn3">객실 검색</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </form> -->
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
/*     $(function(){
    	
    	 $('#datepicker').datepicker({
         	format:"yy-mm-dd",
         	
         	iconsLibrary: 'fontawesome',
             icons: {
              rightIcon: '<span class="fa fa-caret-down"></span>' 
          }
    	 });
    	 
         $('#datepicker2').datepicker({
         	format:"yy-mm-dd",
         	
             iconsLibrary: 'fontawesome',
             icons: {
              rightIcon: '<span class="fa fa-caret-down"></span>'
          }

         });
        
    })
        */
    </script>

</body>

</html>