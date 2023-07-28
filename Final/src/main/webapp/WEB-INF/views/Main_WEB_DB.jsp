<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% User user = (User)session.getAttribute("user_data");
   String secheck = (user != null) ? user.getName() : null; %>
<link rel="stylesheet" type="text/css" href="resources/css/navicover.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/main.css"/>
</head>
<body>
    <div id="center">
        <div id="header">
            <div class="dropdown" style="float: left;">
                <button class="dropbtn">
                    <img class="homeicon" src="resources/img/house.svg">
                </button>
                <!-- <div class="dropdown-content" style="left: 0;">
                    <a href="#">링크#1</a>
                </div> -->
            </div>
            <!-- <span style="display: flex; justify-content: center; align-items: center; font:bold 60px 'malgun gothic'; margin-left: 33%; float: left; margin-top: 2%; letter-spacing:7px; color: #212A3E; font-family: 'Ubuntu', sans-serif;" >oh! yes</span> -->
            <!-- <span id="logo" style="display: flex; justify-content: center; align-items: center; font-size:50px; margin-left: 33%; float: left; margin-top: 2%; letter-spacing:7px; color: #212A3E;" >oh! yes</span> -->
            <span id="logo">oh! yes</span>
            <div class="dropdown" style="float: right;">
                <button class="dropbtn"><img class="myicon" src="resources/img/user.svg"></button>
                <div class="dropdown-content">
                    <% if (secheck != null) { %>
					 	<a href="#">문자 발송 내역</a>
					<% } else { %>
						<a href="movelogin">문자 발송 내역</a>
					<% } %>
					
					<% if (secheck != null) { %>
						<a href="logout">로그아웃</a>
					<% } else { %>
						<a href="movelogin">로그인</a>
					<% } %>
					
					<% if (secheck != null) { %>
						<a href="#">회원탈퇴</a>
					<% } else { %>
						<a href="movelogin">회원탈퇴</a>
					<% } %> 
                </div>
            </div>    
        </div>
        <br><br><br><br><br><br><br><hr>
        <!-- 여기서 작업하면됨 -->
        <div class="main_area">
            <div class="record_btn">
	            <% if (secheck == null) { %>
					<a href="movelogin"><img src="resources/img/video-projector.png" onmouseover="this.src='resources/img/video-projector-unscreen.gif'" onmouseout="this.src='resources/img/video-projector.png'"></a>
				<% } else { %>
					<a href="main"><img src="resources/img/video-projector.png" onmouseover="this.src='resources/img/video-projector-unscreen.gif'" onmouseout="this.src='resources/img/video-projector.png'"></a><!-- 녹화 -->
				<% } %></div>
            <p style="border-left: 1px solid #eae7e4; box-shadow:0 0 15px rgba(159, 151, 151, 0.326);"></p>
            <div class="drive_record_btn">
                <a href="#"><img src="resources/img/bar-chart.png" onmouseover="this.src='resources/img/bar-chart-1--unscreen.gif'" onmouseout="this.src='resources/img/bar-chart.png'"></a>
            </div>
            <p style="border-left: 1px solid #eae7e4;"></p>
            <div class="setting_btn" style="border: 0;">
                <a href="#"><img src="resources/img/settings.png" onmouseover="this.src='resources/img/settings-unscreen.gif'" onmouseout="this.src='resources/img/settings.png'"></a>
            </div>
        </div>
  </div>

</body>
</html>