<%@page import="jdbc.JDBCConn"%>
<%@page import="java.io.*"%>
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

	try (Connection conn = JDBCConn.DBCPConnection();
			PreparedStatement stmt = conn.prepareStatement("delete login where id=?")) {

		String sessionId = (String) session.getAttribute("id");
		stmt.setString(1, sessionId);

		int result = stmt.executeUpdate();
		try (PreparedStatement stmt1 = conn.prepareStatement("delete usermusic where id=?")) {
			// quiz txt 파일 삭제 부분.
			String fileName = session.getAttribute("id") + "quiz.txt"; //지울 파일명
			String fileDir = "/quiz"; //지울 파일이 존재하는 디렉토리
			String filePath = request.getRealPath(fileDir) + "/" + session.getAttribute("id") + "quiz.txt"; //파일이 존재하는 실제경로
			File f = new File(filePath); // 파일 객체생성
			if (f.exists())
		f.delete(); // 파일이 존재하면 파일을 삭제한다.
			//-----------------------------------------------------------------

			// music 폴더 삭제 부분
			String path = "/uploadMusic";
			String dir = request.getRealPath(path) + "/" + session.getAttribute("id") + "music";
			File folder = new File(dir);
			System.out.println(folder);
			while (folder.exists()) {
		File[] folder_list = folder.listFiles(); //파일리스트 얻어오기

		for (int j = 0; j < folder_list.length; j++) {
			folder_list[j].delete(); //파일 삭제 
			System.out.println("파일이 삭제되었습니다.");

		}

		if (folder_list.length == 0 && folder.isDirectory()) {
			folder.delete(); //대상폴더 삭제
			System.out.println("폴더가 삭제되었습니다.");

			stmt1.setString(1, (String) session.getAttribute("id"));

			int delF = stmt1.executeUpdate();
				System.out.print(delF);
		}
			}
		} catch (Exception ea) {
			ea.printStackTrace();
			System.out.println("파일없음");
		}
	%>
	<script>
		alert("회원삭제가 완료되었습니다. 로그아웃됩니다.");
		location.replace('../index.jsp');
	</script>
	<%
	session.invalidate();

	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
</html>