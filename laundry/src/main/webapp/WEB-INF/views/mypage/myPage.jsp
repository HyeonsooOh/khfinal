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
      	left: 43%;
      }
      .mypage_content {
     
       background: rgba(219, 219, 219, 0.253);
           padding: 1rem;

    padding-bottom: 4rem;
    margin: 3rem auto;
    width: 80%;
        
      }
      
       .mypage_content2 {
     
        display: grid;
        grid-template-columns: 1fr 1fr;
        width:80%;
        margin: 4rem auto;
        
      }
      .myinfo {
        display: flex;
        padding: 0.7rem;
        text-align: center;
      }
      .myinfo_title {
        font-size: 1rem;
        font-weight: bold;
        padding: 0.5rem;
        flex: 1;
      }
      .myinfo_content {
        flex: 2;
        padding: 0.5rem;
        text-align: left;
      }

      .address {
        grid-column: 1/3;
      }

      .address .myinfo_title {
        text-align: left;
        padding-left: 2.1rem;
        width: 100px;
      }
      .mypage-btns {
      	padding-top:1rem;
        display: flex;
        justify-content: center;
      }
      .mypage-btns button {
        margin-left: 0.5rem;
      }
    	#myModal, #deleteAccount{
    	  z-index: 1000000;
        background: smokewhite;
    	}
    	
    	#updatePwd{
    	width: 80%;
  		  margin: auto;

    	}
    	
    	#updatePwd div{
    	 display: flex;
    	 justify-content: space-around;
    	 margin-bottom: 0.5rem;
    	}
    	
    	#updatePwd p{
    	width: 120px;
    	margin: 0;
    	padding-buttom: 5px;
   		 align-self: center;
    	}
    </style>
    <title>???????????????</title>
  </head>
  <body>
    <jsp:include page="../common/manubar.jsp"></jsp:include>

    <div class="outer">
      <jsp:include page="./common/sideMenuBar.jsp"></jsp:include>

       <div class="mypage_container">
        <h4 >
          ??? ?????? ??????
        </h4>
        <div class="mypage_content">
        
          <div class="mypage_content2">
        
        
        
	          <div class="myinfo id">
	            <div class="myinfo_title">?????????</div>
	            <div class="myinfo_content">${loginUser.memId}</div>
	          </div>
	          <div class="myinfo name">
	            <div class="myinfo_title">??????</div>
	            <div class="myinfo_content">${loginUser.memName }</div>
	          </div>
	          <div class="myinfo phone">
	            <div class="myinfo_title">?????????</div>
	            <div class="myinfo_content">${loginUser.phone }</div>
	          </div>
	          <div class="myinfo email">
	            <div class="myinfo_title">?????????</div>
	            <div class="myinfo_content">${loginUser.email }</div>
	          </div>
	          <div class="myinfo address">
	            <div class="myinfo_title">??????</div>
	            <div class="myinfo_content" style="text-align: left;">
	              <span class="myinfo_postal">${ loginUser.post }</span>
	              <span class="myinfo_address">
	                ${loginUser.address }
	              </span>
	            </div>
	          </div>
	        </div>
	          <div class="mypage-btns">
	            <button class="btn btn-primary btn-sm" onclick="location.href='${pageContext.request.contextPath}/myPage/updateForm.do'">????????????</button>
	            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">
				  ???????????? ??????
				</button>
	            <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#deleteAccount">????????????</button>
	          </div>
        </div>
      </div>
    </div>

    
	 		
<!-- The Modal for changing in password -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">???????????? ??????</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="updatePwd.do" id="updatePwd" method="post">
        	<div style="width: 195px;
    margin-left: 0.2rem;">
        	<p>?????? ???????????? </p>  ${loginUser.memPwd }
        	</div>
        	<div>
        	<p>??? ???????????? </p>
        	
        	<input type="hidden" name="memNum" value="${loginUser.memNum }" />
        	
        	<input type="password" placeholder="******" name="newPwd" id="newPwd" />
        	</div>
        	<div>
        	<p>??? ???????????? ?????? </p>
        	<input type="password" placeholder="******" id="checkNewPwd"/>
        	</div>
        	<div style="margin-top: 2rem;">
        	<button type="submit" style="    width: 100px;" class="btn btn-danger btn-sm">??????</button>
        	</div>
        </form>
      </div>

  

    </div>
  </div>
</div>						   

	 		
<!-- The Modal for deleting the account -->
<div class="modal" id="deleteAccount"> 
  <div class="modal-dialog">
    <div class="modal-content">


      <!-- Modal body -->
      <div class="modal-body">
		      <form action="deleteAccount.do">
		      	
		        <h5 style="font-weight: bold">????????? ?????? ????????????????</h5>
		        <p>????????? ????????? ??? ??????????????????!</p>
		        <div style="width: 100%; text-align: center;">
		        <textarea rows="4" cols="50" style="resize: none; margin:auto; width: 380px; font-size:0.9rem;">
???? ????????? ?????? ??????????????? ?????? ?????????...
????????? ????????? ???????????? ?????????????????????! 
???????????? ?????? ??????????????? ?????? ???????????? ???????????????.</textarea>
				</div>
				<div style="width: 100%; text-align: center;">
				     <button class="btn btn-primary btn-sm">?????? ??????</button>
				     <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">??????</button>
				 </div>
		       </form>
      </div>

  

    </div>
  </div>
</div>						   

    
  </body>
</html>
