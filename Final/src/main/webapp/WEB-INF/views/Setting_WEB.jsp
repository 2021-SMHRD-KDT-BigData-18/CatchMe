<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="resources/css/navicover.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/recordcss.css" />
<div id="center">
	<div id="header">
		<div class="dropdown" style="float: left;">
			<button class="dropbtn">
				<img class="homeicon" src="resources/image/home (2).png">
			</button>
		</div>
		<div class="dropdown" style="float: right;">
			<button class="dropbtn">
				<img class="myicon" src="resources/image/user (2).png">
			</button>
			<div class="dropdown-content">
				<a href="#">개인정보수정</a> <a href="#">문자 발송 내역</a> <a href="#">로그아웃</a>
				<a href="#">회원탈퇴</a>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<hr>
	<!-- 여기서 작업하면됨 -->
</div>
</head>
<body>

	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

	<aside class="side-bar">
		<section class="side-bar__icon-box">
			<section class="side-bar__icon-1">
				<div></div>
				<div></div>
				<div></div>
			</section>
		</section>
		<ul>
			<li><a href="#" class="classi" id="settingBtn"> 문자 수신인설정</a>
				<ul>
					<li><a href="#">text1</a></li>
					<li><a href="#">text2</a></li>
					<li><a href="#">text3</a></li>
					<li><a href="#">text4</a></li>
				</ul></li>
			<li><a href="#" class="classi" id="alarmBtn"> 알림음 설정</a>
				<ul>
					<li><a href="#">text1</a></li>
					<li><a href="#">text2</a></li>
					<li><a href="#">text3</a></li>
					<li><a href="#">text4</a></li>
				</ul></li>
			<li><a href="#" class="classi" id="personalInfoLink"> 개인정보수정</a>
				<ul>
					<li><a href="#">text1</a></li>
					<li><a href="#">text2</a></li>
					<li><a href="#">text3</a></li>
					<li><a href="#">text4</a></li>
				</ul></li>

		</ul>
	</aside>

	<form action="doJoin" method="POST" class="joinForm"
		onsubmit="showConfirmation(); return false;">
		<!--onsubmit="DoJoinForm__submit(this); return false;"-->
		<h2>Modify</h2>
		<div class="textForm">
			<input name="loginId" type="text" class="id" placeholder="smhrd666">
		</div>
		<div class="textForm">
			<input name="loginPw" type="password" class="pw" placeholder="*****"
				id="loginPwInput">
		</div>
		<div class="textForm">
			<input name="loginPwConfirm" type="password" class="pw2"
				placeholder="비밀번호 변경란">
		</div>

		<input type="submit" class="btn2" value="Confirm" />

		<div class="textForm">
			<input name="name" type="text" class="name" placeholder="김은영">
		</div>
		<div class="textForm">
			<input name="phone" type="number" class="phone"
				placeholder="010-1111-2222">
		</div>
		<input type="submit" class="btn" value="Complete" />
	</form>

	<form action="" class="joinForm2"
		onsubmit="showConfirmation2(); return false;">

		<h2>Receiver Page</h2>
		<div class="settings">
			<div class="setting-item">
				<label class="setting-label" for="recipient" id="settingBtn">문자
					수신인 설정:</label> <input class="setting-input" oninput="hypenTel(this)"
					type="text" id="recipient" name="recipient"
					placeholder="문자 수신인(전화번호)을 입력하세요" required>
			</div>
			<div id="errorMessage" style="display: none; color: red;">올바른
				전화번호를 입력해주세요.</div>

			<button class="submit-btn" type="submit">저장</button>
		</div>

		<script>
      document.getElementById("recipient").addEventListener("input", function() {
      const phoneNumber = this.value;
      const isValidPhoneNumber = /^(\d{2,3}-)?\d{3,4}-\d{4}$/.test(phoneNumber);
      const errorMessage = document.getElementById("errorMessage");
      errorMessage.style.display = isValidPhoneNumber ? "none" : "block";
    });
    </script>

	</form>

	<!--<h1>알림음 설정</h1> -->
	<form class="joinForm3" onsubmit="showConfirmation2();">
		<div class="settings">
			<div class="setting-item">
				<label class="setting-label" for="username">사용자 이름:</label> <input
					type="text" id="username" name="username" class="username"
					placeholder="사용자 이름을 입력하세요" required>
			</div>

			<div class="setting-item">
				<label class="setting-label" for="email">이메일 주소:</label> <input
					type="email" id="email2" name="email2" class="email2"
					placeholder="이메일 주소를 입력하세요" required>
			</div>
			<div class="setting-item">
				<label class="setting-label" for="notifications">알림 설정:</label> <select
					id="notifications" name="notifications">
					<option value="on">켜기</option>
					<option value="off">끄기</option>
				</select>
			</div>

			<br>
			<div>
				<label for="setting-label" class="bold-label">업로드:</label> <input
					type="file" id="fileInput">
				<button onclick="uploadFile()" class="submit-btn123123">Upload</button>
			</div>
			<style>
.bold-label {
	font-weight: bold;
	float: left;
}
</style>

			<button class="submit-btn" type="submit">저장</button>
		</div>
	</form>

	<script src="resources/js/upload.js"></script>

	<script>
        function showConfirmation() {
          // Show the confirmation dialog and get the user's choice
          const result = confirm("진짜 변경하시겠습니까?");
      
          // If the user clicked "Yes" in the confirmation dialog
          if (result) {
            // Get the values of "loginPw" and "loginPwConfirm" input fields
            const loginPwInput = document.getElementById("loginPwInput");
            const loginPwConfirm = document.querySelector("input[name='loginPwConfirm']").value;
      
            // Set the value of "loginPw" to match the value of "loginPwConfirm"
            loginPwInput.value = loginPwConfirm;
      
            // Disable the "loginPw" input field
            loginPwInput.disabled = true;
          }
      
          // Returning false in the onsubmit event will prevent the form from submitting
          return false;
        }
      </script>





	<script>
     const personalInfoLink = document.getElementById("personalInfoLink");
    const joinForm = document.querySelector(".joinForm");

    personalInfoLink.addEventListener("click", () => {
            if (joinForm.style.display === "block") {
                joinForm.style.display = "none"; // 이미 보이는 경우, 숨기기
            } else {
                joinForm.style.display = "block"; // 숨겨져 있는 경우, 보이기
            }
        });

    joinForm.style.display = "none";


</script>

	<!-- 기존 코드 이후에 추가 -->
	<!-- 기존 코드 이후에 추가 -->

	<!-- 문자 수신인 설정 버튼 클릭 시 joinForm2 폼 보이기 -->
	<script>
   
  function toggleJoinForm2() {
    const joinForm2 = document.querySelector(".joinForm2");

    if (joinForm2.style.display === "none") {
                joinForm2.style.display = "block";
            } else {
                joinForm2.style.display = "none";
            }
        }

  //  joinForm2.style.display = joinForm2.style.display === "block" ? "none" : "block";
  

  const settingBtn = document.getElementById("settingBtn");
  const joinForm2 = document.querySelector(".joinForm2");
  joinForm2.style.display = "none";

  settingBtn.addEventListener("click", () => {
    if (joinForm2.style.display === "none") {
      joinForm2.style.display = "block"; // joinForm2가 숨겨져 있으면 보이도록 변경
    } else {
      joinForm2.style.display = "none"; // joinForm2가 보이고 있으면 숨기도록 변경
    }
  });

 /* settingBtn.addEventListener("click", () => {
        toggleJoinForm2(); // toggleJoinForm2() 함수 호출 추가
    });*/

    function toggleJoinForm2() {
        if (joinForm2.style.display === "none") {
            joinForm2.style.display = "block";
        } else {
            joinForm2.style.display = "none";
        }
    }

  // Initially hide joinForm2
 
</script>

	<script>




    const alarmBtn = document.getElementById("alarmBtn");
    const joinForm3 = document.querySelector(".joinForm3");
    joinForm3.style.display="none";

    alarmBtn.addEventListener("click", () => {
    if (joinForm3.style.display === "none") {
      joinForm3.style.display = "block"; // joinForm2가 숨겨져 있으면 보이도록 변경
    } else {
      joinForm3.style.display = "none"; // joinForm2가 보이고 있으면 숨기도록 변경
    }
  });

  function toggleJoinForm3() {
    const joinForm3 = document.querySelector(".joinForm3");

    if (joinForm3.style.display === "none") {
                joinForm3.style.display = "block";
            } else {
                joinForm3.style.display = "none";
            }
        }


</script>


</body>
</html>