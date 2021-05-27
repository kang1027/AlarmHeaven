<%@page import="jdbc.JDBCConn"%>
<%@page import="java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oracle.jdbc.proxy.annotation.Pre"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
request.setCharacterEncoding("utf-8");
String bgCheck = request.getParameter("bgCheck");
if (bgCheck == null || bgCheck.equals(""))
	bgCheck = "base";
try(Connection conn = JDBCConn.DBCPConnection()){
	


ResultSet rs = null;
String loginName = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>알람천국</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 구글 cdn. 웹 사이트의 접속자가 서버에서 콘텐츠를 다운받아야 할 때 자동으로 가장 가까운 서버에서 다운받게 해줌. jquery파일 필요x 속도 짱짱 -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
</head>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mainheader.css">
<body>

	<nav>
		<%@ include file="jsp/mainheader.jsp"%>

		<div id="loginpage">
			<ul>
				<%
				String userId = "";

				userId = (String) session.getAttribute("id");

				if (userId == null || userId.equals("")) {
				%>

				<li><a href="jsp/login.jsp">로그인</a></li>
				<li><a href="jsp/insertUser.jsp">회원가입</a></li>
				<%
				} else {

				try (PreparedStatement stmt = conn.prepareStatement("select name from login where id = ?")) {
					String sessionId = (String) session.getAttribute("id");

					stmt.setString(1, sessionId);

					rs = stmt.executeQuery();

					if (rs.next()) {
						String selectName = rs.getString("name");
						loginName = selectName;
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					JDBCConn.close(rs);
				}

				%>

				<li><%=loginName%>님 반갑습니다.</li>
				<li><a href="jsp/myPage.jsp">마이페이지</a></li>

				<li><a href="jsp/logout.jsp">로그 아웃</a></li>
				<%
				}
				%>
			</ul>
		</div>
		<div id="page" style="position: absolute; z-index: 5">
			<div id="p1menu" class="pmenu">
				<ul>
					<li id="p1t1">알람 설정하기</li>
					<li id="p1t2">알람 디자인 바꾸기</li>
				</ul>
			</div>

			<div id="p2menu" class="pmenu">
				<ul>
					<li id="p2t1">내 음악</li>
					<li id="p2t2">내 문제</li>
				</ul>
			</div>
			<div id="p3menu" class="pmenu">
				<ul>
					<li id="p3t1">계정 수정</li>
					<li id="p3t2">계정 삭제</li>
				</ul>
			</div>
			<img src="image/menu1-1content1.PNG" id="menu1-1content"
				style="float: right; width: 1200px; position: absolute; margin-left: 270px; display: none;">
			<img src="image/menu1-2content1.PNG" id="menu1-2content"
				style="float: right; width: 1200px; position: absolute; margin-left: 300px; display: none;">
			<img src="image/menu2-1content1.PNG" id="menu2-1content"
				style="float: right; width: 1200px; position: absolute; margin-left: 300px; display: none;">
			<img src="image/menu2-2content1.PNG" id="menu2-2content"
				style="float: right; width: 1200px; position: absolute; margin-left: 300px; display: none;">
			<img src="image/menu3-1content1.PNG" id="menu3-1content"
				style="float: right; width: 1200px; position: absolute; margin-left: 300px; display: none;">
			<img src="image/menu3-2content1.PNG" id="menu3-2content"
				style="float: right; width: 1200px; position: absolute; margin-left: 300px; display: none;">


		</div>
		<!--  -->
		<div id="content">
			<div id="settingcompleteAlarm"
				style="position: absolute; text-align: center; margin-left: 50px; padding-top: 200px; width: 100px; z-index: 3;">
				알람<br>
				<div id="alarmresult"></div>
			</div>
			<div id="weatherui"
				style="width: 230px; text-align: center; padding-top: 180px; height: 100%; z-index: 3; position: absolute; margin-left: 1300px;">
				<div class="CurrTemp" style="font-family: '맑은고딕';"></div>
				<div class="City"></div>
				<div class="Icon"></div>
			</div>
			<div id="background">
				<div id="snow">
					<div class="CurrIcon"></div>
				</div>
				<div id="time">AM 12:25:05</div>
				<button type="button" data-toggle="modal" data-target="#alarmModal"
					id="alarmSetting">알람 설정 하기</button>
			</div>

		</div>




		<!-- 아래에서 data-toggle과 data-target 속성에서 data-toggle에는 modal 값을 data-target속성에는 모달 창 전체를 

감싸는 div의 id 이름을 지정하면 된다. -->

			<div id="result" style="width: 210px; height: 100px;"></div>

		<div class="modal fade" id="alarmModal" role="dialog">
			<!-- 사용자 지정 부분① : id명 -->

			<div class="modal-dialog">



				<!-- Modal content-->

				<div class="modal-content">

					<div class="modal-header">

						<button type="button" class="close" data-dismiss="modal">×</button>

						<h4 class="modal-title">알람 설정</h4>
						<!-- 사용자 지정 부분② : 타이틀 -->

					</div>

					<div class="modal-body">

						<p>
							현재 시간 : <input type=text name=ch size=2 id="ch"
								style="text-align: center;">시<input type=text name=cm
								size=2 id="cm" style="text-align: center;">분 <input
								type=text name=cs size=2 id="cs" style="text-align: center;">초
						<hr>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 시간 : <input
							type="time" name="time" id="settingtime" autofocus>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<%
						userId = (String) session.getAttribute("id");

						if (userId == null || userId.equals("")) {
						%>
						벨소리 : <select style="width: 150px; padding: 5px 10px;" id="audio">
							<option value="a">노래</option>
							<option value="b">비프음</option>
							<option value="c">자명종</option>
							<option value="d">꼬꼬댁</option>
							<option value="e">전화벨</option>
						</select>
						<%
						} else {%>
						벨소리 : <select style="width: 150px; padding: 5px 10px;" id="audio">
						<%
						try (PreparedStatement stmt = conn.prepareStatement("select * from usermusic where id = ?")){ 
							stmt.setString(1, (String) session.getAttribute("id"));
							rs = stmt.executeQuery();
							while (rs.next()) {
								String name = rs.getString("musicname");
							%>
							<option value="<%=name%>"><%=name%></option>
							<%
							}
							%>
							<option value="a">노래</option>
							<option value="b">비프음</option>
							<option value="c">자명종</option>
							<option value="d">꼬꼬댁</option>
							<option value="e">전화벨</option>
						</select>


						<%
						} catch (Exception e) {
						e.printStackTrace();
						} finally {
						JDBCConn.close(rs);
						}
						}
						%>
						</p>
						<!-- 사용자 지정 부분③ : 텍스트 메시지 -->

					</div>

					<div class="modal-footer">

						<button class="sub" type="button" class="btn btn-default"
							data-dismiss="modal" onclick="SetAlarm()">설정</button>

					</div>

				</div>

			</div>

		</div>

		<div class="modal fade" id="quizmodal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true" onkeyup="answerkey()">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="quizheader">ㅇㅇ 문제</h2>
						<div id="quizresult"></div>
			<!-- 			<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
			-->
					</div>
					<div class="modal-body" id="quizbody">
						문제 : ㅁㅁㅁㅁㅁㅁ 은?<br> <br> 정답 : <input type="text" size=10 id="anwer">
					</div>
					<div class="modal-footer">
						<button type="button" class="anwerCheck"
							data-dismiss="modal" onclick="answerCheck()" >정답 확인하기</button>
					</div>
				</div>
			</div>
		</div>

	</nav>


	<%@ include file="jsp/footer.jsp"%>


	<script>
		var alarmTimer = null; // 타이머
		var alarmSet; //얼람 시간 저장 여부

		var audio = null;

		var audio1 = new Audio("music/audio.mp3");
		var audio2 = new Audio("music/audio2.mp3");
		var audio3 = new Audio("music/audio3.MP3");
		var audio4 = new Audio("music/audio4.MP3");
		var audio5 = new Audio("music/audio5.MP3");

		var qNum = 0;

		function SetAlarm() {

			var time = document.querySelector("#settingtime").value;
			var hh = time.substr(0, 2);
			var mm = time.substr(3, 2);
			var audioIndex = document.querySelector("#audio");
			var selectAudioValue = audioIndex.options[audioIndex.selectedIndex].value;
			<%
				String context = request.getContextPath();
			%>
			if (new Audio(<%="\""+(context)+"\""%>+"/uploadMusic/" +<%="\"" + (userId) + "\""%>+ "music/" + selectAudioValue)) {
				audio = new Audio(<%="\""+(context)+"\""%>+"/uploadMusic/"+<%="\"" + (userId) + "\""%>+ "music/"+ selectAudioValue);
			}

			switch (selectAudioValue) {
			case "a":
				audio = audio1;
				break;
			case "b":
				audio = audio2;
				break;
			case "c":
				audio = audio3;
				break;
			case "d":
				audio = audio4;
				break;
			case "e":
				audio = audio5;
				break;
			}

			if (hh[0] == "0") {
				hh = hh[1];
			}
			if (mm[0] == "0") {
				mm = mm[1];
			}

			var h = hh;
			var m = mm;
			if (!((h >= 0 && h <= 23) && (m >= 0 && m <= 59))) {
				alert("잘못된 알람입니다. 알람을 다시 설정해주세요");
				Load();
			} else {
				alert(h + "시" + m + "분으로 알람이 설정되었습니다.");
				alarmSet = true;
				document.querySelector("#alarmresult").innerHTML = h
						+ " : "
						+ m
						+ "<div id='alarmcancel' style='float : right; margin-right : 10px; border : 1px solid black; padding : 2px; cursor : pointer;'onclick='alarmC();' >X</div>   ";
			}

		}
		

		function alarmC() {
			document.querySelector("#alarmresult").innerHTML = "";
			alarmSet = false;
			alert("알람이 삭제되었습니다.");
		}

		function Load() {
			alarmSet = false;
			var time = document.querySelector("#settingtime").value;
			var hm = time.split(":");
			var h = hm[0];
			var m = hm[1];

			h = "0";
			m = "0";
		}

		function CountTime() {

			var nowDate = new Date();
			document.querySelector("#ch").value = nowDate.getHours();
			document.querySelector("#cm").value = nowDate.getMinutes();
			document.querySelector("#cs").value = nowDate.getSeconds();
			var hour = nowDate.getHours();
			var minute = nowDate.getMinutes();
			var seconds = nowDate.getSeconds();

			var apm = "";

			var aahour;
			var aaminute;
			var aaseconds;
			if (hour >= 0 && hour <= 12) {
				apm = "AM";
				if (hour < 10) {
					aahour = "0" + hour;
				} else
					aahour = hour;
			} else {
				apm = "PM";
				hour -= 12;
				if (hour < 10) {
					aahour = "0" + hour;
				} else
					aahour = hour;
			}
			if (minute < 10) {
				aaminute = "0" + minute;
			} else
				aaminute = minute;
			if (seconds < 10) {
				aaseconds = "0" + seconds;
			} else
				aaseconds = seconds;
			document.querySelector("#time").textContent = apm + " " + aahour
					+ " : " + aaminute + " : " + aaseconds;
			if (matchH() && matchM() && alarmSet) {
				audio.play();
				audio.addEventListener('ended', function() {
					this.currentTime = 0;
					this.play();
				}, false);
				alarmSet = false;

				document.querySelector("#result").innerHTML = "<button type='button' data-backdrop='static' data-keyboard='false' style='visibility : hidden;' data-toggle='modal' data-target='#quizmodal' name='quizType' value='수학' onclick='answer(0)' id='d'>다시풀기</button>";
				$("#d").trigger("click");

			}

		}
		
	<%String math = null;
String eng = null;
String nun = null;

if (userId == null || userId.equals("")) {
} else {
	BufferedReader reader = null;
	ArrayList<String> ac = new ArrayList<String>();
	try {
		String filePath = request.getRealPath("/quiz/" + session.getAttribute("id") + "quiz.txt");
		reader = new BufferedReader(new FileReader(filePath));
		while (true) {
			String str = reader.readLine();
			if (str == null) {
				break;
			}
			ac.add(str);
		}

		math = ac.get(0);
		eng = ac.get(1);
		nun = ac.get(2);
	} catch (FileNotFoundException e) {
		System.out.println("파일이 없습니다.");
	} catch (IOException e) {
		System.out.println("파일을 읽을 수 없습니다.");
	} finally {
		try {
			reader.close();
		} catch (Exception e) {

		}
	}

}

if ((math == null && eng == null && nun == null) || (math.equals("null") && eng.equals("null") && nun.equals("null"))) {
	math = "수학";
	eng = "영어";
	nun = "넌센스";
}
int randomNum = 0;
ArrayList<String> quizArray = new ArrayList<String>();
ArrayList<String> answerArray = new ArrayList<String>();
ArrayList<String> quizTypeArray = new ArrayList<String>();
try (PreparedStatement stmt = conn
		.prepareStatement("select * from testquiz where quiztype = ? or quiztype = ? or quiztype=?")) {
	stmt.setString(1, math);
	stmt.setString(2, eng);
	stmt.setString(3, nun);

	rs = stmt.executeQuery();

	while (rs.next()) {
		quizArray.add(rs.getString("question"));
		answerArray.add(rs.getString("answer"));
		quizTypeArray.add(rs.getString("quiztype"));
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	JDBCConn.close(rs);
}

randomNum = (int) (Math.random() * quizArray.size());
String quiz = quizArray.get(randomNum);
String answer = answerArray.get(randomNum);
String quizType = quizTypeArray.get(randomNum);%>
		function answer(quizNum) {
			document.querySelector("#quizheader").innerHTML =
	<%="\"" + (quizType) + "\""%>
		+ "문제입니다.";
			document.querySelector("#quizbody").innerHTML = "문제 : "
					+
	<%="\"" + (quiz) + "\""%>
		;
			document.querySelector("#quizbody").innerHTML += "<br><br>정답 : <input type='text' id='answer'>"

		}

		function answerCheck() {
			var answer = document.querySelector("#answer");

			if (answer.value ===
	<%="\"" + (answer) + "\""%>
		) {
				alert("정답입니다.");
				window.location.reload();
			} else {
				alert("틀렸습니다.");
				$("#d").css("visibility", "visible");
			}

		}

		function matchH() {
			var time = document.querySelector("#settingtime").value;
			var hh = time.substr(0, 2);
			var mm = time.substr(3, 2);

			if (hh[0] == "0") {
				hh = hh[1];
			}
			if (mm[0] == "0") {
				mm = mm[1];
			}

			var h = hh;
			var m = mm;
			return (h == document.querySelector("#ch").value);
		}
		function matchM() {
			var time = document.querySelector("#settingtime").value;
			var hh = time.substr(0, 2);
			var mm = time.substr(3, 2);

			if (hh[0] == "0") {
				hh = hh[1];
			}
			if (mm[0] == "0") {
				mm = mm[1];
			}

			var h = hh;
			var m = mm;
			return (m == document.querySelector("#cm").value);
		}

		onload = function() {
			Load();
			setInterval("CountTime()", 1000);
		};
	</script>
	<script>
		var contentBg = "";
		var bodyBg = "";
		var menuBg = "";
		var pageBg = "";
		var alphaBodyBg = "";
		var modal_header = "";
		var modal_title = "";
		var close = "";
		var modal_body = "";
		var modal_footer = "";
		var sub = ""
		var loginpage = "";
		/*modal-header
		modal-title
		close
		modal-body*/
	<%if (bgCheck.equals("base")) {%>
		contentBg = "#dcdcdc";
		bodyBg = "white";
		menuBg = "white";
		pageBg = "white";
		alphaBodyBg = "gray";
		modal_header = "white";
		modal_title = "white";
		close = "white";
		modal_body = "white";
		modal_footer = "white";
		sub = "orange";
		loginpage = "white";
		$("#menu").css("background-color", menuBg);
		$("#page").css("background-color", pageBg);
		$("#content").css("background-color", contentBg);
		$("body").css("background-color", bodyBg);
		$(".modal-header").css("background-color", modal_header);
		$(".modal-title").css("background-color", modal_title);
		$(".close").css("background-color", close);
		$(".modal-body").css("background-color", modal_body);
		$(".modal-footer").css("background-color", modal_footer);
		$(".sub").css("background-color", sub);
		$("#loginpage").css("background-color", loginpage);
	<%}%>
		
	<%if (bgCheck.equals("purple")) {%>
		contentBg = "#a13bb9";
		bodyBg = "#b738c7";
		menuBg = "#b738c7";
		pageBg = "#a16ab9";
		alphaBodyBg = "#9e5cc7";
		modal_header = "#965ce7";
		modal_title = "#965ce7";
		close = "#893f9a";
		modal_body = "#965ce7";
		modal_footer = "#965ce7";
		sub = "#893f9a";
		loginpage = "#b26ff7"
		$("#menu").css("background-color", menuBg);
		$("#page").css("background-color", pageBg);
		$("#content").css("background-color", contentBg);
		$("body").css("background-color", bodyBg);
		$(".modal-header").css("background-color", modal_header);
		$(".modal-title").css("background-color", modal_title);
		$(".close").css("background-color", close);
		$(".modal-body").css("background-color", modal_body);
		$(".modal-footer").css("background-color", modal_footer);
		$(".sub").css("background-color", sub);
		$("#loginpage").css("background-color", loginpage);
	<%}%>
		
	<%if (bgCheck.equals("dark")) {%>
		contentBg = "#464646";
		bodyBg = "#5a5a5a;";
		menuBg = "#5a5a5a";
		pageBg = "#5a5a5a";
		alphaBodyBg = "#646464";
		modal_header = "#646464";
		modal_title = "#646464";
		close = "#969696";
		modal_body = "#646464";
		modal_footer = "#646464";
		sub = "#969696";
		loginpage = "#b4b4b4"
		$("#menu").css("background-color", menuBg);
		$("#page").css("background-color", pageBg);
		$("#content").css("background-color", contentBg);
		$("body").css("background-color", bodyBg);
		$("body").css("color", "yellow");
		$("#menu > li > a").css("color", "yellow");
		$(".modal-header").css("background-color", modal_header);
		$(".modal-title").css("background-color", modal_title);
		$(".close").css("background-color", close);
		$(".modal-body").css("background-color", modal_body);
		$(".modal-footer").css("background-color", modal_footer);
		$(".sub").css("background-color", sub);
		$(".modal-content").css("color", "black");
		$("#loginpage").css("background-color", loginpage);
		$("#loginpage").css("color", "black");
	<%}%>
		$('.menu').mouseenter(function() {

			$('#page').slideDown(250);
			$('#content').stop().animate({
				"background-color" : contentBg,
				opacity : "0.5"
			}, 250)
			$('body').stop().animate({
				"background-color" : alphaBodyBg
			}, 250);
		});

		$('#login').mouseenter(function() {

			$('#loginpage').slideDown(250);
			$('#content').stop().animate({
				"background-color" : contentBg,
				opacity : "0.5"
			}, 250)
			$('body').stop().animate({
				"background-color" : alphaBodyBg
			}, 250);
		});

		$('#menu1').mouseenter(function() {

			$('#p1menu > ul > li').css('font-weight', '100');
			$('#p1t1').css('font-weight', '900');

			$('#p2menu > ul > li').css('font-weight', '100');
			$('#p2t1').css('font-weight', '900');

			$('#p3menu > ul > li').css('font-weight', '100');
			$('#p3t1').css('font-weight', '900');

			$('#page > img').css('display', 'none');
			$('#menu1-1content').css('display', 'block');
			$('#page > img').css("left", "-20");
			$('#menu1-1content').css("opacity", "0");

			$('#menu1-1content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);

			$('#page > div').css('z-index', '0');
			$('#p1menu').css('z-index', '2');
			$('.pmenu > ul > li').css('display', 'none');
			$('#p1menu > ul > li').css('display', 'block');
			$('#p1menu > ul > li').fadeOut(1);
			$('#p1menu > ul > li').fadeIn(200);

		});
		$('#menu2').mouseenter(function() {
			$('#p1menu > ul > li').css('font-weight', '100');
			$('#p1t1').css('font-weight', '900');

			$('#p2menu > ul > li').css('font-weight', '100');
			$('#p2t1').css('font-weight', '900');

			$('#p3menu > ul > li').css('font-weight', '100');
			$('#p3t1').css('font-weight', '900');

			$('#page > img').css('display', 'none');
			$('#menu2-1content').css('display', 'block');
			$('#page > img').css("left", "-20");
			$('#menu2-1content').css("opacity", "0");
			$('#menu2-1content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);

			$('#page > div').css('z-index', '0');
			$('#p2menu').css('z-index', '2');
			$('.pmenu > ul > li').css('display', 'none');
			$('#p2menu > ul > li').css('display', 'block');
			$('#p2menu > ul > li').fadeOut(1);
			$('#p2menu > ul > li').fadeIn(200);
		});
		$('#menu3').mouseenter(function() {
			$('#p1menu > ul > li').css('font-weight', '100');
			$('#p1t1').css('font-weight', '900');

			$('#p2menu > ul > li').css('font-weight', '100');
			$('#p2t1').css('font-weight', '900');

			$('#p3menu > ul > li').css('font-weight', '100');
			$('#p3t1').css('font-weight', '900');

			$('#page > img').css('display', 'none');
			$('#menu3-1content').css('display', 'block');
			$('#page > img').css("left", "-20");
			$('#menu3-1content').css("opacity", "0");
			$('#menu3-1content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);

			$('#page > div').css('z-index', '0');
			$('#p3menu').css('z-index', '2');
			$('.pmenu > ul > li').css('display', 'none');
			$('#p3menu > ul > li').css('display', 'block');
			$('#p3menu > ul > li').fadeOut(1);
			$('#p3menu > ul > li').fadeIn(200);
		});

		$('nav').mouseleave(function() {
			$('#page').slideUp(250, function() {
				$('#page > img').css("left", "-20");
			});
			$('#loginpage').slideUp(250);
			$('body').stop().animate({
				"background-color" : bodyBg
			}, 250);
			$('#content').stop().animate({
				"background-color" : contentBg,
				opacity : "1"
			}, 250);
		});

		$('#p1t1').mouseenter(function() {
			$('#p1menu > ul > li').css('font-weight', '100');
			$('#p1t1').css('font-weight', '900');

			$('#page > img').css("left", "-20");
			$('#page > img').css('display', 'none');
			$('#menu1-1content').css('display', 'block');
			$('#menu1-1content').css("opacity", "0");
			$('#menu1-1content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);
		});
		$('#p1t2').mouseenter(function() {
			$('#p1menu > ul > li').css('font-weight', '100');
			$('#p1t2').css('font-weight', '900');

			$('#page > img').css("left", "-20");
			$('#page > img').css('display', 'none');
			$('#menu1-2content').css('display', 'block');
			$('#menu1-2content').css("opacity", "0");
			$('#menu1-2content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);
		});

		$('#p2t1').mouseenter(function() {
			$('#p2menu > ul > li').css('font-weight', '100');
			$('#p2t1').css('font-weight', '900');

			$('#page > img').css("left", "-20");
			$('#page > img').css('display', 'none');
			$('#menu2-1content').css('display', 'block');
			$('#menu2-1content').css("opacity", "0");
			$('#menu2-1content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);
		});
		$('#p2t2').mouseenter(function() {
			$('#p2menu > ul > li').css('font-weight', '100');
			$('#p2t2').css('font-weight', '900');

			$('#page > img').css("left", "-20");
			$('#page > img').css('display', 'none');
			$('#menu2-2content').css('display', 'block');
			$('#menu2-2content').css("opacity", "0");
			$('#menu2-2content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);
		});

		$('#p3t1').mouseenter(function() {
			$('#p3menu > ul > li').css('font-weight', '100');
			$('#p3t1').css('font-weight', '900');

			$('#page > img').css("left", "-20");
			$('#page > img').css('display', 'none');
			$('#menu3-1content').css('display', 'block');
			$('#menu3-1content').css("opacity", "0");
			$('#menu3-1content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);
		});
		$('#p3t2').mouseenter(function() {
			$('#p3menu > ul > li').css('font-weight', '100');
			$('#p3t2').css('font-weight', '900');

			$('#page > img').css("left", "-20");
			$('#page > img').css('display', 'none');
			$('#menu3-2content').css('display', 'block');
			$('#menu3-2content').css("opacity", "0");
			$('#menu3-2content').stop().animate({
				opacity : "1",
				left : "20"
			}, 300);
		});
	</script>

	<script>
		$(document)
				.ready(
						function() {
							let weatherIcon = {
								'01' : 'fas fa-sun',
								'02' : 'fas fa-cloud-sun',
								'03' : 'fas fa-cloud',
								'04' : 'fas fa-cloud-meatball',
								'09' : 'fas fa-cloud-sun-rain',
								'10' : 'fas fa-cloud-showers-heavy',
								'11' : 'fas fa-poo-storm',
								'13' : 'fas fa-snowflake',
								'50' : 'fas fa-smog'
							};
							$
									.ajax({
										url : 'http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=0c46f67c0bb509a813603966d5974213&units=metric',
										dataType : 'json',
										type : 'GET',
										success : function(data) {
											var $Icon = (data.weather[0].icon);
											var $Temp = Math
													.floor(data.main.temp)
													+ 'º';
											var $city = data.name;

											$('.CurrIcon')
													.append(
															'<img src="' + 'image/weather/weather' + $Icon + '.gif' + '">');
											$('.CurrIcon > img').css('width',
													'100%');
											$('.CurrIcon > img').css('height',
													'500px');
											$('.CurrTemp').prepend($Temp);
											$('.City').append($city);
											$('.Icon')
													.append(
															'<img src="' + 'http://openweathermap.org/img/wn/' + $Icon + '@2x.png' + '">');

										}
									})
						});
	</script>
	<script>

		function answerkey(){
			if(window.event.keyCode == 13){
				$('.anwerCheck').trigger("click");
			}
		}
	</script>
<%} %>
</body>

</html>
