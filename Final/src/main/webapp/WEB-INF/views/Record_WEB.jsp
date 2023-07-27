<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="resources/css/recordcss.css"/>
</head>
<body>
	<div id="center">
		<div id="header">
	    	<div class="dropdown" style="float: left;">
	        	<button class="dropbtn">
	            	<img class="homeicon" src="resources/image/house.svg">
	            </button>
	            <!-- <div class="dropdown-content" style="left: 0;">
	                <a href="#">링크#1</a>
	            </div> -->
	        </div>
	       	<div class="dropdown" style="float: right;">
	        	<button class="dropbtn"><img class="myicon" src="resources/image/user.svg"></button>
	            <div class="dropdown-content">
	            	<a href="#">문자 발송 내역</a>
	                <a href="#">로그아웃</a>
	                <a href="#">회원탈퇴</a>
	            </div>
	        </div>    
	    </div>
	    <br><br><br><br><br><br><br><hr>
	        
	    <div id="main_area">
	    	<div class="record_area">녹화</div>
	        	<div class="record_button">
	            	<a href="#"><img src="resources/image/video.png"></a>
	                <!-- <button>end</button> -->
	            </div>
	            <div class="content_area">
	                <p>02. 졸음운전 감지(2023.07.25 09:20)</p>
	                <p>01. 졸음운전 감지(2023.07.25 09:16)</p>
	            </div>
	    </div>
	    
	
	    <!-- 문자발송완료 알림문구창 -->
	    <div class="notification-container" id="notification-container">
	        <p>이상행동이 감지되어 010-1234-5678님에게 문자 발송을 완료했습니다!</p>
	    </div>
	</div>
	
	
	<script>
		const notification = document.getElementById('notification-container')
	
	    const showNotification = () => {
	        notification.classList.add('show')
	        setTimeout(() => {
	            notification.classList.remove('show')
	        }, 2000)
	    }
	
	    //keydown letter press
	    window.addEventListener('keydown', (e) => {
		    // only want alphabet keys to get into the eventlistener
		    if (e.keyCode >= 65 && e.keyCode <= 90) {
		        const letter = e.key
		        //we want only letters that are not already pressed
		        if (selectedWord.includes(letter)) {
		            if (!correctLetters.includes(letter)) {
		                correctLetters.push(letter)
		                displayWord()
		            } else {
		            //if same correct key pressed
		            showNotification()
		            }
		            
		        }
		        else {
		        	if (!wrongLetters.includes(letter)) {
		            	wrongLetters.push(letter)
		                updateWrongLettersEl()
		            } else {
		                //if same wrong key pressed
		                showNotification()
		            }
		        }
		    }
	    })
	    </script>
</body>
</html>