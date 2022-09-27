<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/list.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js"
	crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/bedc3cc23c.js"
	crossorigin="anonymous"></script>
<style>
.slide_wrapper {
	position: relative;
	margin: 0 auto;
	height: 500px;
	width: 1236px;
	overflow: hidden;
	z-index: 140;
}

.controls {
	display: flex;
	justify-content: space-between;
	width: 1236px;
	position: relative;
	z-index: 150;
	top: 281px;
}

.fa-solid fa-circle>fa-solid fa-chevron-left {
	opacity: 0.4;
}

.controls2 {
	display: flex;
	justify-content: space-between;
	width: 1236px;
	position: relative;
	z-index: 150;
	top: 180px;
}

.controls span, .controls2 span {
	font-size: 2rem;
	position: relative;
}

.slides, .slides2 {
	position: absolute;
	left: 0;
	top: 0;
	width: 2820px;
	padding: 0px;
	transition: left 0.5s ease-out;
	display: flex;
	margin-left: 27.5px
}

.movie-css-listimg img {
	height: 330px;
	width: 220px;
	border-radius: 5px;
}

.slides li, .slides2 li {
	float: left;
	margin-right: 20px
}

.i9h72v {
	margin: 0 0 10px 30px;
	font-size: 1.3rem
}

.a172938a {
	margin: 0 30px;
	padding-top: 100px;
	position: relative;
	padding-bottom: 40px;
	padding-bottom: 0px;
}

.a172938a2 {
	position: relative;
	margin: 0 30px;
	padding-bottom: 0px;
}

.movie-css-listText {
	margin-top: 10px
}

.movie-css-listText p {
	width: 220px;
	color: black;
	margin-bottom: 0px;
}

.slide_wrapper a {
	text-decoration-line: none;
}

.movie-listbox { -
	-bs-gutter-x: 1.5rem; -
	-bs-gutter-y: 0;
	width: 100%;
	padding-right: calc(var(- -bs-gutter-x)* 0.5);
	padding-left: calc(var(- -bs-gutter-x)* 0.5);
	margin-right: auto;
	margin-left: auto;
}

@media ( min-width : 992px) {
	.movie-listbox {
		max-width: 960px;
	}
	.movie-css-listimg img {
		height: 284.625px;
		width: 189.75px;
	}
	.slide_wrapper, .controls, .controls2 {
		width: 876px;
	}
	.slide_wrapper {
		height: 400px
	}
	.movie-css-listText p {
		width: 189.75px;
	}
	.controls {
		top: 262px;
		height: 0px;
	}
	.controls2 {
		top: 161px;
		height: 0px;
	}
}

@media ( min-width : 1400px) {
	.movie-listbox {
		max-width: 1320px;
	}
	.movie-css-listimg img {
		height: 330px;
		width: 220px;
	}
	.slide_wrapper, .controls, .controls2 {
		width: 1236px;
	}
	.slide_wrapper {
		height: 460px;
	}
	.movie-css-listText p {
		width: 220px;
	}
	.controls {
		top: 281px;
		height: 0px;
	}
	.controls2 {
		top: 180px;
		height: 0px;
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
				<span class="prev"> <i class="fa-solid fa-circle"
					style="color: white; position: relative; z-index: 1; left: -4px; top: -134px;     font-size: larger;border-radius: 50%; cursor: pointer; box-shadow: rgb(0 0 0/ 20%) 0px 0px 4px 0px;"></i>
					<i class="fa-solid fa-chevron-left"
					style="color: gray; position: relative; z-index: 2; left: -42px; top: -139px; font-size: x-large; cursor: pointer"></i>

				</span> <span class="next"><i class="fa-solid fa-circle"
					style="color: white; position: relative; z-index: 1; left: 35px; top: -134px;     font-size: larger;border-radius: 50%; cursor: pointer; box-shadow: rgb(0 0 0/ 20%) 0px 0px 4px 0px;"></i>
					<i class="fa-solid fa-chevron-right"
					style="color: gray; position: relative; z-index: 2; left: -2px; top: -139px; font-size: x-large; cursor: pointer"></i></span>
			</p>
			<div class="slide_wrapper">
				<ul class="slides">
					<c:forEach var="tmp" items="${list }">
						<li><a
							href="${pageContext.request.contextPath}/movie/detail.do?num=${tmp.num}">
								<div class="movie-css-listimg">
									<img
										src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${tmp.poster_path }" />
								</div>
								<div class="movie-css-listText">
									<p class="8277n1m">${tmp.title}</p>
									<p style="font-size: small">${tmp.release_date}</p>
									<p style="font-size: small">평균⭐ ${tmp.stars} 💗</p>
									<!-- <p class="" >by <strong>${tmp.original_title}</strong></p>  -->
								</div>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div class="a172938a2">
			<h1 class="i9h72v">이런 영화는 어떤가요</h1>
			<p class="controls2">
				<span class="prev2"><i class="fa-solid fa-circle"
					style="color: white; position: relative; z-index: 1; left: -4px; top: -34px;     font-size: larger;border-radius: 50%; cursor: pointer; box-shadow: rgb(0 0 0/ 20%) 0px 0px 4px 0px;"></i>
					<i class="fa-solid fa-chevron-left"
					style="color: gray; position: relative; z-index: 2; left: -42px; top: -39px; font-size: x-large; cursor: pointer"></i></span>
				<span class="next2"><i class="fa-solid fa-circle"
					style="color: white; position: relative; z-index: 1; left: 35px; top: -34px;     font-size: larger;border-radius: 50%; cursor: pointer; box-shadow: rgb(0 0 0/ 20%) 0px 0px 4px 0px;"></i>
					<i class="fa-solid fa-chevron-right"
					style="color: gray; position: relative; z-index: 2; left: -2px; top: -39px; font-size: x-large; cursor: pointer"></i></span>
			</p>
			<div class="slide_wrapper">
				<ul class="slides2">
					<c:forEach var="tmp" items="${list2 }">
						<li><a
							href="${pageContext.request.contextPath}/movie/detail.do?num=${tmp.num}">
								<div class="movie-css-listimg">
									<img
										src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${tmp.poster_path }" />
								</div>
								<div class="movie-css-listText">
									<p class="8277n1m">${tmp.title}</p>
									<p style="font-size: small">${tmp.release_date}</p>
									<p style="font-size: small">평균⭐ ${tmp.stars} 💗</p>
									<!-- <p class="" >by <strong>${tmp.original_title}</strong></p>  -->
								</div>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</main>
	<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
<script>
	var slides = document.querySelector(".slides"), slide = document
			.querySelectorAll(".slides li"), currentIdx = 0, slideCount = slide.length, prevBtn = document
			.querySelector(".prev"), slideImgSize = document
			.querySelector(".movie-css-listimg"), slideMargin = 20, nextBtn = document
			.querySelector(".next");

	slides.style.width = (slideImgSize + slideMargin) * slideCount
			- slideMargin + "px";
	function moveSlide(num) {
		let windowSize = window.innerWidth;
		if (windowSize <= 1400) {
			slideSize = 209.75;
		} else if (windowSize >= 1400) {
			slideSize = 240;
		}
		slides.style.left = -num * slideSize + "px";
		currentIdx = num;
	}
	nextBtn.addEventListener("click", function() {
		let windowSize = window.innerWidth;
		if (windowSize <= 1400) {
			if (currentIdx < slideCount - 4) {
				moveSlide(currentIdx + 1);
			} else {
				moveSlide(0)
			}
		} else if (windowSize >= 1400) {
			if (currentIdx < slideCount - 5) {
				moveSlide(currentIdx + 1);
			} else {
				moveSlide(0)
			}
		}
	})
	prevBtn.addEventListener("click", function() {
		let windowSize = window.innerWidth;
		if (windowSize <= 1400) {
			if (currentIdx > 0) {
				moveSlide(currentIdx - 1);
			} else {
				moveSlide(slideCount - 4);
			}
		} else if (windowSize >= 1400) {
			if (currentIdx > 0) {
				moveSlide(currentIdx - 1);
			} else {
				moveSlide(slideCount - 5);
			}
		}
	})

	const movieListBox = document.querySelector(".slide_wrapper");

	function handleWindowSize() {
		let windowSize = window.innerWidth;
		if (windowSize <= 1400) {
			slideImgSize.style.width = 189.75;
		} else if (windowSize >= 1400) {
			slideImgSize.style.width = 220;
		}
	}

	window.addEventListener("resize", handleWindowSize);

	var slides2 = document.querySelector(".slides2"), slide2 = document
			.querySelectorAll(".slides2 li"), currentIdx2 = 0, slideCount2 = slide2.length, prevBtn2 = document
			.querySelector(".prev2"), slideWidth = 220, slideMargin = 20, nextBtn2 = document
			.querySelector(".next2");

	slides2.style.width = (slideWidth + slideMargin) * slideCount - slideMargin
			+ "px";
	function moveSlide2(num) {
		let windowSize = window.innerWidth;
		if (windowSize <= 1400) {
			slideSize = 209.75;
		} else if (windowSize >= 1400) {
			slideSize = 240;
		}
		slides2.style.left = -num * slideSize + "px";
		currentIdx2 = num;
	}
	nextBtn2.addEventListener("click", function() {
		let windowSize = window.innerWidth;
		if (windowSize <= 1400) {
			if (currentIdx2 < slideCount2 - 4) {
				moveSlide2(currentIdx2 + 1);
			} else {
				moveSlide2(0)
			}
		} else if (windowSize >= 1400) {
			if (currentIdx2 < slideCount2 - 5) {
				moveSlide2(currentIdx2 + 1);
			} else {
				moveSlide2(0)
			}
		}
	})
	prevBtn2.addEventListener("click", function() {
		let windowSize = window.innerWidth;
		if (windowSize <= 1400) {
			if (currentIdx2 > 0) {
				moveSlide2(currentIdx2 - 1);
			} else {
				moveSlide2(slideCount2 - 4);
			}
		} else if (windowSize >= 1400) {
			if (currentIdx2 > 0) {
				moveSlide2(currentIdx2 - 1);
			} else {
				moveSlide2(slideCount2 - 5);
			}
		}
	})
</script>
</html>