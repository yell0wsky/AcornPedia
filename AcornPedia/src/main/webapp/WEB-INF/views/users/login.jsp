<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript">
	let idExist='<%=(String)session.getAttribute("id")%>';
	if(idExist=='null') {
		alert("아이디 혹은 비밀번호가 다릅니다.");
		setTimeout(function(){location.href = "${pageContext.request.contextPath}/"}, 500)
	} else {
		location.href = "${requestScope.url}";
	}
</script>