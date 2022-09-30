<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
 <style>
  #section{
    width:100%;
    height:1700px;
    border:1px solid #887159;
  }
  #section h3{
    font-family: Bernard MT Condensed;
  }
  #section table{
    margin:auto; 
    margin-top:15px;
    margin-bottom:15px;
  }
  #section table #info{
    font-size:14px;
  }
  #section table #calendar{
    border-top:2px solid #887159;
    padding-left:30px;
    line-height:2;
    /* height:700px; */
    padding-right:50px;
    text-align:center;
    border-collapse:collapse;
    margin-top:20px;
    border-bottom:1px solid #887159;
  }
  #section #calendar tr:last-child{
    border-bottom:2px solid #887159;
  }
  #section #calendar th{
    font-weight:700px;
    /* width:142px; */
    height:50px;
    border-bottom:1px solid #887159;
    /* border:1px solid red; */
  }
  #section #calendar td{
    border-bottom:1px solid #d3d3d3;
    width:140px;
    height:140px;
  }

  #section #day{
    text-align:left;
    /* height:10px; */
    /* border:1px solid blue; */
  }
   #section #calendar #day #dine_type{ /**/
    display:hidden;
  }
  #section #day_td{
    height:20px;
    /* border:1px solid black; */
  }
  #section #pri_info{
    height:80px;
    font-size:12px;
  }
  #section #type_info{
    text-align:center;
    width:140px;
    background: #b8a898;
  }
  .sprite{
background-color: #fefefe;
opacity: 0.4;
background-size: 7px 7px;
background-image: repeating-linear-gradient(45deg, #828284 0, #828284 0.7000000000000001px, #fefefe 0, #fefefe 50%);
  }
  #section input [type=submit]{
     background:#a28d78;
     color:#f2f1ef;
     width:200px;
     height:50px;
     font-size:16px;
     text-align:center;
     /* padding: 5px 0px; */
  }
  #section #dinetype{
     margin-top:5px;
     margin-left:2px;
     margin-bottom:1px;
     height:87px;
     vertical-align: middle;
  }
  #section #dinetype :hover{ /* 다이닝 타입 마우스오버 css */
     color:blue;
     text-decoration:underline;
  }
  #dine_typediv #dine #btn{
  }
  #dine_typediv #dine .btn{  /* 이전, 예약하기 버튼 css */
     border:1px solid #b8a898;
     background:#c3b091;
     /* color:#faf0e6; */
  }
  #dine_typediv #dine{ /* 예약 희망일시(select) table css*/
     height:200px;
     display:hidden;
  }
  #dine_typediv table{
     margin-top:20px;
     border-top:2px solid #887159;
  }
  #dine_typediv table tr, th{
     border-bottom:1px solid #887159;
  }
/*   #dine_typediv table tr{
     margin-left:30px;
  } */
  tbody{
      margin-left:30px;
  }
  #dine_typediv #dine tr:first-child{
     background:#eeeae1 ;
  } 
  #dine_typediv #dine tr:last-child{
     border-bottom:2px solid #887159;
  } 
  #section #dine_typediv table{
     display:none;
  }
  
  
  /*  bootstrap calendar css 시작  */  /*  bootstrap calendar css 시작  */  /*  bootstrap calendar css 시작  */
  .calendar-toolbar {
  margin-bottom: 10px;
  }
  .calendar-month-row {
  height: 75px;
  }
  .calendar-prior-months-date {
  color: #DDD;
  }
  .calendar-current-date {
  text-align: center;
  display: inline-block;
  width: 115px;
  }
  .page-header{
  margin-top:30px;
  margin-bottom:20px;
  }
 </style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<script>
	/* 달력에서 예약마감된 날짜의 식사타입을 빨간색으로 처리 */
	window.onload=function() {
		let dt=[${dt}];	// 예약된 식사타입
		let td=[${td}];	// 예약된 날짜
		let cnt=[${cnt}];	// 예약된 수
		let bk=6;	// 식사타입당 두 타임을 합쳐 만석인 테이블의 수를 입력 (ex : 8시 타임 3테이블 + 10시 타임 3테이블 = 총 6 입력)
      
		for(i=0;i<td.length;i++) {
			if(dt[i] == 1 && cnt[i] == bk) {
				document.getElementsByClassName("b1")[td[i]-1].style.color="#aca8af";
				document.getElementsByClassName("b1")[td[i]-1].style.textDecoration="line-through"; 
				document.getElementsByClassName("b1")[td[i]-1].setAttribute("onclick", "alert('선택하신 시간의 예약이 마감되었습니다. 다시 선택해주시기 바랍니다.');");
				}
				else if(dt[i] == 2 && cnt[i] == bk) {
					document.getElementsByClassName("b2")[td[i]-1].style.color="#aca8af";
					document.getElementsByClassName("b2")[td[i]-1].style.textDecoration="line-through";
					document.getElementsByClassName("b2")[td[i]-1].setAttribute("onclick", "alert('선택하신 시간의 예약이 마감되었습니다. 다시 선택해주시기 바랍니다.');");
					}
					else if(dt[i] == 3 && cnt[i] == bk) {
						document.getElementsByClassName("b3")[td[i]-1].style.color="#aca8af";
						document.getElementsByClassName("b3")[td[i]-1].style.textDecoration="line-through";
						document.getElementsByClassName("b3")[td[i]-1].setAttribute("onclick", "alert('선택하신 시간의 예약이 마감되었습니다. 다시 선택해주시기 바랍니다.');");
					}
						else if(dt[i] == 4 && cnt[i] == bk) {
							document.getElementsByClassName("b4")[td[i]-1].style.color="#aca8af";
							document.getElementsByClassName("b4")[td[i]-1].style.textDecoration="line-through";
							document.getElementsByClassName("b4")[td[i]-1].setAttribute("onclick", "alert('선택하신 시간의 예약이 마감되었습니다. 다시 선택해주시기 바랍니다.');");
						}
		}
	}
   
	/* 달력에서 [아침,점심,저녁]을 클릭하면, 해당 [날짜], [다이닝타입], [시간대]를 보내기 → [시간대]의 예약마감은 ajax로 값 가져와서 처리 */
	function date_type(y, m, d, t) {
		let ymd=y+"-"+m+"-"+d;
		document.getElementById("dr_date").value=ymd;
		document.getElementById("dr_type").innerHTML="<option>"+t+"</option>";

		let chk=new XMLHttpRequest();
		chk.open("get", "getDTresv?dd="+ymd+"&dt="+t);
		chk.send();
		chk.onreadystatechange=function(){
			if(chk.readyState == 4) {
				let tmcnt=chk.responseText.split(",");	// [시간, 예약수, 시간, 예약수] = [8, 3, 10, 1]
				
				/* 예약된 게 있다면 */
				let bk=3;	// 타임당 만석인 테이블의 수를 입력 (ex : 8시 타임 3테이블, 10시 타임 3테이블 = 3 입력)
				if(tmcnt.length > 1) {
					for(i=0;i<tmcnt.length-1;i+=2) {
						if(tmcnt[i] == 8 && tmcnt[i+1] == bk) {
							document.getElementById("dr_time").innerHTML="<option>선택</option><option value='08:00' disabled>08:00</option><option value='10:00'>10:00</option>";
							break;
							}
							else if(tmcnt[i] == 10 && tmcnt[i+1] == bk) {
								document.getElementById("dr_time").innerHTML="<option>선택</option><option value='08:00'>08:00</option><option value='10:00' disabled>10:00</option>";
								break; 
								}
								else if((tmcnt[i] == 8 && tmcnt[i+1] != bk) || (tmcnt[i] == 10 && tmcnt[i+1] != bk))
									document.getElementById("dr_time").innerHTML="<option>선택</option><option value='08:00'>08:00</option><option value='10:00'>10:00</option>";
						else if(tmcnt[i] == 13 && tmcnt[i+1] == bk) {
							document.getElementById("dr_time").innerHTML="<option>선택</option><option value='13:00' disabled>13:00</option><option value='15:00'>15:00</option>";
							break;
							}
							else if(tmcnt[i] == 15 && tmcnt[i+1] == bk) {
								document.getElementById("dr_time").innerHTML="<option>선택</option><option value='13:00'>13:00</option><option value='15:00' disabled>15:00</option>";
								break; 
								}
								else if((tmcnt[i] == 13 && tmcnt[i+1] != bk) || (tmcnt[i] == 15 && tmcnt[i+1] != bk))
									document.getElementById("dr_time").innerHTML="<option>선택</option><option value='13:00'>13:00</option><option value='15:00'>15:00</option>";
						else if(tmcnt[i] == 16 && tmcnt[i+1] == bk) {
							document.getElementById("dr_time").innerHTML="<option>선택</option><option value='16:00' disabled>16:00</option><option value='18:00'>18:00</option>";
							break;
							}
							else if(tmcnt[i] == 18 && tmcnt[i+1] == bk) {
								document.getElementById("dr_time").innerHTML="<option>선택</option><option value='16:00'>16:00</option><option value='18:00' disabled>18:00</option>";
								break; 
								}
								else if((tmcnt[i] == 16 && tmcnt[i+1] != bk) || (tmcnt[i] == 18 && tmcnt[i+1] != bk))
									document.getElementById("dr_time").innerHTML="<option>선택</option><option value='16:00'>16:00</option><option value='18:00'>18:00</option>";
					}
				}
				else {
					/* 예약된 게 없다면 */
					document.getElementById("dr_type").innerHTML="<option value='"+t+"'>"+t+"</option>";
					if(t == 'Breakfast')
						document.getElementById("dr_time").innerHTML="<option>선택</option><option value='08:00'>08:00</option><option value='10:00''>10:00</option>";
						else if(t == 'Lunch')
							document.getElementById("dr_time").innerHTML="<option>선택</option><option value='13:00'>13:00</option><option value='15:00'>15:00</option>";
							else if(t == 'Dinner')
								document.getElementById("dr_time").innerHTML="<option>선택</option><option value='16:00'>16:00</option><option value='18:00'>18:00</option>";
							    else if(t == 'Bbq')
								    document.getElementById("dr_time").innerHTML="<option>선택</option><option value='16:00'>16:00</option><option value='18:00'>18:00</option>";
				}
			}
		}	
		
  } 

  function check()
	{
		// 다이닝 타입, 입장 시간
		if(document.view_type.dr_date.value.trim()=="")
		{
			alert("예약 희망 날짜를 선택해주세요.");
			return false;
		}
		else if(document.getElementById("dr_time").selectedIndex==0)
		{
			alert("예약 희망 시간을 선택해주세요.");
			return false;
		}  
		else
			return true;
		  // options[view_type.selectedIndex]
	}

  /* function show()
    {
	  $('#dine_type').show();
    } */
/*     function show()
    {
    	document.getElementById("dine_type").style.display="block";
    }
 */

/*     function hide(){
     document.getElementById("dine_typediv").style.display ="none"; 	 
    	
    } */
    window.onload = function () {
        var el = document.getElementById("dr_time");
        el.onclick = show;
    }
    function show(){
    	var table=document.getElementById("dinediv");
   	     table.style.display ="block"; 
   	    
   	 //alert("몽!");
    }
</script>
</head>

<body>
   <!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
       ①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
       ②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area s7">   <!-- class="bradcam_area 클래스명" -->
        <div id="h3"> L A&nbsp;&nbsp;M E R  </div>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
   <!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->

<div id="section">
 
    <table width="1100" border="1">
     <c:forEach items="${dlist}" var="dvo">
     <tr id="pri_info">
        <th id="type_info">${dvo.dine_type}</th>
        <td>
           성인 <fmt:formatNumber value="${dvo.dine_adult}" pattern="#,###"/>원<br>
           어린이 <fmt:formatNumber value="${dvo.dine_child}" pattern="#,###"/>원
        </td>

    </tr>
    </c:forEach>
    </table>
 <%--   <div> <fmt:formatNumber value="${drvo.dr_total}" pattern="#,###"/>원 </div> --%>
    <table width="1100">
     <tr>
        <td id="info">
▷ 4월1일부로 디너 이용 시 만12세 이하의 어린이 입장이 제한됩니다.<br>
▷ 드레스코드 : 비지니스 캐쥬얼 / 최상의 격식을 갖춘 서비스를 제공하기 위해 입장 시 
트레이닝 팬츠와 슬러퍼, 샌들 착용을 제한하고 있사오니 너그러운 양해를 부탁드립니다.<br>
▷ 온라인 예약은 신청 후 <예약확정>을 받으셔야 방문이 가능합니다. (예약 확정 시 전화 또는 문자가 발송됩니다.)<br>
▷ 창가좌석은 지정예약이 불가하며 예약하신 순차적으로 배정 됩니다.
        </td>
     </tr>
   </table>

<!-- bootstrap calendar html 시작 --> <!-- bootstrap calendar html 시작 --> <!-- bootstrap calendar html 시작 -->
 <table id="top" width="1100">
  <tr>
    <th>
  <h2 class="page-header">
    <i class="fa fa-calendar"></i>
     Dining Calendar
  </h2>
  
<div class="calendar" id="calendar">
  <!-- Calendar toolbar div 시작-->  <!-- Calendar toolbar div 시작-->
   <div class="calendar-toolbar">
    
     <!-- Calendar "prev" button -->
      <button data-toggle="calendar" data-action="prev" class="btn btn-default">
  
          <c:if test="${m==1}">
            <a href="dining_reserve?y=${y-1}&m=12">  <i class="fa fa-chevron-left"></i>
          </c:if>
    
          <c:if test="${m!=1}">
            <a href="dining_reserve?y=${y}&m=${m-1}"> <i class="fa fa-chevron-left"></i> </a>
          </c:if>
      </button>

          <!-- Calendar "date-indicator" span -->
           <div class="calendar-current-date"
                data-day-format="MM/DD/YYYY"
                data-week-format="MM/DD/YYYY"
                data-month-format="MMMM, YYYY">
                  <span style="font-weight:800px;font-size:20px;"> ${y}년 ${m}월 </span>
           </div>
            
          <!-- Calendar "next" button -->
            <button data-toggle="calendar" data-action="next" class="btn btn-default">
                <c:if test="${m==12}">
                  <a href="dining_reserve?y=${y+1}&m=1"> <i class="fa fa-chevron-right"></i> </a>
                </c:if>
           
                <c:if test="${m!=12}">
                  <a href="dining_reserve?y=${y}&m=${m+1}"> <i class="fa fa-chevron-right"></i> </a>
                </c:if>
            </button>
       </div>  <!-- Calendar toolbar div 끝 -->  <!-- Calendar toolbar div 끝 -->
      </div>
     </th>
    </tr>
  </table>
  
  <div id="per"></div>
  <table id="calendar" width="1100" align="center">    <!-- table 시작 -->
     <tr>
        <th> sun</th>
        <th> mon</th>
        <th> tue</th>
        <th> wed</th>
        <th> thu</th>
        <th> fri</th>
        <th> sat </th>
      </tr> 
   <c:set var="day" value="1"/>
   <c:forEach  var="i" begin="1" end="${ju}"> <!-- 행 -->
      <tr> 
      
        <c:forEach var="j" begin="0" end="6">  <!-- 열 -->
          <c:if test="${(j < yoil && i==1) || (chong < day) }">
           <td>&nbsp;</td>
          </c:if>
           
          <c:if test="${ !((yoil>j && i==1) || (chong < day)) }">

          <td id="day">
             <span id="day_td">${day}</span>
          <%
               int day2=Integer.parseInt(pageContext.getAttribute("day").toString());
               int y=Integer.parseInt(request.getAttribute("y").toString());
               int m=Integer.parseInt(request.getAttribute("m").toString());
             %> 
          <fmt:formatDate var="today" value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>
          <fmt:formatDate var="dday" value="<%=new java.util.Date(y-1900,m-1,day2) %>"  pattern="yyyy-MM-dd"/> 
  <div id="dinetype">
            <c:if test="${dday >= today}"> <!--  오늘 이후면 클릭 되도록 -->
           
            <div id="dine_type" class="b1" name="dine_type" style="font-size:14px;" onclick="show();date_type(${y}, ${m}, ${day}, 'Breakfast');">
               		<img src="../img/dining/breakfast.png" width="17px;" height="17px;">
             Breakfast <br>
            </div>
            <div id="dine_type" class="b2" name="dine_type" style="font-size:14px;" onclick="show();date_type(${y}, ${m}, ${day}, 'Lunch');">
              		 <img src="../img/dining/lunch.png" width="17px;" height="17px;">
             Lunch <br>
            </div>
            <div id="dine_type" class="b3" name="dine_type" style="font-size:14px;" onclick="show();date_type(${y}, ${m}, ${day}, 'Dinner');">
             		  <img src="../img/dining/dinner.png" width="17px;" height="17px;">
             Dinner <br>
            </div>
            <div id="dine_type" class="b4" name="dine_type" style="font-size:14px;" onclick="show();date_type(${y}, ${m}, ${day}, 'Bbq');">
             		  <img src="../img/dining/bbq.png" width="18px;" height="19px;">
             Bbq <br>
            </div>
            </c:if>
             
            
            <c:if test="${dday < today}"> <!--  오늘보다 이전이면 안보이게, 클릭 안되게 -->
          <div class="sprite" style="height:96px;">
            <span id="dine_type" class="b1" name="dine_type" style="font-size:14px;display:none;" >
               <img src="../img/dining/breakfast.png" width="17px;" height="17px;">
               Breakfast <br>
            </span>
            <span id="dine_type" class="b2" name="dine_type" style="font-size:14px;visibility:hidden;" >
               <img src="../img/dining/lunch.png" width="17px;" height="17px;">
               Lunch <br>
            </span>
            <span id="dine_type" class="b3" name="dine_type" style="font-size:14px;visibility:hidden;" >
               <img src="../img/dining/dinner.png" width="17px;" height="17px;">
               Dinner <br>
            </span>
            <span id="dine_type" class="b4" name="dine_type" style="font-size:14px;visibility:hidden;" >
               <img src="../img/dining/bbq.png" width="18px;" height="19px;">
               Bbq <br>
            </span>
          </div>    
            </c:if> 
  </div>
            </td>
            
            <c:set var="day" value="${day+1}"/> <!-- 날짜값을 1씩 증가 -->
         </c:if> 

         </c:forEach>
       </tr>
     </c:forEach> 
   </table>		
<div id="dine_typediv" > <!-- 타임 클릭시 아래 반영되는 div --> 
<span id="ccc" style="display:none"></span> 
  <form name="view_type" method="post" action="dining_reserve_next" onsubmit="return check()">
     <div id="dinediv">
     <table id="dine" width="1100">
	    <tr id="sel">
	       <th width="300">방문 희망 일자</th>
	       <th width="300">조식/중식/석식</th>
	       <th width="300">예약시간</th>
	     </tr>
	     <tr id="sel">
	       <td><input type="text" name="dr_date" readonly id="dr_date"></td>
	       <td><select name="dine_type" id="dr_type"></select></td>
	       <td><select name="dr_time" id="dr_time"></select></td>
	     </tr>
	     <!-- <tr>
	       <td><input type="submit" value="예약하기" class="cbtn" > </td>
	     </tr> -->
	     <tr id="btn">
	       <td><input type="button" value="이전" class="btn" onclick="location='dining'"> </td>	       
           <td colspan="2" align="right">
           <input type="submit" value="예약하기" class="btn">

	     </tr>
   </table>
     </div>
  </form>
</div>

</div>

   
   <!-- bootstrap js 시작 -->  <!-- bootstrap js 시작 --> <!-- bootstrap js 시작 -->
  <script>

  // 이전 버튼 // 이전 버튼 // 이전 버튼 // 이전 버튼 // 이전 버튼 // 이전 버튼 // 이전 버튼
  Calendar.prototype.next = function () {
    switch (this.options.view) {
      case 'day':
        this.options.datetime.add(1, 'day');
        this.render();
        break;
      case 'week':
        this.options.datetime.endOf('week').add(1, 'day');
        this.render();
        break;
      case 'month':
        this.options.datetime.endOf('month').add(1, 'day');
        this.render();
        break;
      default:
        break;
    }
  }
  // 다음 버튼 // 다음 버튼 // 다음 버튼 // 다음 버튼 // 다음 버튼 // 다음 버튼 // 다음 버튼  
  Calendar.prototype.prev = function () {
    switch (this.options.view) {
      case 'day':
        break;
      case 'week':
        break;
      case 'month':
        this.options.datetime.startOf('month').subtract(1, 'day');
        this.render();
        break;
      default:
        break;
    }
  }
 
  // Public data API.
  $('[data-toggle="calendar"]').click(function(){
    var $this = $(this),
        $elem = $this.parents('.calendar'),
        action = $this.data('action');
    if (action) {
      $elem.calendar(action);
    }
  });
$('#calendar').calendar();
</script>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>