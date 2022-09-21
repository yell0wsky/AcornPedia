<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath}/movie/list.do">영화 게시판 바로가기</a></li>
		<li><a href="${pageContext.request.contextPath}/cafe/list.do">자유 게시판 바로가기</a></li>
		<li><a href="${pageContext.request.contextPath}/notice/list.do">공지사항</a></li>
	</ul>
</div>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
</html>
