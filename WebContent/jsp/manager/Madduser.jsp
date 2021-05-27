<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String rank = request.getParameter("rank");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: "content";
	src: url("../../font/content.ttf");
}

@font-face {
	font-family: "title";
	src: url("../../font/title.ttf");
}

body {
	font-family: "content";
	background-color: #f0f0f0;
}

#insert {
	margin-top: 3%;
	text-align: center;
}

input {
	border: none;
	border-bottom: 1px solid black;
	padding: 15px;
	width: 300px;
	font-size: 1.2em;
}

input::-webkit-input-placeholder {
	font-family: "content";
}

#inserttxt {
	color: blue;
	font-family: "title";
	line-height: 100px;
}

#insertform {
	margin: 50px;
	height: 650px;
	width: 550px;
	background-color: white;
	margin: auto;
	border-radius: 30px;
	border: 1px solid gray;
}

#id, #pw, #email, #name {
	margin-bottom: 25px;
	color: gray;
	text-align: center;
}

#insertbtn {
	width: 200px;
	border-radius: 30px;
	border: none;
	height: 50px;
	margin-bottom: 100px;
	font-family: "content";
}
</style>
</head>
<body>
	<form action="MadduserCtrl.jsp" onsubmit="return checkValue()">
		<div id="insert">
			<div id="insertform">
				<div id="inserttxt">
					<h1>회원 추가</h1>
				</div>
				<div id="id">
					<input type="text" name="id" placeholder="아이디를 입력해주세요."
						id="inputid" autofocus>
				</div>
				<br>
				<div id="pw">
					<input type="text" name="pw" placeholder="비밀번호를 입력해주세요."
						id="inputpw">
				</div>
				<br>
				<div id="email">
					<input type="email" name="email" placeholder="이메일을 입력해주세요."
						id="inputemail">
				</div>
				<br>
				<div id="name">
					<input type="text" name="name" placeholder="이름을 입력해주세요."
						id="inputname">
				</div>
				<br> <input type="hidden" name="rank" value="<%=rank%>">
				<input type="submit" value="추가" id="insertbtn">
			</div>
		</div>
	</form>
	<script>
		function checkValue() {

			if (document.getElementById("inputid").value === "") {
				alert('아이디가 입력되지 않았습니다');
				document.getElementById("inputid").focus();
				return false;
			}
			if (document.getElementById("inputpw").value === "") {
				alert('비밀번호가 입력되지 않았습니다');
				document.getElementById("inputpw").focus();
				return false;
			}
			if (document.getElementById("inputemail").value === "") {
				alert('이메일이 입력되지 않았습니다');
				document.getElementById("inputemail").focus();
				return false;
			}
			if (document.getElementById("inputname").value === "") {
				alert('이름이 입력되지 않았습니다');
				document.getElementById("inputname").focus();
				return false;
			}

			return true;
		}
	</script>
</body>
</html>