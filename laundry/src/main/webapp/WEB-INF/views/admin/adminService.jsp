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

	<h1>관리자모드 서비스관리</h1>
	
	<a href="${pageContext.request.contextPath}/admin/adminDash.do">대시보드</a>
	

<h2>예악 서비스 관리</h2>

<table border="1">
		<tr>
			<th>회원번호</th>
			<th>예약번호</th>
			<th>예약타입</th>
			<th>예약날짜</th>
			<th>수거날짜</th>
			<th>요구사항</th>
			<th>배달예정날짜</th>
			<th>수정하기</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty resList }">
				<tr>
					<td colspan="8">조회된 목록이 없습니다</td>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="r" items="${ resList }">
					<tr>
						<td>${r.memNum }</td>
						<td class="resNum">${r.resNum }</td>
						<td>${r.resType } </td>
						<td>${r.resDate }</td>
						<td>${r.pickupDate} </td>
						<td>${r.request }</td>
						<td class="delDate">${r.delDate }</td>
		<td><button class="updateResBtn" data-toggle="modal" data-target="#myModalforUpdateRes">수정하기</button></td>
					</tr>
				</c:forEach>
			</c:otherwise>
			
			
		</c:choose>
	</table>


<form action="updateRes.do" method="post">
	 
	<!-- The Modal for update-->
	<div class="modal" id="myModalforUpdateRes">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">예약서비스 배달예정 날짜수정하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <div class="modal-body"> 
	       	<table border="1">
	       		<tr>
		       		<th></th>
		       		<th>배달예정날짜</th>
	       		</tr>	
	       		<tr>	
	       		<td><input type="hidden" name="resNum"></td>
	       		<td><input type="date" name="delDate2"></td>
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
		
		
		
		$(".updateResBtn").on("click" , function() {
			
			$("input[name=resNum]").val($(this).parent().siblings(".resNum").text()); 
			
			var delDate = new Date($(this).parent().siblings(".delDate").text());
			var yyyy = delDate.getFullYear();
			var mm = delDate.getMonth() + 1 > 9 ? delDate.getMonth() + 1 : '0' + (delDate.getMonth() + 1);
			var dd = delDate.getDate() > 9 ? delDate.getDate() : '0' + delDate.getDate();
			
			$("input[name=delDate2]").val(yyyy + "-" + mm + "-" +dd);
			
			console.log(delDate);
			console.log(yyyy);
			console.log(mm);
			console.log(dd);
			
			
		});
		
	});

</script>

</body>
</html>