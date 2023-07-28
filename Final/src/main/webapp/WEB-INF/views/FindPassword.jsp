<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>비밀번호 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
   
   html {
      height: 100%;
   }
   
   body {
       width:100%;
       height:100%;
       margin: 0;
        padding-top: 200px;
        padding-bottom: 40px;
        font-family: "Nanum Gothic", arial, helvetica, sans-serif;
        background-repeat: no-repeat;
        background-color: #212A3E;
        font-size: 20px;

   }
   
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
   }

    #btn-Yes{
      background: linear-gradient(to right, #9C27B0, #E040FB);
        border: none;
    }
   
   .form-signin .form-control {
        position: relative;
        height: auto;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
            box-sizing: border-box;
        padding: 10px;
        font-size: 16px;
   }
 
    .card-title{
        margin-left: 30px;
    }


    a{ 
       color: #E040FB; text-decoration: none; 
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    
    .checks{
       color : red;
    }

   /* --------------------------------------------------------------------- */
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

    </style>
  </head>
  
  <div id="center">
        <div id="header">
            <div class="dropdown" style="float: left;" id="gomain" onclick="GoMain()">
                <button class="dropbtn">
                    <img class="homeicon" src="./image/free-icon-home-1828864.png">
                </button>
                <!-- <div class="dropdown-content" style="left: 0;">
                    <a href="#">링크#1</a>
                </div> -->
            </div>
            <div class="dropdown" style="float: right;">
                <button class="dropbtn"><img class="myicon" src="./image/free-icon-user-5264565.png"></button>
                <div class="dropdown-content">
                    <a href="photo">사진</a>
                    <a href="login">로그인</a>
                    <a href="#">회원탈퇴</a>
                </div>
            </div>    
        </div>


  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

   <div class="card align-middle" style="width:25rem; margin-top: 100px;">
      <div class="card-title" style="margin-top:30px;">
           
         <h2 style="font-weight: bold;">비밀번호 찾기</h2> 
        
         <hr>
      </div>
        
      <div class="card-body">
      <form class="form-signin">
        <input type="text" name="member_id" id="member_id" class="form-control" placeholder="아이디" required><br>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required><BR>
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>
        <p class="checks" id="checks"></p><br/>
         <button id="btn-Change" class="btn btn-lg btn-primary btn-block" type="button" onclick="findPW()" >비밀번호찾기</button>
      </form>
      
      </div>
        <div class="links">
            <a href="login" style="font-weight: bold;">로그인</a> | <a href="join" style="font-weight: bold;">회원가입</a>
         <!-- <a href="memberId">아이디 찾기</a> |-->

        </div>
   </div>
  
  </body>
     <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
	function GoMain() {
		location.href="/web";
	}
	function findPW() {
		let finId = $("#member_id").val();
		let finname = $("#name").val();
		let finemail = $("#email").val();
		$.ajax({
			url : "SearchPw",
			method : "post",
			data : { 
				finId : finId,
				finname : finname,
				finemail : finemail
			},
			success : function(data) {
				if (data == 1) {
					location.href = "ModifyPw?id="+finId;
				}
				else {
					alert("일치하는 정보가 없습니다")
				}
			},
			error : function(){
				console.log("오류")
			}
		});
	};
        //아이디 정규식
      var idJ = /^[a-z0-9]{5,20}$/;
      
   $("#member_id").focusout(function () {
      if (true) {
        $('#checks').text('5~20자의 영문 소문자, 숫자만 사용 가능합니다');
        $('#checks').css('color', 'red');
      }
    });

    $("#name").focusout(function () {
      if ($('#name').val() == "") {
        $('#checks').text('이름을 입력해주세요.');
        $('#checks').css('color', 'red');
      }
    });

    $("#email").focusout(function () {
      if ($('#email').val() == "") {
        $('#checks').text('이메일을 입력해주세요');
        $('#checks').css('color', 'red');
      }
    });
  </script>
</body>
</html>