//문자보내기 함수
function sendSms() {
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
//문자내역 기록 함수
function smsRecord() {
	$.ajax({
		url: "smsRecord",
		type: "post",
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
function callNotifyController(img_path) {
	$.ajax({
		url: "notify_sleep",
		type: "post",
		data: { "img_path": img_path, "username": username },
		success: function(data) {
			console.log("notify호출 성공")
		},
		error: function() {
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

// 화면 클릭하면 음악종료
document.addEventListener("click", function(event) {
	const audioElement = document.getElementById('notifySound');
	if (!audioElement.paused) {
		stopNotifySound();
	}
});