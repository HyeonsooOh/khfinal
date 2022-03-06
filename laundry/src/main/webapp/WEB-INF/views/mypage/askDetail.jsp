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
    <title>문의 상세내역</title>
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
        	
	      	  <h2> 문의 내역 상세조회</h2>

    <table>
        <thead>
            <th>
                <td>문의번호</td>
                <td>문의날짜</td>
                <td>유형</td>
            </th>
        </thead>
         <tbody>
             <tr>
                <td>${ask.askNum }</td>
                <fmt:parseDate value="${ask.askDate }" var="adate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${ adate }" type="date" dateStyle="long"/> </td>
            
                <td>${ask.askType }</td>
             </tr>
         </tbody>
    </table>

    <br>
     <div class="askTitle">
         <div>문의 제목</div> 
         <div class="askTitle_detail">
             ${ask.askTitle}
         </div>
     </div>
     <div class="askContent">
         <div class="askContent_title">내용</div>
         <div class="askContent_detail">
             <div class="contents">
				${ask.askContent }
             </div>
             <div class="askPic">
             
             	<img src="${ pageContext.request.contextPath }/${ ask.filePath }${ ask.changeName }"/>
             </div>
         </div>
     </div>

     <div class="askAnwser">
         <div class="askAnswer_title">
            <div>답변</div>
            <div class="askAnwser_title_date">
                <fmt:parseDate value="${ask.ansDate }" var="andate" pattern="yyyy-MM-dd"/>
				
                답변날짜 : <fmt:formatDate value="${ andate }" type="date" dateStyle="long"/>
            </div>
         </div>
         <div class="askAnswer_content">
             ${ask.ansContent}
         </div>

     </div>
        </div>
 
      </div>
    </div>

    
					   

    
  </body>
  
  
	</html>
