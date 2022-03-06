<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
            border : 1px solid black;
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
            text-align: center;
        }


        /* step4 일 때 */
        /* selectMenu안에 totalPay와 payInfo속성 */
        .totalPay {
            display: inline-block;
            width : 28%;
            height : 90%;
        }
        /* totalpay안에 결제 관련 속성 (쿠폰함,선택내역 등등)  */
        .payment {
            width : 100%;
            height : 90%;
        }
        /* 결제금액 글씨 속성 */
        .payHeader {
            width : 100%;
            height : 10%;
            font-weight: 700;
            font-size: 25px;
            line-height: 75px;
        }

        /* 선택내역 및 선택요일 및 요청사항 전체 속성 */
        .payContent {
            width: 100%;
            height : 60%;
        }

        /* 선택내역 글씨 속성(selectList) */
        /* 선택 날짜 글씨 속성(dayList) */
        /* 요청사항 글씨 속성(requestList)*/
        .selectList, .dayList, .requestList { 
            width : 100%;
            height : 7%;
            font-size : 17px;
            font-weight: 600;
            line-height: 30px;
        }

        /* 선택한 요일을 보여주는 요소에 속성(days) */
        .days {
            width : 100%;
            height : 30%;
            line-height: 150px;
        }
        
        /* 쿠폰함과 결제금액/할인금액을 보여주는 요소 속성 */
      
        /* 결제금액/할인금액을 보여주는 요소 속성*/
       
        /* 최종 금액을 보여주는 요소 속성 */
        .finalPay {
            height : 10%;
            font-size: large;
            font-weight: 650;
            line-height: 100px;
        }


        /* 결제자 정보에 대한 전체 요소 속성 */
        .payerInfo {
            display: inline-block;
            width : 70%;
            height : 90%;
            vertical-align: top;
        }

        /* 결제정보/카드정보 전체를 보여주는 요소 속성 */
        .payInfo, .cardInfo {
            width : 100%;
            height : 45.5%;
        }

        /* 결제자 정보 글씨 속성 */
        .info1 {
            height : 9%;
            font-weight: 700;
            font-size: 25px;
            line-height: 75px;
        }

        /* 결제 정보, 카드 정보 글씨 속성 */
        .info2 {
            width : 100%;
            height : 7%;
            font-size : 17px;
            font-weight: 600;
            line-height: 30px;
        }


        /* 결제자정보에 input태그에 관련 속성 */
        .input {
            width : 15%;
            height : 7%;
            margin-top: 3%;
        }

        /* 다음단계 버튼 속성 */
        .nextstep {
            text-align: center;
            width : 10%;
            height : 5%;
            background-color: #5995dd;
            color: white;
            border : 0;
            border-radius: 15px;
            font-weight: 600;
            font-size: 20px;
            margin-top: 1%;
        }
        /* 다음단계에 버튼 올렸을 시 */
        .nextstep:hover {
            cursor: pointer;
            background-color: white;
            color :#5995dd;
        }

        
        

        /* footer 속성 */
        .footer {
            width : 100%;
            height : 15%;
            background-color: #bbb;
        }
    </style>
</head>
<body>
    <div class="header">
        header
    </div>
    <div class="content">
        <div class="main">
            <div class="stage">
                <div class="titleStep">
                    <b>구독 변경 / 결제</b>
                </div>
                <div class="step1">
                    <b>step 1</b> <br>
                    구독 변경         
                </div>
                <div class="step2">
                    <b>step 2</b> <br>
                    상세 설정
                </div>
                <div class="step3">
                    <b>step 3</b> <br>
                    날짜 변경
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
                <legend><b>step4</b></legend>
                <div class="selectMenu">
                    <div class="totalPay">
                        <div class="payment">
                            <div class="payHeader">결제 금액</div>
                            <div class="payContent">
                                <div class="selectList">선택 내역</div>
                                <textarea name="" cols="42" rows="5" style="resize: none;"></textarea>
                                <div class="dayList">선택 요일</div>
                                <form action="${pageContext.request.contextPath }/subscribe/subchangepay.sb" method="post">
                                <input type ="text" name = "subDay" value="${ subDay }">
                              </form>                 
                            </div>
                            <div class="finalPay">
                                <span>최종 금액</span>
                                <form action="${pageContext.request.contextPath }/subscribe/subq.sb">
                                <input type ="text" name = "price" value="${ price }">
                                </form>
                            </div>
                            <div class="payFooter">
                                <div class="payAmount">
                                </div>
                            </div>
                        </div>
                       
                    </div>
                    <div class="payerInfo">
                        <div class="info1">결제자 정보</div>
                        <div class="payInfo">
                            <div class="info2">결제 정보</div>
                            <span>이름</span><input type="text" name="" class="input" style="margin-left: 5%;"> <br>
                            <span>주소</span><input type="text" name="" class="input" style="margin-left: 5%;"> <br>
                            <span>이메일</span><input type="text" name="" class="input" style="margin-left: 3.5%;"> <br>
                            <span>전화번호</span><input type="text" name="" class="input" style="margin-left: 1.8%;">
                        </div>
                        <div class="cardInfo">
                            <div class="info2">카드 정보</div>
                            <span>카드번호</span><input type="text" class="input" style="margin-left: 2.9%;"> <br>
                            <span>CVC</span><input type="text" class="input" style="margin-left: 7%;"> <br>
                            <span>유효기간</span><input type="text" class="input" style="margin-left: 2.9%;"> <br>
                            <select name="" class="input">
                                <option value="">카드사 선택</option>
                                <option value="">현대카드</option>
                                <option value="">신한카드</option>
                                <option value="">롯데카드</option>
                                <option value="">국민카드</option>
                                <option value="">삼성카드</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="nextstep">다음 단계</button>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="footer">
        footer
    </div>

    <script>
        $(function() {
            var step = $("legend").text();
            $("."+step).css("background-color" , '#5995dd').css("color", "white");
        });
    </script>
</body>
</html>