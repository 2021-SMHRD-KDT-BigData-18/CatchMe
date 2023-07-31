	// 위치 에러 함수
	function showError(error) {
	  console.log("위치모르겠음" + error.message);
	}
	
	//위치기반 졸음쉼터 찾는 함수
	function findNearestRestArea() {
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	      const lat = position.coords.latitude;
	      const lng = position.coords.longitude;
	      const nearestRestAreaElement = document.getElementById("nearestRestArea");
	      const restarea_infoElement = document.getElementById("restarea_info");
	      nearestRestAreaElement.style.visibility = "visible"; 
	      
	      const xhr = new XMLHttpRequest();
	      const url = "/web/distance?lat=" + lat + "&lng=" + lng;
	      xhr.open("GET", url, true);
	      xhr.onreadystatechange = function() {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	          const response = JSON.parse(xhr.responseText);
	          const firstRestArea =
	            "가까운 쉼터 :  " + response[0].ra_name + "쉼터입니다. 거리 : " + (response[0].distance / 1000).toFixed(1) + "km입니다.&emsp;";
	          const secondRestArea =
	            "가까운 쉼터 :  " + response[1].ra_name + "쉼터입니다. 거리 : " + (response[1].distance / 1000).toFixed(1) + "km입니다.";

	          restarea_infoElement.textContent = firstRestArea + "  " + secondRestArea;
	          setTimeout(function() {
	        	    nearestRestAreaElement.textContent = "";}, 30000);
	        }
	      };
	      xhr.send();
	    }, showError);
	  } else {
	    console.log("쉼터알림실패");
	  }
	}
	
	document.addEventListener("click", function() {
      const nearestRestAreaElement = document.getElementById("nearestRestArea");
      nearestRestAreaElement.style.visibility = "hidden";
    });