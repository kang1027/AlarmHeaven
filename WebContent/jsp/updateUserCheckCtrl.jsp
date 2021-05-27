
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

	String userPw = request.getParameter("pw");

	Connection conn = JDBCConn.DBCPConnection();
	ResultSet rs = null;
	try (PreparedStatement stmt = conn.prepareStatement("select * from login where id=?")) {
		String sessionId = (String) session.getAttribute("id");
		stmt.setString(1, sessionId);
		rs = stmt.executeQuery();
		String id1 = "";
		String pw1 = "";
		if (rs.next()) {
			id1 = rs.getString("id");
			pw1 = rs.getString("pw");
			if (userPw.equals(pw1)) {
				response.sendRedirect("updateUser.jsp");
			} 
			else{
				%>
				<script>
					alert("비밀번호를 확인해주세요.");
					location.replace('updateUserCheck.jsp');
				</script>
				<%
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JDBCConn.close(conn, rs);
	}
	%>
</body>
</html>