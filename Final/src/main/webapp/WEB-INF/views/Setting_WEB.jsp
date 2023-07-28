<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.smhrd.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>최종본</title>
<% User user = (User)session.getAttribute("user_data");
   String userId = user.getId();
%>
    <style>
      
/* 노멀라이즈 시작 */
body, ul, li {
  margin: 0;
  padding: 0;
  list-style: none;   /* 해당 태그의 list-style을 none으로 하는 것으로 ●을 제거한다 */
}

/******************************/
#center{
            height: 88vh;
            width: 94vw;
            /* background-color: rgba(65, 65, 72, 0.807); */
            /* background-color: rgba(253, 253, 255, 0.275); */
            background-color: #F8F6F4;
            /* background-color: #f5f5f5; */
            margin: auto;
            margin-top: 2.8%;
            box-shadow:0 0 10px rgba(57, 57, 57, 0.402);
            border-radius:10px;
            border: 5px solid rgb(39, 41, 60);
        }

        hr{
            /* background-color: rgba(86, 86, 88, 0.904); */
            background-color: #eae7e4;
            height:1.5px;
            border:0;
            /* box-shadow:0 0 5px rgba(33, 31, 31, 0.326); */
            box-shadow:0 0 15px rgba(159, 151, 151, 0.326);
        }
        .homeicon{
            margin: 28px 0;
            width: 17%;
            height: 17%;
            margin-right: 70%;
        }
        /*마이 아이콘*/
        .myicon{
            width: 20%;
            height: 20%;
            margin: 18px 25px;
            /* margin: 18px 0; */
            margin-left: 75%;

        }

              /*드롭다운 메뉴바*/
              .dropbtn{
            background-color:transparent;
            border: 0;
            /* padding: 16px; */
            /* cursor: pointer; 커서가 손가락 모양으로 바뀜*/ 
        }
        .dropdown{
            position: relative;
            display: inline-block;
        }
        .dropdown-content{
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
            right: 0;
        }
        .dropdown-content a{
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover{
            background-color: #f1f1f1;
        }
        .dropdown:hover .dropdown-content{
            display: block;
        }
        /* .dropdown:hover .dropbtn{
            background-color: #3e8e41;
        } */


/******************************/

a {
  color: inherit;   /* 부모 엘리먼트의 값을 물려받는다 */
  text-decoration: none;    /* 해당 태그의 text-decoration 속성을 none 값으로 하는 것으로 밑줄을 제거한다 */
}
/* 노멀라이즈 끝 */

/* 커스텀 시작 */
.side-bar > ul ul {
  display: none;
}

/* 사이트의 높이를 5000px로 만들어 스크롤 생성 */
body {
  height: 5000px;
 /* background-color: #444;*/
  overflow: hidden;
  background-color: #212A3E;
}

/* 사이드바 시작 */

/* 사이드바의 너비와 높이를 변수를 통해 통제 */
:root {
  --side-bar-width: 270px;
  --side-bar-height: 80vh;
}

.side-bar {
  position: fixed;    /* 스크롤을 따라오도록 지정 */
 /* background-color: rgb(200, 198, 198);*/
  width: var(--side-bar-width);
  min-height: var(--side-bar-height);   /* 사이드바의 높이를 전체 화면 높이의 90%로 지정 */
  margin-top: calc((100vh - var(--side-bar-height)) / 2);    /* 사이드바 위와 아래의 마진을 동일하게 지정 */
  position: fixed !important;
    top: 0 !important;
    left: 0 !important;
    width: 270px !important;
    height: 100vh !important;
}


/* 모든 메뉴의 a에 속성값 부여 */
.side-bar ul > li > a {
  display: block;
  color: black;
  font-size: 1.4rem;
  font-weight: bold;
  padding-top: 20px;
  padding-bottom: 20px;
  padding-left: 50px;
  transition: .5s;
}


.center-content {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

a.classi{
    white-space: pre;
}

.classi{
    font-size: 5px;
}

.joinForm {
 
  position: absolute;
  width: 100%;
  height: 100%;
  max-width: 500px;
  max-height: 610px;
  padding: 30px;
  background-color: #FFFFFF;
  text-align: center;
  top: calc(50% + 1.5cm); /* 변경된 부분: 10cm에서 5cm로 변경 */
  left: 50%;
  transform: translate(-50%, -50%);
  border-radius: 15px;

  }
  
  .joinForm2 {
 
 position: absolute;
 width: 100%;
 height: 100%;
 max-width: 500px;
 max-height: 300px;
 padding: 30px;
 background-color: #FFFFFF;
 text-align: center;
 top: calc(50% + 1.5cm); /* 변경된 부분: 10cm에서 5cm로 변경 */
 left: 50%;
 transform: translate(-50%, -50%);
 border-radius: 15px;

 display: block;

 }

 .joinForm2.show {
     display: block;
}

.joinForm3 {
 
 position: absolute;
 width: 100%;
 height: 100%;
 max-width: 500px;
 max-height: 390px;
 padding: 30px;
 background-color: #FFFFFF;
 text-align: center;
 top: calc(50% + 1.5cm); /* 변경된 부분: 10cm에서 5cm로 변경 */
 left: 50%;
 transform: translate(-50%, -50%);
 border-radius: 15px;

 display: block;

 }

 .joinForm3.show {
    display: block;
}

.setting-label {
    cursor: pointer;
 }

.submit-btn {
  margin-bottom: 40px;
  margin-top: 20px;
  width: 80%;
  height: 40px;
  box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
  background: linear-gradient(to right, #9C27B0, #E040FB);
  background-position: left;
  background-size: 200%;
  color: white;
  font-weight: bold;
  border: none;
  cursor: pointer;
  transition: 0.4s;
  display: inline;
  border-radius: 5em;
  width: 100%;
  }     
  
  .submit-btn123123 {
    margin-bottom: 40px;
  margin-top: 20px;
  width: 20%;
  height: 40px;
  box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
  background: linear-gradient(to right, #9C27B0, #E040FB);
  background-size: 100%;
  color: white;
  font-weight: bold;
  border: none;
  cursor: pointer;
  transition: 0.4s;
  display: inline;
  border-radius: 5em;
  }



  .joinForm h2 {
    text-align: center;
    margin: 30px;
    color: #8C55AA;
  }

  
  .textForm {
    border-bottom: 2px solid #adadad;
  margin-bottom: 20px;
  padding: 10px 10px;
  }
  
.id,
.pw,
.name,
.email,
.phone
{
  width: 100%;
  border: none;
  outline: none;
  color: #636e72;
  font-size: 16px;
  height: 25px;
  background: none;
  font-weight: bold;
}

.username,
.email2{
    width: 50%;
  border: none;
  outline: none;
  color: #262728;
  font-size: 15px;
  height: 30px;
  background: none;
  font-weight: bold;
}



.pw2{
  width: 100%;
  border: none;
  outline: none;
  color: #636e72;
  font-size: 16px;
  height: 25px;
  background: none;
  font-weight: bold;

 
}

  .btn {
    margin-bottom: 40px;
  margin-top: 20px;
  width: 80%;
  height: 40px;
  box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
  background: linear-gradient(to right, #9C27B0, #E040FB);
  background-position: left;
  background-size: 200%;
  color: white;
  font-weight: bold;
  border: none;
  cursor: pointer;
  transition: 0.4s;
  display: inline;
  border-radius: 5em;
  width: 100%;
  }

  @media only screen and (max-width: 768px) {
  .joinForm {
    width: 90%;
    padding: 20px;
  }

  .btn:hover {
    background-position: right;
  }
  
}

@media only screen and (max-width: 412px) {
      #menu {
        font-size: 14px; /* Decreased font size for menu */
      }

      #menu li {
        margin-right: 1cm; /* Adjusted spacing for Home, My, and Settings */
      }

      .logo {
        width: 60%; /* Decreased logo width */
      }

      .joinForm {
        width: 90%;
        height: 100%;
        padding: 10px;
        display: none;
      }

      .joinForm h2 {
        font-size: 18px; /* Increased font size for form heading */
      }

      .textForm {
       margin: 10px;
        padding: 5px 5px;
      }

      .btn {
        font-size: 14px; /* Decreased font size for button */
        margin-bottom: 20px;
      }


    }

    .classi a {
        white-space: pre;
      }

      .settings {
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 10px;

            display: flex; /* Use flexbox to align button to the left */
            flex-direction: column;

        }
        .setting-item {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .setting-label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            margin-right: 10px; 
        }

        .setting-input {
            width: 60%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .submit-btn2 {
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
           margin-top: -0.5rem;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: left;

            width: auto;
            align-self: flex-start;
        }

        .submit-btn2:hover {
            background-color: #45a049;
        }

        .btn2 {
    margin-bottom: 40px;
  margin-top: 20px;
  width: 40%;
  height: 40px;
  box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
  background: linear-gradient(to right, #9C27B0, #E040FB);
  background-position: left;
  background-size: 200%;
  color: white;
  font-weight: bold;
  border: none;
  cursor: pointer;
  transition: 0.4s;
  display: inline;
  border-radius: 5em;
  float: right;

  }



    </style>

<div id="center">
    <div id="header">
        <div class="dropdown" style="float: left;">
            <button class="dropbtn" id="gomain" onclick="GoMain()">
                <img class="homeicon" src="./image/free-icon-home-1828864.png">
            </button>
        </div>
        <div class="dropdown" style="float: right;">
            <button class="dropbtn"><img class="myicon" src="./image/free-icon-user-5264565.png"></button>
            <div class="dropdown-content">
                <a href="#">문자 발송 내역</a>
                <a href="logout">로그아웃</a>
                <a href="#">회원탈퇴</a>
            </div>
        </div>    
    </div>
    <br><br><br><br><hr>
    <!-- 여기서 작업하면됨 -->
</div>


</head>
<body>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<aside class="side-bar">
  <section class="side-bar__icon-box">
    <section class="side-bar__icon-1">
      <div></div>
      <div></div>
      <div></div>
    </section>
  </section>
  <ul>
    <li>
      <a href="#" class="classi" id="settingBtn">
        
        

    문자 수신인설정</a>
      <ul>
        <li><a href="#">text1</a></li>
        <li><a href="#">text2</a></li>
        <li><a href="#">text3</a></li>
        <li><a href="#">text4</a></li>
      </ul>
    </li>
    <li>
      <a href="#" class="classi" id="alarmBtn">
        
        


     알림음 설정</a>
      <ul>
        <li><a href="#">text1</a></li>
        <li><a href="#">text2</a></li>
        <li><a href="#">text3</a></li>
        <li><a href="#">text4</a></li>
      </ul>
    </li>
    <li>
      <a href="#" class="classi" id="personalInfoLink">
        
        


    개인정보수정</a>
      <ul>
        <li><a href="#">text1</a></li>
        <li><a href="#">text2</a></li>
        <li><a href="#">text3</a></li>
        <li><a href="#">text4</a></li>
      </ul>
    </li>
    
  </ul>
</aside>

<form action="doJoin" method="POST" class="joinForm"  onsubmit="showConfirmation(); return false;">  <!--onsubmit="DoJoinForm__submit(this); return false;"-->
    <h2>Modify</h2>
    <div class="textForm">
      <input name="loginId" type="text" class="id" id="userId" value="<%=userId %>">
    </div>
    <div class="textForm">
      <input name="loginPw" type="password" class="pw" id="modpw" placeholder="*****">
    </div>
    <div class="textForm">
      <input name="loginPwConfirm" type="password" class="pw2" id="userPwch" placeholder="비밀번호 확인"> 
    </div>
    
    <input type="button" onclick="chanPw()" class="btn2" value="Confirm"/>
    
    <div class="textForm">
      <input name="name" type="text" class="name" id="UName" placeholder="홍길동">
    </div>
    <div class="textForm">
      <input name="phone" type="text" class="phone" id="userPhon" placeholder="010-1111-2222">
    </div>
      <input type="button" id="changeMy" onclick="chanMy()" class="btn" value="Complete"/>
  </form>

<form action="" class="joinForm2" onsubmit="showConfirmation2(); return false;">
 
    <h2>Receiver Page</h2>
    <div class="settings">
        <div class="setting-item">
            <label class="setting-label" for="recipient" id="settingBtn">문자 수신인 설정:</label>
            <input class="setting-input" oninput="hypenTel(this)" type="text" id="recipient" name="recipient" placeholder="문자 수신인(전화번호)을 입력하세요" required>
        </div>
        <div id="errorMessage" style="display: none; color: red;">올바른 전화번호를 입력해주세요.</div>

        <button class="submit-btn" onclick="chanrecephon()">저장</button>
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
<form class="joinForm3" onsubmit="showConfirmation2(); uploadFile();">
    <div class="settings">
        <div class="setting-item">
            <label class="setting-label" for="username">사용자 이름:</label>
            <input type="text" id="username" name="username" class="username" placeholder="사용자 이름을 입력하세요" required> 
        </div>
        
        <div class="setting-item">
            <label class="setting-label" for="email">이메일 주소:</label>
            <input type="email" id="email2" name="email2" class="email2" placeholder="이메일 주소를 입력하세요" required>
        </div>
        <div class="setting-item">
            <label class="setting-label" for="notifications">알림 설정:</label>
            <select id="notifications" name="notifications">
                <option value="on">켜기</option>
                <option value="off">끄기</option>
            </select>
        </div>

        <br>
        <div>
            <label for="setting-label" class="bold-label">업로드:</label>
            <input type="file" id="fileInput">
        </div>
        <style>.bold-label { font-weight: bold; float:left;}</style>
      
        <button class="submit-btn" type="submit">저장</button>
    </div>
</form>

    <script src="resources/js/upload.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		function chanPw() {
			if (confirm("변경하시겠습니까?")) {
				let userId = $("#userId").val();
				let modpw = $("#modpw").val();
				let userPwch = $("#userPwch").val();	
				if (modpw == userPwch) {
					$.ajax({ 
						url : "ChangePw",
						method : "post",
						data : {
							userId : userId,
							modpw : modpw
						},
						success : function(data) {
							if (data == 1) {
								alert("변경하였습니다.")
							}
							else {
								alert("변경되지 않았습니다")
							}
						},
						error : function() {
							console.log("오류!오류!")
						}
					});
				}
				else {
					alert("일치하지 않습니다.")
				}
			}
		}
		function chanMy() {
			if (confirm("변경하시겠습니까?")) {
				let userId = $("#userId").val();
				let UName = $("#UName").val();
				let userPhon = $("#userPhon").val();
				$.ajax({
					url : "changeMy",
					method : "post",
					data : {
						userId : userId,
						UName : UName,
						userPhon : userPhon
					},
					success : function(data) {
						if (data == 1) {
							alert("변경하였습니다.")
						}
						else {
							alert("변경되지 않았습니다")
						}
					},
					error : function() {
						console.log("오류!오류!")
					}
				});
			}
		}
		function GoMain() {
			location.href="/web";
		}
		function chanrecephon() {
			if (confirm("저장하시겠습니까?")) {
				let userId = $("#userId").val();
				let recPhon = $("#recipient").val();
				console.log(userId, recPhon)
				$.ajax({
					url : "chrephonw",
					method : "post",
					data : {
						userId : userId,
						recPhon : recPhon
					},
					success : function(data) {
						if (data != 0) {
							alert("저장되었습니다.")
						}
						else {
							console.log("변경되지 않았습니다")
						}
					},
					error : function() {
						console.log("오류!오류!")
					}
				});
			}
		}
	</script>
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




 
</script>

</body>
</html>