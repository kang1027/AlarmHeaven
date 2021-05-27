<%@page import="vo.QuizVO"%>
<%@page import="dao.QuizDAO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

UserDAO userDao = new UserDAO();
ArrayList<UserVO> userList = userDao.UserList();

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

#userInfo, #quizInfo {
	margin: 40px;
	text-align: center;
	border: 1px solid black;
	width: 420px;
	background-color: white;
	border-radius: 30px;
	border: 1px solid gray;
	height: 100%;
	float: left;
}

#userInfo {
	margin-left: 250px;
	width: 500px;
}

table {
	background-color: #fafafa;
	border-radius: 15px;
	margin: auto;
	width: 400px;
	margin-bottom: 10px;
}

#userInfo>table {
	width: 480px;
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
		<br> 등급 : 중
	</div>
	<div id="container">
		<div id="userInfo">
			<h1>회원 정보</h1>
			<table border=1>
				<a href="Madduser.jsp?rank=중">회원 추가</a>
				<br>
				<br>
				<tr>
					<th width="20%">아이디</th>
					<th width="30%">비밀번호 초기화 (기본값 user1234)</th>
					<th width="30%	">이메일</th>
					<th width="20%">이름</th>
				</tr>
				<%
				for (UserVO list : userList) {
				%>
				<tr>
					<th><a href="Mupdateuser.jsp?id=<%=list.getId()%>&rank=중"><%=list.getId()%></a></th>
					<th><a href="Mpwresetuser.jsp?id=<%=list.getId()%>&rank=중">초기화</a></th>
					<th><%=list.getEmail()%></th>
					<th><%=list.getName()%> <span><a
							href="Mremoveuser.jsp?id=<%=list.getId()%>&rank=중">X</a></span></th>
				</tr>
				<%
				}
				%>
			</table>
		</div>


		<div id="quizInfo">
			<h1>문제 정보</h1>
			<table border=1>

				<a href="Maddquiz.jsp?rank=중">문제추가</a>
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
						href="Mupdatequiz.jsp?question=<%=quiz.getQuestion()%>&rank=중"><%=quiz.getQuestion()%></a></th>
					<th><%=quiz.getAnswer()%> <span><a
							href="Mremovequiz.jsp?question=<%=quiz.getQuestion()%>&rank=중">X</a></span>
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