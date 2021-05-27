<%@page import="vo.QuizVO"%>
<%@page import="dao.QuizDAO"%>
<%@page import="dao.ManagerDAO"%>
<%@page import="vo.ManagerVO"%>
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

ManagerDAO managerDao = new ManagerDAO();
ArrayList<ManagerVO> managerList = managerDao.ManagerList();

QuizDAO quizDao = new QuizDAO();
ArrayList<QuizVO> quizList = quizDao.QuizList();
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

#userInfo, #managerInfo, #quizInfo {
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

table {
	background-color: #fafafa;
	border-radius: 15px;
	margin: auto;
	width: 400px;
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
	background-color : #fafafa;
}
</style>
</head>
<body>
	<%@ include file="Mheader.jsp"%>
	<div id="adminInfo">
		관리자 :
		<%=session.getAttribute("id")%>
		<br> 등급 : 상
	</div>
	<div id="container">
		<div id="userInfo">
			<h1>회원 정보</h1>
			<table border=1>
				<a href="Madduser.jsp?rank=상">회원 추가</a>
				<br>
				<br>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th>이름</th>
				</tr>
				<%
				for (UserVO list : userList) {
				%>
				<tr>
					<th><a href="Mupdateuser.jsp?id=<%=list.getId()%>&rank=상"><%=list.getId()%></a></th>
					<th><%=list.getPw()%></th>
					<th><%=list.getEmail()%></th>
					<th><%=list.getName()%> <span><a
							href="Mremoveuser.jsp?id=<%=list.getId()%>&rank=상">X</a></span></th>
				</tr>
				<%
				}
				%>
			</table>
		</div>

		<div id="managerInfo">
			<h1>관리자 정보</h1>
			<table border=1>

				<a href="Maddmanager.jsp">관리자추가</a>
				<br>
				<br>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>등급</th>
				</tr>
				<%
				for (ManagerVO list : managerList) {
				%>
				<tr>
					<th><a href="Mupdatemanager.jsp?id=<%=list.getManagerid()%>"><%=list.getManagerid()%></a></th>
					<th><%=list.getManagerpw()%></th>
					<th><%=list.getManagerrank()%> <%
 if (!list.getManagerrank().equals("상")) {
 %> <span><a
							href="Mremovemanager.jsp?id=<%=list.getManagerid()%>">X</a></span> <%
 }
 %></th>
				</tr>
				<%
				}
				%>
			</table>
		</div>

		<div id="quizInfo">
			<h1>문제 정보</h1>
			<table border=1>

				<a href="Maddquiz.jsp?rank=상">문제추가</a>
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
						href="Mupdatequiz.jsp?question=<%
						String a = quiz.getQuestion();
							a = a.replace("%", "%25");
							a = a.replace("\\", "%5C");
							a = a.replace("`", "%60");
							a = a.replace("|", "%7C");
							a = a.replace("&", "%26");
							a = a.replace("+", "%2B");
							a = a.replace("^", "%5E");
							a = a.replace("#", "%23");
						%><%=a%>&rank=상"><%=quiz.getQuestion()%></a></th>
					<th><%=quiz.getAnswer()%> <span><a
							href="Mremovequiz.jsp?question=<%=a%>&rank=상">X</a></span></th>
				</tr>

				<%
				}
				%>
			</table>
		</div>
	</div>
</body>
</html>