<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript">
		alert("비밀번호가 변경되었습니다.");
		setTimeout(function(){location.href = "${requestScope.url}"}, 500)
</script>