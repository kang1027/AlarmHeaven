<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BufferedReader reader = null;
ArrayList<String> ac = new ArrayList<String>();
try {
	String filePath = request.getRealPath("/quiz/" + session.getAttribute("id") + "quiz.txt");
	reader = new BufferedReader(new FileReader(filePath));
	while (true) {
		String str = reader.readLine();
		if (str == null) {
	break;
		}
		ac.add(str);
	}

} catch (FileNotFoundException e) {
	String filename = session.getAttribute("id") + "quiz.txt";
	PrintWriter writer = null;
	try {
		String dir = request.getRealPath("/quiz/");
		String filePath = dir + "/" + filename;

		writer = new PrintWriter(filePath);
		writer.printf("null\nnull\nnull");

	} catch (IOException ea) {
		String dir = request.getRealPath("/quiz");
		File file = new File(dir);
		if(!file.exists()){
			file.mkdirs();
		}
	} finally {
		try {
			writer.close();
		} catch (Exception ea) {
			ea.printStackTrace();
		}
	}

} catch (IOException e) {
	out.println("파일을 읽을 수 없습니다.");
	e.printStackTrace();

} finally {
	try {
		reader.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: "content";
	src: url("../font/content.ttf");
}

@font-face {
	font-family: "title";
	src: url("../font/title.ttf");
}

body {
	font-family: "content";
	background-color: #f0f0f0;
}

#myquiz {
	margin-top: 3%;
	text-align: center;
}

#myquiztxt {
	color: blue;
	font-family: "title";
	line-height: 100px;
}

#myquizlist {
	margin: 50px;
	height: 500px;
	width: 550px;
	background-color: white;
	margin: auto;
	border-radius: 30px;
	border: 1px solid gray;
}

#id, #pw {
	margin-bottom: 25px;
	color: gray;
	text-align: center;
}

#myquizbtn {
	width: 200px;
	border-radius: 30px;
	border: none;
	hegith: 80px;
	margin-bottom: 100px;
	font-family: "content";
	font-size: 2em;
	padding: 20px;
	background-color: #75d594;
	margin-top: 50px;
	cursor: pointer;
}

#myquizbtn:hover {
	background-color: #71ad7f;
}

img {
	width: 60px;
}

#mathquiz, #engquiz, #nunquiz {
	color: gray;
	text-align: center;
	float: left;
	margin-left: 5%;
	margin-bottom: 10%;
}

#mathquiz {
	margin-left: 15%;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<form action="myQuizWrite.jsp" onsubmit="return checkValue()">
		<div id="myquiz">
			<div id="myquizlist">
				<div id="myquiztxt">
					<h1>내 문제</h1>
				</div>
				<div id="mathquiz">
					수학<label for="math"><img src="../image/math.png"></label><input
						type="checkbox" name="math" value="수학" id="math">
				</div>
				<div id="engquiz">
					영어<label for="eng"><img src="../image/eng.png"></label><input
						type="checkbox" name="eng" value="영어" id="eng">
				</div>
				<div id="nunquiz">
					넌센스<label for="nun"><img src="../image/nun.png"></label><input
						type="checkbox" name="nun" value="넌센스" id="nun">
				</div>
				<br>
				<button type="submit" id="myquizbtn">바꾸기</button>
			</div>
		</div>
	</form>
	<script>
		window.onload = function() {
	<%if (!ac.isEmpty()) {%>
		
		if (
	<%="\"" + (ac.get(0)) + "\""%>
		=== "수학") {
				document.querySelector("#math").checked = true;
			}
			if (
	<%="\"" + (ac.get(1)) + "\""%>
		=== "영어") {
				document.querySelector("#eng").checked = true;
			}
			if (
	<%="\"" + (ac.get(2)) + "\""%>
		=== "넌센스") {
				document.querySelector("#nun").checked = true;
			}
		}
	<%}%>
		function checkValue() {

			if (!document.getElementById("math").checked
					&& !document.getElementById("eng").checked
					&& !document.getElementById("nun").checked) {
				alert('문제 종목을 선택하여주세요.');
				return false;
			}
			return true;
		}
	</script>

</body>
</html>