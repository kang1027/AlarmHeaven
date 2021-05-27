<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin: 0
}

#header {
	text-align: center;
	height: 100px;
	background-color: white;
	margin: 0;
	display: block;
}

#header>a>img {
	width: 80px;
	margin-top: 10px;
}

#header>a>img:hover {
	cursor: pointer;
	content: url('../../image/main/alarmhover.PNG');
	width: 100px;
}
</style>
</head>
<body>
	<div id="header">
		<a href="../logout.jsp"
			onclick="return confirm('메인으로 가시게 되면 로그아웃됩니다. 로그아웃하시겠습니까?');"><img
			src="../../image/main/alarm.png"></a>
	</div>
</body>
</html>