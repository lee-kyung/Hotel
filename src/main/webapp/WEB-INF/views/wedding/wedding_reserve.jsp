<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@	page import="java.time.LocalDate" %> 
<%
	int y, m, d;
	if(request.getParameter("y")==null)
	{
		LocalDate today=LocalDate.now();
		y=today.getYear();	
		m=today.getMonthValue();

	}
	else
	{
		y=Integer.parseInt(request.getParameter("y"));
		m=Integer.parseInt(request.getParameter("m"));

	}
	
	LocalDate day=LocalDate.of(y, m, 1);
	
	int yoil=day.getDayOfWeek().getValue();
	if(yoil==7)
		yoil=0;
	
	int chong=day.lengthOfMonth();
	
	int ju=(int)Math.ceil((yoil+chong)/7.0);
	
	
	request.setAttribute("yoil", yoil);
	request.setAttribute("chong", chong);
	request.setAttribute("ju", ju);
	request.setAttribute("y", y);
	request.setAttribute("m", m);

	
%> 
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
	
	section #wed_resv #day1, #time{
	cursor:pointer;}
	
 	section #wed_resv #day1:hover, #time:hover{
	color:red;}
	
	section #wed_resv #day2{
	color:#D5D5D5;}

	section #wed_resv #resv_txt{
	margin-top:100px;
	font-family:fantasy;
	font-size:40px;
	font-weight:600;}
	
	section #wed_resv #login{
	border:1px solid #887159;
	background:#887159;
	margin-top:100px;
	width:600px;
	height:70px;
	margin-right:80px;
	padding-top:10px;}
	
	section #wed_resv #login input[type=button]{
	border:1px solid #887159;
	background:white;
	color:#887159;
	width:150px;
	height:50px;
	margin-left:40px;
	cursor:pointer;}
	
	section #wed_resv table#resv{
	margin-top:50px;
	margin-bottom:50px;
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
	
	section #wed_resv table#resv #wresv_name, #wresv_phone, #cday, #wresv_time, #wresv_email{
	background:#F3F3F3;}
	
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
	border: 1px solid #cccccc;
	margin-top:15px;}
	
	section #wed_resv table#resv select option{
	font-size:18px;}

	section #wed_resv table#resv #w_pay{
	height:450px;}
	
	section #wed_resv table#resv #w_pay #txt1{
	font-size:20px;}
	
	section #wed_resv table#resv #w_pay #pay{
	margin-left:20px;
	width:370px;}
	
	section #wed_resv table#resv #w_pay #pay div{
	display:inline-block;}
	
	section #wed_resv table#resv #w_pay #pay #right{
	float:right;}
	
	section #wed_resv table#resv #w_pay #txt2{
	margin-top:60px;
	font-size:20px;}
	 
	section #wed_resv table#resv #w_pay #paymethod{
	margin-left:20px;}
	
	section #wed_resv table#resv #w_pay #paymethod .radio{
	display:inline-block;
	border:1px solid #887159;
	margin-left:10px;
	width:160px;
	height:40px;
	text-align:center;
	padding-top:7px;
	color:#887159;}
    
	section #wed_resv table#resv #w_pay #paymethod .radio input[type=radio] {
	display: none;}
	
	section #wed_resv table#resv #w_pay #paymethod .radio label {
	display: block;
   	margin:-9px;
   	padding-top:15px;
    text-align: center;
    height:50px;
    border:1px solid #887159;}
		 
	section #wed_resv table#resv #w_pay #paymethod input[type=radio]:checked + label {
	background: #887159;
	color: white;}
		 	 
	section #wed_resv table#resv #w_pay #paymethod input[type=radio] + label {
	background:white;
	color:#887159;}
	
	section #wed_resv table#resv #w_pay #bank{
	visibility:hidden;
	margin-top:40px;
	margin-left:30px;}
	
	section #wed_resv table#resv #paymentBtn{
	width:400px;
	height:70px;}
	
	#wed_chk2{
	margin-bottom:100px;}
	#wed_chk2 img{
	width:100%;}
	
	section #wed_resv .btn_css{
	width:300px;
	border: 1px solid #887159;
	background:white;
	color:#887159;
	cursor:pointer;}
	
	section #wed_resv .btn_css:hover{
	background:#887159;
	color:white;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>


 	$(function(){
		$("#test").click(function(){
	        alert($(this).text());
	    });
	});  


	$(function(){
		
		$("#datepicker").datepicker({
			format: "yyyy-mm-dd",	// 작성되지 않은 경우 기본 값: mm/dd/yy
			minDate: new Date(),
		});
	});
	
	
	$(document).ready(function(){		
		$(window).scroll(function(){			
			$('#login').css('top',$(window).scrollTop()+270);		
			});	
		});
	
	
	

    
	
	function edit()
	{
		document.getElementById("wresv_name").readOnly=false; 
	  	document.getElementById("wresv_phone").readOnly=false;
	  	document.getElementById("wresv_email").readOnly=false;
	  	document.getElementById("wresv_name").style.background="white";
	  	document.getElementById("wresv_phone").style.background="white";
	  	document.getElementById("wresv_email").style.background="white";

	}

	function time(time)
	{
		document.wresv.wresv_time.value=time.innerText;
	
	}
	function day(day)
	{
		document.getElementById("time_1").style.visibility="visible";
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
			//	alert(chk.responseText);
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
	
	function bank()
	{
		document.getElementById("bank").style.visibility="visible";
	}
	
	function kakao()
	{
		document.getElementById("bank").style.visibility="hidden";
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

    <!--================ Single-Wedding Area Start =================-->
<section>
<div id="wed_resv">



	<div id="txt">WEDDING RESERVATION</div>
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
				
				<% int day2=Integer.parseInt(pageContext.getAttribute("day").toString()); %>

				<fmt:formatDate var="today" value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>
	        	<fmt:formatDate var="dday" value="<%=new java.util.Date(y-1900,m-1,day2-1) %>"  pattern="yyyy-MM-dd"/>
        	
	            <c:if test="${dday >= today}">
	             	<div id="day1" onclick="day(this)" class="day" name="wresv_cday">${day}</div>	
	            </c:if>
	            <c:if test="${dday < today}">
	             	<div id="day2" class="day" name="wresv_cday" >${day}</div>	
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
			<div id="time" class="time" name="wresv_time" >${tvo.wt_time }</div>
		</c:forEach>  
	</div>

	
	<div>
		<div id="resv_txt" style="float:left;">RESERVATION</div> 
		<c:if test="${userid==null }">
			<div id="login" style="float:right;">
				<span style="margin-left:20px; color:white;">회원으로 상담예약을 원하는 경우 로그인 해 주세요.</span>
				<input type="button" value="로그인" onclick="location='../login/login?ck=1'">
			</div>	
		</c:if>
	</div>
	

		
	
	<form name="wresv" method="post" action="weddingReserve_ok">	
	<table id="resv" align="center">
		<tr>
			<td colspan="4">
			<c:if test="${userid==null }">
				<div>비회원입니다. 비회원의 경우 주문번호와 이름으로 조회가 가능합니다. </div>
			</c:if>
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
						<input type="text" name="wresv_phone">
				 </c:if> 
			</td>
			<td rowspan="5">
			<!-- 	<img src="../img/wedding/wedding_resv.jpg" width="400" height="400"> -->
				<div id="w_pay">
					<div id="txt1">결제정보</div>
					<hr>
					<div id="pay">
						<div id="left">상담 결제비용</div>
						<div id="right">5000 KRW</div>
					</div>
					
					<div id="txt2">결제 방법선택</div>
					<hr>
					<div id="paymethod">
						<div class="radio">
							<input id="radio-1" type="radio" name="wresv_pay" value="0" onclick="kakao()"><label for="radio-1">카카오 결제</label>
						</div>
										 
						<div class="radio">
							<input id="radio-2" type="radio" name="wresv_pay" value="1" onclick="bank()"><label for="radio-2">무통장 입금</label>
						</div>
	
					</div>
	
					<div id="bank">
						<div>신한은행</div>
						<div>020202-08-0880808</div>
						<div>${today } 23:59까지 입금해주세요</div>
					</div>
				</div>
				<input type="button" class="btn_css" id="paymentBtn" onclick="return resv_check()" value="상담예약 결제하기">			
			</td>
		</tr>
		
		<tr>
			<td>희망하는 웨딩홀</td>
          	<td>
				<select name="wresv_hall">
          		<c:forEach items="${hlist }" var="hvo">
					<option value="${hvo.wed_hall }">${hvo.wed_hall }</option>
          		</c:forEach>
				</select>
          	</td>
          	<td>이메일</td>
          	<td>
          		<c:if test="${userid != null }">
					<input type="text" name="wresv_email" id="wresv_email" value="${email }" readonly>
				</c:if>
				<c:if test="${userid == null }"> 
					<input type="text" name="wresv_email">
				 </c:if> 
          	
          	</td>
		</tr>
		
		<tr>
          	<td>상담일</td>
          	<td>
          		<input type="text" name="wresv_cday" id="cday" readonly>
         	</td>
          	<td>상담 시간</td>
          	<td>
      			<input type="text" name="wresv_time" id="wresv_time" value="${wresv_time}" readonly>
         	</td>
		</tr>
		
		<tr>
          	<td>예식 희망일</td>
          	<td><input type="text" id="datepicker" name="wresv_wday" readonly></td>
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

<div id="wed_chk2">
	<img src="../img/wedding/wedding_chk.jpg">
</div>
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	function resv_check()
	{
		if(document.wresv.wresv_name.value.trim()=="")
		{
			alert("이름을 입력하세요.");
			return false;
		}
		else if(document.wresv.wresv_phone.value.trim()=="")
		{
			alert("전화번호를 입력하세요.");
			return false;
		}
		else if(document.wresv.wresv_email.value.trim()=="")
		{
			alert("이메일 입력하세요.");
			return false;
		}
		else if(document.wresv.wresv_cday.value.trim().length==0)	
		{
			alert("상담일을 선택하세요.");
			return false;
		}
		else if(document.wresv.wresv_time.value.trim().length==0)	
		{
			alert("상담시간을 선택하세요.");
			return false;
		}
		else if(document.wresv.wresv_wday.value.trim().length==0)	
		{
			alert("예식 희망일을 선택하세요.");
			return false;
		}
		else if(document.wresv.wresv_content.value.trim().length==0)	
		{
			alert("문의사항을 입력하세요.");
			return false;
		}
		else if(document.wresv.wresv_pay.value=="")	
		{
			alert("결제방법을 선택하세요.");
			return false;
		}
		else if(document.wresv.wresv_pay.value=="0")
		{
				//결제관련
//				$("#paymentBtn").click(function () {
//					var IMP = window.IMP; // 생략가능
//					IMP.init('imp66382802'); 
					// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
					// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
//					IMP.request_pay({
	//					pg: 'html5_inicis',
		//				pay_method: 'card',
			//			merchant_uid: 'merchant_' + new Date().getTime(),
						/* 
						 *  merchant_uid에 경우 
						 *  https://docs.iamport.kr/implementation/payment
						 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
						 */
						// name: '주문명 :',
						// 결제창에서 보여질 이름
						// name: '주문명 : ${auction.a_title}',
						// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
	//					amount: 5000,
						// amount: ${bid.b_bid},
						// 가격 
		//				 buyer_name: '이름 : ${name}',
						// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
						// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
						// buyer_postcode: '123-456',
						
		//				}, function (rsp) {
		//					console.log(rsp);
	//					if (rsp.success) {
	//						var msg = '결제가 완료되었습니다.';
	//						msg += '결제 금액 : ' + rsp.paid_amount;
	//					
	//						document.wresv.submit();
							
							// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
							// 자세한 설명은 구글링으로 보시는게 좋습니다.
//						} else {
	//						var msg = '결제에 실패하였습니다.';
	//						msg += '에러내용 : ' + rsp.error_msg;
	//					}
	//					alert(msg);
	//				});
	//			});
				return true;
		}
		
		else if(document.wresv.wresv_pay.value=="1")
		{
			//alert("dd");
			document.wresv.submit();
			return true;
		}
	}

</script>
   <!--================ Single-Wedding Area end =================-->

</body>