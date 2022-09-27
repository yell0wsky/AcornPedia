<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js" crossorigin="anonymous"></script>
<style>
	 .page-ui a{
      text-decoration: none;
      color: #000;
   }
   
   .page-ui a:hover{
      text-decoration: underline;
   }
   
   .page-ui a.active{
      color: red;
      font-weight: bold;
      text-decoration: underline;
      
   }
   
   .page-ui ul{
   	  display:flex;
   	  justify-content:center;
      text-align:center;
      list-style-type: none;
      padding: 0;
   }
   
    .pagination li a{
   	  margin: 0px 0.3rem;
   }
   
   .move-tr:hover{
   		background-color: #cecece;
   		cursor:pointer;
   }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
<div class="container">
	
	<h1>목록</h1>
	<table class="table table-hover " style="text-align: center;">
		<thead class="table-light">
			<tr>
				<th style="background-color: ; text-align: center; font-size: large; color: #808080">글번호</th>
				<th style="background-color: ; text-align: center; font-size: large; color: #808080">작성자</th>
				<th style="background-color: ; text-align: center; font-size: large; color: #808080">제목</th>
				<th style="background-color: ; text-align: center; font-size: large; color: #808080">조회수</th>
				<th style="background-color: ; text-align: center; font-size: large; color: #808080">등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${list }">
			<tr class="move-tr " onclick="move('detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}')">
				<td>${tmp.num }</td>
				<td>${tmp.writer }</td>
				<td>
					<a style="text-decoration-line: none" class="text-dark " href="detail.do?num=${tmp.num }&keyword=${encodedK }&condition=${condition}">${tmp.title }</a>
				</td>
				<td>${tmp.viewCount }</td>
				<td>${tmp.regdate }</td>
			</tr>
		</c:forEach>
		<script>
			function move(dest){
				location.href=dest;
			}
		</script>
		</tbody>
	</table>
	<button class="btn btn-outline-danger pull-right" id="cafeinsert">글쓰기</button>
	<div class="page-ui clearfix">
		<ul class="pagination">
			<c:if test="${startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${startPageNum-1 }&condition=${condition }&keyword=${encodedK }">Prev</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
				<li>
					<c:choose>
						<c:when test="${pageNum eq i }">
							<a  class="active" href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:when>
						<c:otherwise>
							<a href="list.do?pageNum=${i }&condition=${condition }&keyword=${encodedK }">${i }</a>
						</c:otherwise>
					</c:choose>
				</li>
			</c:forEach>
			<c:if test="${endPageNum lt totalPageCount }">
				<li>
					<a href="list.do?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK }">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<div style="clear:both;">
	
	<form action="list.do" method="get"> 
		<div class="input-group w-50" style="margin:0 auto">
		<select class="form-select form-select-sm" aria-label=".form-select-sm example" name="condition" id="condition">
			<option value="title_content" ${condition eq 'title_content' ? 'selected' : '' }>제목+내용</option>
			<option value="title" ${condition eq 'title' ? 'selected' : '' }>제목</option>
			<option value="writer" ${condition eq 'writer' ? 'selected' : '' }>작성자</option>
		</select>
		<input style="width:350px" class="form-control" type="text" id="keyword" name="keyword" placeholder="검색어..." value="${keyword }"/>
		<button class="btn btn-outline-secondary pull-right" type="submit">검색</button>
		</div>
	</form>	
	</div>
	<c:if test="${ not empty condition }">
		<p>
			<strong>${totalRow }</strong> 개의 글이 검색 되었습니다.
		</p>
	</c:if>
</div>
<script type="text/javascript">
	let isLogin=${ not empty id };
	
	document.querySelector("#cafeinsert").addEventListener("click", function(e){
		if(!isLogin){
			e.preventDefault();
			alert("로그인이 필요합니다.");		
			document.querySelector("#login").click();
		}else{
			location.href="${pageContext.request.contextPath}/cafe/insertform.do"
		}
		
	})
	</script>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
</html>