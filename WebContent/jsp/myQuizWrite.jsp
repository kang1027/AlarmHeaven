<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
	String math= (String)request.getParameter("math");
	String eng = (String)request.getParameter("eng");
	String nun = (String)request.getParameter("nun");
	
	String filename = session.getAttribute("id")+"quiz.txt";
	PrintWriter writer = null;
	try{
		String dir = request.getRealPath("/quiz/");
		String filePath = dir+ "/" + filename;
		
		writer = new PrintWriter(filePath);
		writer.printf(math + "\n"+eng + "\n"+nun);
		
	}
	catch(IOException e)
	{
		out.println("파일에 데이터를 쓸 수 없습니다.");
	}finally{
		try{
			writer.close();
		}
		catch(Exception e)
		{
			
		}
	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("저장되셨습니다.");
	location.replace('../index.jsp');
</script>
</body>
</html>