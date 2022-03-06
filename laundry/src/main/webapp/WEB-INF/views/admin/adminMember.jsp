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
	<h1>회원관리</h1> <br><br>
	
	<a href="${pageContext.request.contextPath}/admin/adminDash.do">대시보드</a>
	
	
	
	<h1>회원 리스트</h1>
	
	<h3>회원검색 </h3>
	<form action="union.do" method="get">
		<input type="hidden" name="currentPage" value=1>
		<select name="type">
			<option value="MEM_NAME">이름</option>
			<option value="ADDRESS">주소</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어 입력">
		<button type="submit">검색</button>
	
	</form>
	
	<div>
		<table border="1">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>추천인회원번호</th>
			<th>가입날짜</th>
		</tr>
		
		<c:choose>
		<c:when test="${ empty pageList}">
		<tr>
			<td colspan="8">조회된 목록이 없습니다</td>
		</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach var="m" items="${ pageList}">
			<tr>
				<td>${ m.memNum }</td>
				<td>${ m.memId }</td>
				<td>${ m.memName }</td>
				<td>${ m.email }</td>
				<td>${ m.phone }</td>
				<td>${ m.post }</td>
				<td>${ m.address }</td>
				<c:choose>
					<c:when test="${ m.recNum gt 0 }">
				<td>${m.recNum }</td>					
					</c:when>
					<c:otherwise>
									<td>없음</td>
					</c:otherwise>
				
				
				</c:choose>

				<td>${ m.enrollDate }</td>
				
			</tr>
			
			</c:forEach>
		</c:otherwise>
		</c:choose>
		
		</table>
	</div>
	
	<div align="center" class="paging-area">
						
                        <!-- 페이징바에서 < 를 담당 : 이전페이지로 이동 -->
                        <c:if test="${pi.currentPage != 1 }">
                            <button onclick="location.href='${ pageContext.request.contextPath }/admin/union.do?type=${ param.type }&keyword=${ param.keyword }&currentPage=${ pi.currentPage - 1 }'">
                                &lt;
                            </button>
                        </c:if>
                        
                        <!-- 페이징바에서 숫자를 담당 -->
                        <c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                            <!-- 버튼이 눌렸을 때 해당 페이지로 이동하게끔 -->
                            <c:choose>
                                <c:when test="${i ne currentPage}">
                                    <button onclick="location.href='${ pageContext.request.contextPath }/admin/union.do?type=${ param.type }&keyword=${ param.keyword }&currentPage=${ i }'">
                                        ${ i }
                                    </button>
                                </c:when>
                                <c:otherwise>
                                    <!-- 현재 내가 보고있는 페이지일 경우에는 클릭이 안되게끔 막고싶다. -->
                                    <button type="button" disabled>${ i }</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <!-- 페이징바에서 > 를 담당 : 다음페이지로 이동 -->
                        <c:if test="${pi.currentPage ne pi.maxPage }">
                            <button onclick="location.href='${ pageContext.request.contextPath }/admin/union.do?type=${ param.type }&keyword=${ param.keyword }&currentPage=${ pi.currentPage + 1 }'">
                                &gt;
                            </button>
                        </c:if>

                    </div>
</body>
</html>