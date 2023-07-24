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
		String music_url = "http://localhost:3000/music/"+alarm_select_path;
	%>
	<a>${user_data.id}</a>
	<a><%=alarm_select_path %></a>
	<input type = "hidden" value = "${user_data.id }" id = "username">
	<input type = "hidden" value = "${user_data.alarm }" id = "alarm_info">
	<a href='logout'>logout</a>
	<a href='location'>문자보내기test</a>
	<br>
	<h3 id="nearestRestArea"></h3>
	<br>
	<button id="toggleStream" class="start-rec-button" onclick="toggleStream()">Play</button>
	<button id="stopStream" class='end-rec-button' onclick="stopStream()"
		style="visibility: hidden;">Stop</button>
	<br>
	<br>
	<video id="video"></video>
	<br>
	<br>
	<audio id = "notifySound" controls>
	  <source src="<%=music_url %>" type="audio/mpeg">
		군대기상나팔
	</audio>
	<button id = "stopSound" onclick="stopNotifySound()" style="visibility: hidden;">음악 종료</button>

	
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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

	function successCallback(mediaStream) {
	  video.srcObject = mediaStream;
	  video.play();
	  startSendingFrames();
	}

	function errorCallback(error) {
	  console.error("웹캠 연결 실패", error);
	}

	function toggleStream() {
	  if (!streaming) {
	    sendstartRecRequest("startRec", "startRec 컨트롤러 실행 성공", "startRec 컨트롤러 실행 실패");
	    navigator.mediaDevices.getUserMedia({ video: true, audio: true })
	      .then(successCallback)
	      .catch(errorCallback);

	    document.getElementById("toggleStream").style.visibility = "hidden";
	    document.getElementById("stopStream").style.visibility = "visible";
	    console.log("toggleStream() 실행됨");
	  }
	}

	function stopStream() {
	  if (streaming) {
	    sendendRecRequest("endRec", "endRec 컨트롤러 실행 성공", "endRec 컨트롤러 실행 실패");
	    video.srcObject.getTracks().forEach(track => track.stop());
	    video.srcObject = null;
	    clearInterval(interval);

	    streaming = false;
	    document.getElementById("toggleStream").style.visibility = "visible";
	    document.getElementById("stopStream").style.visibility = "hidden";
	    
	    stopNotifySound();
	    
	    console.log("stopStream() 실행됨");
	  }
	}

	function startSendingFrames() {
	  interval = setInterval(sendFrameToPython, 1000);
	  streaming = true;
	  console.log('센딩프레임시작');
	}

	function sendFrameToPython() {
	  if (!streaming) return;

	  const canvas = document.createElement('canvas');
	  const context = canvas.getContext('2d');
	  canvas.width = width;
	  canvas.height = height;
	  context.drawImage(video, 0, 0, width, height);
	  console.log('check a포인트');

	  const imageData = context.getImageData(0, 0, width, height);
	  const dataUrl = canvas.toDataURL('image/jpeg');

	  const url = 'http://localhost:9000/web/receiveimg';
	  const options = {
	    method: 'post',
	    headers: {
	      'Content-Type': 'application/json',
	      'API-Key': 'secret',
	      'Access-Control-Allow-Origin': '*'
	    },
	    body: JSON.stringify({ frame: dataUrl }),
	  };
	  console.log('check b포인트');

	  fetch(url, options)
	    .then(response => response.json())
	    .then(data => {
	      if (data.img_path == null) {
	        console.log('데이터넘어감2', data.message);
	      } else {
	        console.log('데이터넘어감2', data.img_path);
	        var img_path = data.img_path;
	        console.log('img_path', img_path)
	        findNearestRestArea();
	        callNotifyController(img_path);
	        playNotifySound();
	        //sendSms();
	        smsRecord();
	      }
	    })
	    .catch(error => {
	      console.error('데이터안넘어감:', error);
	    });
	}

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

	function showError(error) {
	  console.log("위치모르겠음" + error.message);
	}

	function findNearestRestArea() {
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	      const lat = position.coords.latitude;
	      const lng = position.coords.longitude;

	      const xhr = new XMLHttpRequest();
	      const url = "/web/distance?lat=" + lat + "&lng=" + lng;
	      xhr.open("GET", url, true);
	      xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	          const response = JSON.parse(xhr.responseText);
	          const firstRestArea =
	            "가까운 쉼터 :  " + response[0].ra_name + "쉼터입니다. 거리 : " + (response[0].distance / 1000).toFixed(1) + "km입니다.";
	          const secondRestArea =
	            "가까운 쉼터 :  " + response[1].ra_name + "쉼터입니다. 거리 : " + (response[1].distance / 1000).toFixed(1) + "km입니다.";
	          const nearestRestAreaElement = document.getElementById("nearestRestArea");
	          nearestRestAreaElement.textContent = firstRestArea + "  " + secondRestArea;
	          setTimeout(function() {
	        	    nearestRestAreaElement.textContent = "";}, 30000);
	        }
	      };
	      xhr.send();
	    }, showError);
	  } else {
	    console.log("쉼터알림실패");
	  }
	}
	//문자보내기 함수
	function sendSms(){
		$.ajax({
		    url: "smscontroller",
		    type: "get",
		    data: { username: username },
		    success: function(data) {
		      console.log("sendSms 아이디 넘김");
		    },
		    error: function() {
		      console.log("sendSms 아이디 못넘김");
		    }
		  });
		}
	function smsRecord(){
		$.ajax({
			url : "smsRecord",
			type:"post",
			data: { username: username },
		    success: function(data) {
		      console.log("smsRecord 아이디 넘김");
		    },
		    error: function() {
		      console.log("smsRecord 아이디 못넘김");
		    }
		  });
		}
	// notify호출 함수
	function callNotifyController(img_path){
		$.ajax({
			url : "notify_sleep",
			type : "post",
			data : { "img_path" : img_path,"username":username },
			success : function(data){
				console.log("notify호출 성공")
			},
			error : function(){
				console.log("notify호출 실패")
			}
		})
	}
	// 음악재생 함수
	function playNotifySound() {
		const audioElement = document.getElementById('notifySound');
		audioElement.play();
		document.getElementById("stopSound").style.visibility = "visible";
		}
	// 음악종료 함수
	function stopNotifySound() {
		const audioElement = document.getElementById('notifySound');
		audioElement.pause();
		document.getElementById("stopSound").style.visibility = "hidden";
		}
	  
	// 소켓연결
	const serverAddress = 'ws://localhost:3000';
    let socket = null;
    let isConnected = false;

    function connectWebSocket() {
      socket = new WebSocket(serverAddress);

      socket.onopen = () => {
        console.log('WebSocket 연결 성공');
        isConnected = true;
      };

      socket.onmessage = (event) => {
        console.log('WebSocket 메시지 수신:', event.data);
      };

      socket.onclose = () => {
        console.log('WebSocket 연결이 끊어짐');
        isConnected = false;
      };
    }

    function checkWebSocketConnection() {
      if (!isConnected) {
        console.log('WebSocket 연결이 끊어져 다시 연결 시도 중...');
        connectWebSocket();
      }
    }

    connectWebSocket();
    setInterval(checkWebSocketConnection, 5000);
    </script>
</body>
</html>