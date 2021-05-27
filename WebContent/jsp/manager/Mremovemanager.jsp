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
	try (Connection conn = JDBCConn.DBCPConnection();
			PreparedStatement stmt = conn.prepareStatement("delete from manager where managerid=?");) {
		stmt.setString(1, mid);
		stmt.executeUpdate();
	%>
	<script>
		alert(
	<%="\'" + (mid) + "\'"%>
		+ '회원 삭제가 완료되었습니다.');
		location.replace("Mmain1.jsp");
	</script>
	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

</body>
</html>