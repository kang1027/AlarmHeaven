<%@page import="jdbc.JDBCConn"%>
<%@page import="java.sql.*"%>
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
	#updateuser{
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
	#updateusertxt{
		color : blue;
		font-family : "title";
        line-height: 100px;
        
	}
	#updateuserform{
		margin : 50px;
		height : 650px;
		width : 550px;
		background-color : white;
		margin : auto;      
		border-radius: 30px;
		border : 1px solid gray;

	}
	#pw, #email, #name, #pw-check{
		font-weight : bold;
		margin-bottom : 25px;
		color : black;
		text-align : center;
	}
	#updateuserbtn{
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
<script type="text/javascript">
	
	function checkValue() {
		
		if(document.getElementById("pw").value === "") {
			alert('비밀번호가 입력되지 않았습니다');
			document.getElementById("pw").focus();
			return false;
		}
		if(document.getElementById("email").value === "") {
			alert('이메일이 입력되지 않았습니다');
			document.getElementById("email").focus();
			return false;
		}
		if(document.getElementById("name").value === "") {
			alert('이름이 입력되지 않았습니다');
			document.getElementById("email").focus();
			return false;
		}
		if(document.getElementById("pw").value != document.getElementById("pw-check").value)
			{
				console.log()
				alert('비밀번호를 다시 확인해주세요.');
				document.getElementById("pw").focus();
				return false;
			}
		
		return true;
	}
</script>
	<%@ include file="header.jsp" %>

	<form method="post" action="updateUserCtrl.jsp" onsubmit="return checkValue()">
		<div id="updateuser">
			<div id="updateuserform">
				<div id="updateusertxt"><h1>회원수정 창입니다.</h1></div>
				<input type="password" name="userPw" placeholder="바꿀 비밀번호를 입력해주세요." id="pw" autofocus><br>
				<input type="password" placeholder="비밀번호를 다시 입력해주세요." id="pw-check"><br>
				<input type="email" name="userEmail" placeholder="바꿀 이메일을 입력해주세요." id="email"><br>
				<input type="text" name="userName" placeholder="바꿀 이름을 입력해주세요." id="name"><br>
				<input type="submit" value="수정" id="updateuserbtn"><br>
			</div>
		</div>
	</form>
	
</body>
<script>

</script>
</html>