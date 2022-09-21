<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>
	.container{
		width: 990px;
		margin: auto;
	}
	#rtype{
		font-size: 15px;
	}
	#rname{
		margin-top: 50px;
		font-size: 28px;
	}
	roomsec{
		margin-bottom: 80px;
		
	}
	roomsec #ro_outer{
		outline:1px solid black;
		width: 920px;
		height:374px;
	}
	roomsec #subr{
		width: 100px;
		display: inline-block;
		color: black;
	}
	roomsec input[type=button]{
		color: #887159;
		background: white;
		border: 1px solid #887159;
		width: 100px;
		height: 40px;
	}
	roomsec input[type=button]:hover{
		cursor: pointer;
		background: #887159;
		color: white;
	}
	
	section #rmenu{
		width: 1000px;
		height: 60px;
		margin: auto;
		position: relative; // 스크롤 관련
	}
	section #rmenu ul{
		padding-left: 0px;
	}
	section #rmenu ul li{
		list-style-type: none;
		display: inline-block;
		width: 100px;
		height: 38px;
		text-align: center;
		font-weight: 900;
		border: 1px solid black;
		border-top: 3px solid #CCCCFF;
		padding-top:12px;
		margin-left: 0px;
		border-right: none;
		background: lavender;
	}
	section #rmenu ul li:last-child{
		border-right: 1px solid #CCCCFF;
	}
	section #rmenu ul li:first-child{
		border-bottom: none;
		background: white;
	}
</style>
<script>
	function change_sub(my)
	{
		// 배경색 lavender, 밑줄 #CCCCFF 생기기
		var rsub=document.getElementsByClassName("rsub")
		var len=rsub.length;
		for(i=0;i<len;i++)
		{
			rsub[i].style.background="lavender";
			rsub[i].style.borderBottom="1px solid #CCCCFF";
		}
		// 선택된 li 배경색 : white, 밑줄 X
		rsub[n].style.background="white";
		rsub[n].style.borderBottom="none";
	}

</script>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <h3> R O O M S </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
<div class="features_room">
    <div class="container">
    <div class="row"> 
    <roomsec>
    	<div style="font-size: 20px;" id="rmenu"> 
    	<ul>
    		<c:forEach items="${list}" var="rvo"> 
    			<li class="rsub" onclick="change_sub(this)"> <a href="#rr(n)">${rvo.rname}</a></li>
    		</c:forEach>
    	</ul>
    	</div>
    	<br>
 		<c:forEach items="${list}" var="rvo">
 		<div class="rr" style="font-size:35px; font-weight: 900; color: #887159">${rvo.rname}</div>
		<div style="border:1px solid #887159">
			<div style="margin:auto;"><img src="../img/rooms/${rvo.rpimg}" width="980px"></div>
			<img src="../img/rooms/${rvo.rcimg}" width="980px"> <p>
			<br>
		</div>
		<br>
		</c:forEach>
 	</roomsec>
 	</div>
 	</div>
 </div>

    <!-- ================ Rooms Area End ================= -->

</body>
