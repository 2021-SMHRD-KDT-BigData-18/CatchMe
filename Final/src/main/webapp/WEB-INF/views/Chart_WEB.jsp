<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <title>chart_repo</title>
       <style>
 /* Updated styles for the chart tooltip */
        #chartjs-tooltip th {
            font-weight: bold;
            background-color: #f9f9f9;
            padding: 8px;
            color: #333; /* Text color for the tooltip header */
        }

        #chartjs-tooltip td {
            padding: 6px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            color: #333; /* Text color for the tooltip content */
        }
       /* Tooltip Styling */
        #chartjs-tooltip {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.15);
            padding: 8px;
            max-width: 300px;
        }

        #chartjs-tooltip table {
            width: 100%;
            border-collapse: collapse;
           
        }

        #chartjs-tooltip th {
            font-weight: bold;
            background-color: #f9f9f9;
            padding: 8px;
        }

        #chartjs-tooltip td {
            padding: 6px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        #chartjs-tooltip td:first-child {
            text-align: left;
        }
      
            
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

        /*홈 아이콘*/
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
         .dropdown:hover .dropbtn{
            background-color: #3e8e41;
        } 

    /* -----------------------------------------------------------------------------------------*/ /* 외관 틀 */
    /* 그래프 툴팁 시 열리는 테이블 틀 잡는 코드 */
        table, th, tr, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        th, td {
            padding: 5px;
        }

        td {
            text-align: center;
        }

        .forgot a {
            white-space: pre;
        }

        /* -----------------------------------------------------------------------------------------*/
        @import url(https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700);

        body {
            font-family: 'Josefin Slab', serif;
            font-size: 20px;
            line-height: 24px;
            color: #333;
            background-color: #212A3E;
            overflow-y: scroll;
        }

        a,
        a:visited {
            text-decoration: none;
            color: #00AE68;
        }

        .clear {
            clear: both;
        }

        .articleTitle {
            font-size: 1.15em;
            font-weight: 700;
            line-height: 1em;
            color: #222;
            text-align: center;
        }

        .wrapper {
            width: 600px;
            margin: 20px auto;
        }

        .container {
            text-align: center;
            padding-top: 1em;
            margin-top: 1em;
            border-top: solid 1px #CCC;
        }

        .button-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin: 5px;
        }

        a.button {
            display: block;
            position: relative;
            float: left;
            width: 120px;
            padding: 0;
            margin: 10px 20px 10px 0;
            font-weight: 600;
            text-align: center;
            line-height: 50px;
            color: #FFF;
            border-radius: 5px;
            transition: all 0.2s;
        }

        .btnBlueGreen {
            background: #00AE68;
        }

        .btnLightBlue {
            background: #5DC8CD;
        }

        .btnOrange {
            background: #FFAA40;
        }

        .btnPurple {
            background: #A74982;
        }

        .btnBrown {
            background: #74542d;
        }

        .btnBlueGreen.btnPush {
            box-shadow: 0px 5px 0px 0px #007144;
        }

        .btnLightBlue.btnPush {
            box-shadow: 0px 5px 0px 0px #1E8185;
        }

        .btnOrange.btnPush {
            box-shadow: 0px 5px 0px 0px #A66615;
        }

        .btnPurple.btnPush {
            box-shadow: 0px 5px 0px 0px #6D184B;
        }

        .btnBrown.btnPush {
            box-shadow: 0px 5px 0px 0px #382816;
        }

        .btnPush:hover {
            margin-top: 15px;
            margin-bottom: 5px;
        }

        .btnBlueGreen.btnPush:hover {
            box-shadow: 0px 0px 0px 0px #007144;
        }

        .btnLightBlue.btnPush:hover {
            box-shadow: 0px 0px 0px 0px #1E8185;
        }

        .btnOrange.btnPush:hover {
            box-shadow: 0px 0px 0px 0px #A66615;
        }

        .btnPurple.btnPush:hover {
            box-shadow: 0px 0px 0px 0px #6D184B;
        }
        .btnBrown.btnPush:hover{
            box-shadow: 0px 0px 0px 0px #382816;
        }
        
 .homeicon {
      margin: 28px 0;
      width: 17%;
      height: 17%;
      margin-right: 70%;
    }

    .myicon {
      width: 20%;
      height: 20%;
      margin: 18px 25px;
      margin-left: 75%;
    }
      
       .dropbtn {
      background-color: transparent;
      border: 0;
    }

    .dropdown {
      position: relative;
      display: inline-block;
    }

    .dropdown-content {
      display: none;
      position: absolute;
      background-color: #f9f9f9;
      min-width: 160px;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      z-index: 1;
      right: 0;
    }

    .dropdown-content a {
      color: black;
      padding: 12px 16px;
      text-decoration: none;
      display: block;
    }

    .dropdown-content a:hover {
      background-color: #f1f1f1;
    }

    .dropdown:hover .dropdown-content {
      display: block;
    }
      
        .hidden {
            display: none;
        }

        .joinForm {
            position: absolute;
            width: 120%;
            height: 120%;
            max-width: 900px;
            max-height: 370px;
            padding: 30px;
            background-color: #f8f6f4;
            text-align: center;
            top: calc(50% + 4cm);
            /* 변경된 부분: 10cm에서 5cm로 변경 (숫자가 커질수록 joinForm 이 내려감) */
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 15px;
        }

        #prev-button {
            margin-right: 20px;
            height: 50px;
            display: inline-flex;
            /* Display the buttons in a row */
            align-items: center;
            border: none;
            /* Remove the border */
            outline: none;
            /* Remove the outline */
            background: transparent;
            /* Make the background transparent */
            cursor: pointer;
        }

        #next-button {
            margin-left: 20px;
            height: 50px;
            /* Match the height of the buttons */
            display: inline-flex;
            /* Display the buttons in a row */
            align-items: center;
            border: none;
            /* Remove the border */
            outline: none;
            /* Remove the outline */
            background: transparent;
            /* Make the background transparent */
            cursor: pointer;
        }

           #chartList {
      margin-bottom: 20px;
    }
      
      
      #prev-button {
            margin-right: 20px;
            height: 50px;
            display: inline-flex;
            /* Display the buttons in a row */
            align-items: center;
            border: none;
            /* Remove the border */
            outline: none;
            /* Remove the outline */
            background: transparent;
            /* Make the background transparent */
            cursor: pointer;
        }

        #next-button {
            margin-left: 20px;
            height: 50px;
            /* Match the height of the buttons */
            display: inline-flex;
            /* Display the buttons in a row */
            align-items: center;
            border: none;
            /* Remove the border */
            outline: none;
            /* Remove the outline */
            background: transparent;
            /* Make the background transparent */
            cursor: pointer;
        }
      
        #prev-button:hover,
        #next-button:hover {
            background-color: #ececec;
            /* Add a background color on hover */
        }

        .button a {
            margin: 5px;
            /* Add spacing between buttons */
          
          
        }
      
      /* Add these styles to change the chart colors */
    .chart-container {
      position: relative;
      height: 50vh;
      width: 80vw;
    }

    /* Color palette for the bar chart */
    :root {
      --color1: rgba(75, 192, 192, 0.6);
      --color2: rgba(255, 159, 64, 0.6);
      --color3: rgba(153, 102, 255, 0.6);
      --color4: rgba(255, 205, 86, 0.6);
      --color5: rgba(201, 203, 207, 0.6);
    }
         .chart-container {
      position: relative;
      height: 90vh; /* Adjust the height of the chart container */
      width: 100vw; /* Adjust the width of the chart container */
    }
   .chart-container {
      position: relative;
      height: 80vh; /* Adjust the height as desired (e.g., 80vh, 90vh, etc.) */
      width: 90vw; /* Adjust the width as desired (e.g., 90vw, 100vw, etc.) */
    }
       /* Additional styles for table lists */
        .table-list {
            margin-top: 20px;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.15);
            max-width: 300px;
        }

        .table-list h2 {
            text-align: center;
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .table-list table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        .table-list th,
        .table-list td {
            padding: 6px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .table-list th {
            font-weight: bold;
            background-color: #f9f9f9;
        }

        .table-list td:first-child {
            text-align: left;
        }
      
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
 
     <div id="center">
        <div id="header">
            <div class="dropdown" style="float: left;">
                <button class="dropbtn">
                    <a href="/web"><img class="homeicon" src="resources/img/house.svg"></a>
                </button>
                <!-- <div class="dropdown-content" style="left: 0;">
                    <a href="#">링크#1</a>
                </div> -->
            </div>
            <div class="dropdown" style="float: right;">
                <button class="dropbtn"><img class="myicon" src="resources/img/user.svg"></button>
                <div class="dropdown-content"> <!-- 우측 상단 메뉴바 -->
                    <a href="#">개인정보수정</a>
                    <a href="#">문자 발송 내역</a>
                    <a href="#">로그아웃</a>
                    <a href="#">회원탈퇴</a>
                </div>
            </div>    
        </div>
        <br><br><br><br>
        <!-- 여기서 작업하면됨 -->
  </head>
  <body>
  

   

   <!-- ----------------------------------------------------------------------------------------------- -->
   <h1 class="articleTitle">WEEK-REPORT</h1>
   <input type = "hidden" value = "${user_data.id }" id = "username">
    <a>${user_data.id }</a> 
    <div id="resultDiv">ㅇㅇㅇ</div>
   
   <div class="chart-container">
       
        <div class="button-container">
            <button id="prev-button" class="arrow-button">◄ </button>
    
            <!-- 느낌 상, 05,06 버튼도 추가해야함(아니면 1월, 2월, 3월 ... 로 가는 방법도 고려) -->
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(1,1); return false;">1월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(1,2); return false;">1월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(1,3); return false;">1월 3주차</a>
            
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(1,4); return false;">1월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(1,5); return false;">1월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(2,1); return false;">2월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(2,2); return false;">2월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(2,3); return false;">2월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(2,4); return false;">2월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(2,5); return false;">2월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(3,1); return false;">3월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(3,2); return false;">3월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(3,3); return false;">3월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(3,4); return false;">3월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(3,5); return false;">3월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(4,1); return false;">4월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(4,2); return false;">4월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(4,3); return false;">4월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(4,4); return false;">4월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(4,5); return false;">4월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(5,1); return false;">5월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(5,2); return false;">5월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(5,3); return false;">5월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(5,4); return false;">5월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(5,5); return false;">5월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(6,1); return false;">6월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(6,2); return false;">6월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(6,3); return false;">6월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(6,4); return false;">6월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(6,5); return false;">6월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(7,1); return false;">7월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(7,2); return false;">7월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(7,3); return false;">7월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(7,4); return false;">7월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(7,5); return false;">7월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(8,1); return false;">8월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(8,2); return false;">8월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(8,3); return false;">8월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(8,4); return false;">8월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(8,5); return false;">8월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(9,1); return false;">9월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(9,2); return false;">9월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(9,3); return false;">9월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(9,4); return false;">9월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(9,5); return false;">9월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(10,1); return false;">10월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(10,2); return false;">10월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(10,3); return false;">10월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(10,4); return false;">10월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(10,5); return false;">10월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(11,1); return false;">11월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(11,2); return false;">11월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(11,3); return false;">11월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(11,4); return false;">11월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(11,5); return false;">11월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick="mon_week(12,1); return false;">12월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick="mon_week(12,2); return false;">12월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick="mon_week(12,3); return false;">12월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick="mon_week(12,4); return false;">12월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick="mon_week(12,5); return false;">12월 5주차</a>
    
            <button id="next-button" class="arrow-button">►</button>
        </div>
     
        <div class="clear"></div>
    </div>
    
    <form action="#" class="joinForm" onsubmit="return false;">
        <div>
            <canvas id="myChart"></canvas>
        </div>
    </form>
    
    
    
    
    
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
    
    let username = document.getElementById('username').value;
    var event_count = [];
    var event_day_count=[];
    function mon_week(mon, week) {
        console.log("버튼이 클릭되었습니다! 정보:", mon, week);
        $.ajax({
           url : "mon_week",
           type: "post",
           data:{"mon":mon,"week":week,"username":username},
           success:function(data){
              console.log("차트데이터불러오기성공")
              console.log("FRI 값: " + data.fri_sleep);
              event_count = [
                  data.sun,
                  data.mon,
                  data.tue,
                  data.wed,
                  data.thu,
                  data.fri,
                  data.sat
                ];
              event_day_count=[
            	  data.fri_sleep,
            	  data.fri_nolook
              ];
              
				useEventData();
           },
           error: function() {
             console.log("차트데이터불러오기실패");
           }
         });
       }
    
    

       
    function displayData(data) {
        var resultDiv = document.getElementById("resultDiv");
        resultDiv.innerHTML = "이벤트 내용: " + data + "<br>이벤트 날짜: " + data;
    }
         
     // 화살표 누르면 버튼이 넘어가는 기능을 가진 script 코드
     const buttonContainer = document.querySelectorAll(".button");
     //alert("test: " + buttonContainer.length);
     
     let currentMonthIndex = 0;
     const buttonsPerSet = 5;
     
       
     function showCurrentSetButtons() {
     buttonContainer.forEach((ind, index) => {
     ind.style.display = (index >= currentMonthIndex && index < currentMonthIndex + buttonsPerSet ? 'block' : 'none');
     });
     }
     
     function showPreviousButtons() {
     currentMonthIndex -= buttonsPerSet;
     if (currentMonthIndex < 0) {
     currentMonthIndex = 0;
     }
     showCurrentSetButtons();
     }
     
     function showNextButtons() {
     currentMonthIndex += buttonsPerSet;
     if (currentMonthIndex >= buttonContainer.length) {
     currentMonthIndex = buttonContainer.length - buttonsPerSet;
     }
     showCurrentSetButtons();
     }
     
     showCurrentSetButtons();
     
     document.getElementById('prev-button').addEventListener('click', showPreviousButtons);
     document.getElementById('next-button').addEventListener('click', showNextButtons);
     
     
     <!-- ----------------------------------------------------------------------------------------------- -->

       
         const ctx = document.getElementById('myChart');
         
         function useEventData() {
         var week_label = new Array("일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일");
         //알림 명
         var event_label = '금일 알림 수';
         //알림 수
         //날짜 지정
         var week_day ='2023-07-23';
         //시작 시간 명
         
         
         
         
       	
         // X축 레이블에 요일명 사용하기
        	 new Chart(ctx, {
        	   type: 'bar',
        	   data: {
        	     labels: week_label, // 숫자를 요일명으로 변환하여 사용
        	     datasets: [
        	       {
        	         label: event_label,
        	         data: event_count,
        	         backgroundColor: [
        	           '#BE81F7',
        	           '#F3F781',
        	           '#FF8000',
        	           '#2ECCFA',
        	           '#00FF40',
        	           '#FA5858',
        	           '#FF8000'
        	         ],
        	         borderWidth: 1
                 },
             ],
           },
           options: {
             plugins: {
               
                 tooltip: {
                     // "on-canvas tooltip"을 비활성화
                     
                   

                     external: function(context) {
                         // 툴팁 요소
                         let tooltipEl = document.getElementById('chartjs-tooltip');

                         // 첫 번째 렌더링 시에 요소를 생성하는 코드
                         if (!tooltipEl) {
                             tooltipEl = document.createElement('div');
                             tooltipEl.id = 'chartjs-tooltip';
                             tooltipEl.innerHTML = '<table>';
                             document.body.appendChild(tooltipEl);
                         }
                       
                         // 툴팁이 없는 경우에는 해당 요소를 숨겨라!!
                         const tooltipModel = context.tooltip;
                         if (tooltipModel.opacity === 0) {
                             tooltipEl.style.opacity = 0;
                             return;
                         }

                         // 특정 입력 요소 내에서 커서 위치 설정하는 코드
                         tooltipEl.classList.remove('above', 'below', 'no-transform');
                         if (tooltipModel.yAlign) {
                             tooltipEl.classList.add(tooltipModel.yAlign);
                         } else {
                             tooltipEl.classList.add('no-transform');
                         }

                         function getBody(bodyItem) {
                             return bodyItem.lines;
                         }

                         // 특정 요소의 텍스트 내용을 설정하는 코드
                         if (tooltipModel.body) {
                             const titleLines = tooltipModel.title || [];
                             const bodyLines = tooltipModel.body.map(getBody);
                      // 툴팁 관련 정의된 변수들 있는 위치
                             let innerHtml = '';
                             titleLines.forEach(function(title) {
                                 innerHtml += '<tr><th colspan=5>'+ week_day + ' (' + title + ')' + '</th></tr>';
                             });
                             

                             bodyLines.forEach(function(body, i) {
                                 const colors = tooltipModel.labelColors[i];
                                 let style = '';
                                 style += ' border-color:' + colors.borderColor;
                                style += '; border-width: 10px'; 
                               const span = '<span style="' + style + '">' + body + '</span>'; 
                                 
                                 var regex = /[^0-9]/g;            // 숫자가 아닌 문자열을 선택하는 정규식
                                 var result = body[0].replace(regex, "");
                                 
                                 for(var j=1; j<=7; j++){ // j=순번  
                                     innerHtml += '<tr>';
                                     innerHtml += '<td>'+ j + '</td>';
                                     innerHtml += '<td>'+ '졸음운전 : ' + '</td>';
                                     innerHtml += '<td>'+ event_day_count[0] + '</td>';
                                     innerHtml += '<td>'+ '주시태만 : ' + '</td>';
                                     innerHtml += '<td>'+ event_day_count[1] + '</td>';
                                    
                                 }
                                  
                             });
                              

                             let tableRoot = tooltipEl.querySelector('table');
                             tableRoot.innerHTML = innerHtml
                             
                         }

                         const position = context.chart.canvas.getBoundingClientRect();
                         const bodyFont = Chart.helpers.toFont(tooltipModel.options.bodyFont);

                         //  폰트 표시, 배치, 스타일 설정코드
                         tooltipEl.style.opacity = 1;
                         tooltipEl.style.position = 'absolute';
                         tooltipEl.style.left = position.left + window.pageXOffset + tooltipModel.caretX + 'px';
                         tooltipEl.style.top = position.top + window.pageYOffset + tooltipModel.caretY + 'px';
                         tooltipEl.style.font = bodyFont.string;
                         tooltipEl.style.padding = tooltipModel.padding + 'px ' + tooltipModel.padding + 'px';
                         tooltipEl.style.pointerEvents = 'none';
                         
                     }
                 }
             }
          }
         })};
    </script>
  </body>
</html>