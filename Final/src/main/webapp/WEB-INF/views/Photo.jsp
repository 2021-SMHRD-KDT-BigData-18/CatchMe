<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="resources/css/navicover.css"/>
    <style>
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
            max-width: 800px;
            max-height: 590px;
            padding: 30px;
            background-color: #FFFFFF;
            text-align: center;
            top: calc(50% + 3cm);
            /* 변경된 부분: 10cm에서 5cm로 변경 */
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 15px;
            left: calc(50% - 13cm);
            overflow: hidden;
            overflow: scroll;

            float: left;

        }

        .rightform {

            position: absolute;
            width: 100%;
            height: 100%;
            max-width: 800px;
            max-height: 590px;
            padding: 30px;
            background-color: #FFFFFF;
            text-align: center;
            top: calc(50% + 3cm);
            /* 변경된 부분: 10cm에서 5cm로 변경 */
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 15px;
            left: calc(50% + 13cm);
            overflow: hidden;
            overflow: scroll;
        }

        .upmenu_nomodify {
            white-space: pre;
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
    </style>

</head>

<body>
    <div id="center">
        <div id="header">
            <div class="dropdown" style="float: left;" id="gomain" onclick="GoMain()">
                <button class="dropbtn">
                    <img class="homeicon" src="resources/img/home (2).png">
                </button>
            </div>
            <div class="dropdown" style="float: right;">
                <button class="dropbtn"><img class="myicon" src="resources/img/user (2).png"></button>
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

        <h2 class="upmenu_nomodify"> [졸 음 운 전] 												    [주 시 태 만]</h2>
        <!-- 폼 두개로 분리 -->
        <form style="float: left; width: 40%;" class="leftform" style="overflow:auto;">
            <div class="image-container">
                <!-- 800 x 620 -->

                <!-- onclick="" : 클릭 시 확대 -->
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1"
                                onclick="showImage('https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png')">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>



            </div>

        </form>

        <form style="float: right; width: 40%;" class="rightform" style="overflow:auto;">
            <div class="image-container">
                <!-- 800 x 620 -->
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>

                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>
                <table>
                    <tr>
                        <td>
                            <img class="form-image"
                                src="https://1.bp.blogspot.com/-QELd67pUwLw/XTgEGbI0_nI/AAAAAAAARRY/s6GHJQssgx43RKOyqRUU_tRIhvMnkVupQCLcBGAs/s1600/pink-rose-250x250.png"
                                alt="이미지 1">
                            <p>2023-07-28 pm12:00</p>
                        </td>
                    <tr>
                </table>



            </div>

        </form>





    </div>

</body>

<script>
	function GoMain() {
		location.href="/web";
	}
    // 새로운 창에 이미지 표시
    function showImage(imageSrc) {
        window.open(imageSrc, '_blank', 'width=800, height=600');
    }

</script>

</html>