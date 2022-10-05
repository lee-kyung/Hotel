<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<style>
	#sec1{
		width: 1300px;
		margin: auto;
		margin-top: 40px;
		margin-bottom: 200px;
	}
	#h3 a{
		color: white;
	}
	#sec1 #txt1{
		margin: auto;
		font-size: 25px;
		width: 1000px;
		margin-top: 40px;
	}
	#sec1 #txt1>span{
		font-size: 15px;
	}
	#sec1 #title{
		width: 1000px;		
		margin: auto;
		text-align: left;
	}
	#sec1 #title a{
		font-size: 60px;
		color: #887159;
		font-weight: 700;
		text-decoration: underline;
	}
	#sec1 #title a:hover{
		color: black;
	}
	#sec1 table{
		width: 1000px;
		margin: auto;
		margin-top: 4px;
	}
	#sec1 table tr td{
		padding: 7px;
	}
	#sec1 table tr:first-child td{
		border-top: 2px solid #887159;
	}
</style>

</head>

<body>
<c:if test="${userid != 'admin'}">
	<c:redirect url="../main/index"/>
</c:if>
	<!-- ================ (Sitemesh) Top Area 키링템 Start ================= -->
    <!-- bradcam_area_start -->
    <!-- 새 이미지 추가하는 법
    	①[webapp\resources\css]폴더에 있는 [style.css]파일에 소스를 추가하기
    	②[webapp\resources\img\banner]폴더에 이미지파일을 추가하기 -->
    <div class="bradcam_area gongji">	<!-- class="bradcam_area 클래스명" -->
        <div id="h3"> <a href="../admin/admin">ADMIN</a></div>
    </div>
<div id="sec1">
	<div id="title"> <a href="memberlist">${mvo.userid}</a>의 회원정보</div>
	
	<div id="txt1">회원정보</div>
	<table>
		<tr>
			<td width="150"> 이름 </td>
			<td> ${mvo.name} </td>
		</tr>
		<tr>
			<td> 주소 </td>
			<td> ${mvo.juso}${mvo.juso_etc} <br>
				 우편번호: ${mvo.zip}</td>
		</tr>
		<tr>
			<td> 연락번호 </td>
			<td> ${mvo.phone} </td>
		</tr>
		<tr>
			<td> 이메일 </td>
			<td> ${mvo.email} </td>
		</tr>
		<tr>
			<td> 생일 </td>
			<td> ${mvo.birth} </td>
		</tr>
		<tr>
			<td> 가입일 </td>
			<td> ${mvo.joinday} </td>
		</tr>
	</table>
	
	<div id="txt1">총 예약 횟수</div>
	<table>
		<tr>
			<td width="150"> 객실 예약 횟수 </td>
			<td width="100"> ${rcnt} 회</td>
			<td><a href="../admin/roomlist?sel=userid&sword=${mvo.userid}"> +더보기 </a> </td>
		</tr>
		<tr>
			<td> 다이닝 예약 횟수  </td> 
			<td> ${dcnt} 회 </td>
			<td><a href="../admin/dinelist?sel=userid&sword=${mvo.userid}"> +더보기 </a> </td>
		</tr>
		<tr>
			<td> ESHOP 예약 횟수  </td> 
			<td> ${gcnt} 회 </td>
			<td><a href="../admin/gumaelist?sel=userid&sword=${mvo.userid}"> +더보기 </a> </td>
		</tr>
		<tr>
			<td> 웨딩 예약 횟수  </td>
			<td> ${wcnt} 회 </td>
			<td><a href="../admin/wedlist?sel=userid&sword=${mvo.userid}"> +더보기 </a> </td>
		</tr>
	</table>
	
	
	
</div>






</body>