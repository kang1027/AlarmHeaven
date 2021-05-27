<%@page import="jdbc.JDBCConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("utf-8");
    
    String userPw = request.getParameter("pw");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	@font-face{
           font-family: "content";
           src: url("../font/content.ttf");
	}
	@font-face{
           font-family: "title";
           src: url("../font/title.ttf");
	}
	body{
        font-family: "content";
        background-color : #f0f0f0;
	}
	#mymusic{
		margin-top : 3%;
		text-align : center;
	}

	#mymusictxt{
		color : blue;
		font-family : "title";
        line-height: 100px;
        
	}
	#mymusiclist{
		margin : 50px;
		height : 650px;
		width : 550px;
		background-color : white;
		margin : auto;      
		border-radius: 30px;
		border : 1px solid gray;

	}
	#uploadbtn{
		width : 200px;
		border-radius : 30px;
		border : none;
		hegith : 80px;
		margin-bottom : 100px;
		font-family : "content";
		font-size : 2em;
		padding : 20px;
		background-color : #75d594;
		margin-top : 50px;
		cursor : pointer;
	}
	#uploadbtn:hover{
		background-color : #71ad7f;
	}
	img{
		width : 60px;
	}
	table{
		text-align : center;
		margin : auto;
		font-size : 1.3em;
		border : 1px solid black;
		width : 500px;
		height : 50px;	
		
	}
	.deletemusic{
	border : 1px solid black; 
	width : 30px; 
	float : right; 
	cursor : pointer;
	margin-right : 10px;
	margin-left : 5px;
	}	
	.deletemusic:hover{
		background-color : gray;
	}
	.downmusic{
		float : right;
		margin-right : 10px;
	}
	.downmusic > img{
		width : 25px; 
		cursor : pointer;
		margin-top : auto;
	}
	#musicname{
		width : 300px;
		margin : auto;
		padding : 5px;	
		display : block;
		float : left;
		margin-left : 15%;
		border-bottom : 1px solid black;
	}
	form{
		margin-top : 50px;
	}
	
	input[type="file"] {
	 position: absolute; 
	 width: 1px; 
	 height: 1px; 
	 padding: 0; 
	 margin: -1px; 
	 overflow: hidden; 
	 clip:rect(0,0,0,0); 
	 border: 0; 
	 } 
	label { 	 
	 display: inline-block; 
	 padding: .5em .75em; 
	 color: white; 
	 font-size: inherit; 
	 line-height: normal; 
	 vertical-align: middle;
	 background-color: #ffa700; 
	 cursor: pointer;
	 border: 1px solid #ebebeb;
	 border-bottom-color: #e2e2e2;
	 border-radius: .25em; 
	 }
	 label:hover{
	 	background-color: #ff8c00;
	 }
	.musicform .upload-name { 
	display: inline-block; 
	padding: .5em .75em; 
	font-size: inherit; 
	font-family: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #f5f5f5;
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2;
	border-radius: .25em; 
	-webkit-appearance: none;
	-moz-appearance: none; 
	appearance: none; 
	}
</style>

</head>
<body>
<%@ include file="header.jsp" %>
	<!--  
	문제 확인
		-문제 바꾸기
		-문제 삭제 
	배경 바꾸기
		- 배경 확인
	내 음악
		- 음악파일 올리기
		- 음악파일 확인
			- 음악파일 다운
	-->
	<div id="mymusic">
		<div id="mymusiclist">
			<div id="mymusictxt"><h1>내 음악</h1></div>
			<table>
				<%
				Connection conn = JDBCConn.DBCPConnection();
				ResultSet rs = null;
				try(PreparedStatement stmt = conn.prepareStatement("select * from usermusic where id = ?")){
				stmt.setString(1, (String)session.getAttribute("id"));
				rs = stmt.executeQuery();
				int tdNum = 0;
				while(rs.next()){
					String name = rs.getString("musicname");
					
					%>
					<tr style="border : 1px solid black;"><td id="mymusic<%=tdNum%>">
					<div id="musicname"><%=name %> </div>
					<div id="deletemusic<%=tdNum %>" class="deletemusic" onclick="deleteMusic(<%=tdNum %>)">X</div> 
					<div id="downmusic<%=tdNum %>" class="downmusic" onclick="downMusic(<%=tdNum %>)">
					<img src="../image/downIcon.png"></div>
					</td></tr>
				<%tdNum++;}
				
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					JDBCConn.close(conn, rs);
				}
				%>
				
			</table>
			<form action="musicUpload.jsp" method="post" enctype="Multipart/form-data" onsubmit="return checkValue()">
				<div class="musicform">
					
					<input class="upload-name" value="파일선택" disabled="disabled">
					<label for="musicup">음악 선택</label> 
					<input type="file" accept="audio/*" name="fileName1" id="musicup" class="upload-hidden"> <br><br>
				</div>
				
				<button type="submit" id="uploadbtn">업로드</button>
			</form>
		</div>
	</div>
		
		
		<script>
			function checkValue() {
				
				if(document.getElementById("musicup").value === "") {
					alert('추가할 음악을 선택하여주세요.');
					return false;
				}
				return true;
			}
		</script>
		<script>
			function deleteMusic(num){
				var mymusic = document.querySelector("#mymusic"+num);
				var aa = document.querySelector("#deletemusic"+num).textContent;
				var b = mymusic.textContent.replace("X","");
				if(confirm(b.trim() + "음악을 삭제하시겠습니까?")){
					location.replace('deleteMusicCtrl.jsp?deleteMusicName='+b.trim());
					
				}
			}
			
			function downMusic(num){
				var mymusic = document.querySelector("#mymusic"+num);
				var aa = document.querySelector("#downmusic"+num).textContent;
				var b = mymusic.textContent.replace("X","");
				if(confirm(b.trim() + "음악을 다운하시겠습니까?")){
					location.replace('musicDown.jsp?downMusicName='+b.trim());
					
				}
			}
			
		</script>
		<script>
		$(document).ready(function(){ 
			var fileTarget = $('.musicform .upload-hidden'); 
			fileTarget.on('change', function(){
				// 값이 변경되면 
				if(window.FileReader){ 
					// modern browser 
					var filename = $(this)[0].files[0].name; 
				} else { 
					// old IE 
					var filename = $(this).val().split('/').pop().split('\\').pop();
					// 파일명만 추출 
					} // 추출한 파일명 삽입 
					$(this).siblings('.musicform .upload-name').val(filename); 
				}); 
			});

		</script>
</body>
</html>