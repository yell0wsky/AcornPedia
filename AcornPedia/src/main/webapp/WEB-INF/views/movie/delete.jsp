<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/movie/delete.jsp</title>
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
	<script>
		alert("사진이 삭제되었습니다.");
		location.href="${pageContext.request.contextPath}/movie/list.do";
	</script>
</body>
</html>