<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼터거리계산하여알려주기</title>
</head>
<body>
	<a>${user_data.id }</a>
	<input type = "hidden" value = "${user_data.id }" id = "username">
	<button onclick="findNearestRestArea()">가까운 휴게소 보기</button>
	<h3 id="nearestRestArea"></h3>
	<br>
	<button onclick="sendSms()">문자보내기</button>	
	
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	let username = document.getElementById('username').value;
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