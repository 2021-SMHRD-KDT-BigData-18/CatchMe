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
		// Start streaming
		sendstartRecRequest("startRec", "startRec 컨트롤러 실행 성공", "startRec 컨트롤러 실행 실패");
		navigator.mediaDevices.getUserMedia({ video: true, audio: true })
			.then(successCallback)
			.catch(errorCallback);

		document.getElementById("record_img").href = "resources/img/video.png";
		streaming = true;
		console.log("toggleStream() 실행됨");
	} else {
		stopStream();
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
		document.getElementById("record_img").href = "resources/img/video.png";
		stopNotifySound();

		console.log("stopStream() 실행됨");
	}
}
// 프레임 보내기 시작 함수
function startSendingFrames() {
	interval = setInterval(async () => { await Promise.all([sendFrameToPython(),sendFrameToRobo()]); }, 1000);
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
				//sendSms();
				smsRecord();
			}
		})
		.catch(error => {
			console.error('졸음데이터안넘어감:', error);
		});
}

// robo플라스크로 프레임보내기
function sendFrameToRobo() {
	if (!streaming) return;

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

