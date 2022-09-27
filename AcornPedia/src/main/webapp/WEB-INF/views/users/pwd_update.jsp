<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<script type="text/javascript">
	let pwdExist='<%=(String)session.getAttribute("pwd")%>';
	if(pwdExist=='null') {
		alert("비밀번호가 변경되었습니다.");
		setTimeout(function(){location.href = "${requestScope.url}"}, 500)
		
	} else {
		location.href = "${requestScope.url}";
	}
</script>





