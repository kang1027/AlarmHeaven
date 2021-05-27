<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
	margin :0
	}
	#header{
		text-align : center;
		height : 100px;
		background-color : white;
		margin : 0;
		display : block;
	}
	#header > a >img{
		width : 80px;
		margin-top : 10px;
	}
	#header > a >img:hover{
		cursor : pointer;
		content: url('../image/main/alarmhover.PNG');
		width : 100px;
	}
</style>
</head>
<body>
    <div id="header" >
		<a href="../index.jsp"><img src="../image/main/alarm.png"></a>   
    </div>
</body>
</html>