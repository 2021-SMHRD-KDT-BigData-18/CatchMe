function uploadFile() {
	const fileInput = document.getElementById('fileInput');
	const file = fileInput.files[0];

	if (!file) {
		alert('파일을 선택해주세요.');
		return;
	}

	const formData = new FormData();
	formData.append('id', username);
	formData.append('file', file);

	fetch('http://localhost:3000/upload', {
		method: 'POST',
		body: formData
	})
		.then(response => response.json())
		.then(data => {
			console.log('app.js로 넘어감');
			console.log('서버에서 받은 응답 데이터:', data);
		})
		.catch(error => console.error('업로드 에러:', error));
}