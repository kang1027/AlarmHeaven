<%@page import="jdbc.JDBCConn"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
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
	String userId = request.getParameter("userId");
	String userPw = request.getParameter("userPw");
	boolean success = false;

	try (Connection conn = JDBCConn.DBCPConnection();
			PreparedStatement stmt = conn.prepareStatement("select * from LOGIN");
			ResultSet rs = stmt.executeQuery()) {
		while (rs.next()) {
			String dbId = rs.getString("id");
			String dbPw = rs.getString("pw");

			if (dbId.equals(userId)) {
		if (dbPw.equals(userPw)) {
			success = true;
		}
			}
		}

	} catch (Exception e) {
		e.printStackTrace();

	}

	if (success) {
		session.setAttribute("id", userId);
		try{
			String path = request.getRealPath("/uploadMusic/") + session.getAttribute("id") + "music";
			File Folder = new File(path);
	
			if (!Folder.exists()) {
				try {
					Folder.mkdir();
				} catch (Exception e) {
					e.getStackTrace();
				}
			} else
				System.out.println("폴더있음");
		}catch(Exception e){
			String dir = request.getRealPath("/uploadMusic");
			File file = new File(dir);
			if(!file.exists()){
				file.mkdirs();
			}
		}
	%>


	<script>
		location.replace('../index.jsp');
	</script>
	<%
	}

	if (!success) {
	%>
	<script>
		alert("아이디나 비밀번호가 잘못되었습니다. 다시 입력하여주세요.");
		location.replace("login.jsp");
	</script>
	<%
	}
	String id1 = "";
	%>
</body>
</html>