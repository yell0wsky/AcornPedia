<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/info.jsp</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body>
<div class="container">
	<h1>회원 정보</h1>
	<table>
		<tr>
			<th>아이디</th>
			<td>${id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td>???</td>
		</tr>
		<tr>
				<th>연락처 </th>
				<td>???</td>
			</tr>
		<tr>
			<th>가입일</th>
			<td>${dto.regdate }</td>
		</tr>
</table>
		
	<a href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>
	<a href="javascript:deleteConfirm()">탈퇴</a>
</div>
<script>
	function deleteConfirm(){
		const isDelete=confirm("${id} 님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="${pageContext.request.contextPath}/users/delete.do";
		}
	}
</script>
</body>
</html>





