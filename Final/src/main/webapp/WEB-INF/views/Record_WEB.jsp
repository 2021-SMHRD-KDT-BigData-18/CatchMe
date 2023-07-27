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
	<link rel="stylesheet" type="text/css" href="resources/css/recordcss.css"/>
	<link rel="stylesheet" type="text/css" href="resources/css/navicover.css"/>
</head>
<body onload="setSize()">
	<audio id="notifySound" controls style="visibility: hidden;">
		<%
		User user_data = (User) session.getAttribute("user_data");
		String alarm_full_path = user_data.getAlarm();
		String alarm_select_path = alarm_full_path.substring(alarm_full_path.lastIndexOf("\\") + 1);
		String music_url = "http://localhost:3000/music/" + alarm_select_path;
		%>
		<source src="<%=music_url%>" type="audio/mpeg">
	</audio>
	<input type = "hidden" value = "${user_data.id }" id = "username">
	<input type = "hidden" value = "${user_data.sms_receiver }" id = "sms_receiver">


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
	       	<div class="dropdown" style="float: right;">
	        	<button class="dropbtn"><img class="myicon" src="resources/img/user.svg"></button>
	            <div class="dropdown-content">
	            	<a href='#'>문자 발송 내역</a>
	                <a href='logout'>로그아웃</a>
	                <a href='#'>회원탈퇴</a>
	            </div>
	        </div>    
	    </div>
	    <br><br><br><br><br><br><br><hr>

		<div id="main_area">
			<div class="record_area" width=><video id="video"></video></div>
			<div class="record_button">
				<a id="toggleStream" class="start-rec-button"
				onclick="toggleStream()"><img src="resources/img/video.png" id="record_img"></a>
				<!-- <button>end</button> -->
			</div>
			<div class="content_area">
				<p></p>
			</div>
		</div>


		<!-- 문자발송완료 알림문구창 -->
	    <div class="notification-container" id="notification-container">
	        <p></p>
	    </div>
	    <h3 id="nearestRestArea"></h3>
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
			height = 620;
		} else {
			width = 800;
			height = 620;
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
	
	const notification = document.getElementById('notification-container')
	
	const showNotification = () => {
		notification.classList.add('show');
		setTimeout(() => {
			notification.classList.remove('show');
			}, 3000);
		
		const record_end_show_remove = document.getElementById('toggleStream');
		record_end_show_remove.addEventListener('click', () => {
			notification.classList.remove('show');
			});
		};
	
	    //keydown letter press
	    window.addEventListener('keydown', (e) => {
		    // only want alphabet keys to get into the eventlistener
		    if (e.keyCode >= 65 && e.keyCode <= 90) {
		        const letter = e.key
		        //we want only letters that are not already pressed
		        if (selectedWord.includes(letter)) {
		            if (!correctLetters.includes(letter)) {
		                correctLetters.push(letter)
		                displayWord()
		            } else {
		            //if same correct key pressed
		            showNotification()
		            }
		            
		        }
		        else {
		        	if (!wrongLetters.includes(letter)) {
		            	wrongLetters.push(letter)
		                updateWrongLettersEl()
		            } else {
		                //if same wrong key pressed
		                showNotification()
		            }
		        }
		    }
	    })
	    
	    function displaySmsHistory(data) {
	    	var notificationContainer = document.getElementById("notification-container");
	    	var sms_history_show = "<p>이상행동이 감지되어 " + sms_receiver + "님에게 문자 발송을 완료했습니다!</p>";
	    	notificationContainer.innerHTML = sms_history_show;
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