<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쉼터거리계산하여알려주기</title>
</head>
<body>
	<button onclick="findNearestRestArea()">가까운 휴게소 보기</button>
	<h3 id="nearestRestArea"></h3>

	<script>
		function showError(error) {
			console.log("위치모르겠음" + error.message);
		}

		function findNearestRestArea() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					const lat = position.coords.latitude;
					const lng = position.coords.longitude;
					console.log("위도: " + lat);
					console.log("경도: " + lng);

					const xhr = new XMLHttpRequest();
					const url = "/web/distance?lat=" + lat
							+ "&lng=" + lng;
					xhr.open("GET", url, true);
					console.log(url)
					xhr.onreadystatechange = function() {
						if (xhr.readyState === 4 && xhr.status === 200) {
							console.log(xhr.readyState);
							console.log(xhr.status);
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
				console.log("왜 안되냐고");
			}
		}
	</script>
</body>
</html>