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
	#mypage{
		margin-top : 3%;
		text-align : center;
	}
	input{
		border : none;
		border-bottom : 1px solid black;
		padding : 15px;
		width : 300px;
		font-size : 1.2em;
	}
	input::-webkit-input-placeholder {
		font-family : "content";}
	#mypagetxt{
		color : blue;
		font-family : "title";
        line-height: 100px;
        
	}
	#mypagemenu{
		margin : 50px;
		height : 650px;
		width : 550px;
		background-color : white;
		margin : auto;      
		border-radius: 30px;
		border : 1px solid gray;

	}
	#mymusic, #myquiz, #mybg, #updateAccount, #removeAccount{
		color : gray;
		text-align : center;
		float : left;
		margin-left : 25%;
		margin-bottom : 10%;
	}
	
	#insertbtn{
		width : 200px;
		border-radius : 30px;
		border : none;
		hegith : 30px;
		margin-bottom : 100px;
		font-family : "content";
	}
	img{
		width : 60px;
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div id="mypage">
		<div id="mypagemenu">
			<div id="mypagetxt"><h1>마이페이지</h1></div>
			<div id="mymusic"><a href="myMusic.jsp"><img src="../image/music.png"><br>내 음악</a></div>
			<div id="myquiz"><a href="myQuiz.jsp"><img src="../image/question.png"><br>내 문제</a></div>
			<div id="mybg"><a href="myBackGround.jsp"><img src="../image/background.png"><br>내 배경</a></div>
			<div id="updateAccount"><a href="updateUserCheck.jsp"><img src="../image/update.png"><br>계정 수정</a></div>
			<div id="removeAccount"><a href="removeUser.jsp"><img src="../image/remove.png"><br>계정 삭제</a></div>
		</div>
	</div>

</body>
</html>