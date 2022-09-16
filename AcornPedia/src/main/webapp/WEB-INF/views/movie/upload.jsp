<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/movie/upload.jsp</title>
</head>
<body>
	<script>
		var a='${file}'
		if(a=="false"){
			alert("사진 업로드에 실패했습니다.");
		}else{
			alert("사진 업로드에 성공했습니다.");
		}
		location.href = "${pageContext.request.contextPath}/movie/list.do"
	</script>
</body>
</html>