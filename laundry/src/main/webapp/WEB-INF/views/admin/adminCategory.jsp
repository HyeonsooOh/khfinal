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
	<h1>관리자모드 카테고리관리</h1>
	
	<a href="${pageContext.request.contextPath}/admin/adminDash.do">대시보드</a>
	
	
	<h2>세탁</h2>
	
	<button>생활빨래</button> &nbsp;&nbsp;
	<button>침구류</button> &nbsp;&nbsp;
	<button>신발</button> &nbsp;&nbsp;
	<button>드라이클리닝</button> <br><br>
	
	<div>
		<h3>생활빨래</h3>
		
		
		<!-- 기능추가하기 버튼 모달  -->
		<td><button class="insertCat" data-toggle="modal" data-target="#myModalforInsertCat">기능추가하기</button></td>
		
	<form action="insertCat.do" method="post">
	 
	<!-- The Modal for update-->
	<div class="modal" id="myModalforInsertCat">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">세탁 기능추가하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body"> 
	      
	       	<table border="1">
	       		<tr>
		       		<th>세탁카테고리번호</th>
		       		<th>세탁대분류</th>
		       		<th>세탁소분류</th>
		       		<th>금액</th>
	       		</tr>	
	       		
	       		<tr>	
		       		<td><input type="text" name="catNum"></td>
		       		<td><input type="text" name="mcategory"></td>
		       		<td><input type="text" name="scategory"></td>
		       		<td><input type="text" name="lPrice"></td>
	       		</tr>
	       		
	       	</table>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" id="btn" class="btn btn-danger">추가완료</button>
	      </div> 
	    </div>
	  </div>
	</div>

</form>
		<!-- 기능추가하기 버튼 모달  여기까지-->
		
		
		
		
		<table border="1">
			<tr>
				<th>번호</th>
				<th>세탁대분류</th>
				<th>세탁소분류</th>
				<th>가격</th>
				<th>현재상태</th>
				<th>수정</th>
				<th>삭제</th>
				<th>복구</th>
			</tr>
			<tr>
				<c:choose>
				<c:when test="${ empty list }">
					<tr>
						<td colspan="8">조회된 목록이 없습니다.</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="l" items="${list }">
						<tr>
							<td class="catNum">${l.catNum }</td>
							<td class="mcategory">${l.mcategory }</td>
							<td class="scategory">${l.scategory }</td>
							<td class="lPrice">${l.LPrice }</td>
							<td class="status">${l.status }</td>
							<td><button class="updateBtn" data-toggle="modal" data-target="#myModalforUpdate"   >수정하기</button></td>
							<td><a href="delete/${l.catNum }">삭제하기</a></td>
							<td><a href="restore/${l.catNum }">복구하기</a></td>
							
						</tr>
					</c:forEach>
				</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>
	
	
	
 <form action="update.do" method="post">
	 
	<!-- The Modal for update-->
	<div class="modal" id="myModalforUpdate">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">세탁 종류/가격 수정하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body"> 
	       	<table border="1">
	       		<tr>
		       		<th></th>
		       		<th>대분류</th>
		       		<th>소분류</th>
		       		<th>가격</th>
		       		<th></th>
	       		</tr>	
	       		<tr>	
	       		<td><input type="hidden" name="catNum"></td>
	       		<td><input type="text" name="mcategory"></td>
	       		<td><input type="text" name="scategory"></td>
	       		<td><input type="text" name="lPrice"></td>
	       		</tr>
	      	
	       	</table>
	      </div>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="submit" id="btn" class="btn btn-danger">수정완료</button>
	      </div> 
	
	    </div>
	  </div>
	</div>

</form>

<script>
	$(function() {
		
		$(".updateBtn").on("click", function() {
			
			// 수정하기 전에 원래 내용을 일단 보여줌 => 수정하게끔
			$("input[name=catNum]").val($(this).parent().siblings(".catNum").text()); 
			$("input[name=mcategory]").val($(this).parent().siblings(".mcategory").text()); 
			$("input[name=scategory]").val($(this).parent().siblings(".scategory").text());
			$("input[name=lPrice]").val(Number($(this).parent().siblings(".lPrice").text()));

			//console.log($(this).parent().siblings(".catNum").text());
			//$("input[name=catNum]").val($(this).parent().siblings(".catNum").text())
			
		});	
		
	});
</script>
</body>
</html>