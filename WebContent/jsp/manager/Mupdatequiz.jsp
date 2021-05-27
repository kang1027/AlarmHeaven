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

#question>input, #answer>input {
	font-weight: bold;
	margin-bottom: 25px;
	color: black;
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
	<%
	request.setCharacterEncoding("utf-8");
	String question = request.getParameter("question");
	String rank = request.getParameter("rank");
	Connection conn = JDBCConn.DBCPConnection();
	ResultSet rs = null;
	String quiztype = "";
	String question1 = "";
	String answer = "";
	System.out.println(question);
	try(PreparedStatement stmt = conn.prepareStatement("select * from testquiz where question = ?")){
		stmt.setString(1, question);
		rs = stmt.executeQuery();

		System.out.println(question);
		if (rs.next()) {
			quiztype = rs.getString("quiztype");
			question1 = rs.getString("question");
			answer = rs.getString("answer");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCConn.close(conn, rs);
	}
	%>
	<form action="MupdatequizCtrl.jsp">
		<div id="insert">
			<div id="insertform">
				<div id="inserttxt">
					<h1>문제 수정</h1>
				</div>
				<br>
				<div id="question">
					<input type="text" name="question" value="<%=question1%>"><br>
					<mark>
						<small>모든 기호 사용 가능</small>
					</mark>
				</div>
				<br>
				<div id="answer">
					<input type="text" name="answer" value="<%=answer%>"><br>
				</div>
				<div id="quiztype">
					<select name="quiztype">
						<option value="수학" <%if (quiztype.equals("수학")) {%> selected <%}%>>수학</option>
						<option value="영어" <%if (quiztype.equals("영어")) {%> selected <%}%>>영어</option>
						<option value="넌센스" <%if (quiztype.equals("넌센스")) {%> selected
							<%}%>>넌센스</option>
					</select>
				</div>
				<input type="hidden" name="originquestion" value="<%=question%>">
				<input type="hidden" name="rank" value="<%=rank%>"> <input
					type="submit" value="수정" id="insertbtn">

			</div>
		</div>
	</form>
</body>
</html>