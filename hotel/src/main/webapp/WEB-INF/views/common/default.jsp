<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		#banner {
			width : 100%;
			height : 40px;
			margin : auto;
			background : black;
		}
		header {
			width : 100%;
			height : 50px;
			margin : auto;
			background : red;
		}
		#second {
			width : 100%;
			height : 150px;
			margin : auto;
			background : orange;
		}
		#third {
			width : 100%;
			height : 600px;
			margin : auto;
			background : gold;
		}
		#fourth {
			width : 100%;
			height : 120px;
			margin : auto;
			background : green;
		}
		#fifth {
			width : 100%;
			height : 600px;
			margin : auto;
			background : blue;
		}
		#sixth {
			width : 100%;
			height : 600px;
			margin : auto;
			background : navy;
		}
		#seventh {
			width : 100%;
			height : 600px;
			margin : auto;
			background : purple;
		}
		#eighth {
			width : 100%;
			height : 200px;
			margin : auto;
			background : beige;
		}
		#nineth {
			width : 100%;
			height : 200px;
			margin : auto;
			background : black;
		}
	</style>
</head>
	<decorator:head/>
<body> 
	<div id="banner"></div>
	<div id="header"></div>
	<div id="second"></div>
	
	<decorator:body/>
	<div id="nineth"></div>
</body>
</html>