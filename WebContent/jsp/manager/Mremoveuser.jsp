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
	String uid = request.getParameter("id");
	String rank = request.getParameter("rank");
	try (Connection conn = JDBCConn.DBCPConnection();
			PreparedStatement stmt = conn.prepareStatement("delete from login where id=?");) {
		stmt.setString(1, uid);
		stmt.executeUpdate();
	%>
	<script>
		alert(
	<%="\'" + (uid) + "\'"%>
		+ '회원 삭제가 완료되었습니다.');
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