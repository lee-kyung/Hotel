<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	
	section{
	width:1700px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section #wed_resv #txt{
	font-size:80px;
	font-family:fantasy;}
	
	section #wed_resv #cal_title{
	margin-top:100px;
	width:1100px;
	text-align:center;}
	section #wed_resv #year_mon{
	font-size:40px;
	font-family:fantasy;}
	
	section #wed_resv .mon{
	font-size:35px;
	font-family:fantasy;
	color:#EAEAEA;}
	
	section #wed_resv table#cal{
	width:1100px;
	height:500px;
	text-align:center;
	font-size:22px;
	border-left:none;
	border-right:none;}
	
	section #wed_resv table#cal td{
	width:150px;
	border-left:none;
	border-right:none;}
	
	section #wed_resv table#cal tr:first-child{
	font-weight:600;
	height:50px;
	font-size:25px;
	font-family:sans-serif}
	
	section #wed_resv #time_1{
	border:1px solid #cccccc;
	width:300px;
	text-align:center;
	margin-left:1300px;
	margin-top:-500px;
	font-size:22px;}
	
	section #wed_resv #time_1 #time_txt{
	padding-top:15px;
	height:50px;
	font-size:25px;
	font-weight:600;}
	
	section #wed_resv #time_1 #time{
	height:52px;}
	
	section #wed_resv #day, #time{
	cursor:pointer;}
	
 	section #wed_resv #day:hover, #time:hover{
	color:red;}
	

	section #wed_resv #resv_txt{
	margin-top:100px;
	font-family:fantasy;
	font-size:40px;
	font-weight:600;}
	
	section #wed_resv table#resv{
	margin-top:50px;
	width:1600px;}
	
	section #wed_resv table#resv td{
	padding:10px;}
	
	section #wed_resv table#resv tr:first-child{
	text-align:right;
	font-size:13px;}
	
	section #wed_resv table#resv tr:first-child input[type=button]{
	outline:none;
	background:white;
	cursor:pointer;
	border:1px solid black;}
	
	section #wed_resv table#resv td:first-child{
	width:200px;}
	
	section #wed_resv table#resv td:nth-child(3){
	width:200px;
	padding-left:50px;}
	
	section #wed_resv table#resv td:nth-child(4){
	width:390px;}
	
	section #wed_resv table#resv tr:first-child, tr:nth-child(2), tr:nth-child(3){
	height:60px;}
	
	section #wed_resv table#resv tr:nth-child(5){
	vertical-align:top;}
	
	section #wed_resv table#resv #datepicker{
	margin-top:14px;
	font-size:18px;}
	
	section #wed_resv table#resv input[type=text]{
	width:98%;
	height:50px;
	outline:none;
	border: 1px solid #cccccc;}
	
	section #wed_resv table#resv textarea{
	width:99%;
	height:200px;
	resize:none;
	outline:none;
	border: 1px solid #cccccc;}
	
	section #wed_resv table#resv select{
	width:362px;
	height:50px;
	outline:none;
	border: 1px solid #cccccc;}
	
	section #wed_resv table#resv select option{
	font-size:18px;}


	section #wed_resv table#resv input[type=submit]{
	margin-top:20px;
	width:400px;
	height:70px;}
	
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	
 /*	$(function(){
		$("#test").click(function(){
	        alert($(this).text());
	    });
	});  
*/	
	function edit()
	{
		document.getElementById("wresv_name").readOnly=false; 
	  	document.getElementById("wresv_phone").readOnly=false;

	}
	
	function time(time)
	{
		document.wresv.wresv_time.value=time.innerText;
	
	}

	function day(day)
	{
		document.wresv.wresv_cday.value="${y}"+"-"+"${m}"+"-"+day.innerText;
		document.getElementById("time_txt").innerText="${y}"+"-"+"${m}"+"-"+day.innerText;

		var wresv_cday=${y}+"-"+${m}+"-"+day.innerText;
	//	alert(wresv_cday);
		var time=document.getElementsByClassName("time");
		var len=time.length;
		var chk=new XMLHttpRequest();
		chk.open("get","wresv_cal?wresv_cday="+wresv_cday);
		chk.send();
		chk.onreadystatechange=function()
		{
		
			if(chk.readyState==4)
			{		
		//		alert(chk.responseText);
				var chk_time=chk.responseText.split(",");
		 		
		//		alert(chk.responseText.length);
		//		alert(time.length);
		//		alert(chk_time.length);
				
				
				for(i=0; i<time.length; i++)
				{
					time[i].style.color="black";
					time[i].style.textDecoration="none";
					time[i].setAttribute("onclick","time(this)");
					time[i].setAttribute("style","text-decoration:none;");
				}
				
				if(chk_time.length > 1)
				{
					for(i=0; i<chk_time.length; i++)
					{
						for(j=0;j<len;j++)
						{
							if(time[j].innerText.trim()==chk_time[i].trim())
							{
								time[j].style.color="red";
								time[j].style.textDecoration="line-through";
								time[j].setAttribute("onclick"," ");
							}	
						}	
					}	
				}
			}
		}
		
	}
	
	
	function resv(chk)
	{
		if(chk.wresv_name.value.trim().length==0)
		{
			alert("이름을 입력하세요.");
			return false;
		}
		else if(chk.wresv_phone.value.trim().length==0)
		{
			alert("전화번호를 입력하세요.");
			return false;
		}
		else if(chk.wresv_cday.value.trim().length==0)	
		{
			alert("상담일을 선택하세요.");
			return false;
		}
		else if(chk.wresv_time.value.trim().length==0)	
		{
			alert("상담시간을 선택하세요.");
			return false;
		}
		else if(chk.wresv_wday.value.trim().length==0)	
		{
			alert("예식 희망일을 선택하세요.");
			return false;
		}
		else if(chk.wresv_content.value.trim().length==0)	
		{
			alert("문의사항을 입력하세요.");
			return false;
		}
		else
		{
			alert("예약이 완료되었습니다.");
			return true;
		}
	}
	
	
	
	$(function(){
		
		$("#datepicker").datepicker({
			format: "yyyy-mm-dd",	// 작성되지 않은 경우 기본 값: mm/dd/yy
			minDate: new Date("${y}-${m}-${day}"),
		});
	});
	
</script>

</head>

<body>

	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area wedding">	<!-- class="bradcam_area 클래스명" -->
        <h3> 상담예약 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

    <!--================ Single-Wedding Area Start =================-->
<section>
<div id="wed_resv">
	<div id="txt">WEDDING RESERVATION</div>
${wresv_cday}
	<div id="cal_title">
		<c:if test="${m==1  }">	<!-- 1월 -->
			<a href="wedding_reserve?y=${y-1 }&m=12"><span class="mon">${y } 12</span></a>
		</c:if>
	
		<c:if test="${m!=1 }">	<!-- 1월아님 -->
			<a href="wedding_reserve?y=${y }&m=${m-1}"><span class="mon">${y } ${m-1 }</span></a>
		</c:if>
		&emsp;			
		<span id="year_mon">
			${y } 
			<c:if test="${m < 10 }">
				0${m }
			</c:if>
			<c:if test="${m >= 10 }">
				${m }
			</c:if>
		</span>
		&emsp;		
		<c:if test="${m==12 }">	<!-- 12월 -->
			<a href="wedding_reserve?y=${y+1 }&m=1"><span class="mon">${y } 1</span></a>
		</c:if>
		<c:if test="${m!=12 }">	<!-- 12월아님 -->
			<a href="wedding_reserve?y=${y }&m=${m+1}"><span class="mon">${y } ${m+1 }</span></a>
		</c:if>
	</div>			

	<table border="1" id="cal">
	
		<tr>
			<td>SUN</td>
         	<td>MON</td>
         	<td>TUE</td>
         	<td>WED</td>
         	<td>THU</td>
         	<td>FRI</td>
         	<td>SAT</td>
		</tr> 
		<c:set var="day" value="1"/>
		<c:forEach var="i" begin="1" end="${ju }">	<!-- 행 -->
		<tr>
			<c:forEach var="j" begin="0" end="6">	<!-- 열 -->
			<c:if test="${(j < yoil && i==1) || (chong <day)}">	<!-- 1일 이전의 빈칸(열(주)이 1일의해당요일보다 작고(1일이전의 열들을 빈칸) && 모든 행이 아닌 첫번째 행만 포함) -->
				<td> &nbsp;</td>								<!-- 해당 달의 총 일수 이후도 빈칸을 주기위해서 : 총일수(30,31)가 숫자(30~, 31~)보다 작다면  빈칸 -->
			</c:if>
			<c:if test="${((j >= yoil && i==1) || i>1 ) && (chong >=day)}"><!-- 열이 1일의해당요일보다 크고(1일 이후~) 첫번째 행이거나 || 또는 2번째 행부터는 모두 숫자로 표시-->


				<td height="100">
				
						<div id="day" onclick="day(this)" class="day" name="wresv_cday">${day}</div>	


								<c:if test="${tt==1 }">
									tt=1
								</c:if>
					
					
								<c:if test="${tt==0 }">
									tt=0
								</c:if>
							
							
					


				</td>						<!-- 날짜 -->			<!-- 위의 조건과 맞추기 위해 밑에도 총의 조건을 작성해야한다. (&& 총일수가 숫자보다 같거나 큰 경우 출력) -->			


			<c:set var="day" value="${day+1 }"/>	<!-- 날짜값을 1씩 증가 -->
			</c:if>
			</c:forEach>
		
			
		</tr>
		</c:forEach>
	</table>

          
	<div id="time_1">
		<div id="time_txt"></div>
		<hr>
        <c:forEach items="${tlist }" var="tvo">
			<div id="time" class="time" name="wresv_time" onclick="time(this)" >${tvo.wt_time }</div>
		</c:forEach>  
	</div>

	<form name="wresv" method="post" action="weddingReserve_ok" onsubmit="return resv(this)">

	<div id="resv_txt">RESERVATION</div>	
	<table id="resv" align="center">
		<tr>
			<td colspan="4">
				<c:if test="${userid != null }">
					<input type="button" onclick="edit()" value="정보수정">
				</c:if>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td width="400">
				<c:if test="${userid != null }">
						<input type="text" name="wresv_name" id="wresv_name" value="${name}" readonly>
				</c:if>
				<c:if test="${userid == null }">
						<input type="text" name="wresv_name">
				</c:if>
			</td>
			<td>전화번호</td>
			<td>
				<c:if test="${userid != null }">
					<input type="text" name="wresv_phone" id="wresv_phone" value="${phone }" readonly>
				</c:if>
				<c:if test="${userid == null }">
						<input type="text" name="wresv_name">
				</c:if>
			</td>
			<td rowspan="5">
				<img src="../img/wedding/wedding_resv.jpg" width="400" height="400">
				<input type="submit" class="button button-contactForm btn_1 boxed-btn" value="예약하기" onclick="resv()">
			</td>
		</tr>
		
		<tr>
			<td>희망하는 웨딩홀</td>
          	<td colspan="3">
				<select name="wresv_hall">dd
          		<c:forEach items="${hlist }" var="hvo">
					<option value="${hvo.wed_hall }">${hvo.wed_hall }</option>
          		</c:forEach>
				</select>
          	</td>
		</tr>
		
		<tr>
          	<td>상담일</td>
          	<td>
          		<input type="text" name="wresv_cday" id="day2" readonly>
         	</td>
          	<td>상담 시간</td>
          	<td>
      			<input type="text" name="wresv_time" value="${wresv_time}" readonly>
         	</td>
		</tr>
		
		<tr>
          	<td>예식 희망일</td>
          	<td><input type="text" id="datepicker" name="wresv_wday"></td>
          	<td>예상 하객수</td>
          	<td>
          		<select name="wresv_inwon">
          			<option value="0~100명">100명 이하</option>
          			<option value="100~200명">100~200명</option>
          			<option value="200~300명">200~300명</option>
          			<option value="300명 이상">300명 이상</option>
          		</select>
          	</td>
		</tr>
		
		<tr>
          	<td>기타 문의사항</td>
          	<td colspan="3"><textarea name="wresv_content" placeholder="요청사항은 상황에 따라 수용이 어려울 수 있습니다. 양해 부탁드립니다."></textarea></td>
		</tr>
		
	</table>
	</form>  
	
</div>
</section>    


   <!--================ Single-Wedding Area end =================-->

</body>