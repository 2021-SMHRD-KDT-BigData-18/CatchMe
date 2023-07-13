<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .chartContainer {
            margin-top: 2cm; /* 히스토그램 - 아래로 2cm 이동 */
        }

        .hidden-info {
            display: none; /* 초기에 테이블 숨기기 */
        }
/* ---------------------------------- TABLE ----------------------------------------- */

        .table-container {
            height: 300px; /* 테이블 너비 조절 */
            overflow-y: auto;
        }

        table {
            border-collapse: collapse;
            width: 60%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

 /* --------------------------------------------------------------------------------- */   


    </style>
    
     <script>
        window.onload = function () {

            var chart = new CanvasJS.Chart("chartContainer", {
                animationEnabled: true,
                theme: "light2", // "light1", "light2", "dark1", "dark2"
                title: {
                    text: "Week-Records"
                },
                axisY: {
                  /*  title: "Reserves(MMbbl)"  */ 
                  minimum: 1, 
                  maximum: 10
                },
                data: [{        
                    type: "column",  
                  //  showInLegend: true, 
                 //   legendMarkerColor: "grey",
                 //   legendText: "MMbbl = one million barrels",
                    dataPoints: [      
                        { y: 5, label: "Sun" },
                        { y: 4, label: "Mon" },
                        { y: 2, label: "Tue" },
                        { y: 2, label: "Wed" },
                        { y: 4, label: "Thr" },
                        { y: 7, label: "Fri" },
                        { y: 6, label: "Sat" },
               //       { y: 3, label: "All" }
                    ]
                }]
            });
            chart.render();

            // 폼에서 날짜 선택 시 테이블 표시 함수
            var form = document.querySelector('form[name="해당 폼의 이름"]');
            form.addEventListener('change', function (event) {
                var selectedDate = event.target.value;
                showTable(selectedDate);
            });

            // 테이블 표시 함수
            function showTable(selectedDate) {
                var table = document.getElementById("info");
                table.classList.remove("hidden-info"); // 테이블 표시

                // 선택된 날짜에 따라 데이터를 가져와서 테이블에 동적으로 추가
                var row = table.insertRow();
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                cell1.innerHTML = "1";
                cell2.innerHTML = "12:00:00 PM";
                cell3.innerHTML = "12:30:00 PM";
                cell4.innerHTML = "광주 남구 송원로 60 cgi 센터"; // 그냥 썻음

                
            }
        }
    </script>
    
    
</head>

<body>
 <!-- 달력 -->
    <form name="해당 폼의 이름" action="값을 보낼 주소" method="post">
        <input type='date' name='userBirthday' value=""/>
    </form>

    <table id="info" class="hidden-info">
        <tr>
            <th>No</th>
            <th>Start</th>
            <th>End</th>
            <th>Event</th>
        </tr>
    </table>

    <!-- 히스토그램 -->
    <div class="chartContainer" id="chartContainer" style="height: 400px; width: 60%;"></div>
    <script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
</body>
</html>