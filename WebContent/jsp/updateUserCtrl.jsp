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
    
    String userId = (String)session.getAttribute("id");
    String userPw = request.getParameter("userPw");
    String userEmail = request.getParameter("userEmail");
    String userName = request.getParameter("userName");
    
     	
    try(Connection conn = JDBCConn.DBCPConnection();
    	PreparedStatement stmt = conn.prepareStatement("update login set pw=?, email=?, name=? where id=?")){	
		stmt.setString(1, userPw);
		stmt.setString(2, userEmail);
		stmt.setString(3, userName);
		stmt.setString(4, userId);
		System.out.print(userPw + userEmail + userName + userId);
		
		int result = stmt.executeUpdate();
		%>
		<script>
			alert("회원수정이 완료되었습니다.");
			location.replace('../index.jsp');
		</script>
		<%		
    }catch(Exception e){
    		e.printStackTrace();
    }
	%>	
    
</body>
</html>