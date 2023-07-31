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
				smsInterval = setInterval(sendSms, 30000);
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