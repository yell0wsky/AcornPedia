<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/detail.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/moviedetail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/stars.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
	<div id='moviewrapper'>
		<section>
			<div id="bgBlur">
				<img
					src="https://www.themoviedb.org/t/p/w1066_and_h600_bestv2${dto.backdrop_path}" />
			</div>
		</section>
		<section>
			<div class="container">
				<form name="myform" id="myform" method="post"
					action="${pageContext.request.contextPath}/movie/getStars.do">
					<fieldset>
						<legend>별점</legend>
						<input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
						<input type="radio" name="rating" value="4"	id="rate2"><label for="rate2">⭐</label>
						<input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
						<input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
						<input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
						<input type="hidden" name="num" id="num" value="${dto.num}" />
					</fieldset>
					<button class="btn-btn-primary" type="submit">별점 등록</button>
				</form>
				<li>${dto.title}</li>
			</div>
		</section>
	</div>
	<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
</html>

