<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/cafe/insert.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
	<script>
		alert("새글이 추가 되었습니다.");
		location.href="${pageContext.request.contextPath}/cafe/list.do";
	</script>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</body>
</html>





