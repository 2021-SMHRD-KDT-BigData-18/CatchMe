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
<body>
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
			<div class="record_area"  style="background-image: url('resources/img/action!.gif'); background-size: cover;"><video id="video" controls style="height: 530px;width : 480px;"></video></div>
			<br>
			
			<!-- <div class="record_area" style=" background-size: cover;"><video id="video"></video></div>-->
			<div class="record_button">
				<div style="position: relative;">
				  <input type="file" accept="video/*" id="videoInput" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; opacity: 0; cursor: pointer;">
				  <img src="resources/img/video.png" id="record_img" style="float: left;">
				</div>
				<a id = "stopSound" onclick="stopNotifySound()" style="visibility: hidden;">알림 종료 / 닫음</a>
				<!-- <button>end</button> -->
				<div class="content_up" style=" font: bold 35px 'SUIT-Regular'; margin-top: 40px; margin-left: 120px;">
                    <span>지금 뭐해 이상행동 감지되었잖아!</span>
                </div>
			</div>
			<div class="content_area" style="overflow:auto;">
				<p></p>
				
			</div>
		</div>

	</div>
	
	<!-- 운행시작 전 알림문구창 -->
	<!-- <div class="start_before">
		<p>운행을 시작합니다 안전운전하세요:)</p>
		<p>월요일은 졸음 횟수가 높기 때문에 주의하시기 바랍니다!</p>
	</div>
	 -->
		
	<!-- 졸음감지시 졸음쉼터 알려주는 알림 문구창 -->
    <!-- <div id="nearestRestArea" style="visibility: hidden;">-->
    <div id="nearestRestArea" style="font-size: 30px; width:600px; display: block; visibility: hidden; text-align: center; line-height: 70px; overflow:hidden; padding-top: 80px; padding-left: 60px; padding-right: 60px; padding-bottom:48px;  position: absolute; left: calc(50% - 360px); margin-top:-622px;">
    <!-- <div id="nearestRestArea" style="font-size: 30px; width: 1804px; height:633px; margin-left:-902px; margin-top:-209px;display: block; text-align: center; border-radius: 0 0 35px 35px;">-->
    	<span id = "restarea_info1"></span><br>
    	<span id = "restarea_info2"></span><br>
    	<span id = "restarea_info3" style="margin-top: 20px;"></span><br>
    	<span id = "restarea_info4"></span><br>
    	<button id = "stopSound" onclick="stopNotifySound()" class="alarm_btn" style="width: 300px; height: 70px; background-color: #212A3E; font-size: 20px; font-weight: bold; border: 0; border-radius: 20px; margin-top:65px; color:white" >알림 종료</button>

    </div>
   
    

	<!-- 문자발송완료 알림문구창 -->
	<div class="notification-container" id="notification-container">
		<p></p>
	</div>
	

	<script src="resources/js/restarea.js"></script>
	<script src="resources/js/alarm.js"></script>
	<script src="resources/js/socket.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	let width, height;
	let video;
	let streaming = false;
	let stream, interval;
	let username = document.getElementById('username').value;
	let sms_receiver=document.getElementById('sms_receiver').value;
	

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
	    
	    
	    document.getElementById("homeButton").addEventListener("click", function() {
	        stopStream();
	    });
	    
	    let videoElement;

	    function handleVideoUpload(event) {
	    	  const file = event.target.files[0];
	    	  if (!file) return;

	    	  const videoURL = URL.createObjectURL(file);

	    	  videoElement = document.getElementById('video');
	    	  videoElement.src = videoURL;
	    	}

	    	document.getElementById('videoInput').addEventListener('change', handleVideoUpload);

		
		function startSendingFrames2() {
			  const videoInput = document.getElementById('videoInput');
			  const file = videoInput.files[0];

			  const videoUrl = URL.createObjectURL(file);
			  videoElement = document.getElementById('video');
			  videoElement.src = videoUrl;

			  videoElement.play();
			  
			  interval = setInterval(async () => {
			    await Promise.all([sendFrameToPython2(), sendFrameToRobo2()]);
			  }, 1000);

			  console.log('프레임 보내기 시작');
			}
	    
	    let isSendSmsAllowed = true;

	    function successCallback(mediaStream) {
	        video.srcObject = mediaStream;
	        video.play();
	        startSendingFrames();
	      }

	    function errorCallback(error) {
	    	alert("웹캠 연결 실패");
	    	console.error("웹캠 연결 실패", error);
	    }

	    // 녹화시작 함수
	    function toggleStream2() {
	    	if (!video.paused && !video.ended) {
	    		// Start streaming
	    		sendstartRecRequest("startRec", "startRec 컨트롤러 실행 성공", "startRec 컨트롤러 실행 실패");
	    		navigator.mediaDevices.getUserMedia({ video: true, audio: true })
	    			.then(successCallback)
	    			.catch(errorCallback);

	    		document.getElementById("record_img").src = "resources/img/stop-button.png";
	    		streaming = true;
	    		console.log("toggleStream() 실행됨");
	    	} else {
	    		stopStream();
	    	}
	    }

	    // 녹화종료 함수
	    function stopStream() {
		    if (!video.paused && !video.ended) {
		      sendendRecRequest("endRec", "endRec 컨트롤러 실행 성공", "endRec 컨트롤러 실행 실패");
		      video.srcObject.getTracks().forEach(track => track.stop());
		      video.srcObject = null;
		      clearInterval(interval);
		
		      streaming = false;
		      imageElement.src = "resources/img/video.png";
		      stopNotifySound();
		
		      console.log("stopStream() 실행됨");
		    }
		  }

	    // 플라스크로 프레임보내기
	    function sendFrameToPython2() {
	    	if (videoElement && !videoElement.paused && !videoElement.ended) {

	    	const canvas = document.createElement('canvas');
	    	const context = canvas.getContext('2d');
	    	canvas.width = width;
	    	canvas.height = height;
	    	context.drawImage(video, 0, 0, width, height);
	    	console.log('졸음 a포인트');

	    	const imageData = context.getImageData(0, 0, width, height);
	    	const dataUrl = canvas.toDataURL('image/jpeg');

	    	const url = 'http://121.179.7.41:9000/web/receiveimg';
	    	const options = {
	    		method: 'post',
	    		headers: {
	    			'Content-Type': 'application/json',
	    			'API-Key': 'secret',
	    			'Access-Control-Allow-Origin': '*'
	    		},
	    		body: JSON.stringify({ frame: dataUrl }),
	    	};
	    	console.log('졸음 b포인트');

	    	fetch(url, options)
	    		.then(response => response.json())
	    		.then(data => {
	    			if (data.img_path == null) {
	    				console.log('졸음이미지경로없음', data.message);
	    			} else {
	    				console.log('졸음데이터넘어옴', data.img_path);
	    				var img_path = data.img_path;
	    				console.log('졸음 img_path', img_path)
	    				findNearestRestArea();
	    				callNotifyController(img_path);
	    				content_area(1);
	    				playNotifySound();
	    				
	    				if (isSendSmsAllowed) {
	    				isSendSmsAllowed = false;
	    				sendSms()
	    				.then(() => {
	    				setTimeout(() => {isSendSmsAllowed = true;}, 30000);
	    				})
	    				.catch(error => {
	    				console.error('sendSms 실행 중 에러:', error);
	    				isSendSmsAllowed = true;
	    				});
	    				}
	    				smsRecord();
	    			}
	    		})
	    		.catch(error => {
	    			console.error('졸음데이터안넘어감:', error);
	    		});
	    }
	    }

	    // robo플라스크로 프레임보내기
	    function sendFrameToRobo2() {
	    	if (videoElement && !videoElement.paused && !videoElement.ended) {

	    	const canvas = document.createElement('canvas');
	    	const context = canvas.getContext('2d');
	    	canvas.width = width;
	    	canvas.height = height;
	    	context.drawImage(video, 0, 0, width, height);
	    	console.log('robo a포인트');

	    	const imageData = context.getImageData(0, 0, width, height);
	    	const dataUrl = canvas.toDataURL('image/jpeg');

	    	const url = 'http://121.179.7.41:9000/web/robo';
	    	const options = {
	    		method: 'post',
	    		headers: {
	    			'Content-Type': 'application/json',
	    			'API-Key': 'secret',
	    			'Access-Control-Allow-Origin': '*'
	    		},
	    		body: JSON.stringify({ frame: dataUrl }),
	    	};
	    	console.log('robo b포인트');

	    	fetch(url, options)
	    		.then(response => response.json())
	    		.then(data => {
	    			if (data.img_path == null) {
	    				console.log("주시태만 이미지없음",data.message);
	    			} else {			
	    				var img_path = data.img_path;
	    				console.log('주시태만 img_path', img_path)
	    				noLookController(img_path);
	    				content_area(2);
	    				}
	    		})
	    		.catch(error => {
	    			console.error('데이터안넘어감:', error);
	    		});
	    }
	    }


	    //녹화시작 기록
	    function sendstartRecRequest(url, successMessage, errorMessage) {
	    	$.ajax({
	    		url: url,
	    		type: "post",
	    		data: { username: username },
	    		success: function(data) {
	    			console.log("녹화시작 DB전달 성공");
	    		},
	    		error: function() {
	    			console.log("녹화시작 DB전달 실패");
	    		}
	    	});
	    }

	    //녹화종료 기록
	    function sendendRecRequest(url, successMessage, errorMessage) {
	    	$.ajax({
	    		url: url,
	    		type: "post",
	    		data: { username: username },
	    		success: function(data) {
	    			console.log("녹화종료 DB전달 성공");
	    		},
	    		error: function() {
	    			console.log("녹화종료 DB전달 실패");
	    		}
	    	});
	    }
	    let isRecording = false; 
	    const imageElement = document.getElementById('record_img');
	    imageElement.addEventListener('click', function() {
	        const fileInput = document.getElementById('videoInput');
	        fileInput.click(); // 파일 선택(input) 요소를 클릭합니다.

	        // 녹화 상태에 따라 이미지 변경 및 녹화 중지 실행
	        if (!isRecording) {
	          sendstartRecRequest("startRec", "startRec 컨트롤러 실행 성공", "startRec 컨트롤러 실행 실패");
	          imageElement.src = "resources/img/stop-button.png";
	          isRecording = true;
	        } else {
	          stopStream();
	          isRecording = false;
	        }
	      });

	    document.getElementById('videoInput').addEventListener('change', startSendingFrames2);
	    </script>
</body>
</html>