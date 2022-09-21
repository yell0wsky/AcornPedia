<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/movie/upload_form.jsp</title>
<%-- bootstrap 읽어오기 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
	<div class="container">
	   	<h1>이미지 업로드 폼</h1>
	   	<form action="${pageContext.request.contextPath}/movie/upload.do" method="post" enctype="multipart/form-data">
	      	<div>
	         	<label for="caption">설명</label>
	         	<input type="text" name="caption" id="caption"/>
	      	</div>
	      	<div>
	         	<label for="image">이미지</label>
	         	<input type="file" name="image" id="image"
	            	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
	      	</div>
	      	<button type="submit">업로드</button>
	   	</form>
	</div>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
</html>