<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ include file="../common/util.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>문의 상세보기</h1> <br><br>
	<h3>문의 번호 : ${ ask.askNum }</h3>
	<h3>문의 유형 : ${ ask.askType } </h3>
	<h3>회원 아이디 :${ ask.memId } </h3>
	<h3>문의 제목 : ${ask.askTitle }</h3> <br><br>
	<h3>내용 : ${ ask.askContent }</h3> <br><br>
	
	<h3>사진</h3>	
	<c:choose>
		<c:when test="${ empty attList }">
			<h4>조회된 목록이 없습니다</h4>
		</c:when>
		<c:otherwise>
			<c:forEach var="att" items="${ attList }">
				<img src="${ pageContext.request.contextPath }/${ att.filePath }/${ att.changeName }">
				<br>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	
	
	
	<!-- 문의 답변하기  -->
	<td><button class="insertAnsBtn" data-toggle="modal" data-target="#myModalforInsertAns">답변하기</button></td>
	
	
	<form action="insertAnswer.do" method="post">
	 
	<!-- The Modal for update-->
	<div class="modal" id="myModalforInsertAns">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">문의 답변하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body"> 
	       	<table border="1">
	       		<tr>
		       		<th></th>
		       		<th>답변 내용</th>
	       		</tr>	
	       		<tr>	
	       		<td><input type="hidden" name="askNum" value="${ask.askNum }"></td>
	       		<td><input type="text" name="ansContent"></td>
	       		</tr>
	       	</table>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" id="btn" class="btn btn-danger">답변완료</button>
	      </div> 
	    </div>
	  </div>
	</div>

</form>
	
	
	<a href="${ pageContext.request.contextPath }/admin/askList.do?currentPage=1">목록가기</a>
</body>
</html>