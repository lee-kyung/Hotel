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
다음과 같이 예약이 완료 되었습니다.

<div> 예약번호: ${rsvo.bid} </div>
<div> 체크인: ${rsvo.checkin} </div>
<div> 체크아웃: ${rsvo.checkout} </div>
<div> 예약자: ${rsvo.bkname}</div>
 
</body>
</html>