<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
 <script async src="https://docs.opencv.org/3.4/opencv.js"></script>
</head>

<body onload="setSize()">
    <button id="toggleStream" onclick="toggleStream()">Play</button>
    <button id="stopStream" onclick="stopStream()" style="visibility: hidden;">Stop</button>
    <br>
    <br>
    <video id="video"></video>

    <script>
        let width, height;
        let video;
        let streaming = false;
        let stream, interval;

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
                navigator.mediaDevices.getUserMedia({ video: true, audio: true })
                    .then(successCallback)
                    .catch(errorCallback);

                document.getElementById("toggleStream").style.visibility = "hidden";
                document.getElementById("stopStream").style.visibility = "visible";
                console.log("toggleStream()function됨")
            }
        }

        function stopStream() {
            if (streaming) {
                video.srcObject.getTracks().forEach(track => track.stop());
                video.srcObject = null;
                clearInterval(interval);

                streaming = false;
                document.getElementById("toggleStream").style.visibility = "visible";
                document.getElementById("stopStream").style.visibility = "hidden";
                console.log("stopStream()function됨")
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
        	  console.log('a포인트')

        	  const imageData = context.getImageData(0, 0, width, height);
        	  const dataUrl = canvas.toDataURL('image/jpeg');

        	  const url = 'http://localhost:9000/web/receiveimg';
        	  const options = {
        	    method: 'POST',
        	    headers: {
        	      'Content-Type': 'application/json',
        	    },
        	    body: JSON.stringify({ frame: dataUrl }),
        	  };
        	  console.log('b포인트');
        	  
        	  fetch(url, options)
        	    .then(response => response.json())
        	    .then(data => {
        	      console.log('데이터 넘어감');
        	    })
        	    .catch(error => {
        	      console.error('데이터안넘어감:', error);
        	    });
        	}
    </script>
</body>
</html>