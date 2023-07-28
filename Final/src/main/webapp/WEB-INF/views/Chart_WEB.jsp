<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/navicover.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/recordcss.css"/>
</head>

     <div id="center">
        <div id="header">
            <div class="dropdown" style="float: left;">
                <button class="dropbtn">
                    <img class="homeicon" src="resources/image/home (2).png">
                </button>
                <!-- <div class="dropdown-content" style="left: 0;">
                    <a href="#">링크#1</a>
                </div> -->
            </div>
            <div class="dropdown" style="float: right;">
                <button class="dropbtn"><img class="myicon" src="resources/image/user (2).png"></button>
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

<body>

	   <h1 class="articleTitle">WEEK-REPORT</h1> 
   
   <div class="chart-container">
       
        <div class="button-container">
            <button id="prev-button" class="arrow-button">◄ </button>
    
            <!-- 느낌 상, 05,06 버튼도 추가해야함(아니면 1월, 2월, 3월 ... 로 가는 방법도 고려) -->
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(1,1)>1월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(1,2)>1월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(1,3)>1월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(1,4)>1월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(1,5)>1월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(2,1)>2월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(2,2)>2월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(2,3)>2월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(2,4)>2월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(2,5)>2월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(3,1)>3월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(3,2)>3월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(3,3)>3월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(3,4)>3월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(3,5)>3월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(4,1)>4월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(4,2)>4월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(4,3)>4월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(4,4)>4월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(4,5)>4월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(5,1)>5월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(5,2)>5월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(5,3)>5월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(5,4)>5월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(5,5)>5월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(6,1)>6월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(6,2)>6월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(6,3)>6월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(6,4)>6월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(6,5)>6월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(7,1)>7월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(7,2)>7월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(7,3)>7월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(7,4)>7월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(7,5)>7월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(8,1)>8월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(8,2)>8월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(8,3)>8월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(8,4)>8월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(8,5)>8월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(9,1)>9월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(9,2)>9월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(9,3)>9월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(9,4)>9월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(9,5)>9월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(10,1)>10월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(10,2)>10월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(10,3)>10월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(10,4)>10월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(10,5)>10월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(11,1)>11월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(11,2)>11월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(11,3)>11월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(11,4)>11월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(11,5)>11월 5주차</a>
            
            <a href="" title="Button push blue/green" class="button btnPush btnBlueGreen" onclick=mon_week(12,1)>12월 1주차</a>
            <a href="" title="Button push lightblue" class="button btnPush btnLightBlue" onclick=mon_week(12,2)>12월 2주차</a>
            <a href="" title="Button push orange" class="button btnPush btnOrange" onclick=mon_week(12,3)>12월 3주차</a>
            <a href="" title="Button push purple" class="button btnPush btnPurple" onclick=mon_week(12,4)>12월 4주차</a>
            <a href="" title="Button push Brown" class="button btnPush btnBrown" onclick=mon_week(12,5)>12월 5주차</a>
    
            <button id="next-button" class="arrow-button">►</button>
        </div>
     
        <div class="clear"></div>
    </div>
    
    <form action="#" class="joinForm">
        <div>
            <canvas id="myChart"></canvas>
        </div>
    </form>
    
    <script>
    
    function mon_week(month, week) {
       console.error("버튼이 클릭되었습니다! 정보:", month, week);
       $.ajax({
          url : "mon_week",
          type: "post",
          data:{month:month,week:week},
          success:function(){
             
          }, error : function(){
             
          }
       });
      
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

        var week_label = new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat');
        //알림 명
        var event_label = '금일 알림 수';
        //알림 수
        var event_count = new Array(4, 7, 3, 5, 2, 3, 2);
        //날짜 지정
        var week_day ='2023-07-25';
        //시작 시간 명
        var start_label = 'Start';
        //시작 시간
        var start_time = '13:00';
        //종료 시간 명
        var end_label = 'End';
        //종료 시간
        var end_time = '17:00';
        //발생 시간 명
        var event_label = 'Event';
        //발생 시간
        var event_time = '15:30';
        //발생 이유 명
        var reason_label = 'Reason';
        //발생 이유
        var reason_name = '졸음'


        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: week_label,
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
                   
                   ], borderWidth: 1
                  
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
                            innerHtml += '<tr><th>No</th><th>'+start_label+'</th><th>'+end_label+'</th><th>'+event_label+'</th><th>'+reason_label+'</th></tr>';
                            

                            bodyLines.forEach(function(body, i) {
                                const colors = tooltipModel.labelColors[i];
                                let style = '';
                                style += ' border-color:' + colors.borderColor;
                               style += '; border-width: 10px'; 
                              const span = '<span style="' + style + '">' + body + '</span>'; 
                                
                                var regex = /[^0-9]/g;            // 숫자가 아닌 문자열을 선택하는 정규식
                                var result = body[0].replace(regex, "");
                                
                                for(var j=1; j<=result; j++){ // j=순번  
                                    innerHtml += '<tr>';
                                    innerHtml += '<td>'+ j + '</td>';
                                    innerHtml += '<td>'+ start_time +'</td>';
                                    innerHtml += '<td>'+ end_time + '</td>';
                                    innerHtml += '<td>'+ event_time + '</td>';
                                    innerHtml += '<td>'+ reason_name + '</td>';
                                   
                                }
                                 
                            });
                             

                            let tableRoot = tooltipEl.querySelector('table');
                            tableRoot.innerHTML = innerHtml;
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
        });
      </script>

</body>
</html>