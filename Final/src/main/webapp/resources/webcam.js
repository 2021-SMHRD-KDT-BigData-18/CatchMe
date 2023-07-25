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

// 녹화시작 함수
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

// 녹화종료 함수
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
// 프레임 보내기 시작 함수
function startSendingFrames() {
	interval = setInterval(sendFrameToPython, 1000);
	streaming = true;
	console.log('센딩프레임시작');
}

// 플라스크로 프레임보내기
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