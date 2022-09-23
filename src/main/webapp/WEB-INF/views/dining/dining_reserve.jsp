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
  #section table{
    margin:auto; 
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
  }
  #section #calendar td{
    border-bottom:1px solid #d3d3d3;
    width:140px;
    height:80px;
  }
  #section #day{
    text-align:left;
  }
  .sprite{
  background: repeating-linear-gradient(-45deg, #444, #444 10px, #888 0, #888 20px);
  }
  
  /*  bootstrap calendar css 시작  */
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
   // 예약 완료된 타임은 빨간색 으로 처리
   window.onload=function()
   {
      var td=[${td}];    // var td=[25, 30, 27, 27, 28]
      var dt=[${dt}];  // var td=[아침, 아침, 점심, 저녁, 저녁]
      var today=new Date();
      var dd=1;
          //if(today.getFullYear()==${y} && today.getMonth()+1 == ${m}) // 요청한 달이 이번달이라면  
          //dd=today.getDate();
       //alert(dd);
      //alert(td.length);
      for(i=0;i<td.length;i++)
      {
         if(dt[i] == 1)
                 document.getElementsByClassName("b1")[td[i]-dd].style.color="red";
            else if(dt[i] == 2)
                     document.getElementsByClassName("b2")[td[i]-dd].style.color="red";
                 else if(dt[i] == 3)
                     document.getElementsByClassName("b3")[td[i]-dd].style.color="red";
      }
      
   }
  /* 달력에서 [아침,점심,저녁]을 클릭하면, 해당 [날짜], [다이닝타입], [시간대]를 보내기 */
     function date_type(y, m, d, t) {
      document.getElementById("dr_date").value=y+"-"+m+"-"+d;
      document.getElementById("dr_type").innerHTML="<option value='"+t+"'>"+t+"</option>";
      if(t == 'Breakfast')
         document.getElementById("dr_time").innerHTML="<option>선택</option><option value='8:00'>8:00</option><option value='10:00' name='dr_time'>10:00</option>";
         else if(t == 'Lunch')
            document.getElementById("dr_time").innerHTML="<option>선택</option><option value='13:00'>13:00</option><option value='15:00' name='dr_time'>15:00</option>";
            else if(t == 'Dinner')
               document.getElementById("dr_time").innerHTML="<option>선택</option><option value='16:00'>16:00</option><option value='18:00' name='dr_time'>18:00</option>";
  }
 
</script>
</head>

<body>
   <!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
       ①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
       ②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area dining">   <!-- class="bradcam_area 클래스명" -->
        <h3> ON THE PLATE </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
   <!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->

<div id="section">
 <input type="hidden" name="dine_type">
    <table width="1100" border="1">
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
 <table id="top" width="1100" border="1">
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
             ${day}<p></p>
          <%
               int day2=Integer.parseInt(pageContext.getAttribute("day").toString());
               int y=Integer.parseInt(request.getAttribute("y").toString());
               int m=Integer.parseInt(request.getAttribute("m").toString());
             %> 
          <fmt:formatDate var="today" value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>
          <fmt:formatDate var="dday" value="<%=new java.util.Date(y-1900,m-1,day2) %>"  pattern="yyyy-MM-dd"/> 
  
            <c:if test="${dday >= today}"> <!--  오늘 이후면 클릭 되도록 -->
           
            <span id="dine_type" class="b1" name="dine_type" style="font-size:14px;" onclick="date_type(${y}, ${m}, ${day}, 'Breakfast')">
               <img src="../img/dining/breakfast.png" width="17px;" height="17px;">
               Breakfast <br>
            </span>
            <span id="dine_type" class="b2" name="dine_type" style="font-size:14px;" onclick="date_type(${y}, ${m}, ${day}, 'Lunch')">
               <img src="../img/dining/lunch.png" width="17px;" height="17px;">
               Lunch <br>
            </span>
            <span id="dine_type" class="b3" name="dine_type" style="font-size:14px;" onclick="date_type(${y}, ${m}, ${day}, 'Dinner')">
               <img src="../img/dining/dinner.png" width="17px;" height="17px;">
               Dinner <br>
            </span>
            </c:if>
             
            
            <c:if test="${dday < today}"> <!--  오늘보다 이전이면 안보이게, 클릭 안되게 -->
          <div class="sprite">
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
          </div>    
            </c:if> 
            </td>
            
            <c:set var="day" value="${day+1}"/> <!-- 날짜값을 1씩 증가 -->
         </c:if> 

         </c:forEach>
       </tr>
     </c:forEach> 
   </table>		
<div id="dine_typediv"> <!-- 타임 클릭시 아래 반영되는 div --> 
<span id="ccc" style="display:none"></span> 
  <form name="view_type" method="post" action="dining_reserve_next">
     <table id="dine" width="1100" border="1">
	    <tr>
	       <th width="300">방문 희망 일자</th>
	       <th width="300">조식/중식/석식</th>
	       <th width="300">예약시간</th>
	     </tr>
	     <tr>
	       <td><input type="text" name="dr_date" readonly id="dr_date"></td>
	       <td><select name="dine_type" id="dr_type"></select></td>
	       <td><select name="dr_time" id="dr_time"></select></td>
	     </tr>
	     <tr>
	       <td><input type="submit" value="예약하기" class="cbtn" > </td>
	     </tr>
   </table>
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
})(jQuery);

$('#calendar').calendar();
</script>
    <!-- 부타이틀(자유롭게 변경)_area_end -->
    <!-- ================ 타이틀(자유롭게 변경) Area End ================= -->

</body>