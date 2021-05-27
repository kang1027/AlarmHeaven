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
	height: 650px;
	width: 550px;
	background-color: white;
	margin: auto;
	border-radius: 30px;
	border: 1px solid gray;
}

#id, #pw, #email, #name {
	font-weight: bold;
	margin-bottom: 25px;
	color: black;
	text-align: center;
}
#name{
	margin-bottom : 50px;
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
	<%
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("id");
	String rank = request.getParameter("rank");
	
	Connection conn = JDBCConn.DBCPConnection();
	ResultSet rs = null;
	String id1 = "";
	String pw1 = "";
	String email1 = "";
	String name1 = "";
	try(PreparedStatement stmt = conn.prepareStatement("select * from login where id = ?")){
		stmt.setString(1, uid);
		rs = stmt.executeQuery();
		if (rs.next()) {
			id1 = rs.getString("id");
			pw1 = rs.getString("pw");
			email1 = rs.getString("email");
			name1 = rs.getString("name");
			System.out.println(rs.getString("id"));
		}	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCConn.close(conn, rs);
	}
	%>
	<form action="MupdateuserCtrl.jsp">
		<div id="insert">
			<div id="insertform">
				<div id="inserttxt">
					<h1>회원 수정</h1>
				</div>
				<br> <input type="text" name="id" value="<%=id1%>" readonly id="id"><br> <input type="password" name="pw"
					value="<%=pw1%>" id="pw"><br> <input type="text"
					name="email" value="<%=email1%>" id="email"><br> <input
					type="text" name="name" value="<%=name1%>" id="name"><br>
				<input type="hidden" name="rank" value="<%=rank%>"> <input
					type="submit" value="수정" id="insertbtn">

			</div>
		</div>
	</form>
</body>
</html>