<%@page import="kr.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>

<!DOCTYPE html>
<html>
<head>
<script async src="https://docs.opencv.org/3.4/opencv.js"></script>
<style>
  #notifySound {
    display: none;
  }
</style>
</head>
<body onload="setSize()">
	<% User user_data = (User) session.getAttribute("user_data");
		String alarm_full_path = user_data.getAlarm();
		String alarm_select_path = alarm_full_path.substring(alarm_full_path.lastIndexOf("\\") + 1);
		String music_url = "http://121.179.7.41:3000/music/"+alarm_select_path;
	%>
	<a>${user_data.id}</a>
	<a><%=alarm_select_path %></a>
	<input type = "hidden" value = "${user_data.id }" id = "username">
	<input type = "hidden" value = "${user_data.alarm }" id = "alarm_info">
	<a href='record'>녹화페이지</a>
	<a href='location'>문자보내기test</a>
	<br>
	<h3 id="nearestRestArea"></h3>
	<br>
	<button id="toggleStream" class="start-rec-button" onclick="toggleStream()">Play</button>
	<!-- 	<button id="stopStream" class='end-rec-button' onclick="stopStream()"
		style="visibility: hidden;">Stop</button> -->
	<br>
	<br>
	
	<input type="file" accept="video/*" id="videoInput">
    <video id="video" controls></video>
    <button onclick="startSendingFrames()">프레임 보내기 시작</button>
	<br>
	<br>
	<audio id = "notifySound" controls>
	  <source src="<%=music_url %>" type="audio/mpeg"> <!-- 확인 ~-->
	</audio>
	<button id = "stopSound" onclick="stopNotifySound()" style="visibility: hidden;">음악 종료</button>
	<br>	
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="resources/js/alarm.js"></script>
	<script src="resources/js/socket.js"></script>
	<script>
	let width, height;
	let video;
	let streaming = false;
	let stream, interval;
	let username = document.getElementById('username').value;
	function setSize() {
		if (window.orientation === 0) {
			width = 480;
			height = 640;
		} else {
			width = 640;
			height = 480;
		}

		video = document.getElementById("video");
		video.width = width;
		video.height = height;
	}
	
	let videoElement;

	function handleVideoUpload(event) {
	  const file = event.target.files[0];
	  if (!file) return;

	  // Create a URL for the uploaded video file
	  const videoURL = URL.createObjectURL(file);

	  // Get the video element and set its source to the uploaded video
	  videoElement = document.getElementById('video');
	  videoElement.src = videoURL;
	}

	document.getElementById('videoInput').addEventListener('change', handleVideoUpload);

	// Function to start sending frames from the uploaded video
	function startSendingFrames() {
	  // 'videoInput' 엘리먼트에서 동영상 파일을 가져옴
	  const videoInput = document.getElementById('videoInput');
	  const file = videoInput.files[0];

	  // 'videoElement'에 동영상을 재생할 수 있는 소스를 추가
	  const videoUrl = URL.createObjectURL(file);
	  videoElement = document.getElementById('video');
	  videoElement.src = videoUrl;

	  videoElement.play();
	  
	  interval = setInterval(async () => {
		    await Promise.all([sendFrameToPython(), sendFrameToRobo()]);
		  }, 1000);

	  console.log('프레임 보내기 시작');
	}
	
	// 플라스크로 프레임보내기
	function sendFrameToPython() {
		if (!video.paused && !video.ended) {
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
		          smsInterval = setInterval(sendSms, 30000);
		          smsRecord();
		        }
		      })
		      .catch(error => {
		        console.error('졸음데이터안넘어감:', error);
		      });
		  }
		}
	// robo플라스크로 프레임보내기
	function sendFrameToRobo() {
		if (!video.paused && !video.ended) {

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


	



    </script>
</body>
</html>