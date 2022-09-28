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
	.container {
		width: 1300px;
		margin: auto;
		margin-bottom: 80px;
	}
	roomsec {
		margin-bottom: 80px;
		margin: auto;
	}
	roomsec #txt1 {
		color: #887159;
		font-weight: 900;
		font-size: 50px;
		font-family: fantasy;
	}
	roomsec #txt2 {
		color: #887159;
		font-weight: 900;
		font-size: 20px;
	}

	roomsec table {
		width: 1200px;
		height: 100px;
		border: 1px solid #887159;
		background: #F9F9F9;
		/* color: #A6908C; */
		color: #887159;
		border: none;
		text-align: center;
		border-spacing: 0;
		border-collapse: collapsed;
		border: 1px solid #F9F9F9;
	}
	
	roomsec table th{
		font-size: 20px;
	}
	
	roomsec table input[type=text] {
		height: 40px;
		margin-top: 20px;
		/* border: 1px solid #E6E3DF; */
		border: 1px solid #887159;
	}

	roomsec table select {
		width: 100px;
		height: 40px;
		color: #887159;
		border: 1px solid #887159;
		background: white;
	}
		
	roomsec #searchbtn {
		background: #FFFFFF;
		border: 1px solid #887159;
		color: #887159;
		width: 120px;
		height: 40px;
	}
	
	roomsec #searchbtn:hover {
		color: white;
		background: #887159;
		cursor: pointer;
	}

/* 객실목록 */	
	roomsec #ro_info {
		width: 395px;
		height: 530px;
		border: 1px solid #887159;
		/* margin-bottom: 30px; */
		margin-top: 30px;
		display: inline-block;
		border-radius: 10px;
	}
	
	roomsec #ro_info img {
		width: 393px;
		height: 280px;
		border-top-right-radius: 10px;
		border-top-left-radius: 10px;
	}
	
	roomsec #roomdiv {
		visibility: hidden;
	}
	
	roomsec #ro_info #ro_in{
		margin-left: 10px;
		margin-top: 3px;
	}
	roomsec #rname{
		font-size: 20px;
		color: #887159;
		font-weight: 700;	
	}
	
	roomsec #rtxt3{
		font-size: 14px;
		color: #887159;
		height: 15px;
	}
	
	roomsec #ro_info #ro_inner{
		margin-top: 10px;
		color: #887159;
	}
	
	roomsec #subr{
		width: 120px;
		display: inline-block;
		font-weight: 500;
	}
	
	roomsec .cbtn {
		background: #FFFFFF;
		border: 1px solid #887159;
		color: #887159;
		width: 370px;
		height: 50px;
		font-weight: 900;
	}
	
	roomsec .cbtn:hover {
		cursor: pointer;
		background: #887159;
		color: #FFFFFF;
	}
	
	.crcode {
		display: none;
	}
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<script>

/*     $(document).ready(function(){       
    $( "#checkin,#checkout" ).datepicker({
         changeMonth: true,
         changeYear: true,
         showMonthAfterYear: true,
         dateFormat:"yy-mm-dd",
     });
    
    $('#checkin').datepicker("option", "maxDate", $("#checkout").val());
    $('#checkin').datepicker("option", "minDate", new Date());
    $('#checkin').datepicker("option", "onClose", function (selectedDate){
        $("#checkout").datepicker( "option", "minDate", selectedDate );
        });
    
    $('#checkout').datepicker();
    $('#checkout').datepicker("option", "minDate", $("#checkin").val());
    $('#checkout').datepicker("option", "onClose", function (selectedDate){
        $("#checkin").datepicker( "option", "maxDate", selectedDate );
       });

   });   */
 
   $(function(){
      $("#checkin").datepicker({
         format: "yyyy-mm-dd",
         minDate :new Date(),
      });
      $("#checkout").datepicker({
         minDate: new Date(),
         format: "yyyy-mm-dd",
      });
      
   }); 
  
// rcode받기
   function form_submit(n)
   {
      //alert(document.room.rcode2[n].value);
      document.room.rcode.value=document.room.rcode2[n].value;
      document.room.submit();
   }

// 비어있는 객실 확인
   function getRoomAvail(){
      var adult=parseInt(document.getElementById("adult").value);
      var child=parseInt(document.getElementById("child").value);
      var binwon=parseInt(adult+child);
   // 체크인,체크아웃,성인 인원수 체크
      if(document.getElementById("checkin").value.trim()=="")
      {
         alert("체크인 날짜를 선택하세요")
         return false;
      }
      else if(document.getElementById("checkout").value.trim()=="")
      {
         alert("체크아웃 날짜를 선택하세요")
         return false;
      }
      else if(document.getElementById("adult").value==0)
      {
         alert("인원을 선택하세요.")
         return false;
      }
      else
      {
      // 객실수량 체크해서 예약불가 표시
      document.getElementById("roomdiv").style.visibility="visible";
      var checkin=document.room.checkin.value;
      var checkout=document.room.checkout.value;
      //var adult=document.room.adult.value;
      var chk=new XMLHttpRequest();
      chk.open("get","getRoomAvail?checkin="+checkin+"&checkout="+checkout);
      chk.send();
      chk.onreadystatechange=function(){
         if(chk.readyState==4){
            //alert(chk.responseText);
            document.getElementById("ccc").innerText=chk.responseText;
            var aa=chk.responseText.split(",");
      
            //alert(chk.responseText.length);
            var cbtn=document.getElementsByClassName("cbtn");
            for(i=0;i<cbtn.length;i++){
               document.getElementsByClassName("cbtn")[i].disabled=false;
            }
            
            var crmax=document.getElementsByClassName("crmax");
            for(i=0;i<cbtn.length;i++){
               if(binwon > crmax[i].innerText){      
                  cbtn[i].disabled=true;
                  cbtn[i].style.background="#F9F9F9";
                  cbtn[i].style.border="1px solid #E6E3DF";
                  cbtn[i].style.color="#E6E3DF";
                  cbtn[i].style.hover="none";
               }
            }   

            if(aa.length > 1) {
               var crcode=document.getElementsByClassName("crcode");
               var crsu=document.getElementsByClassName("crsu");
               for(i=0;i<aa.length;i+=2){ //cnt받아온 객실길이만큼 돌때
                  for(j=0;j<crcode.length;j++){ // 만약 객실rcode가 
                     if(aa[i]==crcode[j].innerText.trim()){ // cnt들어있는 rcode랑 같다면
                        if(aa[i+1]>=crsu[j].value) 
                        {
                           cbtn[j].disabled=true;
                           cbtn[j].style.background="#F9F9F9";
                           cbtn[j].style.border="1px solid #E6E3DF";
                           cbtn[j].style.color="#E6E3DF";
                           cbtn[j].style.hover="none";
                        }
                     }
                  }      
               }      
            }   
         }   
      }
      return true;
   }
}

</script>
   <!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
       ①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
       ②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area rooms"> <!-- class="bradcam_area 클래스명" -->
        <div id="h3"> RESERVATION </div>>
    </div>
    <!-- bradcam_area_end -->
    <!-- ================ (Sitemesh) Top Area 키링템 End ================= -->

   <!-- ================ Rooms Area Start ================= -->
   <!-- 객실 리스트 -->
  <div class="container">
    <div class="row"> 
       <roomsec>
          <div id="txt1">RESERVATION</div>
          <div id="txt2">ㅁㅁ 호텔에 오신것을 환영합니다!</div>
          <br>
            <form name="room" method="post" action="room_resvnext" >
            <input type="hidden" name="rcode">
            <table>
               <tr> 
                  <th> 체크인 </th>
                  <th> 체크아웃 </th>
                  <th width="140px"> 성인 </th>
                  <th width="140px"> 어린이 </th>
                  <th width="160px"></th>
               </tr>  
               <tr>
                  <td><input type="text" name="checkin" id="checkin" placeholder="체크인"></td>
                  <td><input type="text" name="checkout" id="checkout" placeholder="체크아웃"></td>
                  <td> 
                     <select name="adult" id="adult">
                        <option value="0"> 선택 </option>
                        <option value="1"> 1 </option>
                        <option value="2"> 2 </option>
                        <option value="3"> 3 </option>
                        <option value="4"> 4 </option>
                        <option value="5"> 5 </option>
                        <option value="6"> 6 </option>
                     </select>
                  </td>
                  <td> 
                     <select name="child" id="child">
                        <option value="0"> 선택 </option>
                        <option value="1"> 1 </option>
                        <option value="2"> 2 </option>
                     </select>
                  </td>
                  <td> <input type="button" id="searchbtn" value="검색" onclick="return getRoomAvail()"> </td>   
               </tr>
            </table>

            
            <div id="ccc" style="display:none"></div>
         <div id="roomdiv">
            <c:forEach items="${list}" var="rvo" varStatus="my">
			<div id="ro_info">
            <input type="hidden" name="rcode2" value="${rvo.rcode}">
            <input type="hidden" name="rsu" value="${rvo.rsu}" class="crsu">
				<img src="../img/rooms/${rvo.rpimg}">
                <div id="ro_in">
					<div id="rname">${rvo.rname}</div> <span class="crcode">${rvo.rcode}</span>
					<div id="rtxt3">${rvo.rtxt3}</div>
	                <div id="ro_inner">
						<div><span id="subr">전망</span>${rvo.rview}</div>
						<div><span id="subr">베드타입</span>${rvo.rbed}</div>
						<div><span id="subr">가격</span>${rvo.rprice}</div>                  
						<div><span id="subr">기준|최대인원</span>${rvo.rmin}/<span class="crmax">${rvo.rmax}</span></div>
	                </div>                  
				<br>
					<input type="button" value="객 실 선 택" class="cbtn" onclick="form_submit(${my.index})">
				</div>
			</div>
            </c:forEach> 
         </div>
        </form>   
      </roomsec>
    </div>
  </div>
  <!-- ================ Rooms Area End ================= -->
</body>