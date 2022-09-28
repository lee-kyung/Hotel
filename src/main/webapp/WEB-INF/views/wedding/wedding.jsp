<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	section{
	width:1800px;
	margin:auto;
	margin-top:100px;}
	
	section #wed #txt{
	margin-left:300px;
	font-size:80px;
	font-family:fantasy;}
	
	section #wed #txt2{
	margin-left:300px;
	font-weight:600;
	font-size:20px;
	margin-top:20px;}
	
	section #wed #txt3{
	margin-left:300px;
	font-size:18px;
	margin-top:20px;}
	
	section #wed #img_main img{
	margin-top:100px;
	width:1800px;
	height:900px; }
	
	section #wed .blog_right_sidebar{
	width:1800px;
	margin-top:-200px;}
	
	section #wed .imgs{
	display:inline-block;
	width:245px;}
	
	section #wed .imgs img{
	height:200px;}
	
	section #wed .blog_item{
	margin-top:-150px;
	text-align:right;}
	
	section #wed .blog_item #txt4{
	margin-top:50px;
	font-size:18px;}
	
	section #wed .blog_item .blog_details button{
	margin-top:30px;
	width:250px;
	height:70px;}
	
	section #wed #txt5{
	margin-left:300px;
	font-size:50px;
	font-family:fantasy;
	margin-top:150px;}
	
	section #wed table{
	width:1600px;
	margin-top:100px;
	margin-bottom:100px;}
	
	section #wed table td{
	height:600px;}
	
	section #wed table img{
	width:950px;
	height:500px;}
	
	section #wed table .txt{
	font-size:18px;
	font-weight:600;}

	section #wed table .table_right{
	text-align:right;}
</style>
<script>
	function zoom(img)
	{
		document.getElementById("zoom_img").src=img;
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
        <div id="h3">WEDDING</div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

    <!--================ Wedding Area Start =================-->
    
<section>
<div id="wed">
	<div id="txt">One & Only Luxurious Wedding</div>
	
	<div id="txt2">
		당신만을 위한 특별한 축제가 시작됩니다.<br>
		인생에서 가장 행복한 순간을 로맨틱한 환희와 감동으로 밝혀드립니다.<br>
	</div>
	<div id="txt3">
		눈부심과 설레임으로 가장 아름다울 당신의 소중한 순간을 위해 준비했습니다.<br>
		전통과 격식을 갖추는 클래식한 감성은 물론, 롯데호텔만의 명가의 품격이 느껴지는 세련된 감각의 웨딩까지 다양한 웨딩 스타일을 제안합니다.<br>
		럭셔리하고 차별화된 플라워 데코와 최상의 요리, 세심한 웨딩 서비스까지 인생의 빛나는 첫걸음에 배려와 감동을 더하겠습니다.<br>
		롯데호텔에서 당신만의 축제, 오직 당신만을 위한 파티를 시작하세요.<br>
	</div>
	
	<div id="img_main">
		<img src="../img/wedding/wedding1.jpg" id="zoom_img">
    </div>              
                  
             
    <div class="offers_area padding_top">
    
		<div class="blog_right_sidebar">

			<aside class="single_sidebar_widget instagram_feeds">
    
				<div class="imgs">
                          
					<div class="single_offers">
						
						<div class="about_thumb">
							
							<img src="../img/wedding/wedding1.jpg" onclick="zoom(this.src)">
							
                        </div>
                        
                    </div>
                    
				</div>
	           
				<div class="imgs">

					<div class="single_offers">

						<div class="about_thumb">
						
							<img  src="../img/wedding/wedding2.jpg" onclick="zoom(this.src)">
                            
						</div>
                        
					</div>
                  
				</div>
              
				<div class="imgs">
                           
					<div class="single_offers">

						<div class="about_thumb">

							<img src="../img/wedding/wedding3.jpg" onclick="zoom(this.src)">

						</div>

					</div>
                              
				</div>

				<div class="imgs">
                              
					<div class="single_offers">

						<div class="about_thumb">

							<img src="../img/wedding/wedding4.jpg" onclick="zoom(this.src)">

						</div>

					</div>
					
				</div>
				
				<div class="imgs">
                              
					<div class="single_offers">

						<div class="about_thumb">

							<img src="../img/wedding/wedding5.jpg" onclick="zoom(this.src)">

						</div>

					</div>
					
				</div>
				
				<div class="imgs">
                              
					<div class="single_offers">

						<div class="about_thumb">

							<img src="../img/wedding/wedding6.jpg" onclick="zoom(this.src)">

						</div>

					</div>
					
				</div>
				
				<div class="imgs">
                              
					<div class="single_offers">

						<div class="about_thumb">

							<img src="../img/wedding/wedding7.jpg" onclick="zoom(this.src)">

						</div>

					</div>
					
				</div>
                         
			</aside>
			
		</div>
              
	</div>   
         
	<article class="blog_item">
                            
		<div class="blog_details">

			<div id="txt4"> 운영일 : 월~일요일 &emsp;|&emsp; 운영시간 : 10:00 ~ 18:00 &emsp;|&emsp; Tel : 02-000-000</div>
			
			<button type="submit" class="button button-contactForm btn_1 boxed-btn" onclick="location='../wedding/wedding_reserve'">예약하기</button>

		</div>
		
	</article>
    
	<div id="txt5">FACILITIES & SERVICES</div>

    <table align="center">
    	<tr>
    		<td colspan="2"><img src="../img/wedding/wedding_flower.jpg"></td>
    		<td width="600">
    			<div class="txt">웨딩 플라워 디자인</div>
    			<hr><br>
    			<p>
					화려한 꽃 장식으로 개성을 표현하고자 하는 신랑 신부를 위해 그랜드 인터컨티넨탈 서울 파르나스의 플라워 팀이 1:1 상담을 통해 웨딩 플라워를 디자인합니다.<br>
					디테일한 공간 데커레이션까지 세련된 감각으로 디자인하여 예식장을 마치 고급스러운 예술 공간으로 완성해드립니다.
				</p>
    		</td>
    	</tr>
    	<tr class="table_right">
    		<td width="600">
    			<div class="txt">신부대기실</div>
    			<hr><br>
    			<p>
					가장 설레는 순간에 가장 편안한 마음으로 하객을 맞이할 수 있는 공간입니다.<br> 
					신부의 취향에 맞춘 꽃으로 장식해 더욱더 빛나는 순간을 완성해 줍니다.
				</p>
			</td>
    		<td colspan="2"><img src="../img/wedding/wedding_waiting.jpg"></td>
    	</tr>
    	<tr>
    		<td colspan="2"><img src="../img/wedding/wedding_limousine.jpg"></td>
    		<td>
    			<div class="txt">Limousine Service</div>
    			<hr><br>
    			<p>
					롯데호텔에서는 웨딩(하객 300명 이상)을 치르신 신랑신부님의 품격과 편의를 위해 신혼여행을 떠나시는 공항까지 리무진으로 배웅해 드리는 서비스를 제공하고 있습니다.<br>
					롯데호텔이 웨딩 고객만을 위해 제공해 드리는 VIP 서비스를 직접 느껴보시기 바랍니다.
				</p>
    		</td>
    	</tr>
    	<tr class="table_right">
    		<td>
    			<div class="txt">Tasting Service</div>
    			<hr><br>
    			<p>
					롯데호텔에서 웨딩을 예약하신 고객님께 해당 메뉴에 대한 시식 서비스를 제공하고 있습니다. <br>
					귀한 하객님들의 품격에 걸맞게 온 정성을 가득 담아 준비해 드리는 롯데호텔 웨딩의 최고 메뉴를 미리 점검해 보시기 바랍니다.
				</p>
    		</td>
    		<td colspan="2"><img src="../img/wedding/wedding_tasting.jpg"></td>
    	</tr>
    	<tr>
    		<td colspan="2"><img src="../img/wedding/wedding_courtesy.jpg"></td>
    		<td>
    			<div class="txt">폐백실</div>
    			<hr><br>
    			<p>
					양가의 예(禮)와 정성을 상징하는 폐백실은 단아하고 품위 있는 분위기의 여유로운 공간입니다.<br>
					고전미와 현대미를 조화시켜 한국적 멋스러움을 느낄 수 있는 폐백실은 어른들께 예를 갖추기에 조금도 손색이 없는 여유롭고 편안한 공간입니다.
				</p>	
			</td>
    	</tr>
    	<tr class="table_right">
    		<td>
    			<div class="txt">포토존</div>
    			<hr><br>
    			<p>
    				특별한 공간, 포토룸입니다.<br> 
    				아름다운 꽃으로 꾸민 공간으로 여러분들의 사진을 담으세요.	
    			</p>
    		</td>
    		<td colspan="2"><img src="../img/wedding/wedding_zone2-1.png"></td>
    	</tr>
    </table>
    
         
	
</div>
</section>   


    <!--================ Wedding Area End =================-->
</body>