<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript">
		alert("회원가입 되었습니다.");
		setTimeout(function(){location.href = "loginform.do?url=${requestScope.encodedUrl }"}, 500)
</script>