<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            /*큰 틀의 색상*/
            background-color: #212A3E;
        }

        .center {
            overflow: hidden;
            position: relative;
            height: 853px;
            width: 1804px;
            background-color: #F8F6F4;
            border-radius: 35px;
            margin: 0 auto;
            margin-top: 55px;
            /* position: absolute; */
            /* margin: 0 auto 100px; */
            /* top: 50%;
                left: 50%; */
            /* margin: -330px 0 0 -590px; */
            /* filter: drop-shadow(10px 7px 5px #c3c3c3); */
            /* box-shadow:0 0 10px rgba(57, 57, 57, 0.402); */
        }

        .homeicon {
            /*홈 아이콘*/
            width: 160px;
            height: 160px;
            margin-left: -18px;
            margin-top: 21px;
            filter: brightness(1);
            transition: 0.5s;
            filter: drop-shadow(3px 3px 3px #c3c3c3);
        }

        .homeicon:hover {
            /* transition: 0.5s ease-out;
                opacity : 0.5; */
            filter: brightness(0.2);
        }

        *, *:before, *:after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        input, button {
            border: none;
            outline: none;
            background: none;
            font-family: "Open Sans", Helvetica, Arial, sans-serif;
        }

        /* input태그 설정 */
        .form {
            position: relative;
            width: 800px;
            height: 100%;
            transition: transform 1.2s ease-in-out;
            padding: 70px 30px 0;
            margin-left: 200px;
        }

        /* 움직이기 전 오른쪽 화면 설정 */
        .sub-cont {
            overflow: hidden;
            position: absolute;
            float: right;
            /* left: 1154px;고정 인제 수정 금지ㅠㅠㅠ */
            left: 1154px;
            top: 0;
            /* width: 1200px;고정 인제 수정 금지ㅠㅠㅠ */
            /* width: 650px; */
            height: 100%;
            padding-left: 260px;
            background: #F8F6F4;
            /* background: #edb985; */
            transition: transform 1.2s ease-in-out;
        }

        /* sign up 눌렀을 때 옆으로 이동하는 효과 */
        .center.s--signup .sub-cont {
            /* transform: translate3d(-640px, 0, 0); */
            transform: translate3d(-1154px, 0, 0);
        }

        button {
            display: block;
            margin: 0 auto;
            width: 260px;
            height: 45px;
            border-radius: 30px;
            color: #fff;
            font-size: 15px;
            cursor: pointer;
        }

        /* 오른쪽 화면 이미지 설정 */
        .img {
            overflow: hidden;
            z-index: 2;
            position: absolute;
            left: 0;
            top: 0;
            width: 650px;/*고정 인제 수정 금지ㅠㅠㅠ*/
            height: 100%;
            padding-top: 360px;
        }

        /* 이미지 전 설정 */
        .img:before {
            content: "";
            position: absolute;
            right: 0;
            top: 0;
            width: 1804px;/*고정 인제 수정 금지ㅠㅠㅠ*/
            height: 100%;
            background-image: url("resources/img/car-gb74fda5ff_1280.jpg");
            background-size: cover;
            transition: transform 1.2s ease-in-out;
        }

        /* 이미지 위에 글자나 배경색 설정 */
        .img:after {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
        }

        .center.s--signup .img:before {
            /* transform: translate3d(640px, 0, 0); */
            transform: translate3d(1154px, 0, 0);
        }

        .img__text {
            z-index: 2;
            position: absolute;
            left: 0;
            top: 50px;
            width: 100%;
            padding: 0 20px;
            text-align: center;
            color: #fff;
            transition: transform 1.2s ease-in-out;
        }

        .img__text h2 {
            margin-bottom: 10px;
            font-weight: normal;
        }

        .img__text p {
            font-size: 18px;
            line-height: 1.5;
        }

        .center.s--signup .img__text.m--up {
            /* transform: translateX(520px); */
            transform: translateX(1034px);
        }

        .img__text.m--in {
            /* transform: translateX(-520px); */
            transform: translateX(-1034px);
        }

        .center.s--signup .img__text.m--in {
            transform: translateX(0);
        }

        .img__btn {
            overflow: hidden;
            z-index: 2;
            position: relative;
            width: 100px;
            height: 36px;
            margin: 0 auto;
            background: transparent;
            color: #fff;
            text-transform: uppercase;
            font-size: 15px;
            cursor: pointer;
            margin-top: 35px;
        }

        .img__btn:after {
            content: "";
            z-index: 2;
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            border: 2px solid #fff;
            border-radius: 30px;
        }

        .img__btn span {
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100%;
            transition: transform 1.2s;
        }
        /* 버튼 눌렀을 때 움직임 효과 설정 */
        .img__btn span.m--in {
            transform: translateY(-72px);
        }
        .center.s--signup .img__btn span.m--in {
            transform: translateY(0);
        }
        .center.s--signup .img__btn span.m--up {
            transform: translateY(72px);
        }

        h2 {
            width: 100%;
            font-size: 60px;
            text-align: center;
            margin-top: 30px;
        }

        .forgot-pass {
            margin-top: 100px;
            text-align: center;
            font-size: 23px;
            color: #cfcfcf;
        }

        .submit {
            margin-top: 40px;
            margin-bottom: 20px;
            background: #d4af7a;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 20px;

        }

        .fb-btn {
            border: 2px solid #d3dae9;
            color: #8fa1c7;
        }

        .fb-btn span {
            font-weight: bold;
            color: #455a81;
        }

        .sign-in {
            transition-timing-function: ease-out;
        }

        .center.s--signup .sign-in {
            transition-timing-function: ease-in-out;
            transition-duration: 1.2s;
            /* transform: translate3d(640px, 0, 0); */
            transform: translate3d(650px, 0, 0);
            /* transform: translate3d(1154px, 0, 0); */
        }

        .sign-up {
            /* transform: translate3d(-900px, 0, 0); */
            transform: translate3d(-1804px, 0, 0);
            /* transform: translate3d(-2100px, 0, 0); */
        }

        .center.s--signup .sign-up {
            transform: translate3d(0, 0, 0);
        }

        .m--up :active .sign-in{
            opacity: 0;
        } 

        /* input태그 안에 입력 폼 설정 */
        /* label {
            display: block;
            width: 500px;
            margin: 70px auto 0;
            text-align: center;} */

        /* input 태그 글자 설정 */
        label span {
            font-size: 22px;
            font-weight: bold;
            text-transform: uppercase;
            float: left;
            margin-bottom: 15px;
            /* margin-top: 10px; */
        }

        input {
            /* display: block;
            width: 100%; */
            /* margin-top: -20px; */
            /* padding-bottom: 5px; */
            font-size: 20px;
            /* border-bottom: 1px solid rgba(0, 0, 0, 0.4);
            text-align: center; */
        }
        .sign_text{
            margin-top: -10px;
        }
        .sign-up p{
            margin-top: 50px;
            /* margin-bottom: -20px; */
        }
        .sign-up .submit{
            margin-top: 60px;
        }


        /* ------------------------------------------------------------- */
        .wrap { margin: 20vh auto; width:50vh; height:50vh; text-align:center;}
        p { margin:100px auto 0; }
        /* form과 fieldset은 선택자로 사용하지 않는다. */

        /* 스타일 */
        p { position:relative; width:63%; height:60px; } /* 기본세팅 */
        p input { box-sizing:border-box; padding:20px 0 0; width:100%; height:100%; border:0 none; color:#595f63; outline:none; }
        p label { position:absolute; left:0%; bottom:0; width:100%; height:100%; border-bottom:1px solid #000; text-align:left; pointer-events:none; }
        p label:after { content:""; position:absolute; left:0; bottom:-1px; width:0; height:100%; border-bottom:3px solid #33cccc; transition:all .3s ease; } /* 파란색 가로줄 */
        p label span { position:absolute; left:0; bottom:5px; transition:all .3s ease; }
        p input:focus + label span, 
        p input:valid + label span { transform:translateY(-150%); font-size:22px; }  /* input에 글을 입력하고 포커스가 지나간 상태에서 제어하려면 valid 선택자를 써야한다. */
        /* 포커스 될 때 label span(name)이 위로 올라감 */
        p input:focus + label::after,
        p input:valid + label::after { width:100%; transform:translateX(0); } 
        /* 포커스 될 때 파란색 가로줄이 생김 */

        /* 실시간 id 중복확인 설정 */
        .id_ok{
        color:#008000;
        display: none;
        margin-left: 140px;
        }

        .id_already{
        color:#ff4646; 
        display: none;
        margin-left: 140px;
        }

        /* 회원가입 성공/실패 메시지 */
        .fail{
            display: none;
            position: relative; 
            width: 600px;
            height: 600px;
            background-color: #d4d4d4ac;
            font-size: 25px;
            font-weight: bold;
            z-index: 3;

        }
        .success{
            display: none;
            position: relative; 
            width: 600px;
            height: 600px;
            background-color: #d4d4d4ac;
            font-size: 25px;
            font-weight: bold;
            z-index: 3;
        }
        .success img{
            width: 260px;
            height: 260px;
            margin-left: 170px;
            margin-top: 40px;
            padding-bottom: 60px;
        }
        .fail img{
            width: 260px;
            height: 260px;
            margin-left: 170px;
            margin-top: 40px;
            padding-bottom: 60px;
        }
        .success, .fail span{
            margin-top: -700px;
            margin-left: 1010px; 
        }
        .success span{
            margin-left: 168px;
        }
        .fail span{
            margin-left: 168px;
        }
        .success_btn{
            width: 300px;
            height: 70px;
            /* background-color: rgb(57, 222, 101); */
            background-color: #008000;
            font-size: 20px;
            font-weight: bold;
            margin-top: 90px;
        }
        .fail_btn{
            width: 300px;
            height: 70px;
            /* background-color: rgb(222, 57, 57); */
            background-color: #ff4646;
            font-size: 20px;
            font-weight: bold;
            margin-top: 70px;
        }


    </style>
</head>
<!-- <script src="./1.회원가입 성공,실패 확인.html"></script> -->
<body>
    <div class="center" style="position: relative;">
        <div class="dropdown" style="float: left;">
            <button class="dropbtn" id="gomain" onclick="GoMain()">
                <img class="homeicon" src="resources/img/home (2).png">
            </button>
        </div>

        <div class="form sign-in">
            <h2 style="color: #212A3E;">Welcome</h2>
            <form action="login" method="post">
                    <p>
                      <input type="text" name="id" id="id" autocomplete="off" required>
                      <label for="id"><span>아이디</span></label>
                    </p>  
                    <p>
                        <input type="password" name="pw" id="password" autocomplete="off" required>
                        <label for="password"><span>비밀번호</span></label>
                    </p> 
                <a href="findPw" style="text-decoration-line: none;"><p class="forgot-pass">비밀번호를 잃어버렸나요?</p></a>
                <button type="submit" class="submit">로그인</button>
            </form>
        </div>

        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>Catch you</h2>
                    <p>가입을 통해 Catch you에서 더 다양한 서비스를 만나보세요!</p>
                </div>
                <div class="img__text m--in">
                    <h2 style="font-size: 55px;">Whenever, Wherever</h2>
                    <p>반갑습니다! Catch you의 슬로건과 같이 언제 어디서든 서비스를 만나보세요!</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">회원가입</span>
                    <span class="m--in">로그인</span>
                </div>
            </div>
            <div class="form sign-up" style="margin-left: 600px;" >
                <h2 class="sign_text" style="font-size: 55px; color: #212A3E;">회원가입</h2>

                <form action="sign_up">
                    <p>
                      <input name="id" type="text" id="userid" autocomplete="off" required oninput="checkID()">
                      <label for="id"><span>아이디</span></label>
                    </p>
                    <!-- ID ajax 중복체크 -->
                    <span class="id_ok">사용 가능한 아이디입니다.</span>
                    <span class="id_already">사용중인 아이디입니다!</span>
                    <p>
                        <input type="password" id="user_pw" autocomplete="off" required>
                        <label for="password"><span>비밀번호</span></label>
                    </p> 
                    <p>
                        <input type="text" id="user_name" autocomplete="off" required>
                        <label for="user_name"><span>이름</span></label>
                    </p> 
                    <p>
                        <input type="text" id="user_phon" autocomplete="off" required>
                        <label for="user_phon"><span>핸드폰번호</span></label>
                    </p>
                    <p>
                        <input type="text" id="user_email" autocomplete="off" required>
                        <label for="user_email"><span>이메일</span></label>
                    </p>
                    <button type="button" class="submit" onclick="userRegi()">회원가입</button>
                </form>
            </div>
        </div>
    </div>
    <!-- 회원가입 성공/실패 메시지 -->
    <div class="success_check">
        <div class="success">
            <img src="resources/img/Icon-Reward-unscreen.gif"><br>
            <span>회원가입이 되었습니다!</span>
            <button class="success_btn" type="button" onclick="regiche('succ')">CONTINUE</button>
            
        </div>
        <div class="fail" style="margin-top: -700px; margin-left: 1010px; ">
            <img src="resources/img/Loading-fail-unscreen.gif"><br>
            <span>회원가입을 실패했습니다.</span><br>
            <span style="margin-left: 203px;">다시 입력해주세요!</span>

            <!-- <button class="fail_btn" onclick="ondisplay()">TRY AGAIN</button>
            <button class="fail_btn" onclick="offdisplay()">TRY AGAIN</button> -->
            <button class="fail_btn" type="button" onclick="regiche('fail')">TRY AGAIN</button>


              
        </div>
    </div>
    <!-- 여기까지 -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
	    function GoMain() {
			location.href="/web";
		}
        // 로그인&회원가입 버튼 눌렀을 때 효과
        document.querySelector('.img__btn').addEventListener('click', function () {
            document.querySelector('.center').classList.toggle('s--signup');
            $('.id_ok').css("display", "none");
            $('.id_already').css("display", "none");
            $("#id").val("");
            $("#password").val("");
            $("#userid").val("");
            $("#user_pw").val("");
            $("#user_name").val("");
            $("#user_email").val("");
            $("#user_phon").val("");
        });

        // 실시간 id 중복 확인
        function checkID(){
        var id = $('#userid').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'idcheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{
            	id : id
            },
            success:function(data){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(data == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디 
                    $('.id_ok').css("display","inline-block"); 
                    $('.id_already').css("display", "none");
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                    $('.id_already').css("display","inline-block");
                    $('.id_ok').css("display", "none");
                    $('#id').val('');
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
        };
        function userRegi() {
            // 폼 데이터를 직렬화합니다.
            var formData = {
                id: $("#userid").val(),
                pw: $("#user_pw").val(),
                name: $("#user_name").val(),
                email: $("#user_email").val(),
                phone: $("#user_phon").val()
            };

            // 비동기적으로 회원가입 요청을 서버로 전송합니다.
            $.ajax({
                url: 'join',
                type: 'POST',
                data: formData,
                dataType: "json",
                success: function (data) {
                    if (data != 0) {
                        $('.success').css("display","block");
                        $('.id_ok').css("display", "none");
                        $("#userid").val("");
                        $("#user_pw").val("");
                        $("#user_name").val("");
                        $("#user_email").val("");
                        $("#user_phon").val("");
                        // 회원가입 성공시 처리 (원하는 동작 추가)
                    } else {
                        $('.fail').css("display","block");
                        // 회원가입 실패시 처리 (원하는 동작 추가)
                    }
                },
                error: function (error) {
                    console.log('Error:', error);
                    $('.fail').css("display","block");
                    // 오류 처리 (원하는 동작 추가)
                }
            });
        }
        function regiche(check) {
        	console.log(check)
        	if (check == "succ") {
        		$('.success').css("display","none");
        		$('.center').removeClass('s--signup');
        	}
        	else {
        		$('.fail').css("display","none");
        	}
        }
    </script>
</body>

</html>