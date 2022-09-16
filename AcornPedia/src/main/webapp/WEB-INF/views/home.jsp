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
<div class="container">
	<c:choose>
		<c:when test="${ empty sessionScope.id}">
			<a href="${pageContext.request.contextPath}/users/loginform.do">로그인</a>
			<a href="${pageContext.request.contextPath}/users/signup_form.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<p>
				<a href="${pageContext.request.contextPath}/users/info.do">${sessionScope.id }</a> 로그인중... 
				<a href="${pageContext.request.contextPath}/users/logout.do">로그아웃</a>
			</p>
		</c:otherwise>
	</c:choose>
	
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath}/movie/list.do">영화 게시판 바로가기</a></li>
		<li><a href="${pageContext.request.contextPath}/cafe/list.do">자유 게시판 바로가기</a></li>
	</ul>
</div>
</body>
</html>








