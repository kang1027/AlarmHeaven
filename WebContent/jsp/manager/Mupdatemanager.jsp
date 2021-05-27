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
	height: 640px;
	width: 550px;
	background-color: white;
	margin: auto;
	border-radius: 30px;
	border: 1px solid gray;
}

	#id, #pw{
		font-weight : bold;
		margin-bottom : 25px;
		color : black;
		text-align : center;
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

#rank {
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
	String uid = request.getParameter("id");
	Connection conn = JDBCConn.DBCPConnection();
	ResultSet rs = null;
	String id1 = "";
	String pw1 = "";
	String rank1 = "";
	try(PreparedStatement stmt = conn.prepareStatement("select * from manager where managerid = ?")){
		stmt.setString(1, uid);
	
		rs = stmt.executeQuery();
	
		if (rs.next()) {
			id1 = rs.getString("managerid");
			pw1 = rs.getString("managerpw");
			rank1 = rs.getString("managerrank");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		JDBCConn.close(conn, rs);
	}
	%>
	<form action="MupdatemanagerCtrl.jsp">
		<div id="insert">
			<div id="insertform">
				<div id="inserttxt">
					<h1>관리자 수정</h1>
				</div>

					<input type="text" name="id" value="<%=id1%>" readonly id="id">
				<br>
					<input type="password" name="pw" id="pw" value="<%=pw1%>">
				<br>

				<div id="rank">
					등급을 선택해주세요.<br> <br> <select name="rank">
						<option value="상" <%if (rank1.equals("상")) {%> selected
							<%}%>>상</option>
						<option value="중" <%if (rank1.equals("중")) {%> selected
							<%}%>>중</option>
						<option value="하" <%if (rank1.equals("하")) {%> selected
							<%}%>>하</option>
					</select>
				</div>
				<input type="submit" value="수정" id="insertbtn">

			</div>
		</div>
	</form>
</body>
</html>