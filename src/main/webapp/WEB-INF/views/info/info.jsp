<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?
appkey=def97946ef83ffb1f9a1cacb75ac32eb"></script>
<style>
   body{
    text-align:center;
   }
   section{
    width:800px;
    margin:auto;
   }
   .map{
   margin: auto !important;
    text-align:center;
    margin:auto;
	max-width: none;
	height: auto;
	border: 0;
	padding-left:400px;
   }
  section .outer{ /* 상단 표, 이미지 */
    border:1px solid black;
    width:800px;
    height:1000px;
    background:#e5e4e2;
    margin:auto;
  }
  .row{
    padding: 0 35px;
  }
  .outer .tab{
    margin:auto;
  }
  .subtitle{
    font-weight:500px;
    font-size:35px;
    margin:auto;
    text-align:center;
  }
 
 .outer .nav{
    width:300px;
    font-weight:600px;
    font-size:45px;
 }
 .outer #myTab .nav .nav-tabs .justify-content-around{ /* 상단 이미지 */
    border:none;
    width:800px;
    height:400px;
    margin:auto;
    margin-left:400px;
  }
/*   .outer #myTab .nav .nav-tabs .justify-content-around a {
    font-size:35px;
  } */
  .outer .tab ul li:hover{
    text-decoration:underline;
  }
  .location-header{
    flex: 0 0 500px;
  }
  .outer .left{
    border:1px solid red;
    width:500px;
    float:left;
    margin:auto;
    padding-left:200px;
    /* display:flex; */
  }
  .outer .right{ /* 상단 가격표 */
    border:1px solid blue;
    width:200px;
    float:right;
    margin:auto;
    margin-top:40px;
  }

</style>
<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area info2">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> Hotel info </div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
<section>   

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?
appkey=def97946ef83ffb1f9a1cacb75ac32eb"></script>
       <div class="subtitle" style="text-align:center;font-size:40px;"> Location </div>
  <div class="outer">
     
			<div class="tab">
				<ul class="nav nav-tabs justify-content-around" role="tablist" id="myTab">
					<li role="presentation" class="active"><a href="#place1" aria-controls="place1" role="tab" data-toggle="tab">Busan&nbsp;&nbsp;</a></li>
					<li role="presentation"><a href="#place2" aria-controls="place2" role="tab" data-toggle="tab">Gapyung&nbsp;&nbsp;</a></li>
					<li role="presentation"><a href="#place3" aria-controls="place3" role="tab" data-toggle="tab">Namhae&nbsp;&nbsp;</a></li>
				</ul>
	  <div class="row">
              <div class="left">
               <header class="location-header">
				<div class="tab-content justify-content-center">
					<div role="tabpanel" class="tab-pane active" id="place1">
						<div role="tabpanel" class="tab-pane active" id="place1">
						<div class="map" id="map1" style="width:500px;height:500px;margin:auto;"></div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="place2">
						<div role="tabpanel" class="tab-pane" id="place2">
						<div class="map" id="map2" style="width:500px;height:500px;margin:auto;"></div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="place3">
						<div role="tabpanel" class="tab-pane" id="place3">
						<div class="map" id="map3" style="width:500px;height:500px;margin:auto;"></div>
						</div>
					</div>
				</div> <!-- tab-content end -->
			  </header>
		     </div> <!-- left end -->
		     <div class="right">
                        <li id="title"><a href="">Busan<i class="ti-angle-down"></i></a>
                             <ul class="submenu">
                                <li><a href="../dining/dining">DINING</a></li>
                                <li><a href="../dining/dining_reserve">BOOKING</a></li>
                             </ul>
                      	</li>	
                      	<li id="title"><a href="">dining<i class="ti-angle-down"></i></a>
                             <ul class="submenu">
                                <li><a href="../dining/dining">DINING</a></li>
                                <li><a href="../dining/dining_reserve">BOOKING</a></li>
                             </ul>
                      	</li>
                      	<li id="title"><a href="">dining<i class="ti-angle-down"></i></a>
                             <ul class="submenu">
                                <li><a href="../dining/dining">DINING</a></li>
                                <li><a href="../dining/dining_reserve">BOOKING</a></li>
                             </ul>
                      	</li>	        
		        <div id="area">Busan <i class="ti-angle-down"></i></div>
		          <div id="name">아난티 코브 </div>
		        <div id="area">Busan <i class="ti-angle-down"></i></div>
		          <div id="name">아난티 코브</div>
		        <div id="area">Busan <i class="ti-angle-down"></i></div>
		          <div id="name">아난티 코브</div>
		     </div>
	</div> <!-- row end -->
		     </div> <!-- tab end -->
  </div> <!-- outer end -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

/* place1의 지도 */

var mapContainer1 = document.getElementById('map1'),
    mapOption1 = {  
        center: new kakao.maps.LatLng(35.200707, 129.229098),
        level: 3
    };
var map1 = new kakao.maps.Map(mapContainer1, mapOption1);
var markerPosition1  = new kakao.maps.LatLng(35.200707, 129.229098); 
var marker1 = new kakao.maps.Marker({
    position: markerPosition1
});
marker1.setMap(map1);

/* place2의 지도 */
    
var mapContainer2 = document.getElementById('map2'),
    mapOption2 = { 
        center: new kakao.maps.LatLng(37.625122, 127.480362),
        level: 3
    };
var map2 = new kakao.maps.Map(mapContainer2, mapOption2);
var markerPosition2  = new kakao.maps.LatLng(37.625122, 127.480362); 
var marker2 = new kakao.maps.Marker({
    position: markerPosition2
});
marker2.setMap(map2);

/* place3의 지도 */

var mapContainer3 = document.getElementById('map3'),
    mapOption3 = { 
        center: new kakao.maps.LatLng(34.776888, 127.851892),
        level: 3
    };
var map3 = new kakao.maps.Map(mapContainer3, mapOption3);
var markerPosition3  = new kakao.maps.LatLng(34.776888, 127.851892); 
var marker3 = new kakao.maps.Marker({
    position: markerPosition3
});
marker3.setMap(map3);


 $('#myTab a').click(function (e) {
	  e.preventDefault()
	  $(this).tab('show');
	  setTimeout(function(){
		  map2.relayout();
		  map2.setCenter(new kakao.maps.LatLng(37.626727, 127.482574));
		  map3.relayout();
		  map3.setCenter(new kakao.maps.LatLng(34.776888, 127.851892));
		}, 0);  
	}); 



																			// 기본
  /*  var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
	center: new kakao.maps.LatLng(35.200680, 129.229312), //지도의 중심좌표.
	level: 13 //지도의 레벨(확대, 축소 정도)
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '아난티 코브', 
	        latlng: new kakao.maps.LatLng(35.200680, 129.229312)
	    },
	    {
	        title: '아난티 코드', 
	        latlng: new kakao.maps.LatLng(37.626727, 127.482574)
	    },
	    {
	        title: '아난티 남해', 
	        latlng: new kakao.maps.LatLng(34.776888, 127.851892)
	    }
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}
	
	// 마커를 지도에 표시합니다.
	marker.setMap(map); */
	
	
	
	
	
	
    /* // 아난티 코브
	var iwContent = '<div style="padding:5px;"> 아난티 코브 <br><a href="https://map.kakao.com/link/map/Hello World!,35.200680, 129.229312" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(35.200680, 129.229312); //인포윈도우 표시 위치입니다
    
    var iwContent1 = '<div style="padding:5px;"> 아난티 코드 <br><a href="https://map.kakao.com/link/map/Hello World!,37.626727, 127.482574" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition1 = new kakao.maps.LatLng(37.626727, 127.482574); //인포윈도우 표시 위치입니다
    
    var iwContent2 = '<div style="padding:5px;"> 아난티 남해 <br><a href="https://map.kakao.com/link/map/Hello World!,34.776888, 127.851892" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition2 = new kakao.maps.LatLng(34.776888, 127.851892); //인포윈도우 표시 위치입니다
    

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, iwPosition1, iwPosition2
	    content : iwContent, iwContent1, iwContent2
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker);  */
	
/* 	// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
	var iwContent = '<div style="padding:5px;font-weight:500;">아난티 남해</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    content : iwContent
	});

	// 마커에 마우스오버 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseover', function() {
	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	    infowindow.open(map, marker);
	});

	// 마커에 마우스아웃 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'mouseout', function() {
	    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	    infowindow.close();
	}); */

	 //부트스트랩 충돌시에 사용하는 스크립트
	/* function relayout(){
		setTimeout(function(){map.relayout();},0);
	} */
</script> 


</section>  
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>
