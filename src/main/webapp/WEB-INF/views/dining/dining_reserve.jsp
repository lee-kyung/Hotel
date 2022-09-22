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
  }
  #section #tit{
    font-weight:800px;
  }
  #section #day{
    text-align:left;
  }
  #section #dine_type_1:hover{
    color:red;
  }
  #section #dine_type_2:hover{
    color:blue;
  }
  #section #dine_type_3:hover{
    color:purple;
  }
/*   #section #dine_typediv{
    visibility:hidden;
  } */ 
  
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

  //} 
  /*function categoryChange(e)
  {*/
     
     /* var dr_time_"${dine_type}"=dr_time_["Breakfast","Lunch","Dinner"]; */
     /*var dr_time="${dine_type}";
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
  }*/
  
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
/*   // 예약 가능한 다이닝 타입 확인
   function getDineAvail(){
     document.getElementById("dine_typediv").style.visibility="visible";
     var adult=document.view_type.adult.value;
     // input name=document.form이름.input id
     var child=document.view_type.child.value;
     var chk=new XMLHttpRequest();
     chk.open("get","getDineAvail?adult="+adult+"&child="+child);
     chk.send();
     chk.onreadystatechange=function(){
        if(chk.readyState==4){
         alert(chk.responseText);  
         document.getElementById("ccc").innerText=chk.responseText;
         var aa=chk.responseText.split(",");
         
          alert(chk.responseText.length);
          var cbtn=document.getElementsByClassName("cbtn");
          for(i=0;i<cbtn.length;i++){
             document.getElementsByClassName("cbtn")[i].disabled=false;             
          }
          if(aa.length >1){
             var dine_type=document.getElementsByClassName("dine_type");
             
             for(i=0;i<aa.length;i+=2){
               for(j=0;j<dine_type.length;j++){
                  if(aa[i]==dine_type[j].innerText.trim()){
                     if(aa[i+1]>=2)
                        cbtn[j].disabled=true;
                  }
               }      
            }      
         }
      }   
   }
} */  
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
 <form name="view_type" method="post" action="dining_reserve_next">
 <input type="hidden" name="dine_type">
 <div id="step1">

  <%-- <table width="1100" align="center" border="1">
     <tr>
        <th>STEP 1</th>
        <td >예약인원 선택</td>
     </tr>
     <tr>
        <th width="183">성인</th>
        <td width="183">
           <select name="adult" id="adult">
              <option name="adult" id="adult" value="0"> 선택 </option>
           <option name="adult" id="adult" value="1"> 1 </option>
            <option name="adult" id="adult" value="2"> 2 </option>
           <option name="adult" id="adult" value="3"> 3 </option>
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
     <tr>
       <td><input type="button" id="searchbtn" value="조회" onclick="getDineAvail(${my.index})"></td>
     </tr>
     </table> --%>
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

  </div> <!-- step 1 div 끝 -->
    
    </form>
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
             ${day}<p>
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
             
            </c:if> 
            </td>
            
            <c:set var="day" value="${day+1}"/> <!-- 날짜값을 1씩 증가 -->
         </c:if> 

         </c:forEach>
       </tr>
     </c:forEach> 
   </table>
 </div>  
   <div id="ccc" style="display:none"></div>
 <div id="dine_typediv"> <!-- ajax를 위한 div -->  
 <form name="view_type" method="post" action="dining_reserve_next">  
   <table id="dine" width="1100" border="1">
    <tr>
       <th width="300">방문 희망 일자</th>
       <th width="300">조식/중식/석식</th>
       <th width="300">예약시간</th>
     </tr>
     <tr>
       <td><input type="text" name="dr_date" readonly id="dr_date"></td>
       <td>
        <select name="dine_type" id="dr_type"></select>
       </td>
       <td>

      <select name="dr_time" id="dr_time"></select>
      
      <%-- <select id="dr_time" name="dr_time">
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
       </select> --%>
       
       </td>
     </tr>
     <tr>
       <td><input type="submit" value="예약하기" class="cbtn" >
       <%-- onclick="location='dining_reserve_next?dr_date=${drvo.dr_date}&dr_time=${drvo.dr_time }'"> --%>
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