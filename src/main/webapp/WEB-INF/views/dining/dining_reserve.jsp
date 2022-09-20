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
  }
  #section #tit{
    font-weight:800px;
  }
  #section #day{
    text-align:left;
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
  // 예약 가능한 다이닝 타입 확인
//   function getDineAvail(){
	//  document.getElementById("dine_typediv").style.visibility="visible";
	  //var dine_type=document.
  //} 
  function categoryChange(e)
  {
	  
	  /* var dr_time_"${dine_type}"=dr_time_["Breakfast","Lunch","Dinner"]; */
	  var dr_time="${dine_type}";
	  var dr_time_Breakfast=["8:00","10:00"];
	  var dr_time_Lunch=["13:00","15:00"];
	  var dr_time_Dinner=["16:00","18:00"];
	  var target= document.getElementById("dr_time");
	  
	  var dr_time_Breakfast=["8:00","10:00"];
	  var dr_time_Lunch=["13:00","15:00"];
	  var dr_time_Dinner=["16:00","18:00"];
	  var target= document.getElementById("dr_time");
	  
	  if(e.value == "Breakfast") var d = dr_time_Breakfast;
		else if(e.value == "Lunch") var d = dr_time_Lunch;
		else if(e.value == "Dinner") var d = dr_time_Dinner;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = d[x];
			opt.innerHTML = d[x];
			target.appendChild(opt);
             }
  }
  function view_type(mine)
  {
	  // 체크된 다이닝 타입을 밑으로 보내기
		document.getElementById("dine_type").value=mine;
	
	}
</script>
</head>

<body>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area dining">	<!-- class="bradcam_area 클래스명" -->
        <h3> ON THE PLATE </h3>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->
	<!-- ================ 타이틀(자유롭게 변경) Area Start ================= -->
    <!-- 부타이틀(자유롭게 변경)_area_start -->

<div id="section">
 <div id="step1">
  <table width="1100" align="center" border="1">
     <tr>
        <th>STEP 1</th>
        <td >예약인원 선택</td>
     </tr>
     <tr>
        <th width="183">성인</th>
        <td width="183">
           <select name="adult" id="adult" onchange="total_price()">
              <option value="0"> 선택 </option>
			  <option value="1"> 1 </option>
		      <option value="2"> 2 </option>
			  <option value="3"> 3 </option>
           </select>
        </td>
        <th width="183">어린이</th>
        <td width="183">
           <select name="child" id="child">
              <option value="0"> 선택 </option>
			  <option value="1"> 1 </option>
		      <option value="2"> 2 </option>
			  <option value="3"> 3 </option>
           </select>
        </td>
        <th width="183">유아</th>
        <td width="183">
           <select name="baby" id="baby">
              <option value="0"> 선택 </option>
			  <option value="1"> 1 </option>
		      <option value="2"> 2 </option>
			  <option value="3"> 3 </option>
           </select>
        </td>
     </tr>
     </table>
     <table width="1100" border="1">
     <tr>
        <td>
▷ 4월1일부로 디너 이용 시 만12세 이하의 어린이 입장이 제한됩니다.<br>
▷ 드레스코드 : 비지니스 캐쥬얼 / 최상의 격식을 갖춘 서비스를 제공하기 위해 입장 시 
트레이닝 팬츠와 슬러퍼, 샌들 착용을 제한하고 있사오니 너그러운 양해를 부탁드립니다.<br>
▷ 온라인 예약은 신청 후 <예약확정>을 받으셔야 방문이 가능합니다. (예약 확정 시 전화 또는 문자가 발송됩니다.)<br>
▷ 창가좌석은 지정예약이 불가하며 예약하신 순차적으로 배정 됩니다.
        </td>
     </tr>
   </table>
  </div> <!-- step 1 div 끝 -->
    
    
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
           
          <c:if test="${ ((j >= yoil && i==1) || i>1) && (chong >= day) }">
          <c:set var="id" value="${dvo.dine_type}"/>
           <td id="day">${day}<p></p> 

 <div id="dine_typediv">        
		<!-- 방의 이름을 출력 -->
            <c:forEach items="${dlist}" var="dvo" varStatus="my">
             <c:if test="${dvo.dine_type == 'Breakfast' }">
               <a href="dining_reserve_next?y=${y}&m=${m}&d=${day}&dine_type=${dvo.dine_type}"> 
                <img src="../img/dining/breakfast.png" width="17px;" height="17px;">
                ${dvo.dine_type}
               </a><br>
             </c:if>
             
             <c:if test="${dvo.dine_type == 'Lunch' }">
               <%-- <a href="dining_reserve_next?y=${y}&m=${m}&d=${day}&dine_type=${dvo.dine_type}">  --%>
               <span class="dine_type" name="dine_type" style="font-size:12px;" onclick="view_type('${dvo.dine_type}')">
                <img src="../img/dining/lunch.png" width="17px;" height="17px;">
                ${dvo.dine_type}
               </span>
               </a><br>
             </c:if>
               
             <c:if test="${dvo.dine_type == 'Dinner' }">
               <a href="dining_reserve_next?y=${y}&m=${m}&d=${day}&dine_type=${dvo.dine_type}"> 
                <img src="../img/dining/dinner.png" width="17px;" height="17px;">
                ${dvo.dine_type}
               </a><br>
             </c:if>
            </c:forEach>   
 </div>
          </td>
               <c:set var="day" value="${day+1}"/> <!-- 날짜값을 1씩 증가 -->              
           </c:if>
         </c:forEach>
  
         </tr>
   </c:forEach> 
   </table>
 <form name="view_type" method="post" onsubmit="return dine(this)">
   <table id="dine" width="1100" border="1">
    <tr>
       <th width="300">방문 희망 일자</th>
       <th width="300">조식/중식/석식</th>
       <th width="300">예약시간</th>
     </tr>
     <tr>
       <td><input type="text" name="dr_date" value="${ymd}" readonly></td>
       <td>
       <input type="hidden" id="changeInput">
        <select value="" name="dine_type" id="dine_type" onchange="categoryChange(this)">
         <%-- <option value="${dine_type}">${dine_type}</option> --%>
         <option value="Breakfast" name="dine_type" id="dine_type">Breakfast</option>
         <option value="Lunch" name="dine_type" id="dine_type">Lunch</option>
         <option value="Dinner" name="dine_type" id="dine_type">Dinner</option>
        </select>
<%-- <input type="text" name="dine_type" value="${ dine_type}"> --%>
       </td>
       <td>

      <select id="dr_time" name="dr_time">
         <option value="0">선택</option>
          <c:if test="${dvo.dine_type == 'Breakfast' }">

            <option value="8:00" name="dr_time">8:00</option>
            <option value="10:00" name="dr_time">10:00</option>
          </c:if>
       
          <c:if test="${dvo.dine_type == 'Lunch' }">
    
            <option value="13:00" name="dr_time">13:00</option>
            <option value="15:00" name="dr_time">15:00</option>
          </c:if>
       
         <c:if test="${dvo.dine_type == 'Dinner' }">

            <option value="16:00" name="dr_time">16:00</option>
            <option value="18:00" name="dr_time">18:00</option>  
         </c:if>
       </select>
 
       </td>
     </tr>
   </table>
</form>
  </div>
   <!-- bootstrap js 시작 -->  <!-- bootstrap js 시작 --> <!-- bootstrap js 시작 -->
  <script>
(function($){
  var Calendar = function (elem, options) {
    this.elem = elem;
    this.options = $.extend({}, Calendar.DEFAULTS, options);
    this.init();
  };
  
  Calendar.DEFAULTS = {
    datetime: undifined,
    dayFormat: 'DDD',
    weekFormat: 'DDD',
    monthFormat: 'MM/DD/YYYY',
    view: undefined,
  };

  Calendar.prototype.init = function () {
    if (! this.options.datetime || this.options.datetime == 'now') {
      this.options.datetime = moment();
    }
    if (! this.options.view) {
      this.options.view = 'month';
    }
    this.initScaffold()
        .initStyle()
        .render();
  }
  
  Calendar.prototype.initScaffold = function () {
    
    var $elem = $(this.elem),
        $view = $elem.find('.calendar-view'),
        $currentDate = $elem.find('.calendar-current-date');
    
    if (! $view.length) {
      this.view = document.createElement('div');
      this.view.className = 'calendar-view';
      this.elem.appendChild(this.view);
    } else {
      this.view = $view[0];
    }
    console.log($currentDate);
    console.log($currentDate);
    
    if ($currentDate.length > 0) {
      var dayFormat = $currentDate.data('day-format'),
          weekFormat = $currentDate.data('week-format'),
          monthFormat = $currentDate.data('month-format');
      this.currentDate = $currentDate[0];
      if (dayFormat) {
        this.options.dayFormat = dayFormat;
      }
      if (weekFormat) {
        this.options.weekFormat = weekFormat;
      }
      if (monthFormat) {
        this.options.monthFormat = monthFormat;
      }
    }
    return this;
  }
  
  Calendar.prototype.initStyle = function () {
    return this;
  }
  
  Calendar.prototype.render = function () {
    switch (this.options.view) {
      case 'day': this.renderDayView(); break;
      case 'week': this.renderWeekView(); break;
      case 'month': this.renderMonthView(); break;
      befault: this.renderMonth();
    }
  }
  
  Calendar.prototype.renderDayView = function () {
    //$(this.elem).append('Day View');
  }
  
  Calendar.prototype.renderWeekView = function () {
    //$(this.elem).append('Week View');
  }
  
  Calendar.prototype.renderMonthView = function () {
    
    var datetime = this.options.datetime.clone(),
        month = datetime.month();
    datetime.startOf('month').startOf('week');
    
    var $view = $(this.view),
        table = document.createElement('table'),
        tbody = document.createElement('tbody');
    
    $view.html('');
    table.appendChild(tbody);
    table.className = 'table table-bordered';
    
    var week = 0, i;
    while (week < 6) {
      tr = document.createElement('tr');
      tr.className = 'calendar-month-row';
      for (i = 0; i < 7; i++) {
        td = document.createElement('td');
        td.appendChild(document.createTextNode(datetime.format('D')));
        if (month !== datetime.month()) {
          td.className = 'calendar-prior-months-date';
        }
        tr.appendChild(td);
        datetime.add(1, 'day');
      }
      tbody.appendChild(tr);
      week++;
    }
    
    $view[0].appendChild(table);
    
    if (this.currentDate) {
      $(this.currentDate).html(
        this.options.datetime.format(this.options.monthFormat)
      );
    }
    
  }
  
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
  
  Calendar.prototype.today = function () {
    this.options.datetime = moment();
    this.render();
  }

  function Plugin(option) {
    return this.each(function () {
      var $this = $(this),
          data  = $this.data('bs.calendar'),
          options = typeof option == 'object' && option;
      if (! data) {
        data = new Calendar(this, options);
        $this.data('bs.calendar', data);
      }
      
      switch (option) {
        case 'today':
          data.today();
          break;
        case 'prev':
          data.prev();
          break;
        case 'next':
          data.next();
          break;
        default:
          break;
      }
    });
  };
  var noConflict = $.fn.calendar;

  $.fn.calendar             = Plugin;
  $.fn.calendar.Constructor = Calendar;

  $.fn.calendar.noConflict = function () {
    $.fn.calendar = noConflict;
    return this;
  };

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