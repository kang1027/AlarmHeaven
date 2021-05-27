<%@page import="jdbc.JDBCConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String quiztype = request.getParameter("quiztype");
	String question = request.getParameter("question");
	String answer = request.getParameter("answer");
	String rank = request.getParameter("rank");
	try (Connection conn = JDBCConn.DBCPConnection();
			PreparedStatement stmt = conn.prepareStatement("insert into TESTQUIZ values(?,?,?)");) {
		stmt.setString(1, quiztype);
		stmt.setString(2, question);
		stmt.setString(3, answer);
		stmt.executeUpdate();
	%>
	<script>
		alert(
	<%="\'" + (question) + "\'"%>
		+ '문제가 추가되었습니다.');
	<%if (rank.equals("상")) {%>
		location.replace("Mmain1.jsp");
	<%} else if (rank.equals("중")) {%>
		location.replace("Mmain2.jsp");
	<%} else if (rank.equals("하")) {%>
		location.replace("Mmain3.jsp");
	<%}%>
		
	</script>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>