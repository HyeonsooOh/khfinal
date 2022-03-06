<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<h1>관리자 대시보드</h1>
	
	<div>
		<ul class="list-group">
			<li onclick="location.href='${pageContext.request.contextPath}/admin/union.do?currentPage=1'" class="list-group-item-success">
			회원관리
			</li>
				
			<li onclick="location.href='${pageContext.request.contextPath}/admin/static.do'" class="list-group-item-warning">
			통계관리
			</li>
			
			<li onclick="location.href='${pageContext.request.contextPath}/admin/askList.do?currentPage=1'" class="list-group-item-info">
			문의관리
			</li>
			
			<li onclick="location.href='${pageContext.request.contextPath}/admin/service.do'" class="list-group-item-primary">
			서비스관리
			</li>
			
			<li onclick="location.href='${pageContext.request.contextPath}/admin/category.do'" class="list-group-item-danger">
			카테고리관리
			</li>
			
		</ul>
	</div>
	
	
</body>
</html>