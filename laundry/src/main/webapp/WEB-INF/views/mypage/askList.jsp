<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <style>
    
    
  
    html, body {
    	height: 100%;
    	overflow:hidden;
    }
    
      .mypage_container {
        width: 60%;
        margin: 0rem auto;
        padding: 1.5rem;
        position: relative;
      }
      
      .mypage_container h4{
      	position: absolute;
      	top: 2%;
      	font-weight: bold;
      	left: 40%;
      }
      .mypage_content {
     
      
        width:80%;
        margin: 4rem auto;
        
      }
      
    </style>
    <title>마이페이지</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

       <div class="mypage_container">
        <h4 >
         문의 내역
        </h4>
        <div class="mypage_content">
         <table class="table" id="ask_table" >
	        <thead>
	            <th>번호</th>
	            <th>날짜</th>
	            <th>종류</th>
	            <th>제목</th>
	            <th>답변완료</th>
	        </thead>
	        <tbody>
	        
	        <c:choose>
	        
	        	<c:when test="${!empty list }">
	        		<c:forEach var="i" items="${list }">
	        		      <tr id>
			                <td>${ i.askNum }</td>
			                	  	
      		  	    <fmt:parseDate value="${i.askDate }" var="adate" pattern="yyyy-MM-dd"/>
					<td><fmt:formatDate value="${ adate }" type="date" dateStyle="long"/> </td>
			                <td>${ i.askType}</td>
			                <td>${ i.askTitle}</td>
			                <td>${ i.ansYn}</td>
	           			 </tr>
	        		</c:forEach>
	        	</c:when>
	        	<c:otherwise>
	        		<tr>
	        			<td>문의 내역이 없습니다.</td>
	        		</tr>
	        	</c:otherwise>

	        </c:choose>
	     
	        </tbody>
   		 </table>
        </div>
 
      </div>
    </div>

    
					   

    
  </body>
  
  <script>

    $(function(){
        $("tbody tr").each(function(){
             $(this).click(function(){
                console.log("you are here!")
    
                var askNo = $(this).children().eq(0).text();
                location.href = "${pageContext.request.contextPath}/myPage/askDetail.do?askNo="+askNo;
            })
        });
    })


</script>
</html>
