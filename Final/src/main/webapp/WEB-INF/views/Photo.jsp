<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@page import="kr.smhrd.entity.User"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="resources/css/navicover.css"/>
    <style>

/* 반응형 웹 디자인 */
@media screen and (max-width: 1024px) {
            /* 1024px 이하에서 적용되는 스타일을 여기에 추가합니다. */
            /* 크기와 위치를 조정해주는 스타일 등을 추가합니다. */
            .upmenu_nomodify {
                top: calc(30%);
                left: calc(50%);
                transform: translateX(-50%);
            }
            .upmenu_nomodify2 {
                top: calc(30%);
                right: calc(20%);
                transform: translateX(-50%);
            }
            .leftform {
                top: calc(50%);
                left: calc(5%);
                transform: translate(-50%, -50%);
            }
            .rightform {
                top: calc(50%);
                right: calc(5%);
                transform: translate(-50%, -50%);
            }
        }
/*------------------------------------큰틀----------------------------------------*/

@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
* {
   /*font-family: 'SUIT-Regular';*/
   font-family: "Open Sans", Helvetica, Arial, sans-serif;
   
}

#logo {
   font-size: 63px;
   font-weight:bold;
   display: flex;
   justify-content: center;
   align-items: center;
   margin-left: 475px;
   float: left;
   margin-top: 60px;
   letter-spacing: 10px;
   color: #212A3E;
}

#logo_un {
   display: flex;
   justify-content: center;
   align-items: center;
   font-size: 30px;
   margin-left: 445px;
   float: left;
   margin-top: 20px;
   letter-spacing: 9px;
   color: #487070;
}

body { /*큰 틀의 색상*/
   /* background-color: rgb(13, 13, 14); */
   background-color: #212A3E;
}

#center { /*안에 클 틀*/
   height: 88vh;
   width: 94vw;
   /* background-color: rgba(65, 65, 72, 0.807); */
   /* background-color: rgba(253, 253, 255, 0.275); */
   background-color: #F8F6F4;
   /* background-color: #f5f5f5; */
   margin: auto;
   margin-top: 55px;
   box-shadow: 0 0 10px rgba(57, 57, 57, 0.402);
   border-radius: 35px;
   /* border-radius:30px; */
   /* border: 5px solid rgb(39, 41, 60); */
}

hr {
   /* background-color: rgba(86, 86, 88, 0.904); */
   background-color: #eae7e4;
   height: 2px;
   border: 0;
   /* box-shadow:0 0 5px rgba(33, 31, 31, 0.326); */
   margin-top: 20px;
}

.homeicon { /*홈 아이콘*/
    width: 120px;
   height: 120px;
   margin-top: 2px;
   /* margin-left:35px;
            margin-bottom: 20px; */
   filter: brightness(1);
   transition: 0.5s;
   filter: drop-shadow(3px 3px 3px #c3c3c3);
}

.homeicon:hover {
   /* transition: 0.5s ease-out;
            opacity : 0.5; */
   filter: brightness(0.2);
}

.myicon { /*마이 아이콘*/
   width: 120px;
   height: 120px;
   margin-top: 2px;
   margin-left: 484px;
   filter: brightness(1);
   transition: 0.5s;
   filter: drop-shadow(3px 3px 3px #c3c3c3);
}

.myicon:hover {
   /* transition: 0.5s ease-out;
            opacity : 0.5; */
   filter: brightness(0.2);
}

/*드롭다운*/
.dropbtn {
   background-color: transparent;
   border: 0;
   /* padding: 16px; */
   /* cursor: pointer; 커서가 손가락 모양으로 바뀜*/
}

.dropdown {
   position: relative;
   display: inline-block;
}

.dropdown-content {
   display: none;
   position: absolute;
   background-color: #f9f9f9;
   min-width: 180px;
   /* min-height: 180px; */
   height: 180px;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
   z-index: 1;
   right: 0;
   /* text-align: center; */
   /*font: 20px "SUIT-Regular";*/
   font-size: 20px;
}

.dropdown-content a {
   color: black;
   padding: 18px 22px;
   text-decoration: none;
   display: block;
   filter: drop-shadow(1px 1px 1px #c3c3c3);
}

.dropdown-content a:hover {
   /* background-color: #f1f1f1; */
   /* background-color: #dee1ea; */
   background-color: #e5e5e5;
   filter: drop-shadow(3px 3px 3px #c3c3c3);
}

.dropdown:hover .dropdown-content {
   display: block;
}
/* .dropdown:hover .dropbtn{
            background-color: #3e8e41;
        } */
/*--------------------------------------------------------------------------------*/

        /* 세로 선 */
        .v-line {
            border-left: thick solid #0001;
            height: 70%;
            left: 50%;
            position: absolute;
        }

        .leftform {

            position: absolute;
            width: 100%;
            height: 100%;
            max-width: 700px;
            max-height: 300px;
            padding: 30px;
            background-color: #FFFFFF;
            text-align: center;
            top: calc(50% + 5cm);
            /* 변경된 부분: 10cm에서 5cm로 변경 */
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 15px;
            left: calc(50% - 12cm);
            overflow: hidden;
            overflow: scroll;
            border: 14px solid #376fe8;
            float: left;
            text-align: center;
            
        }


        .rightform {

            position: absolute;
            width: 100%;
            height: 100%;
            max-width: 700px;
            max-height: 300px;
            padding: 30px;
            background-color: #FFFFFF;
            text-align: center;
            top: calc(50% + 5cm);
            /* 변경된 부분: 10cm에서 5cm로 변경 */
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 15px;
            left: calc(50% + 12cm);
            overflow: hidden;
            overflow: scroll;
            border: 14px solid #376fe8;
        }

        .upmenu_nomodify {
       /*     white-space: pre; */

       /*    line-height:4; */
           color: #33cccc;    
           position: absolute;
           font-size: 34px;
        /*   margin-bottom: 1rem;
           padding: 0 2rem; /* 좌우 간격을 설정 
           margin-left: -110px; */
           top: calc(35%);
           left: calc(25%);
        
        transform: translateX(-50%);
        }
        .upmenu_nomodify2 {
       /*     white-space: pre; */

       /*    line-height:4; */
           color: #33cccc;    
           position: absolute;
           font-size: 34px;
        /*   margin-bottom: 1rem;
           padding: 0 2rem; /* 좌우 간격을 설정 
           margin-left: -110px; */
           top: calc(35%);
           right: calc(17%);
        
        transform: translateX(-50%);
        }

        /* 이미지 스타일 (이미지 크기 등을 조정할 수 있습니다) */
        .form-image {
            max-width: 100%;
            height: auto;
        }

        /* 이미지 컨테이너 스타일 (여러 이미지를 한 줄에 나열하기 위해 추가) */
        .image-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            align-items: flex-start;
        }

        /* 각 이미지 간의 간격을 조정하려면 이미지 컨테이너에 margin 값을 지정합니다 */
        .image-container img {
            margin: 4px;
        }

        table {
            width: 16%;
            border-collapse: collapse;
        }

        td {
            padding: 5px;
            /*     text-align: center; */
            vertical-align: top;
        }

        #lightbox {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
        }

        #lightbox-image {
            max-width: 80%;
            max-height: 80%;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        #close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            color: #fff;
            cursor: pointer;
        }

        .photo-record{
            text-align: center; /* 가운데 정렬 */
            font-size: 30px; /* 폰트 크기 설정 */
            position: relative; /* 요소의 위치를 상대적으로 설정합니다. */
            top: 2cm; /* 텍스트를 6cm 아래로 이동시킵니다. */
            color: #33cccc; /* 색깔 맞춥시당 */

            /* ======================================================================= */
            /* 모달 스타일 */


/* 스크롤 막기 */
body {
    overflow: hidden;
}

            /* ======================================================================= */
        }
    </style>

</head>

<body>
<input type="hidden" value="${user_data.id }" id="username">
    <div id="center">
        <div id="header">
            <h2 class="photo-record">Photo_Archive</h2>
            <div class="dropdown" style="float: left;" id="gomain" onclick="GoMain()">
                <button class="dropbtn">
                    <img class="homeicon" src="./home (2).png">
                </button>
            </div>
            <div class="dropdown" style="float: right;">
                <button class="dropbtn"><img class="myicon" src="./user (2).png"></button>
                <div class="dropdown-content">
                    <a href="#">문자 발송 내역</a>
                    <a href="logout">로그아웃</a>
                    <a href="#">회원탈퇴</a>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br>
        <hr>

        <!-- 세로 구분선 표시 -->
        <div class="v-line"></div>

        <h2 class="upmenu_nomodify">졸 음 운 전</h2>
        <!-- 폼 두개로 분리 -->
        <form style="float: left; width: 40%; overflow: auto;" class="leftform" >
            <div class="image-container">
                <!-- 800 x 620 -->
                <!-- onclick="" : 클릭 시 확대 -->
                <table>
                    <tr>
                        <td>
							<c:forEach items="${sleep_img}" var="event">
                            <a href="#" onclick="showModal('image1')">   
							   <img src="${event.event_img}" alt="이미지없다야" class="form-image">    
                            </a>
                            <p>${event.formattedDateTime}</p>
                            </c:forEach>
                        </td>
                    <tr>
                </table>
            </div>

        </form>

        <h2 class="upmenu_nomodify2">주 시 태 만</h2>
        <form style="float: right; width: 40%; overflow: auto;" class="rightform">
            <div class="image-container">
                <!-- 800 x 620 -->
                <table>
                    <tr>
                        <td>
                            <a href="#" onclick="showModal('image2')">
								<c:forEach items="${nolook_img}" var="event">
									<img src="${event.event_img}" alt="이미지없다야" class="form-image">
									<a>${event.formattedDateTime }</a>
								</c:forEach>
                            </a>
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
            
            </div>
        </form>
    </div>

    <div id="lightbox">
        <span id="close-button">&times;</span>
        <img id="lightbox-image" />
    </div>

</body>

<script>
   function GoMain() {
      location.href="/web";
   }
    // 새로운 창에 이미지 표시
 /*   function showImage(imageSrc) {
        window.open(imageSrc, '_blank', 'width=800, height=600');
    } */

    function showModal(imageId) {
        var imageSrc = document.getElementById(imageId).src;
        var modal = document.getElementById('lightbox');
        var modalImage = document.getElementById('lightbox-image');
        var closeButton = document.getElementById('close-button');

        modalImage.src = imageSrc;
        modal.style.display = 'block';

        closeButton.onclick = function () {
            modal.style.display = 'none';
        };
    }

</script>

</html>