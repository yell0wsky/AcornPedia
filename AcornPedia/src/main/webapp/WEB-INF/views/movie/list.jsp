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
            width: 1236px;  
            overflow: hidden;
            z-index: 140;
        }
		.controls{
			display: flex;
			justify-content:space-between;
			width:1236px;
			position: absolute;
			z-index: 150;
			top: 281px;
			
		}
		.controls2{
			display: flex;
			justify-content:space-between;
			width:1236px;
			position: absolute;
			z-index: 150;
			top: 180px;
			margin-left: 10px;
		}
		.controls span,
		.controls2 span{
			font-size: 2rem;
			color: #ff2f6e;
		}
        .slides,
        .slides2 {
        	position:absolute;
            left: 0; top:0;
            width: 2820px;
            padding: 0px;
            transition: left 0.5s ease-out;
            display: flex;       
            margin-left: 27.5px
        }
        .movie-css-listimg img {
            height: 330px;
            width: 220px;
            border-radius:5px;
        }
		
		.slides li,
		.slides2 li {
			float: left;
			margin-right: 20px
		} 
		.i9h72v {
			margin:0 0 10px 30px ;
			font-size: 1.3rem
		}
		
		.a172938a{
			margin: 0 30px;
			padding-top: 100px;
			position: relative;
			padding-bottom: 40px;
		}
		.a172938a2{
			position: relative;
			margin: 0 30px;
		}
		.movie-css-listText{
			margin-top: 10px
		}
		
		.movie-css-listText p{
			width: 220px;
			color: black;
			margin-bottom:0px;
		}
		.slide_wrapper a{
			text-decoration-line:none;
		}
		
		.movie-listbox
		{
		  --bs-gutter-x: 1.5rem;
		  --bs-gutter-y: 0;
		  width: 100%;
		  padding-right: calc(var(--bs-gutter-x) * 0.5);
		  padding-left: calc(var(--bs-gutter-x) * 0.5);
		  margin-right: auto;
		  margin-left: auto;
		}

		@media (min-width: 768px) {
		  .movie-listbox {
		    max-width: 720px;
		  }
		}
		@media (min-width: 992px) {
		  .movie-listbox {
		    max-width: 960px;
		  }
		}
		@media (min-width: 1400px) {
		  .movie-listbox {
		    max-width: 1320px;
		  }
		}

    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
    <main class="movie-listbox">
	    <div class="a172938a">
		    <h1 class="i9h72v">평균 평점이 높은 순위</h1>
			<p class="controls">
				<span class="prev"><i class="fas fa-chevron-circle-left"></i></span>
				<span class="next"><i class="fas fa-chevron-circle-right"></i></span>
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
		                            <p style=font-size:small>${tmp.release_date}</p>
	                            	<p style=font-size:small>${tmp.genre }</p>
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
			<p class="controls2">
				<span class="prev2"><i class="fas fa-chevron-circle-left"></i></span>
				<span class="next2"><i class="fas fa-chevron-circle-right"></i></span>
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
		                            <p style=font-size:small>${tmp.release_date}</p>
	                            	<p style=font-size:small>${tmp.genre }</p>
		                            <!-- <p class="" >by <strong>${tmp.original_title}</strong></p>  -->
		                        </div>
	                   		</a>
	                    </li>
	            	</c:forEach>
	            </ul>
	        </div>
	    </div>
    </main>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
   <script>
    var slides=document.querySelector(".slides"),
	    slide=document.querySelectorAll(".slides li"),
	    currentIdx=0,
	    slideCount=slide.length,
	    prevBtn=document.querySelector(".prev"),
	    slideWidth =220,
	    slideMargin =20,
	    nextBtn=document.querySelector(".next");
	
	slides.style.width=(slideWidth+slideMargin)*slideCount-slideMargin+"px";
	function moveSlide(num){
	    slides.style.left=-num * 240 +"px";
	    currentIdx=num;
	}
	nextBtn.addEventListener("click",function(){
	    if(currentIdx<slideCount -5){
	        moveSlide(currentIdx+1);
	    }else{
	        moveSlide(0)
	    }
	})
	prevBtn.addEventListener("click",function(){
	    if(currentIdx> 0){
	        moveSlide(currentIdx -1);
	    }else{
	        moveSlide(slideCount -5);
	    }
	})
	
	var slides2=document.querySelector(".slides2"),
	    slide2=document.querySelectorAll(".slides2 li"),
	    currentIdx2=0,
	    slideCount2=slide2.length,
	    prevBtn2=document.querySelector(".prev2"),
	    slideWidth =220,
	    slideMargin =20,
	    nextBtn2=document.querySelector(".next2");
	
	slides2.style.width=(slideWidth+slideMargin)*slideCount-slideMargin+"px";
	function moveSlide2(num){
		slides2.style.left=-num * 240 +"px";
		currentIdx2=num;
	}
	nextBtn2.addEventListener("click",function(){
	    if(currentIdx2<slideCount2 -5){
	    	moveSlide2(currentIdx2+1);
	    }else{
	    	moveSlide2(0)
	    }
	})
	prevBtn2.addEventListener("click",function(){
	    if(currentIdx2> 0){
	    	moveSlide2(currentIdx2 -1);
	    }else{
	    	moveSlide2(slideCount2 -5);
	    }
	})
	
    </script>
</html>