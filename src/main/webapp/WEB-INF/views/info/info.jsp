<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?
appkey=def97946ef83ffb1f9a1cacb75ac32eb"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?
appkey=221164233a66d168e789f0d0113a6dcb&libraries=services,clusterer,drawing"></script> -->


<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
			    center: new kakao.maps.LatLng(35.200680, 129.229312), // 지도의 중심좌표
			    level: 3 // 지도의 확대 레벨
			};
			
			//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			//마커 초기화(초기화 시 지도에 미리 지정 가능 : 카카오맵 API 문서 참조)
			const marker = new kakao.maps.Marker();
			
			//카카오맵 클릭 이벤트 추가
			kakao.maps.event.addListener(map, 'click', (mouseEvent) => {
				//클릭한 위도, 경도 정보 불러오기
				const latlng = mouseEvent.latLng;
				//마커 위치를 클릭한 위치로 이동
				marker.setPosition(latlng);
				marker.setMap(map);
				
				alert(`위도 : ${latlng.getLat()}, 경도 : ${latlng.getLng()}`);
			});
			</script>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area basic">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> Hotel info </div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->


	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->
<section>
         <div id="map" style="width:500px;height:400px;"></div>
			
</section>
<!-- 지도[s] -->    
<!--     <div id="map" style="width:600px;height:400px; margin:auto; margin-top:10px;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42be5e09039a963ee3f9a39d4bcb5af4"></script>
    <script>
        var container = document.getElementById('map'); //지도 표시 div
        var options = {
            center: new kakao.maps.LatLng(36.300442, 127.574917), //지도의 중심좌표
            level: 3 //지도의 확대 레벨
        };
 
        var map = new kakao.maps.Map(container, options);
        
        // 마커가 표시될 위치
        var markerPosition  = new kakao.maps.LatLng(36.300442, 127.574917); 
 
        // 마커 생성
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
 
        // 마커가 지도 위에 표시되도록 설정
        marker.setMap(map);
 
        // 아래 코드는 지도 위의 마커를 제거하는 코드
        // marker.setMap(null);  
        
    </script> -->
    <!-- 지도[e] -->

    	<br>
    	<br>
    	<br>
    	<div style="margin:auto;text-align:center;"> 당당한  <input type="button" value="버튼"> 하나 </div>
    	<br>
    	<br>
    	<br>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>
