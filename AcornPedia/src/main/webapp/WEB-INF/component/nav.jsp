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
<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog"
   aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

   <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">로그인</h5>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <!-- Modal body -->
         <div class="modal-body">
            <form class="animate__animated animate__bounceInDown"
               action="${pageContext.request.contextPath}/users/login.do"
               method="post">
               <c:choose>
                  <c:when test="${ empty param.url }">
                     <input type="hidden" name="url"
                        value="${pageContext.request.contextPath}/" />
                  </c:when>
                  <c:otherwise>
                     <input type="hidden" name="url" value="${param.url }" />
                  </c:otherwise>
               </c:choose>
               <div>
                  <label class="control-label" for="id">아이디</label> <input
                     class="form-control" type="text" name="id" id="id" />
               </div>
               <div>
                  <label class="control-label" for="pwd">비밀번호</label> <input
                     class="form-control" type="password" name="pwd" id="pwd" />
               </div>
               <!-- Modal footer -->
               <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">로그인</button>
               </div>
            </form>
         </div>
      </div>
   </div>
</div>
<!-- The Modal -->
<div class="modal fade" id="signupmodal">
   <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">

         <!-- Modal Header -->
         <div class="modal-header">
            <h4 class="modal-title">회원가입</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
         </div>

         <!-- Modal body -->
         <div class="modal-body">
            <form class="animate__animated animate__bounceInDown"
               action="${pageContext.request.contextPath}/users/signup.do"
               method="post" id="myForm">
               <div>
                  <label class="control-label" for="id">아이디</label> <input
                     class="form-control" type="text" name="id" id="id" /> <small
                     class="form-text text-muted">영문자 소문자로 시작하고 5글자~10글자 이내로
                     입력하세요.</small>
                  <div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
               </div>
               <div>
                  <label class="control-label" for="pwd">비밀번호</label> <input
                     class="form-control" type="password" name="pwd" id="pwd" /> <small
                     class="form-text text-muted">5글자~10글자 이내로 입력하세요.</small>
                  <div class="invalid-feedback">비밀번호를 확인 하세요.</div>
               </div>
               <div>
                  <label class="control-label" for="pwd2">비밀번호 확인</label> <input
                     class="form-control" type="password" name="pwd2" id="pwd2" />
               </div>
               <div>
                  <label class="control-label" for="email">이메일</label> <input
                     class="form-control" type="text" name="email" id="email" />
                  <div class="invalid-feedback">이메일 형식을 확인 하세요.</div>
               </div>
               <div>
                  <label class="control-label" for="mpn">휴대폰 번호</label> <input
                     class="form-control" type="number" name="mpn" id="mpn" />
                  <div class="invalid-feedback">정확한 번호를 기재해 주세요.</div>
               </div>
               <!-- Modal footer -->
               <div class="modal-footer">
                  <button class="btn btn-primary" type="submit">가입</button>
               </div>
            </form>
         </div>



      </div>
   </div>
</div>
<style>
@font-face {
   font-family: 'MICEGothic Bold';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
      format('woff2');
   font-weight: 700;
   font-style: normal;
}

* {
   font-family: 'MICEGothic Bold';
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}

html {
   font-family: 'Noto Sans KR', sans-serif;
   line-height: normal;
   height: 100%
}

li {
   list-style: none;
}

body{
    height: 100%;
    display: flex;
      flex-direction: column;
}

.navbar-box {
   border-bottom: solid 0.8px black;
   position: fixed;
   width: 100%;
   padding-top: 0.5rem;
   background-color: white;
}

.navbar-ul {
   display: flex;
   margin: 0px 50px 15px 50px;
   padding-left: 0px;
}

.css-logo {
   width: 10rem;
   height: 2.0625rem;
}

#logo {
   margin-top: 7px;
}

.css-text {
   display: flex;
   align-items: center;
   height: 3rem;
   margin-left: 1.5rem;
   text-decoration: none;
}

.navbar-atext {
   text-decoration: none;
   color: black;
   opacity: 0.8;
   border: 0;
}

.navbar-atext span {
   display: flex;
   align-items: center;
}

.css-textweb {
   margin-right: 0.8rem;
}



.navbar-divicon #fuck {
   position: absolute;
   opacity: .65;
   margin: 8px 0px 0px 7px;
}

.navbar-divicon input {
   height: 2rem;
   width: 17rem;
   padding: 4px 1rem 4px 2rem;
   background-color: rgb(243, 243, 243);
   border: 0px solid;
}

.navbar-divicon button {
   position:absolute;
   border: none;
   margin: 8px 0px -30px -15px;
}

.css-search {
   margin: 0 0 0 auto;
}

.navbar-divicon a {
   text-decoration: none;
}

.navbar-margin {
   margin-left: 0.5rem;
}

.navbar-color {
   border: 1px solid black;
   font-weight: 700;
   border-radius: 5px;
   font-size: 0.9rem;
   display: flex;
   justify-content: center;
   height: 2rem;
   width: 80px;
}

#haha {
   display: none;
   color: black;
   opacity: 0.65;
   margin-top: 5px;
}

@media screen and (max-width: 930px) {
   .navbar-divicon input {
      display: none;
   }
   #fuck {
      display: none;
   }
   #haha {
      display: block;
   }
   .button-delete {
      display: none;
   }
}

@media screen and (max-width: 670px) {
   .navbar-ul {
      display: flex;
      justify-content: center;
   }
   .navbar-atext {
      display: none;
      width: 100%;
      justify-content: center;
      text-align: center;
      height: 3rem;
      align-items: center;
   }
   .css-hidden {
      display: none;
   }
   #haha {
      display: none;
   }
}

.container,
.a172938a {
   padding-top: 100px;
   text-decoration: none;
   flex: 1 0 auto;
}

/* footer css */
.css-footer-box {
   width: 100%;
   background-color: #222222;
   display: flex;
   font-size: 14px;
   margin-top: 60px;
   bottom: 0;
}


#footer{
  flex-shrink: 0;
}

.css-footer-margin {
   margin-right: 0.4rem;
}

.css-footer-text {
   flex-direction: column;
   margin: 2rem 0px 2rem 3.125rem;
}

.css-footer-1line, .css-footer-2line, .css-footer-3line,
   .css-footer-4line {
   display: flex;
}
.css-footer-4line {
   margin-bottom: 0px;
} 

.css-footer-2line, .css-footer-3line {
   margin-top: 1rem;
}

.css-footer-1line, .css-footer-2line {
   color: #a5a5a7;
}

.css-footer-3line, .css-footer-4line {
   color: #858585;
}

@media screen and (max-width: 670px) {
   .css-footer-3line {
      flex-direction: column;
   }
}
  .container,
  .a172938a{
    z-index: 0;
}
   .navbar-box{
    z-index: 200;
}

</style>
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
                  placeholder="콘텐츠, 인물, 컬렉션를 검색해보세요.">
                  <i class="fas fa-search" id="haha"></i>
            </div>
         </form>
      </li>
      <c:choose>
         <c:when test="${ empty sessionScope.id}">
            <li class="navbar-li css-text css-hidden">
               <a href="${pageContext.request.contextPath}/users/loginform.do" class="navbar-atext" data-toggle="modal" data-target="#loginmodal">로그인</a>
               <a href="${pageContext.request.contextPath}/users/signup_form.do"
                  class="navbar-atext navbar-margin navbar-color" data-toggle="modal"
                  data-target="#signupmodal"><span>회원가입</span></a>
            </li>
         </c:when>
         <c:otherwise>
            <li class="navbar-li css-text css-hidden">
               <a href="${pageContext.request.contextPath}/users/info.o" class="navbar-atext">${sessionScope.id }</a>
               <a href="${pageContext.request.contextPath}/users/logout.do" class="navbar-atext navbar-margin navbar-color"> <span>로그아웃</span>
            </a><li>
         </c:otherwise>
      </c:choose>
   </ul>
</nav>

</body>
<script>
   

</script>