<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	section{
	width:1100px;
	margin:auto;
	margin-top:100px;
	margin-bottom:200px;}
	
	section #resv_check #title{
	font-family:fantasy;
	font-size:70px;}
	
	section #resv_check #txt{
	font-size:18px;
	margin-left:40px;}
	
	section #resv_check #name{
	margin-top:120px;
	font-size:40px;
	margin-bottom:30px;}
	
	section #resv_check #border{
	border:1px solid black;
	height:450px;
	width:850px;
	margin:auto;}
	
	section #resv_check #left{
	margin-top:50px;
	display:inline-block;
	margin-left:20px;
	width:150px;}
	
	section #resv_check #right{
	display:inline-block;
	width:550px;}
	
	section #resv_check #left div{
	font-weight:600;
	padding:25px;}
	
	section #resv_check #right div{
	padding:25px;
	border-bottom:1px solid black;}
	
	section #resv_check #txt2{
	margin-top:50px;
	margin-right:20px;
	float:right;}
	
	section #resv_check .under{
	border-bottom:1px solid black;}
	
	section #resv_check #btn_center{
	margin-top:150px;
	text-align:center;}
	
	section #resv_check input[type=button]{
	margin-left:50px;
	width:500px;
	height:70px;
	background:black;
	color:white;}

</style>
<body>
<section>
<div id="resv_check">
<div id="title">RESERVATION</div>
	<div id="name">예약이 완료되었습니다.</div>
	<div id="border">
	<div id="left">
		<div>예약번호</div>
		<div>체크인</div>
		<div>체크아웃</div>
		<div>예약자</div>
	</div>
	<div id="right">
		<div>${rsvo.bid}</div>
		<div>${rsvo.checkin}</div>
		<div>${rsvo.checkout}</div>
		<div>${rsvo.bkname}</div>
	</div>
	<div id="txt2">비회원은 이름과 주문코드로 조회가 가능합니다.</div>
	</div>
	<div id="btn_center"><input type="button" onclick="location='../main/index'" value="확 인"></div>
</div>
</section>
</body>
</html>