<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/home.jsp</title>
 <script src="https://kit.fontawesome.com/2e01103920.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
</head>
<style>
		*{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        html{
            font-family: 'Noto Sans KR', sans-serif;
            height: 400vh;
        }
        li{
            list-style:none;
        }
        .navbar-box{
            border-bottom: solid 0.8px black;
            position: fixed;
            width: 100%;
            padding-top:0.5rem;
            background-color: white;
        }
        
        .navbar-ul{
            display: flex;
            margin: 0px 50px 15px 50px;
            padding-left: 0px;
        }

        .css-logo{
            width: 10rem;
            height: 2.0625rem;
        }
        
        #logo{
            margin-top: 7px;
        }

        .css-text{
            display: flex;
            align-items: center;
            height: 3rem;
            margin-left: 1.5rem;
            text-decoration: none;
        }

        .navbar-atext{
            text-decoration: none;
            color: black;
            opacity: 0.8;
        }

        .css-textweb{
            margin-right: 0.8rem;
        }


        .navbar-divicon #fuck{
            position: absolute;
            opacity: .65;
            margin: 8px 0px 0px 7px;
        }

        .navbar-divicon input{
            height: 2rem;
            width: 17rem;
            padding: 4px 10px 4px 2rem ;
            background-color: rgb(243, 243, 243);
            border: 0px solid;
        }

        .css-search{
            margin: 0 0 0 auto;
        }

        .navbar-divicon a{
            text-decoration: none;
        }
		.navbar-margin{
			margin-left: 0.5rem;
		}
		
		.navbar-color{
			border: 1px solid black ;
			font-weight: 700;
			border-radius: 5px;
			font-size: 0.9rem;
			display: flex;
			justify-content: center;
			height: 2rem;
			width: 80px;
			padding-top: 3px;
		}

        #haha{
            display: none;
            color: black;
            opacity: 0.65;
            margin-top: 5px;
        }

        @media screen and (max-width: 930px) {
            .navbar-divicon input {
                display: none;
                transition: 0.5s ease-in-out;
                transform: scale(0.3) translate(-100%,-100%);
            }
            #fuck{
                display: none;
            }
            #haha{
                display:block;
            }
        }
        @media screen and (max-width: 670px) {
            .navbar-ul{
                display: flex;
                flex-direction: column;
                justify-content: center;
            }
            .navbar-atext{
                display: flex;
                width: 100%;
                justify-content: center;
                text-align: center;
                height: 3rem;
                align-items: center;
            }
            .css-textweb{
                margin-right: 0px;
            }
            .css-hidden{
                display: none;
            }
            #haha{
                display: none;
            }
            .navbar-li{
                margin-left: 0px;
            }
            .css-search{
                height: 0px;
            }
        }    
        .container{
        	padding-top: 100px;
        }   
</style>
<body>
 	<nav class="navbar-box">
        <ul class="navbar-ul">
            <li class="navbar-li css-logo">
                <a>
                    <img src="${pageContext.request.contextPath}/images/watcha.png" id="logo">
                </a>
            </li>
            <li class="navbar-li css-text">
                <a href="" class="navbar-atext">영화</a>
            </li>
            <li class="navbar-li css-text">
                <a href="" class="navbar-atext">TV</a>
            </li>
            <li class="navbar-li css-text">
                <a href="" class="navbar-atext">책</a>
            </li>
            <li class="navbar-li css-text css-textweb">
                <a href="" class="navbar-atext">웹툰</a>
            </li>
            <li class="navbar-li css-text css-search">
                <form action="#">
                    <div class="navbar-divicon">
                        <i class="fas fa-search" id="fuck"></i>
                        <input type="text" placeholder="콘텐츠, 인물, 컬렉션를 검색해보세요.">
                        <a href=""><i class="fas fa-search" id="haha"></i></a>
                    </div>
                </form>
            </li>
            <c:choose>
				<c:when test="${ empty sessionScope.id}">
					<li class="navbar-li css-text css-hidden">
						<a href="${pageContext.request.contextPath}/users/loginform.do" class="navbar-atext">로그인</a>
						<a href="${pageContext.request.contextPath}/users/signup_form.do" class="navbar-atext navbar-margin navbar-color">회원가입</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="navbar-li css-text css-hidden">
						<a href="${pageContext.request.contextPath}/users/info.do" class="navbar-atext">${sessionScope.id }</a>
						<a href="${pageContext.request.contextPath}/users/logout.do" class="navbar-atext navbar-margin navbar-color">로그아웃</a>
					</li>
				</c:otherwise>
			 </c:choose>
        </ul>
    </nav>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="${pageContext.request.contextPath}/movie/list.do">영화 게시판 바로가기</a></li>
		<li><a href="${pageContext.request.contextPath}/cafe/list.do">자유 게시판 바로가기</a></li>
	</ul>
</div>
</body>
</html>








