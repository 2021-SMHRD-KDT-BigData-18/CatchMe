<%@page import="java.util.Date"%>
<%@page import="kr.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/navicover.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/recordcss.css"/>
</head>
<body onload="setSize()">
	<audio id="notifySound" controls style="visibility: hidden;">
		<%
		User user_data = (User) session.getAttribute("user_data");
		String alarm_full_path = user_data.getAlarm();
		String alarm_select_path = alarm_full_path.substring(alarm_full_path.lastIndexOf("\\") + 1);
		String music_url = "http://121.179.7.41:3000/music/" + alarm_select_path;
		%>
		<source src="<%=music_url%>" type="audio/mpeg">
	</audio>
	<input type = "hidden" value = "${user_data.id }" id = "username">
	<input type = "hidden" value = "${user_data.sms_receiver }" id = "sms_receiver">


	<div id="center">
		<div id="header">
	    	<div class="dropdown" style="float: left;">
	        	<button class="dropbtn">
	            	<a href="/web"><img class="homeicon" src="resources/img/home (2).png"></a>
	            </button>
	            <!-- <div class="dropdown-content" style="left: 0;">
	                <a href="#">링크#1</a>
	            </div> -->
	        </div>
	        <span id="logo">Catch you</span>
            <span id="logo_un">Whenever, Wherever </span>
	       	<div class="dropdown">
	        	<button class="dropbtn"><img class="myicon" src="resources/img/user (2).png"></button>
	            <div class="dropdown-content">
	            	<a href='#'>문자 발송 내역</a>
	                <a href='logout'>로그아웃</a>
	                <a href='#'>회원탈퇴</a>
	            </div>
	        </div>    
	    </div>
	    <br><hr>

		<div id="main_area">
			<div class="record_area" width=><video id="video"></video></div>
			<div class="record_button">
				<a id="toggleStream" class="start-rec-button"
				onclick="toggleStream()"><img src="resources/img/video.png" id="record_img" style="float: left;"></a>
				<a id = "stopSound" onclick="stopNotifySound()" style="visibility: hidden;">음악 종료</a>
				<!-- <button>end</button> -->
				<div class="content_up" style="margin-top: 40px; margin-left: 120px;">
                    <span>지금 뭐해 이상행동 감지되었잖아!</span>
                </div>
			</div>
			<div class="content_area" style="overflow:auto;">
				<p></p>
				<!-- <p>07. 졸음운전 감지(2023.07.25 09:20)</p><hr>
                <p>06. 졸음운전 감지(2023.07.25 09:20)</p><hr>
                <p>05. 졸음운전 감지(2023.07.25 09:20)</p><hr>
                <p>04. 졸음운전 감지(2023.07.25 09:20)</p><hr>
                <p>03. 졸음운전 감지(2023.07.25 09:20)</p><hr>
                <p>02. 졸음운전 감지(2023.07.25 09:20)</p><hr>
                <p>01. 졸음운전 감지(2023.07.25 09:16)</p><hr> -->
			</div>
		</div>
	</div>
		
	<!-- 졸음감지시 졸음쉼터 알려주는 알림 문구창 -->
    <div id="nearestRestArea">
    	<span>00m 앞에 졸음쉼터가 있습니다.</span>
    </div>
   
     

	<!-- 문자발송완료 알림문구창 -->
	<div class="notification-container" id="notification-container">
		<p>이상행동이 감지되어 010-1234-5678님에게 문자 발송을 완료했습니다!</p>
		<p></p>
		
	</div>
	

	<script src="resources/js/restarea.js"></script>
	<script src="resources/js/alarm.js"></script>
	<script src="resources/js/webcam.js"></script>
	<script src="resources/js/socket.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	let width, height;
	let video;
	let streaming = false;
	let stream, interval;
	let username = document.getElementById('username').value;
	let sms_receiver=document.getElementById('sms_receiver').value;

	function setSize() {
		if (window.orientation === 0) {
			width = 800;
			height = 570;
		} else {
			width = 800;
			height = 570;
			/*height = 620;*/
		}

		video = document.getElementById("video");
		video.width = width;
		video.height = height;
	}
	

	function getCurrentDateTime() {
		  var curDate = new Date();

		  var dateTimeString = curDate.getFullYear() + "." + 
		    (curDate.getMonth() + 1).toString().padStart(2, '0') + "." + 
		    curDate.getDate().toString().padStart(2, '0') + " " +
		    curDate.getHours().toString().padStart(2, '0') + ":" + 
		    curDate.getMinutes().toString().padStart(2, '0') + ":" + 
		    curDate.getSeconds().toString().padStart(2, '0');

		  return dateTimeString;
		}
	
		
	    
	function displaySmsHistory(data) {
		  var notificationContainer = document.getElementById("notification-container");
		  var sms_history_show = "<p>이상행동이 감지되어 " + sms_receiver + "님에게 문자 발송을 완료했습니다!</p>";

		  var notificationMessage = document.createElement("div");
		  notificationMessage.classList.add("notification-message");
		  notificationMessage.innerHTML = sms_history_show;

		  notificationContainer.appendChild(notificationMessage);

		  notificationMessage.classList.add("show");

		  setTimeout(() => {
		    notificationMessage.classList.add("hide");
		    setTimeout(() => {
		      notificationContainer.removeChild(notificationMessage); 
		    }, 500); 
		  }, 3000); 
		}
	    
	    function content_area(type) {
	    	  const contentArea = document.querySelector(".content_area");
	    	  const newParagraph = document.createElement("p");
	    	  const existingParagraphs = contentArea.querySelectorAll("p");
	    	  const currentCount = existingParagraphs.length;

	    	  const dateTimeString = getCurrentDateTime();

	    	  if (type == 1) {
	    	    newParagraph.textContent = '졸음운전 ' + dateTimeString;
	    	  } else {
	    	    newParagraph.textContent = '주시태만 ' + dateTimeString;
	    	  }

	    	  contentArea.appendChild(newParagraph); 
	    	}
		
	    </script>
</body>
</html>