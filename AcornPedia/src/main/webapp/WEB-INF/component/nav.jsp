<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- The Modal -->
<<<<<<< HEAD
<div class="modal fade" id="loginmodal">

   <div class="modal-dialog modal-sm modal-dialog-centered">
      <section id="loginmodalsection">
         <div class="modal-content" id=loginmodalcontent>
            <div id="login-img-logo">
               <img
                  src="${pageContext.request.contextPath}/resources/images/watcha.png"
                  id="modal-logo">
            </div>
=======
<div class="modal fade" id="loginmodal" aria-hidden="true" aria-labelledby="loginmodalLabel" tabindex="-1">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<section id="loginmodalsection">
			<div class="modal-content">
				<div id="img-logo">
					<img
						src="${pageContext.request.contextPath}/resources/images/watcha.png"
						id="modal-logo">
				</div>
>>>>>>> 27e095bf6282fc998eb42c065dc5cb6713725e5d

            <!-- Modal Header -->
            <header class="login-header">

               <h2 class="modal-title" id="exampleModalLongTitle">로그인</h2>

            </header>

            <div class="login-body">
               <form class="animate__animated_animate__bounceInDown"
                  action="info.do?url=${requestScope.encodedUrl }"
                  method="post" id="myForm">
                  <c:choose>
                     <c:when test="${ empty param.url }">
                        <input type="hidden" name="url"
                           value="${pageContext.request.contextPath}/" />
                     </c:when>
                     <c:otherwise>
                        <input type="hidden" name="url" value="${param.url }" />
                     </c:otherwise>
                  </c:choose>
                  <div class="login-label">
                     <label class="control-label" for="id"><input
                        class="form-control" type="text" name="id" id="id"
                        placeholder="아이디" /></label>
                  </div>
                  <div class="login-label">
                     <label class="control-label" for="pwd"><input
                        class="form-control" type="password" name="pwd" id="pwd"
                        placeholder="비밀번호" /></label>
                  </div>
                  <div class="btn" id="loginbtn">
                     <button type="submit" class="btn-btn-primary">로그인</button>
                  </div>

<<<<<<< HEAD
                  

               </form>
            </div>


         </div>
      </section>
   </div>
</div>
<!-- The Modal -->
<div class="modal fade" id="signupmodal">
   <div class="modal-dialog modal-sm modal-dialog-centered">
      <section id="signupmodalsection">
         <div class="modal-content">
            <div id="img-logo">
               <img
                  src="${pageContext.request.contextPath}/resources/images/watcha.png"
                  id="modal-logo">
            </div>

            <!-- Modal Header -->
            <header class="header">
=======





					</form>
					<div>
					<a href="${pageContext.request.contextPath}/users/signup_form.do"
							data-toggle="modal" data-target="#signupmodal">
						<button class="btn btn-primary" data-bs-target="#signupmodal"
							data-bs-toggle="modal">회원가입</button></a>
					</div>
				</div>


			</div>
		</section>
	</div>
</div>
<!-- The Modal -->
<div class="modal fade" id="signupmodal" aria-hidden="true" aria-labelledby="signupmodalLabel" tabindex="-1">
	<div class="modal-dialog modal-sm modal-dialog-centered">
		<section id="signupmodalsection">
			<div class="modal-content">
				<div id="img-logo">
					<img
						src="${pageContext.request.contextPath}/resources/images/watcha.png"
						id="modal-logo">
				</div>
				<header class="header">
>>>>>>> 27e095bf6282fc998eb42c065dc5cb6713725e5d

               <h2 class="modal-title">회원가입</h2>

            </header>


            <div class="body">
               <form class="animate__animated_animate__bounceInDown"
                  action="${pageContext.request.contextPath}/users/signup.do"
                  method="post" id="signForm">
                  <div class="label">
                     <label class="signid-control-label" for="id"><input
                        class="form-control" type="text" name="id" id="id"
                        placeholder="아이디" /></label> 
                        <div>
                        <small class="form-text-text-muted">영문자
                        소문자로 시작하고 5글자~10글자 이내로 입력하세요.</small>
                        </div>
                        
                     <div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>

                  </div>

                  <div class="label">
                     <label class="signpwd-control-label" for="pwd"><input
                        class="form-control" type="password" name="pwd" id="pwd"
                        placeholder="비밀번호" /></label> 
                        <div>
                        <small class="form-text-text-muted">5글자~10글자
                        이내로 입력하세요.</small>
                        </div>
                        
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
                  <div class="btn" id="submitbtn">
                     <button class="btn-btn-primary" type="submit">회원가입</button>
                  </div>
                  

<<<<<<< HEAD
               </form>
            </div>
         </div>
      </section>
   </div>
</div>

=======
						</div>
						<div class="btn" id="submitbtn">
							<button class="btn-btn-primary" type="submit">회원가입</button>
						</div>
						<div>
						<a href="${pageContext.request.contextPath}/users/loginform.do"
							class="navbar-atext" data-toggle="modal"
							data-target="#loginmodal">
							<button class="btn btn-primary" data-bs-target="#loginmodal"
								data-bs-toggle="modal">로그인</button></a>
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
>>>>>>> 27e095bf6282fc998eb42c065dc5cb6713725e5d

<nav class="navbar-box">
   <ul class="navbar-ul">
      <li class="navbar-li css-logo"><a
         href="${pageContext.request.contextPath}/home.do">
          <img src="${pageContext.request.contextPath}/resources/images/watcha.png"
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
<script>
</script>