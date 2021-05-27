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
	String mid = request.getParameter("id");
	String mpw = request.getParameter("pw");
	String mrank = request.getParameter("rank");
	try (Connection conn = JDBCConn.DBCPConnection();
			PreparedStatement stmt = conn.prepareStatement("insert into manager values(?, ?, ?)")) {
		stmt.setString(1, mid);
		stmt.setString(2, mpw);
		stmt.setString(3, mrank);
		System.out.println(mid + "\t" + mpw + "\t" + mrank);
		stmt.executeUpdate();
	%>
	<script>
		alert(
	<%="\'" + (mid) + "\'"%>
		+ '관리자가 추가되었습니다.');
		location.replace("Mmain1.jsp");
	</script>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>