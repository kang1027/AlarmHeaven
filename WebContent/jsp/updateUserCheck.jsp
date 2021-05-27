<%@page import="jdbc.JDBCConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String userId = "";
Connection conn = JDBCConn.DBCPConnection();
ResultSet rs = null;
try (PreparedStatement stmt = conn.prepareStatement("select id from login where id=?")) {

	String sessionId = (String) session.getAttribute("id");
	stmt.setString(1, sessionId);

	rs = stmt.executeQuery();

	if (rs.next()) {
		userId = rs.getString("id");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	JDBCConn.close(conn, rs);
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

#updateusercheck {
	margin-top: 5%;
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

#updateuserchecktxt {
	color: blue;
	font-family: "title";
	line-height: 100px;
}

#updateform {
	margin: 50px;
	height: 500px;
	width: 500px;
	background-color: white;
	margin: auto;
	border-radius: 30px;
	border: 1px solid gray;
}

#id, #pw {
	font-weight: bold;
	margin-bottom: 25px;
	color: black;
	text-align: center;
}

#updatebtn {
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
	<%@ include file="header.jsp"%>
	<form action="updateUserCheckCtrl.jsp" onsubmit="return checkValue()">
		<div id="updateusercheck">
			<div id="updateform">
				<div id="updateuserchecktxt">
					<h1>회원수정</h1>
				</div>
				<br> <input type="text" value="아이디 : <%=userId%>" readonly
					name="id" id="id"><br> <input type="password"
					name="pw" id="pw" placeholder="비밀번호를 입력해주세요." autofocus><br>
				<input type="submit" value="수정하기" id="updatebtn">
			</div>
		</div>
	</form>
	<script>
		function checkValue() {
			if (document.getElementById("pw").value === "") {
				alert('비밀번호가 입력되지 않았습니다');
				document.getElementById("pw").focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>