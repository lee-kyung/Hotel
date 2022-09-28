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
		width: 1300px;
		margin: auto;
	}
	roomsec{
		margin-top: 40px;
		margin-bottom: 80px;
		margin: auto;
	}
/* ul메뉴관련 */
 	roomsec #menu{
		width: 1200px;
		height: 60px;
		margin: auto;
		position: relative;
		magrin-top: 40px;
	}
	roomsec #menu ul{
		margin-bottom:50px;
		margin-left: 0;
		padding-left: 0;
	}
 	roomsec #menu ul a{
		font-size: 40px;
		font-weight: 700;
		font-family: fantasy;
		color: black;
	}  
	roomsec #menu ul li{
		display:inline-block;
		padding-right:30px;
 		font-size: 40px;
		font-weight: 700;
		font-family: fantasy;
		color: #887159; 
	} 
/* sec2 */
	roomsec #sec2{
		margin-top: 30px;
	}
	roomsec #sec2 #rname{
		font-size:35px; 
		font-weight: 900; 
		color: #887159;
	}
	roomsec #sec2 #secimg{
		width: 1200px;
		margin: auto;
	}
	roomsec #sec2 img{
		width: 1198px;
	}
	
</style>
<script>
	function change_sub(n)
	{
		var sub=document.getElementsByClassName("sub")
		var len=sub.length;
		for(i=0;i<len;i++)
		{
			sub[i].style.color="#887159";
			sub[i].style.borderBottom="none";
		} 
		// 선택된 색깔
		sub[n].style.borderBottom="5px solid #887159";
		sub[n].style.background="white";
		//alert(sub[n]);
	}
</script>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <div id="h3"> R O O M S </div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

	<!-- ================ Rooms Area Start ================= -->
	<!-- 객실 리스트 -->
<div class="container">
	<div class="row"> 
    <roomsec>
    	<div id="menu"> 
    	<ul>
     	<c:set var="i" value="0"/> 
    	<c:forEach items="${list}" var="rvo"> 
    		<li class="sub" onclick="change_sub(${i})"><a href="../room/room_content?code=${rvo.code}&rcode=${rvo.rcode}">${rvo.rname}</a></li>
     	<c:set var="i" value="${i+1}"/> 
    	</c:forEach>
    	</ul>
    	</div>
    	<br>
 	
 	<div id="sec2">
 		<div id="rname">${rvo.rname}</div>
		<div id="secimg">
			<img src="../img/rooms/${rvo.rpimg}">
			<br>
			<img src="../img/rooms/${rvo.rcimg}">
		</div>
		<br>
	</div> <!-- sec2end-->
	
 	</roomsec>
 	</div>
</div>

    <!-- ================ Rooms Area End ================= -->

</body>
