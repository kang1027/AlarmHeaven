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
    
    Connection conn = JDBCConn.DBCPConnection();
    ResultSet rs = null;
	try(PreparedStatement stmt = conn.prepareStatement("select * from manager where managerid = ? ")){
			
		stmt.setString(1, userId);
		rs = stmt.executeQuery();
		System.out.println(userId+"\t"+userPw);

		if(rs.next())
		{
			String dbId = rs.getString("managerid");
			String dbPw = rs.getString("managerpw");
				System.out.println(dbPw+"\t"+userPw);
			
			if(dbId.equals(userId))
			{
				if(dbPw.equals(userPw))
				{
					
					if(rs.getString("managerrank").equals("상")){
						%>
						<script>
							location.replace('manager/Mmain1.jsp');
						</script>
					<%
					}
					else if(rs.getString("managerrank").equals("중")){
						%>
						<script>
							location.replace('manager/Mmain2.jsp');
						</script>
					<%
					}
					else if(rs.getString("managerrank").equals("하")){
						%>
						<script>
							location.replace('manager/Mmain3.jsp');
						</script>
					<%
					}
					else{
						%>
							<script>
								alert('관리자 권한이 없습니다. 상위 관리자에게 문의하세요.');
								location.replace('managerlogin.jsp');
							</script>
						<%
					}
					session.setAttribute("id", userId);
					
	
				}
				else{
					%>
					<script>
						alert('관리자 비밀번호를 다시 확인해주세요.');
						location.replace('managerlogin.jsp');
					</script>
	<%
				}
			}	
		}
		else{
				%>
	<script>
		alert('관리자 아이디를 다시 확인해주세요.');
		location.replace('managerlogin.jsp');
	</script>
	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	JDBCConn.close(conn, rs);
	}
	%>
</body>
</html>