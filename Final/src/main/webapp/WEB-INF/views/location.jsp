<%@page import="kr.smhrd.entity.User"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼터거리계산하여알려주기</title>
</head>
<body>
<% User user_data = (User) session.getAttribute("user_data");
	String alarm_full_path = user_data.getAlarm();
	String alarm_select_path = alarm_full_path.substring(alarm_full_path.lastIndexOf("\\") + 1);
	String music_url = "http://localhost:3000/music/" + alarm_select_path;
%>
	<a>${user_data.id }</a>
	<br>
	<a>${user_data.alarm }</a>
	<br>
	<a><%=music_url %></a>
	<br>
	<a href='logout'>logout</a>
	<input type="hidden" value="${user_data.id }" id="username">
	<input type="hidden" value="${user_data.alarm }" id="alarm">
	<button onclick="findNearestRestArea()">가까운 휴게소 보기</button>
	<h3 id="nearestRestArea"></h3>
	<br>
	<button onclick="sendSms()">문자보내기</button>
	<br>
	<input type="file" id="fileInput">
  	<button onclick="uploadFile()">Upload</button>
  	<br>
  	<audio controls>
	  <source src="<%=music_url %>" type="audio/mpeg">
		군대기상나팔
	</audio>
	  	

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		let username = document.getElementById('username').value;
		
	
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
		// 문자발송
		function sendSms(){
			$.ajax({
			    url: "smscontroller",
			    type: "get",
			    data: { username: username },
			    success: function(data) {
			      console.log("아이디 넘김");
			    },
			    error: function() {
			      console.log("아이디못넘김");
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
					const url = "/web/distance?lat=" + lat
							+ "&lng=" + lng;
					xhr.open("GET", url, true);
					xhr.onreadystatechange = function() {
						if (xhr.readyState === 4 && xhr.status === 200) {
							const response = JSON.parse(xhr.responseText);
							const firstRestArea =
								"가까운 쉼터 :  " + response[0].ra_name + "쉼터입니다. 거리 : " + (response[0].distance / 1000).toFixed(1) + "km입니다.";
							const secondRestArea = 
								"가까운 쉼터 :  " + response[1].ra_name + "쉼터입니다. 거리 : " + (response[1].distance / 1000).toFixed(1)+"km입니다.";
					        const nearestRestAreaElement = document.getElementById("nearestRestArea");
					        nearestRestAreaElement.textContent = firstRestArea + "  " + secondRestArea
						}
					};
					xhr.send();
				}, showError);
			} else {
				console.log("쉼터알림실패");
			}
		}
	</script>
</body>
</html>