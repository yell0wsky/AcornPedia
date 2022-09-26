<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- login Modal -->
<div class="modal fade" id="loginmodal">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<section id="loginmodalsection">
			<div class="modal-content" id=loginmodalcontent>
				<div id="login-img-logo">
					<img
						src="${pageContext.request.contextPath}/resources/images/ACORN LOGO.jpg"
						id="modal-logo">
				</div>

				<!-- Modal Header -->
				<header class="login-header">
					<h2 class="modal-title" id="exampleModalLongTitle">로그인</h2>
				</header>

				<div class="login-body">
					<form class="animate__animated_animate__bounceInDown"
						action="${pageContext.request.contextPath}/users/login.do"
						method="post" id="loginForm">
						<input type="hidden" name="url" value="" />
						<div class="login-label">
							<label class="control-label" for="id"><input
								class="form-control" type="text" name="id" id="signid"
								placeholder="아이디" /></label>
						</div>
						<div class="login-label">
							<label class="control-label" for="pwd"><input
								class="form-control" type="password" name="pwd" id="signpwd"
								placeholder="비밀번호" /></label>
						</div>
						<div class="btn" id="loginbtn">
							<button class="modal-button" type="submit"
								class="btn-btn-primary">로그인</button>
						</div>
						<div class="modal-text">
							아직 계정이 없으신가요? <a
								href="${pageContext.request.contextPath}/users/signup_form.do"
								class="navbar-atext" id="login-modal-move" data-dismiss="modal"
								data-toggle="modal" data-target="#signupmodal">회원가입</a>
						</div>


					</form>
				</div>
			</div>
		</section>
	</div>
</div>

<!-- signUp Modal -->
<div class="modal fade" id="signupmodal">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<section id="signupmodalsection">
			<div class="modal-content">
				<div id="img-logo">
					<img
						src="${pageContext.request.contextPath}/resources/images/ACORN LOGO.jpg"
						id="modal-logo">
				</div>

				<!-- Modal Header -->
				<header class="header">
					<h2 class="modal-title">회원가입</h2>
				</header>

				<div class="body">
					<form class="animate__animated_animate__bounceInDown"
						action="${pageContext.request.contextPath}/users/signup.do"
						method="post" id="signForm">
						<div class="label">
							<label class="sign1-control-label" for="name"> <input
								class="form-control" type="text" name="name" id="name"
								placeholder="이름" /></label>
						</div>
						<div class="label">
							<label class="sign2-control-label" for="id"><input
								class="form-control" type="text" name="id" id="id"
								placeholder="아이디" /></label> <small class="form-text-text-muted">영문자
								소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
							<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
						</div>

						<div class="label">
							<label class="sign2-control-label" for="pwd"><input
								class="form-control" type="password" name="pwd" id="pwd"
								placeholder="비밀번호" /></label> <small class="form-text-text-muted">5글자~10글자
								이내로 입력하세요.</small>
							<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
						</div>
						<div class="label">
							<label class="sign1-control-label" for="pwd2"><input
								class="form-control" type="password" name="pwd2" id="pwd2"
								placeholder="비밀번호 확인" /></label>
						</div>
						<div class="label">
							<label class="sign1-control-label" for="email"><input
								class="form-control" type="text" name="email" id="email"
								placeholder="이메일" /></label>
							<div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
						</div>
						<div class="button" id="submitbtn">
							<button class="modal-button" type="submit">회원가입</button>


						</div>
						<div class="sign-modal-text">
							이미 가입하셨나요? <a data-dismiss="modal"
								href="${pageContext.request.contextPath}/users/loginform.do"
								class="navbar-atext" id="login-modal-move" data-toggle="modal"
								data-target="#loginmodal">로그인</a>
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
				src="${pageContext.request.contextPath}/resources/images/ACORN LOGO.jpg"
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
						class="fas fa-search" id="haha" style="margin-top: 0px;"></i>
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
<nav class="navbar-box">
	<ul class="navbar-ul">
		<li class="navbar-li css-logo"><a
			href="${pageContext.request.contextPath}/home.do"> <img
				src="${pageContext.request.contextPath}/resources/images/ACORN LOGO.jpg"
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
					<i class="fas fa-search" id="fuck"></i> <input class="form-control"
						type="text" id="search" name="search" value="${search }"
						placeholder="콘텐츠, 인물, 컬렉션를 검색해보세요."> <i
						class="fas fa-search" id="haha"></i>
				</div>
			</form>
		</li>
		<c:choose>
			<c:when test="${ empty sessionScope.id}">
				<li class="navbar-li css-text css-hidden"><a id="login"
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
<script
	src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//아이디, 비밀번호, 이메일의 유효성 여부를 관리한 변수 만들고 초기값 대입
	let isIdValid = false;
	let isPwdValid = false;
	let isEmailValid = false;

	//아이디를 입력했을때(input) 실행할 함수 등록 
	document.querySelector("#id").addEventListener(
			"input",
			function() {
				//일단 is-valid,  is-invalid 클래스를 제거한다.
				document.querySelector("#id").classList.remove("is-valid");
				document.querySelector("#id").classList.remove("is-invalid");

				//1. 입력한 아이디 value 값 읽어오기  
				let inputId = this.value;
				//입력한 아이디를 검증할 정규 표현식
				const reg_id = /^[a-z].{4,9}$/;
				//만일 입력한 아이디가 정규표현식과 매칭되지 않는다면
				if (!reg_id.test(inputId)) {
					isIdValid = false; //아이디가 매칭되지 않는다고 표시하고 
					// is-invalid 클래스를 추가한다. 
					document.querySelector("#id").classList.add("is-invalid");
					return; //함수를 여기서 끝낸다 (ajax 전송 되지 않도록)
				}

				//2. util 에 있는 함수를 이용해서 ajax 요청하기
				ajaxPromise(
						"${pageContext.request.contextPath}/users/checkid.do",
						"get", "inputId=" + inputId).then(function(response) {
					return response.json();
				}).then(
						function(data) {
							console.log(data);
							//data 는 {isExist:true} or {isExist:false} 형태의 object 이다.
							if (data.isExist) {//만일 존재한다면

								//사용할수 없는 아이디라는 피드백을 보이게 한다. 
								isIdValid = false;
								// is-invalid 클래스를 추가한다. 
								document.querySelector("#id").classList
										.add("is-invalid");
							} else {
								isIdValid = true;
								document.querySelector("#id").classList
										.add("is-valid");
							}
						});
			});

	//비밀 번호를 확인 하는 함수 
	function checkPwd() {
		document.querySelector("#pwd").classList.remove("is-valid");
		document.querySelector("#pwd").classList.remove("is-invalid");

		const pwd = document.querySelector("#pwd").value;
		const pwd2 = document.querySelector("#pwd2").value;

		// 최소5글자 최대 10글자인지를 검증할 정규표현식
		const reg_pwd = /^.{5,10}$/;
		if (!reg_pwd.test(pwd)) {
			isPwdValid = false;
			document.querySelector("#pwd").classList.add("is-invalid");
			return; //함수를 여기서 종료
		}

		if (pwd != pwd2) {//비밀번호와 비밀번호 확인란이 다르면
			//비밀번호를 잘못 입력한것이다.
			isPwdValid = false;
			document.querySelector("#pwd").classList.add("is-invalid");
		} else {
			isPwdValid = true;
			document.querySelector("#pwd").classList.add("is-valid");
		}
	}

	//비밀번호 입력란에 input 이벤트가 일어 났을때 실행할 함수 등록
	document.querySelector("#pwd").addEventListener("input", checkPwd);
	document.querySelector("#pwd2").addEventListener("input", checkPwd);

	//이메일을 입력했을때 실행할 함수 등록

	document.querySelector("#email").addEventListener("input", function() {

		document.querySelector("#email").classList.remove("is-valid");
		document.querySelector("#email").classList.remove("is-invalid");

		//1. 입력한 이메일을 읽어와서
		const inputEmail = this.value;
		//2. 이메일을 검증할 정규 표현식 객체를 만들어서

		const reg_email = /@/;

		//3. 정규표현식 매칭 여부에 따라 분기하기
		if (reg_email.test(inputEmail)) {//만일 매칭된다면
			isEmailValid = true;
			document.querySelector("#email").classList.add("is-valid");
		} else {
			isEmailValid = false;
			document.querySelector("#email").classList.add("is-invalid");
		}
	});

	//폼에 submit 이벤트가 발생했을때 실행할 함수 등록
	document.querySelector("#signForm").addEventListener("submit", function(e) {
		//console.log(e);
		/*
		   입력한 아이디, 비밀번호, 이메일의 유효성 여부를 확인해서 하나라도 유효 하지 않으면
		   e.preventDefault(); 
		   가 수행 되도록 해서 폼의 제출을 막아야 한다. 
		 */
		//폼 전체의 유효성 여부 알아내기 
		let isFormValid = isIdValid && isPwdValid && isEmailValid;
		if (!isFormValid) {//폼이 유효하지 않으면
			//폼 전송 막기 
			e.preventDefault();
			alert("양식에 맞게 입력해주세요");
		}
	});

	//login.do로 보낼 form에 현재페이지의 파라미터값까지 포함한 url값 담기
	var link = document.location.href;
	$('input[name=url]').attr('value', link)
</script>
<!-- Navi Bar End -->