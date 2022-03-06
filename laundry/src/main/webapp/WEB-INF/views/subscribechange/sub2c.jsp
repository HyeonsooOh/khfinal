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
            height : 100%;
            background: rgb(248, 245, 244);/*css 추가*/
        }
        /**/
        .menubar{
	        background : white !important;
	        border-bottom : 1px solid black;
        }
        /**/
        #noMain {
        	background : rgb(248, 245, 244) !important;
        }
        
        /* content안에 div(main)속성 */
        .main {
            width : 100%;
            height : 100%;
            padding : 0 5rem; /**/
            padding-bottom : 5rem; /**/
        }

        /* 클래스 main안에 인라인 속성으로 */
        .main>div, .main>fieldset {
            display: inline-block;
        }

        /* main안에 step속성 */
        .stage {
            width : 18%;
            height : 97.5%;
            text-align: center;
            line-height: 75px;
            position : relative;
            font-size: 25px;
            /**/
            border-radius : 15px;
            background : white;
            margin-top : 22px;
            margin-right : 15px;
            /**/
        }

        /* stage안에 step들 속성 */
        .titleStep {
            width : 100%;
            font-size: 30px;
            line-height: 50px;
            
        }
        .STEP1 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /**/
            top : 6%;
            height : 12%;
            width : 100%;
        }
        .step2 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /**/
            top : 18%;
            height : 12%;
            width : 100%;
        }
        .step3 {
            position: absolute;
            border-bottom : 8px solid rgb(248, 245, 244); /**/
            top : 30%;
            height : 12%;
            width : 100%;
        }
        .step4 {
            position: absolute;
            top : 42%;
            height : 12%;
            width : 100%;
        }
      

        /* legend에 step 글씨*/
        legend {
            font-size: 20px;
            width : auto !important;
            margin-left : 10px;
            padding : 5px;
        }


        /* main안에 select속성 */
        .select {
            vertical-align: top;
            width : 80%;
            height : 100%;
            box-sizing: border-box;
            /**/
            background-color: white; /**/
            border-radius : 15px; /**/
            border : none; /**/
        }
        
        /* select속성에 selectMenu 속성 */
        .selectMenu {
            width : 100%;
            height : 100%;
            text-align: center;
            padding : 2rem;
        }



        /* 각 구독서비스 선택시 바뀔 속성 */
        .standard:hover, .basic:hover, .premium:hover {
            cursor: pointer;
            background-color: white;
        }
        /* 구독요금제 영역 속성(subscription) */
        .subscription {
            height : 50%;
            margin-left: 5%;
            margin-right: 5%;
        }

        .subscription>table {
            margin : 0 auto;
        }

        /* 구독 신청 글씨 속성(subscribe) */
        .subscribe {
            height : 10%;
            margin-left: 5%;
            margin-top: 1%;
            margin-right: 5%;
            font-size: 30px;
            font-weight: 600;
        }

        /* 바구니에 대한 설명 속성(explain) */
        .explain {
            width : 90%;
            margin-left: 5%;
            height : 25%;
            font-weight: 500;
           font-size: 1.3rem;
            margin-top: 5rem;
        }

        /* 다음단계 버튼 속성 */
        .nextstep {
            margin-top: 1%;
            text-align: center;
            width : 10%;
            height : 5%;
            background-color: #5995dd;
            color: white;
            border : 0;
            border-radius: 15px;
            font-weight: 600;
            font-size: 20px;
           position: absolute;    /*절대값으로 위치를 설정*/
            left: 50%px;    /* x축 */
            top: 680px;    /* y축 (작성하지 않는다면 원래의 위치로 설정됨 */
        }
        

        /* footer 속성 */
        .footer {
            width : 100%;
            height : 15%;
            background-color: #bbb;
        }
        /* 버튼 클릭시 이미지 변경 */
        .div2 {
        border: 1px solid;
        width: 100px;
        height: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .clicked {
        color: blue;
      }
      
       #sub-selection tr th,
        #sub-selection tr td{
         line-height: 47px;
    </style>
</head>
<body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

	<br><br>
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
                    날짜 변경
                </div>
                <div class="step3">
                    <b>step 3</b> <br>
                    결제 정보 작성
                </div>
                <div class="step4">
                    <b>step 4</b> <br>
                    변경 확인
                </div>
            </div>
            <fieldset class="select">
                <legend><b>step1</b></legend>
                <div class="selectMenu">
                   <div class="subscribe">구독 변경</div>
                   <div class="subscription">
                       <img src="" alt="">
                       <table class="table" id="sub-selection">
                           <tr>
                               <th width="200" height="70">요금제</th>
                               <td width="200" align="center">베이직</td>
                               <td width="180" align="center">스탠다드</td>
                               <td width="180" align="center">프리미엄</td>
                           </tr>
                           <tr>
                               <th width="100" height="70">바구니 크기</th>
                               <td width="200" align="center">30X30</td>
                               <td width="180" align="center">50X50</td>
                               <td width="180" align="center">70X70</td>
                           </tr>
                           <tr>
                               <th width="100" height="70">가격</th>
                               <td width="200" align="center">50,000원</td>
                               <td width="180" align="center">70,000원</td>
                               <td width="180" align="center">100,000원</td>
                           </tr>
                           <form action="${pageContext.request.contextPath }/subscribe/sub2c.sb" method="post" >
                           <tr>
                            <th width="100" height="70"></th>
                            <td width="200" align="center">
                            <input type='radio'
                                name='subOption' 
                                value='베이직/50000'
                                id='basic'/></td>
                            <td width="180" align="center"><input type='radio'
                                name='subOption' 
                                value='스탠다드/70000'
                                id='standard'/></td>
                            <td width="180" align="center"><input type='radio'
                                name='subOption' 
                                value='프리미엄/100000'
                                id='premium'/></td>
                        	</tr>
                        	<input type='hidden' value="${ subscribe.subDay }" name="subDay">
                        	<input type='hidden' value="${ subscribe.subEdate }" name="subEdate">
                        	<input type="submit" value="전송" class ="nextstep">
                        	</form>
                       </table>
                   <div class="explain">
                       <p> 
                       <br><br>
			                           구독 신청 시 구독 전용 세탁 바구니가 제공됩니다.<br>
			                           바구니 크기는 선택한 요금제별로 제공됩니다.
                       </p>
                   </div>
                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    
    <script>
        $(function () {
            var step = $("legend").text();
            $("."+step).css("background-color" , '#5995dd').css("color", "white");
            
            var service = "${ subscribe.subOption }";
            
            
         	// 베이직일때
            if(service == "베이직") {
                $("#basic").prop("checked", true);

                $("#basic").click(function() {
                    var result = window.confirm("이미 구독한 서비스입니다. 그래도 선택하시겠습니까?");

                    if(!result) {
                        $("#basic").prop("checked", false);
                    }
                });
            }
            else if(service == "스탠다드") {
                $("#standard").prop("checked", true);

                $("#standard").click(function() {
                    var result = window.confirm("이미 구독한 서비스입니다. 그래도 선택하시겠습니까?");
                    
                    if(!result) {
                        $("#standard").prop("checked", false);
                    }
                    
                });
            }
            else if(service == "프리미엄") {
                $("#premium").prop("checked", true);

                $("#premium").click(function() {
                    var result = window.confirm("이미 구독한 서비스입니다. 그래도 선택하시겠습니까?");

                    if(!result) {
                        $("#premium").prop("checked", false);
                    }
               });
            }
        });
        var div2 = document.getElementsByClassName("div2");

function handleClick(event) {
  console.log(event.target);
  // console.log(this);
  // 콘솔창을 보면 둘다 동일한 값이 나온다

  console.log(event.target.classList);

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("clicked");
    }
    event.target.classList.add("clicked");
  }
}
    </script>
</body>
</html>