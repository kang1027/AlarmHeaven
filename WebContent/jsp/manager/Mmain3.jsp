<%@page import="vo.QuizVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.QuizDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
QuizDAO quizDao = new QuizDAO();
ArrayList<QuizVO> quizList = quizDao.QuizList();
//System.out.println("로드 완료");
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

span {
	border: 1px solid black;
	border-radius: 15px;
	padding: 1px;
	margin-right: 10px;
	float: right;
}

a {
	text-decoration: none;
	color: #646464;
}

body {
	background-color: #f0f0f0;
}

#container {
	margin: 0;
}

#quizInfo {
	margin-left : 33%;
	text-align: center;
	border: 1px solid black;
	width: 500px;
	background-color: white;
	border-radius: 30px;
	border: 1px solid gray;
	height: 100%;
	float: left;
}

table {
	background-color: #fafafa;
	border-radius: 15px;
	margin: auto;
	width: 450px;
	margin-bottom: 10px;
}
th {
	border: none;
	border-bottom: 1px solid black;
}

tr:last-child>th {
	border: none;
}

#adminInfo {
	font-family: "content";
	padding: 3px;
	border: 2px solid black;
	border-radius: 10px;
	width: 100px;
	text-align: center;
	margin-left: 1%;
	margin-top: 1%;
	background-color: #fafafa;
}
</style>
</head>
<body>
	<%@ include file="Mheader.jsp"%>
	<div id="adminInfo">
		관리자 :
		<%=session.getAttribute("id")%>
		<br>
		등급 : 하
	</div>
	<div id="container">

		<div id="quizInfo">
			<h1>문제 정보</h1>
			<table border=1>

				<a href="Maddquiz.jsp?rank=하">문제추가</a>
				<br>
				<br>
				<tr>
					<th>분야</th>
					<th>문제</th>
					<th>답</th>
				</tr>
				<%
				for (QuizVO quiz : quizList) {
				%>
				<tr>
					<th><%=quiz.getQuiztype()%></th>
					<th><a
						href="Mupdatequiz.jsp?question=<%=quiz.getQuestion()%>&rank=하"><%=quiz.getQuestion()%></a></th>
					<th><%=quiz.getAnswer()%> <span><a
							href="Mremovequiz.jsp?question=<%=quiz.getQuestion()%>&rank=하">X</a></span>
					</th>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>