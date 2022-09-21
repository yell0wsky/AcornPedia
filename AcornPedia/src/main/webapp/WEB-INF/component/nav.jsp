<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://kit.fontawesome.com/2e01103920.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<!-- The Modal -->
<div class="modal fade" id="signupmodal">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<section>
			<div class="modal-content">

				<!-- Modal Header -->
				<header class="header">
					<img
						src="${pageContext.request.contextPath}/resources/images/watcha.png"
						id="logo">
					<div>
						<h2 class="modal-title">회원가입</h2>
					</div>

				</header>


				<div class="body">
					<form class="animate__animated_animate__bounceInDown"
						action="${pageContext.request.contextPath}/users/signup.do"
						method="post" id="myForm">
						<div class="label">
							<label class="control-label" for="id"><input
								class="form-control" type="text" name="id" id="id"
								placeholder="아이디" /></label> <small class="form-text-text-muted">영문자
								소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
							<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>

						</div>

						<div class="label">
							<label class="control-label" for="pwd"><input
								class="form-control" type="password" name="pwd" id="pwd"
								placeholder="비밀번호" /></label> <small class="form-text-text-muted">5글자~10글자
								이내로 입력하세요.</small>
							<div class="invalid-feedback">비밀번호를 확인 하세요.</div>

						</div>

						<div class="label">
							<label class="control-label" for="pwd2"><input
								class="form-control" type="password" name="pwd2" id="pwd2"
								placeholder="비밀번호 확인" /></label>


						</div>
						<div class="label">
							<label class="control-label" for="email"><input
								class="form-control" type="text" name="email" id="email"
								placeholder="이메일" /></label>
							<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>


						</div>
						<div class="label">
							<label class="control-label" for="mpn"><input
								class="form-control" type="number" name="mpn" id="mpn"
								placeholder="휴대폰 번호" /></label>
							<div class="invalid-feedback">정확한 번호를 기재해 주세요.</div>


						</div>
						<div class="btn">
							<button class="btn-btn-primary" type="submit">회원가입</button>
						</div>
						<a href="${pageContext.request.contextPath}/users/loginform.do"
							class="navbar-atext" data-toggle="modal"
							data-target="#loginmodal">로그인</a>
						<div>
							<button class="btn btn-primary" data-bs-target="#loginmodal"
								data-bs-toggle="modal">로그인</button>
						</div>

					</form>
				</div>
			</div>
		</section>
	</div>
</div>

<nav class="navbar-box">
	<ul class="navbar-ul">
		<li class="navbar-li css-logo"><a
			href="${pageContext.request.contextPath}/home.do"> <img
				src="${pageContext.request.contextPath}/resources/images/watcha.png"
				id="logo">
		</a></li>
		<li class="navbar-li css-text navbar-li-remove"><a
			href="${pageContext.request.contextPath}/notice/list.do"
			class="navbar-atext">공지</a></li>
		<li class="navbar-li css-text navbar-li-remove"><a
			href="${pageContext.request.contextPath}/movie/list.do"
			class="navbar-atext">영화</a></li>
		<li class="navbar-li css-text navbar-li-remove"><a
			href="${pageContext.request.contextPath}/cafe/list.do"
			class="navbar-atext">자유</a></li>
		<li class="navbar-li css-text css-search">
			<form action="#">
				<div class="navbar-divicon">
					<i class="fas fa-search" id="fuck"></i> <input type="text"
						placeholder="콘텐츠, 인물, 컬렉션를 검색해보세요."> <i
						class="fas fa-search" id="haha"></i>
				</div>
			</form>
		</li>
		<c:choose>
			<c:when test="${ empty sessionScope.id}">
				<li class="navbar-li css-text css-hidden"><a
					href="${pageContext.request.contextPath}/users/loginform.do"
					class="navbar-atext" data-toggle="modal" data-target="#loginmodal">로그인</a>
					<a href="${pageContext.request.contextPath}/users/signup_form.do"
					class="navbar-atext navbar-margin navbar-color" data-toggle="modal"
					data-target="#signupmodal"><span>회원가입</span></a></li>
			</c:when>
			<c:otherwise>
				<li class="navbar-li css-text css-hidden"><a
					href="${pageContext.request.contextPath}/users/info.do"
					class="navbar-atext">${sessionScope.id }</a> <a
					href="${pageContext.request.contextPath}/users/logout.do"
					class="navbar-atext navbar-margin navbar-color"> <span>로그아웃</span>
				</a>
				<li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>

