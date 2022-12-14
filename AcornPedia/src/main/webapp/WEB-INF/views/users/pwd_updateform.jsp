<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/pwd_updateform.jsp</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/users.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>
<div id="wrap">
<div id="container">
	<div id="top-a">
	<h1>패스워드 변경</h1>
	
	<br>
	<form action="${pageContext.request.contextPath}/users/pwd_update.do" method="post" id="myForm">
	<form>
		
			<label for="pwd">기존 패스워드</label>
			<input type="password" name="pwd" id="pwd" style="height:20px;"/>
		
		
			<label for="newPwd">새 패스워드</label>
			<input type="password" name="newPwd" id="newPwd" style="height:20px;"/>
		
		
			<label for="newPwd2">새 패스워드 확인</label>

			<input type="password" id="newPwd2" style="height:20px;"/>
			
			
		<br>
		<button class="btn btn-primary" type="submit">수정</button>
			
		</form>
	</form>
</div>
	</div>
	</div>

<script>
	//폼에 submit 이벤트가 일어났을때 실행할 함수를 등록하고 
	document.querySelector("#myForm").addEventListener("submit", function(e){
		let pwd1=document.querySelector("#newPwd").value;
		let pwd2=document.querySelector("#newPwd2").value;
		//새 비밀번호와 비밀번호 확인이 일치하지 않으면 폼 전송을 막는다.
		if(pwd1 != pwd2){
			alert("비밀번호를 확인 하세요!");
			e.preventDefault();//폼 전송 막기 
		}
	});
</script>
</body>
</html>