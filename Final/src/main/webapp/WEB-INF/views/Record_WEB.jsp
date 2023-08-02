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
	<style type="text/css">
	.record_area { /*녹화 화면*/
	height: 530px;
	width: 707px;
	/* height: 480px;
            width: 640px; */
	float: left;
	margin: 40px auto;
	margin-right: 0;
	background-color: rgba(255, 255, 255, 0.979);
	box-shadow: 0 0 10px rgba(129, 127, 127, 0.548);
	position: relative;
}
	</style>
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
	        	<button class="dropbtn" id="homeButton">
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
	            <div class="dropdown-content" style="width: auto; height: auto;">
	            	<a href='photo'>라이브러리</a>
	                <a href='logout'>로그아웃</a>
	                <a href='#'>회원탈퇴</a>
	            </div>
	        </div>    
	    </div>
	    <br><hr>

		<div id="main_area">
			<div class="record_area"  style="background-image: url('resources/img/action!.gif'); background-size: cover;"><video id="video" style="height: 530px;"></video></div>
			<!-- <div class="record_area" style=" background-size: cover;"><video id="video"></video></div>-->
			<div class="record_button">
				<a id="toggleStream" class="start-rec-button"
				onclick="toggleStream()"><img src="resources/img/video.png" id="record_img" style="float: left;"></a>
				<a id = "stopSound" onclick="stopNotifySound()" style="visibility: hidden;">알림 종료 / 닫음</a>
				<!-- <button>end</button> -->
				<div class="content_up" style=" font: bold 34px 'SUIT-Regular'; margin-top: 40px; margin-left: 120px;">
                    <span>지금 뭐해 이상행동 감지되었잖아!</span>
                </div>
			</div>
			<div class="content_area" style="background-image: url('resources/img/action!_content.gif'); background-size: cover; overflow:auto;">
				<p></p>
				
			</div>
		</div>
	</div>
	
	<!-- 녹화 재생 버튼 시 알림문구창 -->
	<div class="start_before" style="visibility: hidden;" id="startMessage">
		<span>녹화를 시작합니다. 안전운전하세요:D</span>
	</div>
	 
	<!-- 녹화 종료 버튼 시 알림문구창 -->
	<div class="end_before" style="visibility: hidden;" id="endMessage">
		<span>녹화를 종료합니다!</span>
	</div>
		
	<!-- 졸음감지시 졸음쉼터 알려주는 알림 문구창 -->
    <!-- <div id="nearestRestArea" style="visibility: hidden;">-->
    <div id="nearestRestArea" style="font-size: 30px; width:600px; display: block; visibility: hidden; text-align: center; line-height: 70px; overflow:hidden; padding-top: 80px; padding-left: 60px; padding-right: 60px; padding-bottom:40px;  position: absolute; left: calc(50% - 360px); margin-top:-622px;">
    <!-- <div id="nearestRestArea" style="font-size: 30px; width: 1804px; height:633px; margin-left:-902px; margin-top:-209px;display: block; text-align: center; border-radius: 0 0 35px 35px;">-->
    	<span id = "restarea_info1"></span><br>
    	<span id = "restarea_info2"></span><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    	<span id = "restarea_info3"></span><br>
    	<span id = "restarea_info4"></span><br>
    	<button id = "stopSound" onclick="stopNotifySound()" class="alarm_btn" style="width: 300px; height: 70px; background-color: #212A3E; font-size: 20px; font-weight: bold; border: 0; border-radius: 20px; margin-top:65px; color:white" >알림 종료</button>

    </div>
    

	<!-- 문자발송완료 알림문구창 -->
	<div class="notification-container" id="notification-container" style="visibility: hidden;">
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
			height = 530;
		} else {
			width = 800;
			height = 530;
			/*height = 620;*/
			/*height: 530px;
			width: 800px;*/
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
	
		
	    
	function displaySmsHistory() {
		  var notificationContainer = document.getElementById("notification-container");
		  var sms_history_show = "<p>이상행동이 감지되어 " + sms_receiver + "님에게 문자 발송을 완료했습니다!</p>";
		  notificationContainer.style.visibility = "visible";
			
		  var notificationMessage = document.createElement("div");
		  notificationMessage.classList.add("notification-message");
		  notificationMessage.innerHTML = sms_history_show;

		  notificationContainer.appendChild(notificationMessage);

		  // 추가된 부분: div를 화면 하단으로 내리기 위해 translate 사용
		  notificationContainer.style.transform = "translateY(90px)";

		  setTimeout(() => {
		    // 추가된 부분: 애니메이션 클래스 제거
		    notificationContainer.style.transform = "translateY(0)";
		    setTimeout(() => {
		      notificationContainer.removeChild(notificationMessage);
			  notificationContainer.style.visibility = "hidden";
		    }, 500);
		  }, 5000);
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
	    
	    
	    document.getElementById("homeButton").addEventListener("click", function() {
	        stopStream();
	    });
	    
		function displayStartHistory() {
			  var startMessage = document.getElementById("startMessage");
			  startMessage.style.visibility = "visible";
				
			  startMessage.style.transform = "translateY(100px)";

			  setTimeout(() => {
			    startMessage.style.transform = "translateY(0)";
			    setTimeout(() => {
			    	startMessage.style.visibility = "hidden";
			    }, 500);
			  }, 3000);
			}
		
		function displayEndHistory() {
			  var endMessage = document.getElementById("endMessage");
			  endMessage.style.visibility = "visible";
				
			  endMessage.style.transform = "translateY(100px)";

			  setTimeout(() => {
				  endMessage.style.transform = "translateY(0)";
			    setTimeout(() => {
			    	endMessage.style.visibility = "hidden";
			    }, 500);
			  }, 3000);
			}
	    </script>
</body>
</html>