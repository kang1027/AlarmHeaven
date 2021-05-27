<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@font-face{
           font-family: "content";
           src: url("../font/content.ttf");
	}
	@font-face{
           font-family: "title";
           src: url("../font/title.ttf");
	}
	body{
        font-family: "content";
        background-color : #f0f0f0;
	}	
	#container{
		margin-top : 3%;
		text-align : center;
	}
	#mybgtxt{
		color : blue;
		font-family : "title";
        line-height: 100px;
        
	}
	#mybg{
		margin : 50px;
		height : 550px;
		width : 1400px;
		background-color : white;
		margin : auto;      
		border-radius: 30px;
		border : 1px solid gray;

	}
	#mybgbtn{
		width : 200px;
		border-radius : 30px;
		border : none;
		hegith : 60px;
		margin-bottom : 100px;
		font-family : "content";
		font-size : 2em;
		padding : 20px;
		background-color : #75d594;
		margin-top : 50px;
		cursor : pointer;
		
	}
	#mybgbtn:hover{
		background-color : #71ad7f;
	}
</style>
</head>
<body>
<%@ include file="header.jsp" %>

	<form action="../index.jsp" onsubmit="return checkValue()">
	
	
		<div id="container">
			<div id="mybg">
					<div id="mybgtxt"><h1>배경 바꾸기</h1></div>
				<div id="backgrounds" style="margin-top : 50px; height : 200px;">
					<input type="radio" id="baseBg" name="bgCheck" style="float : left; margin-left : 60px;" value="base" >
					<img src="../image/bg_base.PNG" style=" width : 300px; margin-right : 10%; float : left; border : 1px solid black;">
					
					
					<input type="radio" id="darkBg" name="bgCheck" style="float : left" value="dark">
					<img src="../image/bg_dark.PNG" style=" width : 300px; margin-right : 10%; float : left; border : 1px solid black;">
					
					
					<input type="radio" id="purpleBg" name="bgCheck" style="float : left" value="purple">	
					<img src="../image/bg_purple.PNG" style=" width : 300px; float : left; border : 1px solid black;">
	
				</div>
				<button type="submit" id="mybgbtn">바꾸기</button>
			</div>
		</div>
		<script>
		function checkValue() {
			
			if(!document.getElementById("baseBg").checked && !document.getElementById("darkBg").checked && !document.getElementById("purpleBg").checked ) {
				alert('원하는 배경을 선택하여주세요.');
				return false;
			}
			return true;
		}
		</script>

	</form>
</body>
</html>