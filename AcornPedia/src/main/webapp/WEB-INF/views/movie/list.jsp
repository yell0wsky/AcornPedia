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

        .slides {
        	position:absolute;
            left: 0; top:0;
            width: 2820px;
            padding: 0px;
            transition: left 0.5s ease-out;
        }

        .movie-css-listimg img {
            height: 330px;
            width: 220px;
        }
		
		.slides li:not(:last-child) {
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
			margin: 0 30px
		}
		
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
    <div class="a172938a">
	    <h1 class="i9h72v">영화목록</h1>
		<p class="controls">
			<span class="prev"></span>
			<span class="next"></span>
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
	                            <p class="">${tmp.title}</p>
	                            <p class="">by <strong>${tmp.original_title}</strong></p>
	                        </div>
                   		</a>
                    </li>
            	</c:forEach>
            </ul>
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
	
    </script>
</html>