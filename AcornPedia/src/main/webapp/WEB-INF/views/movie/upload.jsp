<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/movie/upload.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
	<script>
		var a='${file}'
		if(a=="false"){
			alert("사진 업로드에 실패했습니다.");
		}else{
			alert("사진 업로드에 성공했습니다.");
		}
		location.href = "${pageContext.request.contextPath}/movie/list.do"
	</script>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
</html>