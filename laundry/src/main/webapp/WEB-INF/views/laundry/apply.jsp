<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../common/util.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!-- 온라인 방식-->
    <style>
        /* 화면 전체 크기 */
        html,body {
            width : 100%;
            height : 1500px;
        }
        div {
            box-sizing: border-box;
        }

        /* header 속성 */
        .header {
            width : 100%;
            height : 15%;
            background-color: lightgray;
        }

        /* content 속성 */
        .content {
            width : 100%;
            height : 70%;
        }

        /* content안에 div(main)속성 */
        .main {
            width : 100%;
            height : 100%;
        }

        /* 클래스 main안에 인라인 속성으로 */
        .main>div, .main>fieldset {
            display: inline-block;
        }


        /* main안에 stage속성 */
        .stage {
            width : 18%;
            height : 100%;
            text-align: center;
            line-height: 75px;
            position : relative;
            font-size: 25px;
        }

        /* stage안에 step들 속성 */
        .titleStep {
            width : 100%;
            font-size: 40px;
            line-height: 50px;
            
        }
        .step1 {
            position: absolute;
            top : 6%;
            height : 15%;
            width : 100%;
        }
        .step2 {
            position: absolute;
            top : 21%;
            height : 15%;
            width : 100%;
        }
        .step3 {
            position: absolute;
            top : 36%;
            height : 15%;
            width : 100%;
        }
        .step4 {
            position: absolute;
            top : 51%;
            height : 15%;
            width : 100%;
        }
        .step5 {
            position: absolute;
            top : 66%;
            height : 15%;
            width : 100%;
        }
        /* step들의 hover속성 */
        div[class^=step]:hover {
            background-color: #5995dd;
            color : white;
            cursor: pointer;
        }

        /* legend에 step 글씨*/
        legend {
            font-size: 20px;
            width : auto !important;
            margin-left: 10px;
            padding: 5px;
        }



        /* main안에 select속성 */
        .select {
            vertical-align: top;
            width : 80%;
            height : 100%;
            box-sizing: border-box;
            background-color: #E6E6E6;
        }


        /* select속성에 selectMenu 속성 */
        .selectMenu {
            width : 100%;
            height : 100%;
        }



        /* 여기서 부터 바뀌는 내용*/
        /* step1일 때 */
        /* selectMenu안에 laundry/repair에 속성 */
        .laundry, .repair {
            display: inline-block;
            width : 40%;
            height: 40%;
            margin-left: 100px;
            margin-top: 10%;
            border: 1px solid black;
        }

        /* laundry/repair 각 이미지 속성 */
        .laundry>img, .repair>img {
            margin-left: 25%;
            margin-top: 10%;
            width : 50%;
            height: 50%;
        }

        /* laundry/repair 이미지 밑에 수선/세탁 신청 글씨 */
        .requestWashing, .requestRepair {
            height : 35%;
            text-align: center;
            font-weight: 700;
            line-height: 125px;
            font-size: 30px;
            border-top: 1px solid black;
        }

        div[class^=request]:hover, .laundry:hover, .repair:hover {
            cursor: pointer;
            background-color: white;
        }
        /* -------------여기까지 --------*/



        /* footer 속성 */
        .footer {
            width : 100%;
            height : 15%;
            background-color: #bbb;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>
    <div class="content">
        <div class="main">
            <div class="stage">
                <div class="titleStep">
                    <b>예약 / 결제</b>
                </div>
                <div class="step1">
                    <b>step 1</b> <br>
                    세탁 및 수선 신청             
                </div>
                <div class="step2">
                    <b>step 2</b> <br>
                    상세 설정
                </div>
                <div class="step3">
                    <b>step 3</b> <br>
                    날짜 선택
                </div>
                <div class="step4">
                    <b>step 4</b> <br>
                    결제 정보 작성
                </div>
                <div class="step5">
                    <b>step 5</b> <br>
                    결제 확인
                </div>
            </div>
            <fieldset style="border: 3px solid black;" class="select">
                <legend><b>step1</b></legend>
                <div class="selectMenu">
                    <div class="laundry" onclick="laundryStep2();">
                        <img src="/laundry/resources/image/laundry-icon.png">
                        <div class="requestWashing">세탁 신청</div>
                        <input type="hidden" name="laundry" value="세탁" id="laundry">
                    </div>
                    <div class="repair" onclick="repairStep2();">
                        <img src="/laundry/resources/image/repair-icon2.png">
                        <div class="requestRepair">수선 신청</div>
                        <input type="hidden" name="repair" value="수선" id="repair">
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
        /* 각 스텝별로 페이지에 사이드에 선택되도록 */
        $(function () {
            var step = $("legend").text();
            
            $("."+step).css("background-color" , '#5995dd').css("color", "white");
            
        });

        /* 빨래 step2로 이동*/
        function laundryStep2() {
            var laundry = document.getElementById("laundry").value;
            location.href= "${pageContext.request.contextPath}/reserve/detail.rs?resType="+laundry;
        }

        function repairStep2() {
            var repair = document.getElementById("repair").value;
            location.href="${pageContext.request.contextPath}/reserve/detail.rs?resType="+repair;
        }

    </script>
</body>
</html>