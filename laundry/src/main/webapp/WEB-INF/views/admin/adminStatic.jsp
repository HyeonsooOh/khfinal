<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자모드 통계관리</h1>
	
	<a href="${pageContext.request.contextPath}/admin/adminDash.do">대시보드</a>
	
	
	<h3>총 회원 수 : ${result } 명 </h3> <br><br>
	
	<h3>총 후기수  : ${resultReview } 건</h3> <br><br>
	
	<h3>총 문의수 : ${resultAsk }</h3> <br><br>
	
	<h3>총 구독자 수 : ${resultSubscribe } 명 </h3> <br><br>
	
	<h3>총 세탁 수 : ${resultLaundry }건 </h3> <br><br>
	
	<h3>총 수선 수 : ${resultRepair }건 </h3> <br><br>
	
	<h3>월별 구독자 수 <br>
		<c:choose>
			<c:when test="${ empty list }">조회된 목록이 없습니다</c:when>
			
			<c:otherwise>
				<c:forEach var="m" items="${list }">
					${m.MONTH } 월 /
					${m.COUNT } 명 <br>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	 </h3> <br><br>
</body>
</html>