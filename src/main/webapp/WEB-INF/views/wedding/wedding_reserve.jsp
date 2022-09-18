<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>

	 #hall li{
	display:inline-block;	
	width:150px;}
	#aa{
	width:1100px;
	margin:auto;}
	
	#bb .blog_right_sidebar{
	width:1100px;}
	#bb .blog_right_sidebar ul li{
	display:inline-block;	}
	#bb .blog_right_sidebar img{
	width:120px;}
	
	.c{
	height:400px;}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>

$(function(){
		
		$("#date").datepicker({
			
			format: "yyyy-mm-dd",	// 작성되지 않은 경우 기본 값: mm/dd/yy
			
		});
	});
</script>


<script>
function time(my)
{
	document.wresv.wresv_time.value=my.innerText;
	
}

function day(my)
{
	document.wresv.wresv_cday.value="${y}"+"-"+"${m}"+"-"+my.innerText;
	
	
	var wresv_cday=${y}+"-"+${m}+"-"+my.innerText;
//	alert(wresv_cday);
    var time2=document.getElementsByClassName("time2");
    var len=time2.length;
	var us=new XMLHttpRequest();
	us.open("get","wresv_cal?wresv_cday="+wresv_cday);
	us.send();
	us.onreadystatechange=function()
	{
		
		if(us.readyState==4)
		{
			
			
				
				//alert(us.responseText);
				document.getElementById("aa").innerHTML=us.responseText;
			
				var tt=us.responseText.split(",");
		 
			for(i=0;i<tt.length;i++)
			{
				for(j=0;j<len;j++)
				{
					if(time2[j].innerText.trim()==tt[i].trim())
					{
						time2[j].style.color="red";
						time2[j].style.textDecoration="line-through";
						time2[j].setAttribute("onclick","");
					}	
				}	
			}	
		/*	if(us.responseText=="0")
			{	
				//alert(us.responseText.replace("[","").replace("]",""));
				var time=us.responseText.replace("["," ").replace("]"," ");
				//time=time.split(",");
				alert(time);
				
				document.getElementById("aa").innerHTML="<span style='color:red; text-decoration:line-through;'>"+time+"</span>"
				
			}
			else
			{
				alert("ww");
			}	*/ 
		}
		
	}
	
	
/*	
	
	var wresv_cday=document.wresv.wresv_cday.value;
	var wresv_time=document.wresv.wresv_time.value;
	var chk=new XMLHttpRequest();
	chk.open("get","getcheck?wresv_cday="+wresv_cday+"&wresv_time="+wresv_time);
	chk.send();
	chk.onreadystatechange=function()
	{
		if(chk.readyState==4)
		{
			alert(chk.responseText);
		}
	}
	*/

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
        <h3> 상담예약 </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

    <!--================ Single-Wedding Area Start =================-->
    
    
<section class="blog_area section-padding">
        <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
     <form name="cal" method="post" action="">
          <table width="1100" border="1">
          <tr>
          <td colspan="7">
          <c:if test="${m==1  }">	<!-- 1월 -->
          	<a href="wedding_reserve?y=${y-1 }&m=12">이전</a>
          </c:if>
          <c:if test="${m!=1 }">	<!-- 1월아님 -->
            <a href="wedding_reserve?y=${y }&m=${m-1}">이전</a>
          </c:if>
          	${y }년 ${m }월
          <c:if test="${m==12 }">	<!-- 12월 -->
          	<a href="wedding_reserve?y=${y+1 }&m=1">다음</a>
          </c:if>
          <c:if test="${m!=12 }">	<!-- 12월아님 -->
            <a href="wedding_reserve?y=${y }&m=${m+1}">다음</a>
          </c:if>
          </td>
          
          </tr>
         <tr>
         	<td>sun</td>
         	<td>mon</td>
         	<td>tue</td>
         	<td>wed</td>
         	<td>thu</td>
         	<td>fri</td>
         	<td>sat</td>
         </tr> 
         <c:set var="day" value="1"/>
          
          <c:forEach var="i" begin="1" end="${ju }">	<!-- 행 -->
          
          <tr>
          		<c:forEach var="j" begin="0" end="6">	<!-- 열 -->
          		<c:if test="${(j < yoil && i==1) || (chong <day)}">	<!-- 1일 이전의 빈칸(열(주)이 1일의해당요일보다 작고(1일이전의 열들을 빈칸) && 모든 행이 아닌 첫번째 행만 포함) -->
          			<td> &nbsp;</td>								<!-- 해당 달의 총 일수 이후도 빈칸을 주기위해서 : 총일수(30,31)가 숫자(30~, 31~)보다 작다면  빈칸 -->
          		</c:if>
          		<c:if test="${((j >= yoil && i==1) || i>1 ) && (chong >=day)}"><!-- 열이 1일의해당요일보다 크고(1일 이후~) 첫번째 행이거나 || 또는 2번째 행부터는 모두 숫자로 표시-->
         	 		<td><div id="day" onclick="day(this)" name="wresv_cday">${day }</div></td>						<!-- 날짜 -->			<!-- 위의 조건과 맞추기 위해 밑에도 총의 조건을 작성해야한다. (&& 총일수가 숫자보다 같거나 큰 경우 출력) -->
         	 	<c:set var="day" value="${day+1 }"/>	<!-- 날짜값을 1씩 증가 -->
         	 	</c:if>
          		</c:forEach>
          		
          </tr>
          
          </c:forEach>
          </table>
          
          </form>
<!-- ----------------------------------------------------------- -->



          ss
          <form name="wresv" method="post" action="weddingReserve_ok">

          <!-- 예약가능한 시간 보이는 테이블 :예약가능/예약불가 -->
          <table border="1" id="timetable">


      
          		<c:forEach items="${tlist }" var="tvo">
          		
          	<tr>
        
        
          	
           <div id="aa"> </div> 
           
           
          	<td>
          	<!--	<div id="aa" class="time2" name="wresv_time" onclick="time(this)" >${tvo.wt_time }</div>
        
        <span style="color:red; text-decoration:line-through;">${tvo.wt_time }</span>  -->
       
       <div id="aa" class="time2" name="wresv_time" onclick="time(this)" >${tvo.wt_time }</div>
       
       
       
       
       
       
          	</td>
          	<td></td>

          	</tr>
          	</c:forEach>
          </table>

          <!-- 예약을 위한 정보 -->
          <!-- 객실의 이름을 출력 :get room-->
          
          <table border="1">
          <tr>
          	<td>희망하는 웨딩홀</td>
          	<td>
          	
          		<c:forEach items="${hlist }" var="hvo">
          			<input type="radio" name="wresv_hall" value="${hvo.wed_hall }">${hvo.wed_hall }
          		</c:forEach>
          	</td>
          </tr>
          <tr>
          	<td>클릭된 날짜(상담일)wresv_cday</td>
          	<td>
          		<input type="text" name="wresv_cday" id="day2">
          	</td>
          </tr>
          <tr>
          	<td>클릭된 시간(상담시간)</td>
          	<td>
         	<!--	<span id="time" name=""></span>   -->
         		<input type="text" name="wresv_time" value="${wresv_time}">
          	</td>
          </tr>
          <tr>
          	<td>예식희망일</td>
          	<td> <input type="text" id="date" name="wresv_wday"></td>
          </tr>
          <tr>
          	<td>내용</td>
          	<td><textarea name="wresv_content"></textarea></td>
          </tr>
          <tr>
          	<td colspan="2">
          		<input type="submit" value="전송">
          	</td>
          </tr>
          </table>
          </form>
          
          
       
          
          
          
          
          
          
            
             </div>
             </div>
      </div>
   </section>
   <!--================ Single-Wedding Area end =================-->

</body>