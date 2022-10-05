<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <!-- 카카오맵 APP 인증키 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?
appkey=def97946ef83ffb1f9a1cacb75ac32eb"></script>

<style>
   body{
    text-align:center;
   }
   section{
    width:1100px;
    margin:auto;
   }
   .map{
    margin: auto !important;
    text-align:center;
	max-width: none;
	height: auto;
	border: 0;
	padding-left:400px;
   }
   
  section .outer{ /* 상단 표, 이미지 */
    width:1100px;
    height:1000px;
/*   background:#e5e4e2; */
    margin:auto;
    text-align:center;
  }
  .row{
    width:800px;
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
 .outer #myTab .nav .nav-tabs .justify-content-center{ /* 상단 이미지 */
    border:none;
    width:800px;
    height:400px;
    margin:auto;
    margin-left:400px;
    font-size:60px;
  }
/*   .outer #myTab .nav .nav-tabs .justify-content-around a {
    font-size:35px;
  } */
  .outer .tab ul li:hover{
    text-decoration:underline;
  }
 /*  .location-header{
    flex: 0 0 35px;
  } */
  .outer .left{
    border:1px solid red;
    width:300px;
    /* float:left; */
    margin:auto;
 /*    padding-left:200px;
    display: inline-block; */
  }
  .outer .right{ /* 상단 가격표 */
    width:200px;
    float:right;
    margin:auto;
    margin-top:40px;
    line-height:2;
    margin-left:0px;
   /*  display: inline-block; */
    
  }
   #myTab{
    font-size:40px;
   }
  /* 지점 접고 펼치기 */
  .detail {
    display: none;
    padding-bottom: 30px;
  }
  #faq-title {
    font-size: 35px;
    margin-left:50px;
  }
  .faq-content {
    border-top: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
    margin-left:50px;
  }
  .area {
    font-size: 30px;
    padding: 30px 0;
    cursor: pointer;
    border: none;
    outline: none;
    background: none;
    width: 100%;
    text-align: center;
    
  }
  .area:hover {
    color: #2962ff;
  }
  .faq-content .area a{
    width:20px;
    background:gold;
  }
  .sebu{
    font-size:13px;
  }
  [id$="-toggle"] {
    margin-right: 15px;
  }
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area info2">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> About hotel </div>
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
				<ul class="nav nav-tabs justify-content-center" role="tablist" id="myTab">
					<li role="presentation" class="active"><a href="#place1" aria-controls="place1" role="tab" data-toggle="tab">&nbsp;&nbsp;Busan&nbsp;&nbsp;</a></li>
					<li role="presentation"><a href="#place2" aria-controls="place2" role="tab" data-toggle="tab">&nbsp;&nbsp;Gapyung&nbsp;&nbsp;</a></li>
					<li role="presentation"><a href="#place3" aria-controls="place3" role="tab" data-toggle="tab">&nbsp;&nbsp;Namhae&nbsp;&nbsp;</a></li>
				</ul>
	  <div class="row">
      <div class="left col-md-6" style="margin:auto; align:center;">
               <header class="location-header">
				<div class="tab-content justify-content-center">
					<div role="tabpanel" class="tab-pane active" id="place1">
						<div role="tabpanel" class="tab-pane active" id="place1">
						<div class="map" id="map1" style="width:650px;height:600px;margin:0 auto;margin-left:280px;"></div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="place2">
						<div role="tabpanel" class="tab-pane" id="place2">
						<div class="map" id="map2" style="width:650px;height:600px;margin:0 auto;margin-left:280px;"></div>
						</div>
					</div>
					<div role="tabpanel" class="tab-pane" id="place3">
						<div role="tabpanel" class="tab-pane" id="place3">
						<div class="map" id="map3" style="width:650px;height:600px;margin:0 auto;margin-left:280px;"></div>
						</div>
					</div>
				</div> <!-- tab-content end -->
			  </header>
		     </div> <!-- left end -->
	  <div class="right col-md-6" id="list">
			<span id="faq-title" style="text-align:left;"><h2>Ananti</h2></span>
			<div class="faq-content" style="text-align:left;">
			  <button class="area" id="are-1"><span id="are-1-toggle">▼</span><span>아난티 코브</span></button>
				  <div class="sebu" id="seb-1">In Busan
					   <div>부산 기장군 기장읍 기장해안로 268-31</div>
					   <div><a href="https://place.map.kakao.com/1672210391"><input type="button" class="btn" value="지도 검색"></a>
					  &nbsp;<a href="https://map.kakao.com/?map_type=TYPE_MAP&target=car&rt=,,1007508,478968&rt1=&rt2=%EC%95%84%EB%82%9C%ED%8B%B0%EC%BD%94%EB%B8%8C&rtIds=,1672210391">
					         <input type="button" class="btn" value="길찾기"></a>
					   </div>
				  <br><br>
				  </div>
			</div>
			<div class="faq-content" style="text-align:left;">
			  <button class="area" id="are-2"><span id="are-2-toggle">▼</span><span>아난티 코드</span></button>
				  <div class="sebu" id="seb-2">In Gapyung
					   <div>경기 가평군 설악면 유명로 1007-90</div>
					   <div><a href="https://map.kakao.com/link/search/아난티코드"><input type="button" class="btn" value="지도 검색"></a>
				      &nbsp;<a href="https://map.kakao.com/?q=%EC%95%84%EB%82%9C%ED%8B%B0%EC%BD%94%EB%93%9C">
					         <input type="button" class="btn" value="길찾기"></a>
				      
				       </div>
				 <br><br>
			     </div>
			</div>
			<div class="faq-content" style="text-align:left;">
			  <button class="area" id="are-3"><span id="are-3-toggle">▼</span><span>&nbsp;&nbsp;아난티 남해</span></button>
				  <div class="sebu" id="seb-3">In Namhae
					   <div>경남 남해군 남면 남서대로1179번길 40-109</div>
					   <div><a href="https://map.kakao.com/link/search/아난티남해"><input type="button" class="btn" value="지도 검색"></a>
                      &nbsp;<a href="https://map.kakao.com/?q=%EC%95%84%EB%82%9C%ED%8B%B0%EB%82%A8%ED%95%B4">
					         <input type="button" class="btn" value="길찾기"></a>
				      <br><br>
				       </div>
			      </div>
		   </div>
		  </div>
	</div> <!-- row end -->
		     </div> <!-- tab end -->
  </div> <!-- outer end --> 
</section> 
<script src="http://code.jquery.com/jquery-latest.js"></script>	
   <script>
   const items = document.querySelectorAll('.area');

   function openCloseSebu() {
     const sebuId = this.id.replace('are', 'seb');

     if(document.getElementById(sebuId).style.display === 'block') {
       document.getElementById(sebuId).style.display = 'none';
       document.getElementById(this.id + '-toggle').textContent = '▼';
     } else {
       document.getElementById(sebuId).style.display = 'block';
       document.getElementById(this.id + '-toggle').textContent = '△';
     }
   }
   items.forEach(item => item.addEventListener('click', openCloseSebu));
   </script>    
   
                           <!-- <li id="title">Busan<i class="ti-angle-down"></i></a>
                             <ul class="submenu">
                                <li>아난티 코브</li>
                                <li id="juso">부산 기장군 기장읍 기장해안로 268-31</li>
                                <li><a href="https://place.map.kakao.com/1672210391">지도 검색</a></li>
                             </ul>
                      	</li>	
                      	<li id="title">Gapyung<i class="ti-angle-down"></i></a>
                             <ul class="submenu">
                                <li>아난티 코드</li>
                                <li id="juso">경기 가평군 설악면 유명로 1007-90</li>
                                <li><a href="https://map.kakao.com/link/search/아난티코드">지도 검색</a></li>
                             </ul>
                      	</li>
                      	<li id="title">Namhae<i class="ti-angle-down"></i></a>
                             <ul class="submenu">
                                <li>아난티 남해</li>
                                <li id="juso">경남 남해군 남면 남서대로1179번길 40-109</li>
                                <li><a href="https://map.kakao.com/link/search/아난티남해">지도 검색</a></li>
                             </ul>
                      	</li> -->


<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>

 // 지도 
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

 $('#list button').click(function (e) {
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


 
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>
