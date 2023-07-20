<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<script async src="https://docs.opencv.org/3.4/opencv.js"></script>
</head>
<body onload="setSize()">
	<a>${user_data.id }</a>
	<input type = "hidden" value = "${user_data.id }" id = "username">
	<a href='logout'>logout</a>
		
	<button id="toggleStream" class="start-rec-button" onclick="toggleStream()">Play</button>
	<button id="stopStream" class='end-rec-button' onclick="stopStream()"
		style="visibility: hidden;">Stop</button>
	<br>
	<br>
	<video id="video"></video>
	
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
                console.log("toggleStream()실행됨")
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
                console.log("stopStream()실행됨")
            }
        }
        
        function startSendingFrames() {
            interval = setInterval(sendFrameToPython, 1000);
            streaming = true;
            console.log('센딩프레임시작')
            
        }

        function sendFrameToPython() {
        	  if (!streaming) return;

        	  const canvas = document.createElement('canvas');
        	  const context = canvas.getContext('2d');
        	  canvas.width = width;
        	  canvas.height = height;
        	  context.drawImage(video, 0, 0, width, height);
        	  console.log('check a포인트')

        	  const imageData = context.getImageData(0, 0, width, height);
        	  const dataUrl = canvas.toDataURL('image/jpeg');

        	  const url = 'http://localhost:9000/web/receiveimg';
        	  const options = {
        	    method: 'post',
        	    headers: {
        	      'Content-Type': 'application/json',
        	    },
        	    body : JSON.stringify({ frame: dataUrl }),
        	  };
        	  console.log('check b포인트');
        	  
        	  fetch(url, options)
        	    .then(response => response.json())
        	    .then(data => {
        	      console.log('데이터 넘어감');
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
        function sendendRecRequest(url, successMessage, errorMessage){
        	$.ajax({
        		url: url,
        		type : "post",
        		data : { username: username},
        		success:function(data){
        			console.log("녹화종료 DB전달 성공");
        		},
        		error : function(){
        			console.log("녹화종료 DB전달 실패");
        		}
        	});
        }
    </script>
</body>
</html>