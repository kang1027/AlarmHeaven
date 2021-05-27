<%@page import="jdbc.JDBCConn"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
    
    String deleteMusicName = request.getParameter("deleteMusicName"); 
    
    
    try(Connection conn = JDBCConn.DBCPConnection();
    	PreparedStatement stmt = conn.prepareStatement("delete usermusic where musicname=?")){
		stmt.setString(1, deleteMusicName);
		
		stmt.executeUpdate();
		
		
		String fileName = deleteMusicName; //지울 파일명
		   String fileDir = "/uploadMusic\\"+session.getAttribute("id")+"music"; //지울 파일이 존재하는 디렉토리
		   String filePath = request.getRealPath(fileDir) + "/"; //파일이 존재하는 실제경로
		   filePath += fileName;
	
		   File f = new File(filePath); // 파일 객체생성
		   if( f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.
		response.sendRedirect("myMusic.jsp");
    	
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>