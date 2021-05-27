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
			PreparedStatement stmt = conn
			.prepareStatement("update manager set managerpw=?, managerrank=?where managerid=?")) {
		stmt.setString(1, mpw);
		stmt.setString(2, mrank);
		stmt.setString(3, mid);
		stmt.executeUpdate();
	%>
	<script>
		alert(
	<%="\'" + (mid) + "\'"%>
		+ '관리자 수정이 완료됬습니다.');
		location.replace("Mmain1.jsp");
	</script>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>