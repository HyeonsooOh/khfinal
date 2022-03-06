<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            text-align: center;
            overflow: scroll;
        }

        /* step2일 때 */
        /* 선택사항에 대한 요소 속성 */
        .serviceMenu {
            display: inline-block;
            width : 30%;
            height : 90%;
            vertical-align: top;
        }
        /* 선택한 사항들이 들어가는 div 속성 */
        #insert {
            overflow: auto; 
            overflow-x:hidden;
            width:100%;
            height:85%;
            border: 1px solid black;
        }


        /* 요구사항에 대한 요소 속성 */
        .requestMenu {
            display: inline-block;
            margin-left: 15%;
            width : 30%;
            height : 16%;
        }

        /* selectMenu안에 laundryType/laundryPrice속성 */
        /* 세탁 대분류 속성 */
        .laundryType {
            margin-left : 2%;
            margin-top: 2%;
            width : 40%;
            height : 15.5%;
            display: inline-block;
            vertical-align: top;
        }
        /* 생활빨래 상세정보 속성 */
        .laundryPrice1 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            height : 12.5%;
            display: inline-block;
        }
        /* 침구류 상세정보 속성 */
        .laundryPrice2 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            height : 22%;
            display: inline-block;
        }

        /* 신발 상세정보 속성 */
        .laundryPrice3 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            height : 20%;
            display: inline-block;
        }

        /* 드라이 상세정보 속성 */
        .laundryPrice4 {
            margin-left: 7%;
            margin-top: 2%;
            width : 40%;
            height : 30%;
            display: inline-block;
        }


        /* laundryPrice안에 테이블 속성 */
        .priceTable {
            width : 100%;
            height : 100%;   
        }
        /* td에 수량쪽 input태그 */
        td>input[type=number] {
            width : 50%;
        }

        /* 각 상세사항에 대한 tr태그에 대한 속성 */
        /* 생활빨래에 마우스 올렸을 시 속성 */
        .washing tr:hover {
            cursor: pointer;
            background-color: #5995dd;
            color: white;
        }
        .detailWashing tr:hover {
            cursor: pointer;
        }

        /* 침구류에 마우스 올렸을 시 속성 */
        .bedding tr:hover {
            cursor: pointer;
            background-color: #5995dd;
            color: white;
        }
        .detailBedding tr:hover {
            cursor: pointer;
        }

        /* 신발에 마우스 올렸을 시 속성 */
        .shoes tr:hover {
            cursor: pointer;
            background-color: #5995dd;
            color: white;
        }
        .detailShoes tr:hover {
            cursor: pointer;
        }

        /* 드라이클리닝에 마우스 올렸을 시 속성 */
        .dry tr:hover {
            cursor: pointer;
            background-color: #5995dd;
            color: white;
        }
        .detailDry tr:hover {
            cursor: pointer;
        }




        /* 생활빨래 옵션 클릭시 바뀌는 속성 */
        .clickWashing {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 생활빨래 클릭시 바뀌는 속성*/
        .washingLaundry {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 생활빨래 옵션 클릭시 바뀌는 속성 */
        .clickWashing {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 침구류 클릭시 바뀌는 속성*/
        .beddingLaundry {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }
        
        /* 침구류 옵션 클릭시 바뀌는 속성 */
        .clickBedding {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 신발 클릭시 바뀌는 속성*/
        .shoesLaundry {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }
        
        /* 신발 옵션 클릭시 바뀌는 속성 */
        .clickShoes {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }

        /* 드라이 클릭시 바뀌는 속성*/
        .dryLaundry {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }
        
        /* 드라이 옵션 클릭시 바뀌는 속성 */
        .clickDry {
            animation : bgColor 0.5s both;
        }
        @keyframes bgColor {
            from {background-color:#E6E6E6;}
            to {background-color: #5995dd; color:white;}
        }


        /* 선택된 수선속성들을 추가하는 버튼 속성(클래스는 같고 아이디값이 각자 다르다) */
        .insertButton {
            width : 15%;
            height : 80%;
            background-color: #5995dd;
            color : white;
            border-radius: 15px;
            border: 0;
        }
        .insertButton:hover {
            cursor: pointer;
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
        }
        /* 다음단계에 버튼 올렸을 시 */
        .nextstep:hover {
            cursor: pointer;
            background-color: white;
            color :#5995dd;
        }
        
        .reset:hover {
            cursor: pointer;
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
    <jsp:include page="../common/manubar.jsp"></jsp:include>
    <div class="content">
        <div class="main">
            <div class="stage">
                <div class="titleStep">
                    <b>예약/결제</b>
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
                <legend><b>step2</b></legend>
                <div class="selectMenu">
                	<form action="${pageContext.request.contextPath}/reserve/laundryDay.rs" style="height:16%;" method="post">
	                    <div class="serviceMenu">
	                        <div style="font-weight: 600; text-align:center">선택한 서비스</div>
	                        <div id="insert" style="text-align:left">
	                        	<span style="font-size: 7px; margin-left:30px;">대분류</span>
	                            <span style="font-size: 7px; margin-left:85px;">소분류</span>
	                            <span style="font-size: 7px; margin-left:65px;">금액</span>
	                            <br>
	                        </div>
	                    </div>
	                    <div class="requestMenu">
	                        <div style="font-weight: 600; text-align:center">요구사항</div>
	                        <textarea name="request" cols="44" rows="5" class="request" style="resize: none;" placeholder="선택한 사항에 대한 요구사항을 작성하세요"></textarea>
	                        <input type="hidden" value="${ resType }" name="resType">
	                        <button type="submit" style="display : none;" id="hiddenButton">123</button>
	                    </div>
                    </form>
                    <table class="laundryType">
                        <thead class="washing">
                        <tr id="washing">
                            <th align="left">생활빨래</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left">
                                용량 단위 물빨래 서비스로 봉투에 담아주신 그대로 물세탁하고 깔끔하게 개어 드리는 상품입니다.
                                수건,잠옷,양말 등을 담아주세요. 용량 단위로 과금되므로 일반 봉투를 이용하셔도 됩니다. 
                            </td>
                        </tr>
                        <tr>
                            <td id="checkWashing" height="40">
                                
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice1">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left">품목</th>
                                <th width="100" align="right">기본요금</th>
                            </tr>
                            </thead>
                            <tbody class="detailWashing">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum < 200 }">
	                            	<tr>
		                                <td height="30" align="left">${ s.scategory }</td>
		                                <td align="right">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="bedding">
                        <tr id="bedding">
                            <th align="left">침구류</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left">
                                개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본 케어도 함께 진행합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkBedding" height="40">
                                
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice2">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left">품목</th>
                                <th width="100" align="right">기본요금</th>
                            </tr>
                            </thead>
                            <tbody class="detailBedding">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum > 200 && s.catNum < 300 }">
	                            	<tr>
		                                <td height="30" align="left">${ s.scategory }</td>
		                                <td align="right">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="shoes">
                        <tr id="shoes">
                            <th align="left">신발</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left">
                                개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본 케어도 함께 진행합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkShoes" height="40">
                                
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice3">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left">품목</th>
                                <th width="100" align="right">기본요금</th>
                            </tr>
                            </thead>
                            <tbody class="detailShoes">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum > 300 && s.catNum < 400 }">
	                            	<tr>
		                                <td height="30" align="left">${ s.scategory }</td>
		                                <td align="right">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <table class="laundryType">
                        <thead class="dry">
                        <tr id="dry">
                            <th align="left">드라이클리닝</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td align="left">
                                개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본 케어도 함께 진행합니다.
                            </td>
                        </tr>
                        <tr>
                            <td id="checkDry" height="40">
                                
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="laundryPrice4">
                        <table class="priceTable">
                            <thead>
                            <tr class="title">
                                <th width="100" height="30" align="left">품목</th>
                                <th width="100" align="right">기본요금</th>
                            </tr>
                            </thead>
                            <tbody class="detailDry">
                            <c:forEach var="s" items="${ list }">
                            	<c:if test="${ s.catNum > 400 && s.catNum < 500 }">
	                            	<tr>
		                                <td height="30" align="left">${ s.scategory }</td>
		                                <td align="right">
		                                	${ s.LPrice }
		                                	<input type="hidden" value="${ s.catNum }">
		                                </td>
	                            	</tr>
                            	</c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <br>
                    <button type="submit" class="nextstep" onclick="nextstep();">다음 단계</button>
                </div>
            </fieldset>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    
    <script>
        $(function () {
            var step = $("legend").text();
            $("."+step).css("background-color",'#5995dd').css("color", "white");

            /* 생활빨래 클릭시 이벤트 */
            $("#washing").click(function() {

                $(this).toggleClass("washingLaundry");
                
                $(".detailWashing tr").click(function() {
                    if($("#washing").hasClass("washingLaundry")) {
                        $(this).toggleClass("clickWashing");
                    }
                });

                if($("#washing").hasClass("washingLaundry")) {
                    $("#checkWashing").html("<button type='submit' class='insertButton' id='insertWashing' onclick='insertWashing();'>추가</button>");
                }
                else {
                    $("#checkWashing").empty();
                }
            });

            /* 침구류 클릭시 이벤트 */
            $("#bedding").click(function() {

                $(this).toggleClass("beddingLaundry");
                
                $(".detailBedding tr").click(function() {
                    if($("#bedding").hasClass("beddingLaundry")) {
                        $(this).toggleClass("clickBedding");
                    }
                });

                if($("#bedding").hasClass("beddingLaundry")) {
                    $("#checkBedding").html("<button type='submit' class='insertButton' id='insertBedding' onclick='insertBedding();'>추가</button>");
                }
                else {
                    $("#checkBedding").empty();
                }
            });

            /* 신발 클릭시 이벤트 */
            $("#shoes").click(function() {

                $(this).toggleClass("shoesLaundry");
                
                $(".detailShoes tr").click(function() {
                    if($("#shoes").hasClass("shoesLaundry")) {
                        $(this).toggleClass("clickShoes");
                    }
                });

                if($("#shoes").hasClass("shoesLaundry")) {
                    $("#checkShoes").html("<button type='submit' class='insertButton' id='insertShoes' onclick='insertShoes();'>추가</button>");
                }
                else {
                    $("#checkShoes").empty();
                }
            });

            /* 드라이 클릭시 이벤트 */
            $("#dry").click(function() {

                $(this).toggleClass("dryLaundry");
                
                $(".detailDry tr").click(function() {
                    if($("#dry").hasClass("dryLaundry")) {
                        $(this).toggleClass("clickDry");
                    }
                });

                if($("#dry").hasClass("dryLaundry")) {
                    $("#checkDry").html("<button type='submit' class='insertButton' id='insertDry' onclick='insertDry();'>추가</button>");
                }
                else {
                    $("#checkDry").empty();
                }
            });
        });
		
        var num = 0;
        
         /* 생활빨래 상세에서 추가 버튼 클릭시 이벤트 */
         function insertWashing() {
            var washing = document.getElementById("washing").innerText;
            console.log(washing);
            
            var repair1 = document.getElementsByClassName("clickWashing");
            if(repair1.length != 0) {
                console.log(repair1);
                
                console.log(repair1[0].children[1].children[0].value);

                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                	repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";      
                }
                console.log("repair : "+repair);
                var str = repair.split('/');
                console.log(str);

                
                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    console.log(str2);
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"'> <input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>"
                    													+"<input type='text' value="+washing+" style='width:27%; margin-left:1%;' name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; margin-left:1%;' name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%; margin-left:1%;' name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:3%; background: lightgray; border:1px solid black; ' id='"+num+"' class='reset'>취소</span> </div>";
					num = num + 1;                                                                        
                }
            
                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickWashing");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            
            document.getElementById("washing").classList.toggle('washingLaundry');
            document.getElementById("insertWashing").remove();

        }

         /* 침구류 상세에서 추가 버튼 클릭시 이벤트 */
         function insertBedding() {
            var bedding = document.getElementById("bedding").innerText;
            console.log(bedding);
            
            var repair1 = document.getElementsByClassName("clickBedding");
            if(repair1.length != 0) {
                console.log(repair1);
                
                console.log(repair1[0].children[1].children[0].value);

                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                    repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";      
                }
                console.log("repair : "+repair);
                var str = repair.split('/');
                console.log(str);

                
                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    console.log(str2);
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"'> <input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>" 
																		+"<input type='text' value="+bedding+" style='width:27%; margin-left:1%;' name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; margin-left:1%;' name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%; margin-left:1%;'  name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:3%; background: lightgray; border:1px solid black; ' id='"+num+"' class='reset'>취소</span> </div>";
					num = num + 1;
                }
            
                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickBedding");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            
            document.getElementById("bedding").classList.toggle('beddingLaundry');
            document.getElementById("insertBedding").remove();

        }

        /* 신발 상세에서 추가 버튼 클릭시 이벤트 */
        function insertShoes() {
            var shoes = document.getElementById("shoes").innerText;
            console.log(shoes);
            
            var repair1 = document.getElementsByClassName("clickShoes");
            if(repair1.length != 0) {
                console.log(repair1);
                
                console.log(repair1[0].children[1].children[0].value);

                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                    repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";   
                }
                console.log("repair : "+repair);
                var str = repair.split('/');
                console.log(str);

                
                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    console.log(str2);
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"'> <input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>"
                    													+"<input type='text' value="+shoes+" style='width:27%; margin-left:1%;' name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; margin-left:1%;' name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%; margin-left:1%;' name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:3%; background: lightgray; border:1px solid black; ' id='"+num+"' class='reset'>취소</span> </div>";
                    num = num + 1;
                }

                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickShoes");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            
            document.getElementById("shoes").classList.toggle('shoesLaundry');
            document.getElementById("insertShoes").remove();

        }

        /* 드라이클리닝 상세에서 추가 버튼 클릭시 이벤트 */
        function insertDry() {
            var dry = document.getElementById("dry").innerText;
            console.log(dry);
            
            var repair1 = document.getElementsByClassName("clickDry");
            if(repair1.length != 0) {
                console.log(repair1);
                
                console.log(repair1[0].children[1].children[0].value);

                var repair= "";
                for(var i=0; i<repair1.length; i++) {                    
                    repair += repair1[i].innerText+"\t"+repair1[i].children[1].children[0].value+"/";      
                }
                console.log("repair : "+repair);
                var str = repair.split('/');
                console.log(str);

                
                for(var j=0; j<(str.length-1); j++) {
                    var str2 = str[j].split('\t');
                    console.log(str2);
                    document.getElementById('insert').innerHTML += "<div id='reset"+num+"'> <input type='hidden' value="+str2[2]+" name='multiList["+num+"].catNum'>"
                    													+"<input type='text' value="+dry+" style='width:27%; margin-left:1%;' name='multiList["+num+"].mcategory'>"
                                                                        +"<input type='text' value="+str2[0]+" style='width:33%; margin-left:1%;' name='multiList["+num+"].scategory'>"
                                                                        +"<input type='text' value="+str2[1]+" style='width:17%; margin-left:1%;' name='multiList["+num+"].lPrice'>"
                                                                        +"<span onclick='reset(this);' style='font-size:13px; margin-left:3%; background: lightgray; border:1px solid black; ' id='"+num+"' class='reset'>취소</span> </div>";
                    num = num + 1;                                  
                }
            
                for(var t=0; t<3; t++) {
                    for(var z=0; z<repair1.length ;z++) {
                        repair1[z].classList.remove("clickDry");
                    }
                }
            }
            else {
                alert("옵션을 선택해야 합니다");
            }
            
            document.getElementById("dry").classList.toggle('dryLaundry');
            document.getElementById("insertDry").remove();

        }
    

        /* 서비스 선택사항에서 추가된 사항에서 취소 시키는 버튼을 클릭시  이벤트 */
        /*
        function reset() {
            document.getElementById("reset").remove();
        }
        */
        /* 중간에 취소하거나 해도 정상으로 name값이랑 div(id값) 들어가도록 */
        function reset(idValue) {
            console.log("buttonId : "+idValue.id);
            var no = (Number)(idValue.id); // 버튼아이디에 그 해당하는 num을 넣어놨다
            document.getElementById("reset"+no+"").remove();

            console.log("no : "+no);

            console.log(num);

            console.log(typeof no);

            for(var i=no; i<num-1; i++) {
            	console.log("i : "+i);
                console.log(document.getElementById('insert').children[i+4]);
                document.getElementById("insert").children[i+4].id = "reset"+i;
                document.getElementById("insert").children[i+4].children[0].name = "multiList["+i+"].catNum";
                document.getElementById("insert").children[i+4].children[1].name = "multiList["+i+"].mcategory";
                document.getElementById("insert").children[i+4].children[2].name = "multiList["+i+"].scategory";
                document.getElementById("insert").children[i+4].children[3].name = "multiList["+i+"].lPrice";
                document.getElementById("insert").children[i+4].children[4].id = no;
            }
            num = num - 1;
            console.log("num-1 : "+ num);
        }
         
        /* 다음단계버튼 눌렀을때 step3로 넘어가도록 hiddenButton 클릭되도록 */
        function nextstep() {
        	var button = document.getElementById("hiddenButton");
        	button.click();
        }
    </script>
</body>
</html>