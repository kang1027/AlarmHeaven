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
	#login{
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
	#logintxt{
		color : blue;
		font-family : "title";
        line-height: 100px;
        
	}
	#loginform{
		margin : 50px;
		height : 600px;
		width : 550px;
		background-color : white;
		margin : auto;      
		border-radius: 30px;
		border : 1px solid gray;

	}
	#id, #pw{
		margin-bottom : 25px;
		color : gray;
		text-align : center;
	}
	#loginbtn{
		width : 200px;
		border-radius : 30px;
		border : none;
		height : 50px;
		margin-bottom : 100px;
		font-family : "content";
	}
</style>
</head>
<body>
	<%@ include file="header.jsp" %>
	<form action="userLogin.jsp" method="post" onsubmit="return checkValue()">
		<div id="login">
			<div id="loginform">
				<div id="logintxt"><h1>로그인</h1></div><br>
				<div id="id"><input type="text" name="userId" placeholder="아이디를 입력하세요." id="inputid" autofocus></div><br>
				<div id="pw"><input type="password" name="userPw" placeholder="비밀번호를 입력하세요." id="inputpw"></div><br>
				<input type="submit" value="로그인" id="loginbtn"><br>
				<a href="insertUser.jsp">회원가입하기</a><br><br>
				<a href="managerlogin.jsp">관리자로그인</a>
			</div>
		</div>
	
	</form>
	<script>
	function checkValue() {
		
		if(document.getElementById("inputid").value === "") {
			alert('아이디가 입력되지 않았습니다');
			document.getElementById("inputid").focus();
			return false;
		}
		if(document.getElementById("inputpw").value === "") {
			alert('비밀번호가 입력되지 않았습니다');
			document.getElementById("inputpw").focus();
			return false;
		}
		
		
		return true;
	}
	</script>
	
</body>
</html>