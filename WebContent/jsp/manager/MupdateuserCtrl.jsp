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
	String upw = request.getParameter("pw");
	String uemail = request.getParameter("email");
	String uname = request.getParameter("name");
	String rank = request.getParameter("rank");
	try(Connection conn = JDBCConn.DBCPConnection();
		PreparedStatement stmt = conn.prepareStatement("update login set pw=?, email=?, name=? where id=?")){
		stmt.setString(1, upw);
		stmt.setString(2, uemail);
		stmt.setString(3, uname);
		stmt.setString(4, uid);
		stmt.executeUpdate();	
		%>
		<script>
		alert(
		<%="\'" + (uid) + "\'"%>
		+ '회원수정이 완료됬습니다.');
		<%if (rank.equals("상")) {%>
		location.replace("Mmain1.jsp");
		<%} else if (rank.equals("중")) {%>
		location.replace("Mmain2.jsp");
		<%} else if (rank.equals("하")) {%>
		location.replace("Mmain3.jsp");
		<%}%>
		
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
	%>

</body>
</html>