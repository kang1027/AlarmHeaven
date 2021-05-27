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
	height: 670px;
	width: 550px;
	background-color: white;
	margin: auto;
	border-radius: 30px;
	border: 1px solid gray;
}

#question, #answer {
	margin-bottom: 25px;
	color: gray;
	text-align: center;
}

#insertbtn {
	width: 200px;
	border-radius: 30px;
	border: none;
	height: 50px;
	margin-bottom: 40px;
	margin-top: 50px;
	font-family: "content";
}

#quiztype {
	font-size: 1.2em;
	color: gray;
	padding-bottom: 50px;
	border-bottom: 1px solid black;
}

select {
	width: 200px;
	border-radius: 30px;
	height: 50px;
	font-family: "content";
	font-size: 1.2em;
	text-align-last: center;
	vertical-align: middle;
}
</style>
</head>
<body>
	<form action="MaddquizCtrl.jsp" onsubmit="return checkValue()">
		<div id="insert">
			<div id="insertform">
				<div id="inserttxt">
					<h1>문제 추가</h1>
				</div>
				<br>
				<div id="question">
					<input type="text" name="question" placeholder="문제를 입력해주세요." id="inputquestion"> <br>
					<br>
					<mark>
						<small>모든 기호 사용 가능</small>
					</mark>
				</div>
				<br>
				<div id="answer">
					<input type="text" name="answer" placeholder="답을 입력해주세요." id="inputanswer">
				</div>
				<br> <input type="hidden" name="rank" value="<%=rank%>">
				<div id="quiztype">
					<select name="quiztype">
						<option value="수학">수학</option>
						<option value="영어">영어</option>
						<option value="넌센스">넌센스</option>
					</select>
				</div>
				<input type="submit" value="추가" id="insertbtn">

			</div>
		</div>
	</form>
	
	<script>
		function checkValue() {

			if (document.getElementById("inputquestion").value === "") {
				alert('문제가 입력되지 않았습니다');
				document.getElementById("inputquestion").focus();
				return false;
			}
			if (document.getElementById("inputanswer").value === "") {
				alert('답이 입력되지 않았습니다');
				document.getElementById("inputanswer").focus();
				return false;
			}

			return true;
		}
	</script>
</body>
</html>