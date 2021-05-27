<%@page import="jdbc.JDBCConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String inId = request.getParameter("inId"); // 이렇게 쿼리스트링으로 값 받음.
String inPw = request.getParameter("inPw");
String inEmail = request.getParameter("inEmail");
String inName = request.getParameter("inName");
System.out.println(inId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 보기</title>
</head>
<body>
	<%
	try (Connection conn = JDBCConn.DBCPConnection();
		 PreparedStatement stmt = conn.prepareStatement("insert into login(id,pw,email,name) values(?,?,?,?)")) {
		stmt.setString(1, inId);
		stmt.setString(2, inPw);
		stmt.setString(3, inEmail);
		stmt.setString(4, inName);

		int num = stmt.executeUpdate();
	%>
	<script>
		alert("회원가입이 되었습니다. 로그인해주세요.");
		location.replace('login.jsp');
	</script>
	<%
	} catch (Exception e) {
	%>
	<script>
		alert("이미 존재하는 아이디입니다.");
		location.replace('insertUser.jsp');
	</script>
	<%
	e.printStackTrace();
	}
	%>
</body>
</html>






