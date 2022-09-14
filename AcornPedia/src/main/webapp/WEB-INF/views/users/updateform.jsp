<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 50px;
		height: 50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
	#imageForm{
		display: none;
	}
</style>
</head>
<body>
<div class="container">
	<h1>회원정보 수정</h1>
	<a id="profileLink" href="javascript:"></a>
	<form action="${pageContext.request.contextPath}/users/update.do" method="post">
		<input type="hidden" name="profile" 
			value="${ empty dto.profile ? '' : dto.profile}"/>
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="${id }" disabled/>
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="${dto.email }"/>
		</div>
		<div>
			<label for="pwd">비밀번호</label>
			<td><a href="${pageContext.request.contextPath}/users/pwd_updateform.do">수정하기</a></td>
		</div>
		<button type="submit">수정반영</button>
	</form>
	<h2>본인 확인</h2>
		<div>
			<label for="phone">연락처</label>
			<input type="text" name="phone" id="phone" value="???"/>
		</div>
		</table>
	
	<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
		<input type="file" name="image" id="image" 
			accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
	</form>
</div>
<script src="${pageContext.request.contextPath}/resources/js/gura_util.js"></script>
<script>
	//프로필 이미지 링크를 클릭하면 
	document.querySelector("#profileLink").addEventListener("click", function(){
		// input type="file" 을 강제 클릭 시킨다. 
		document.querySelector("#image").click();
	});
	//이미지를 선택했을때 실행할 함수 등록 
	document.querySelector("#image").addEventListener("change", function(){
		
		let form=document.querySelector("#imageForm");
		
		// gura_util.js 에 정의된 함수를 호출하면서 ajax 전송할 폼의 참조값을 전달하면 된다. 
		ajaxFormPromise(form)
		.then(function(response){
			return response.json();
		})
		.then(function(data){
			// data 는 {imagePath:"/upload/xxx.jpg"} 형식의 object 이다.
			console.log(data);
			let img=`<img id="profileImage" src="${pageContext.request.contextPath}\${data.imagePath}"/>`;
			document.querySelector("#profileLink").innerHTML=img;
			// input name="profile" 요소의 value 값으로 이미지 경로 넣어주기
			document.querySelector("input[name=profile]").value=data.imagePath;
			
		/*
            document.querySelector(" css 선택자 ")
            document.querySelectorAll(" css 선택자 ")
            
            # => 아이디 선택자
            . => 클래스 선택자
            []=> 속성 선택자
            
            ex) [속성명=속성값]
            
            [id=one] : id 속성의 값이 one 인 요소 선택 : <xxx id="one" >
            [class=my-class] : class 속성의 값이 my-class 인 요소 선택 : <xxx class="my-class" >
            [name=profile] : <xxx name="profile" >
            
            input[name=profile] : input 요소 이면서 name 속성의 값이 profile 인 요소 선택
            <input name="profile">
            
            !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!주의!!!!!!!!!!!!!!!!!!!!!!
            input [name=profile] : input 요소의 자손중에서 name속성의 값이 profile인 요소 선택
           	 띄어쓰기 유무 중요
         */
		});
	});
</script>
</body>
</html>










