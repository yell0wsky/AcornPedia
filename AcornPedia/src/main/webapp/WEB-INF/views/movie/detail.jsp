<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/detail.jsp</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/moviedetail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/stars.css" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js"
	crossorigin="anonymous"></script>
</head>
<style>
	 #movieinfo
      {
        --bs-gutter-x: 1.5rem;
        --bs-gutter-y: 0;
        width: 100%;
        padding-right: calc(var(--bs-gutter-x) * 0.5);
        padding-left: calc(var(--bs-gutter-x) * 0.5);
        margin-right: auto;
        margin-left: auto;
        margin-top: 70px;
      }
	  @media (min-width: 2px) {
        #movieinfo {
          max-width: 1400px;
        }
      }
     
      #moviewrapper{
      	 width: 100%;
		 height: 100%;
		 text-align: center;
		 position: relative;
		 z-index: 1;
		 background-color: #000;
		 
      }
     
      #moviewrapper:after{
      	width: 100%;
	 	height: 100%;
	 	content: "";
	  	background: url("https://www.themoviedb.org/t/p/w1066_and_h600_bestv2${dto.backdrop_path}");
      	background-size: cover;
	  	position: absolute;
	  	top: 0;
	  	left: 0;
	  	z-index: -1;
	  	opacity: 0.2;
      }
      .movieposter{
        width: 370px;
      	height: 600px;
      }
      .movieposter img{
      	max-width: 467px;
    	max-height: 700px;
      }
      #movieinfo{
      	display: flex;
      	color: white;
      }
      #movietitle{
      	font-size: 2.5rem;
      	margin: 0 0 10px 0;
      	text-align: left;
      }
      #iwjsuy12{
      	display: flex;
      	margin: 15px 0px 0px 25px;
      	width: 700px;
      	height: 410px;
      }
      
      .movie-detailtext{
      	text-align: left;
      	margin-bottom: 10px;
      }
      
      #starform{
      	text-align: left;
      	top:0px;
      }
      #starform label{
      	font-size: 1.6em;
      }
      .movieDetailDate{
      	color: #afafaf;
      	font-size: 1.7rem;
      }
      .movieGrade{      
      	margin-top:50px;
      	display: flex;
      	flex-direction: column;
      	text-align: left;
      }
      .91jhijhi{
      	height: 390px;
      }
      .movieGrade div{
      	margin-bottom: 5px;
      }
      .movieSummary{
      	overflow: scroll;
      	height: 196px;
      	-ms-overflow-style: none;
      }
      .movieSummary::-webkit-scrollbar {
    	display: none;
	  }
</style>
<body>
	<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
	<div id='moviewrapper'>
		<section>
			<div class="movie-detail">
				<div id="movieinfo" >
					<div class="movieposter" style="margin-left: 30px;">
						<img src="https://www.themoviedb.org/t/p/w300_and_h450_bestv2${dto.poster_path}"  style="height: 550px;" />
					</div>
					<div id="iwjsuy12">
						<div>
							<h3 id="movietitle">
								<span>${dto.title}</span>
								<span class="movieDetailDate">(${dto.release_date })</span>
							</h3>
							<div class="movie-detailtext">${dto.genre}</div>
							<h4>줄거리</h4>
							<p class="movieSummary">${dto.overview }</p>
							
							<div class="movieGrade">
								<div>
									<div class="movie-detailtexts">평균 ⭐${dto.stars} (${dto.count}명)</div>
									<form name="starform" id="starform" method="post"
									action="${pageContext.request.contextPath}/movie/runStars.do">
									<fieldset>
										<button class="btn btn-primary" type="submit">평가하기</button>
										<input type="radio" name="rating" value="5" id="rate1"><label for="rate1" >⭐</label>
										<input type="radio" name="rating" value="4"	id="rate2"><label for="rate2" >⭐</label>
										<input type="radio" name="rating" value="3" id="rate3"><label for="rate3" >⭐</label>
										<input type="radio" name="rating" value="2" id="rate4"><label for="rate4" >⭐</label>
										<input type="radio" name="rating" value="1" id="rate5"><label for="rate5" >⭐</label>
										<input type="hidden" name="num" id="num" value="${dto.num}" />
									</fieldset>
								</div>
								<div>
									<c:choose>
										<c:when test="${stars!=0}">
										<p>${sessionScope.id } 님의 평가점수는 ⭐${stars} 이군요!</p>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>						
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script type="text/javascript">
let idExist='<%=(String)session.getAttribute("id")%>';
document.querySelector("#starform").addEventListener("submit", function(e){
	if(idExist=="null"){
		e.preventDefault();
		alert("로그인을 해주세요");		
		document.querySelector("#login").click();
	} else{
		alert("별점이 등록되었습니다.")
	}
});
</script>
</html>