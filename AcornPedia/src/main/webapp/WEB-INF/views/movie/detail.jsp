<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/detail.jsp</title>
<style>

.container {
	display: flex;
	/* display: inline-flex; */
	
	flex-direction: row;
	 justify-content: space-evenly;

	grid-template-columns: 200px 200px 500px;
	/* grid-template-columns: 1fr 1fr 1fr */
	/* grid-template-columns: repeat(3, 1fr) */
	/* grid-template-columns: 200px 1fr */
	/* grid-template-columns: 100px 200px auto */

	/*grid-template-rows: 200px 200px 500px;*/
	 grid-template-rows: 1fr 1fr 1fr
	/* grid-template-rows: repeat(3, 1fr) */
	/* grid-template-rows: 200px 1fr */
	/* grid-template-rows: 100px 200px auto */
}
.item {
	align-self: auto;
}


</style>
<%-- bootstrap --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
<div>
<section>
<div class="container">
	<div class="item"><p>d</p></div>
	<div class="item"><p>d</p></div>
</div>
</section>
<section>
<div class="container">
	<div class="item"><p>asd</p></div>
</div>
</section>


<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
</html>

