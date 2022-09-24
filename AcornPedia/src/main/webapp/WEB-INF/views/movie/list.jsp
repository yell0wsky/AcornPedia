<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js" crossorigin="anonymous"></script>
    <style>
        .slide_wrapper {
            position: relative;
            margin: 0 auto;
            height: 400px;
            width: 1720px;  
            overflow: hidden;
        }

        .slides,
        .slides2 {
        	position:absolute;
            left: 0; top:0;
            width: 2820px;
            padding: 0px;
            transition: left 0.5s ease-out;
            display: flex;       
        }

        .movie-css-listimg img {
            height: 330px;
            width: 220px;
            border-radius:5px;
        }
		
		.slides li,
		.slides2 li {
			float: left;
			margin-right: 30px
		} 
		.i9h72v {
			margin-left: 50px;
		}
		
		.controls{
			display: flex;
			justify-content: space-between;
		}
		.controls span{
			padding: 10px 20px;
			margin: 0px 10px;
		}
		
		.a172938a{
			margin: 0 30px;
			padding-top: 100px
		}
		.a172938a2{
			margin: 0 30px;
		}
		.movie-css-listText{
			margin-top: 10px
		}
		
		.movie-css-listText p{
			width: 220px;
			color: black;
		}
		.slide_wrapper a{
			text-decoration-line:none;
		}
		
		.i9h72v{
			font-size: 1.3rem
		}
	
		
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
    <div class="container">
    <div class="a172938a">
	    <h1 class="i9h72v">평균 평점이 높은 순위</h1>
		<p class="controls">
			<span class="prev"><</span>
			<span class="next">></span>
		</p>
        <div class="slide_wrapper">
            <ul class="slides">
            	<c:forEach var="tmp" items="${list }">
                    <li>
                    	<a href="${pageContext.request.contextPath}/movie/detail.do?num=${tmp.num}">
	                        <div class="movie-css-listimg">
	                            <img src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${tmp.poster_path }" />
	                        </div>
	                        <div class="movie-css-listText">
	                            <p class="8277n1m" >${tmp.title}</p>
	                            <!-- <p class="" >by <strong>${tmp.original_title}</strong></p>  -->
	                        </div>
                   		</a>
                    </li>
            	</c:forEach>
            </ul>
        </div>
    </div>
    <div class="a172938a2">
	    <h1 class="i9h72v">이런 영화는 어떤가요</h1>
		<p class="controls">
			<span class="prev2"><</span>
			<span class="next2">></span>
		</p>
        <div class="slide_wrapper">
            <ul class="slides2">
            	<c:forEach var="tmp" items="${list2 }">
                    <li>
                    	<a href="${pageContext.request.contextPath}/movie/detail.do?num=${tmp.num}">
	                        <div class="movie-css-listimg">
	                            <img src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${tmp.poster_path }" />
	                        </div>
	                        <div class="movie-css-listText">
	                            <p class="8277n1m" >${tmp.title}</p>
	                            <!-- <p class="" >by <strong>${tmp.original_title}</strong></p>  -->
	                        </div>
                   		</a>
                    </li>
            	</c:forEach>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
   <script>
    var slides=document.querySelector(".slides"),
	    slide=document.querySelectorAll(".slides li"),
	    currentIdx=0,
	    slideCount=slide.length,
	    prevBtn=document.querySelector(".prev"),
	    slideWidth =220,
	    slideMargin =30,
	    nextBtn=document.querySelector(".next");
	
	slides.style.width=(slideWidth+slideMargin)*slideCount-slideMargin+"px";

	function moveSlide(num){
	    slides.style.left=-num * 250 +"px";
	    currentIdx=num;
	}
	nextBtn.addEventListener("click",function(){
	    if(currentIdx<slideCount -7){
	        moveSlide(currentIdx+1);
	    }else{
	        moveSlide(0)
	    }
	})
	prevBtn.addEventListener("click",function(){
	    if(currentIdx> 0){
	        moveSlide(currentIdx -1);
	    }else{
	        moveSlide(slideCount -7);
	    }
	})
	
	var slides2=document.querySelector(".slides2"),
	    slide2=document.querySelectorAll(".slides2 li"),
	    currentIdx2=0,
	    slideCount2=slide2.length,
	    prevBtn2=document.querySelector(".prev2"),
	    slideWidth =220,
	    slideMargin =30,
	    nextBtn2=document.querySelector(".next2");
	
	slides2.style.width=(slideWidth+slideMargin)*slideCount-slideMargin+"px";

	function moveSlide2(num){
		slides2.style.left=-num * 250 +"px";
		currentIdx2=num;
	}
	nextBtn2.addEventListener("click",function(){
	    if(currentIdx2<slideCount2 -7){
	    	moveSlide2(currentIdx2+1);
	    }else{
	    	moveSlide2(0)
	    }
	})
	prevBtn2.addEventListener("click",function(){
	    if(currentIdx2> 0){
	    	moveSlide2(currentIdx2 -1);
	    }else{
	    	moveSlide2(slideCount2 -7);
	    }
	})
	
    </script>
</html>