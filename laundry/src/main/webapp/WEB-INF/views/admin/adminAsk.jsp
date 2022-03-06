<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script><!--온라인 방식-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>관리자모드 문의관리</h1>

<a href="${pageContext.request.contextPath}/admin/adminDash.do">대시보드</a>
	
	
	<table border="1">
		<tr>
			<th>문의번호</th>
			<th>회원아이디</th>
			<th>문의종류</th>
			<th>문의제목</th>
			<th>문의내용</th>
			<th>문의날짜</th>
			<th>답변유무</th>
			<th>답변날짜</th>
		</tr>
		
		<tbody>
		<c:choose>
			<c:when test="${empty pageList }">
			<tr>
				<td colspan="8">조회된 목록이 없습니다</td>
			</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="m" items="${pageList }">
				
				<tr>
				
					<td>${m.askNum }</td>
					<td>${m.memId }</td>
					<td>${m.askType }</td>
					<td>${m.askTitle }</td>
					<td>${m.askContent }</td>
					<td>${m.askDate }</td>
					<td>${m.ansYn }</td>
					<td>${m.ansDate }</td>
				</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	
	<!-- 페이징처리 -->
	<div align="center" class="paging-area">
                        <!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
                        <c:choose>
                        <c:when test="${pi.currentPage != 1 }">
                            <button type="button" onclick="location.href='${ pageContext.request.contextPath }/admin/askList.do?currentPage=${ pi.currentPage - 1 }'">
                                &lt;
                            </button>
                        </c:when>
                        <c:otherwise>
                        <button type="button">
                        	&lt;
                        </button>
                        </c:otherwise>
                        </c:choose>
                        <!-- 페이징바에서 숫자를 담당 -->
                        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                            <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
                            <c:choose>
                                <c:when test="${i != currentPage}">
                                    <button onclick="location.href='${ pageContext.request.contextPath }/admin/askList.do?currentPage=${ i }'">
                                        ${ i }
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
                                    <button disabled>${ i }</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
                        <c:if test="${pi.currentPage != pi.maxPage }">
                            <button onclick="location.href='${ pageContext.request.contextPath }/admin/askList.do?currentPage=${ pi.currentPage + 1 }'">
                                &gt;
                            </button>
                        </c:if>
                    </div>
	
	
	<script>
		$(function() {
			$("table>tbody>tr").click(function() {
			
				var ano = $(this).children().eq(0).text();
				
				location.href="${ pageContext.request.contextPath }/admin/detail.do?askNum=" +ano;
				
			})
		});	
	</script>
</body>
</html>



















