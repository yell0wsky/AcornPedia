<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://kit.fontawesome.com/2e01103920.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
 <style>
        @font-face {
            font-family: 'MICEGothic Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
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
            height: auto;
        }

        li {
            list-style: none;
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
            padding: 4px 10px 4px 2rem;
            background-color: rgb(243, 243, 243);
            border: 0px solid;
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

        .button-delete{
            position: absolute;
            right: 210px;
            top: 1.3rem;
            border: none;
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

        .container {
            padding-top: 100px;
            text-decoration: none;
        }


        /* footer css */
        .css-footer-box {
            width: 100%;
            background-color: #222222;
            height: auto;
            display: flex;
            font-size: 14px;
            position: absolute;
            bottom: 0;
        }

        .css-footer-margin {
            margin-right: 0.4rem;
        }

        .css-footer-text {
            flex-direction: column;
            margin: 2rem 0px 2rem 3.125rem;
        }

        .css-footer-1line,
        .css-footer-2line,
        .css-footer-3line,
        .css-footer-4line {
            display: flex;
        }

        .css-footer-2line,
        .css-footer-3line {
            margin-top: 1rem;
        }

        .css-footer-1line,
        .css-footer-2line {
            color: #a5a5a7;

        }

        .css-footer-3line,
        .css-footer-4line {
            color: #858585;
        }

        @media screen and (max-width: 670px) {
            .css-footer-3line {
                flex-direction: column;
            }
        }
    </style>
    <nav class="navbar-box">
        <ul class="navbar-ul">
            <li class="navbar-li css-logo">
                <a href="${pageContext.request.contextPath}/home.do">
                    <img src="${pageContext.request.contextPath}/resources/images/watcha.png" id="logo">
                </a>
            </li>
            <li class="navbar-li css-text navbar-li-remove">
                <a href="${pageContext.request.contextPath}/notice/list.do" class="navbar-atext">공지</a>
            </li>
            <li class="navbar-li css-text navbar-li-remove">
                <a href="${pageContext.request.contextPath}/movie/list.do" class="navbar-atext">영화</a>
            </li>
            <li class="navbar-li css-text navbar-li-remove">
                <a href="${pageContext.request.contextPath}/cafe/list.do" class="navbar-atext">자유</a>
            </li>
            <li class="navbar-li css-text css-search">
                <form action="#">
                    <div class="navbar-divicon">
                        <i class="fas fa-search" id="fuck"></i>
                        <input type="text" placeholder="콘텐츠, 인물, 컬렉션를 검색해보세요.">
                        <i class="fas fa-search" id="haha"></i>
                    </div>
                </form>
            </li>
            <c:choose>
                <c:when test="${ empty sessionScope.id}">
                    <li class="navbar-li css-text css-hidden">
                        <a href="${pageContext.request.contextPath}/users/loginform.do" class="navbar-atext">로그인</a>
                        <a href="${pageContext.request.contextPath}/users/signup_form.do"
                            class="navbar-atext navbar-margin navbar-color">
                            <span>회원가입</span>
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
               <li class="navbar-li css-text css-hidden">
                  <a href="${pageContext.request.contextPath}/users/info.do" class="navbar-atext">${sessionScope.id }</a>
                  <a href="${pageContext.request.contextPath}/users/logout.do" class="navbar-atext navbar-margin navbar-color">
                        <span>로그아웃</span>
                    </a>
               </li>
            </c:otherwise>
            </c:choose>
        </ul>
    </nav>
</body>
<script>
    const input = document.querySelector(".navbar-divicon input");
    const navbarDivicon = document.querySelector(".navbar-divicon");
    const buttonDaelete=document.querySelector(".button-delete");
    const smallIcon=document.querySelector("#haha");
    const navLiRemove=document.querySelectorAll(".navbar-li-remove");
    
    function handleClick() {
        const button = document.createElement("button");
        button.innerText=("✕")
        navbarDivicon.appendChild(button);
        button.classList.add("button-delete")
        button.addEventListener("click", buttonremove);
    }
    
    function buttonremove() {
        input.value="";
        document.querySelector(".button-delete").remove();
    };
    
    function handleInputClick(){
    }

    input.addEventListener("click", handleClick);
    smallIcon.addEventListener("click",handleInputClick)

    
</script>