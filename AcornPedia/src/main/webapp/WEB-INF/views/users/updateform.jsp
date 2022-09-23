<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/updateform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/updateform.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/users.css" />

<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 100px;
		height: 100px;
		border: 0px solid #cecece;
		border-radius: 70%;
	}
	#imageForm{
		display: none;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/component/nav.jsp"></jsp:include>

  <div id="wrap">
      <div id="container">
        <div id="top-a">
         <a id="profileLink" href="javascript:">
		<c:choose>
			<c:when test="${empty dto.profile }">
				<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
			</c:when>
			<c:otherwise>
				<img id="profileImage" 
					src="${pageContext.request.contextPath}${dto.profile}" />
			</c:otherwise>
		</c:choose>
	</a>
	<form action="${pageContext.request.contextPath}/users/update.do" method="post">
		<input type="hidden" name="profile" 
			value="${ empty dto.profile ? '' : dto.profile}"/>
          
            <label for="name">이름</label>
            <input type="text" name="name" id="name" style="height:20px;" value="${dto.name }" />
            
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" style="height:20px;" value="${id }" disabled/>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" style="height:20px;" value="${dto.email }" />

        	<button type="submit" class="btn btn-outline-primary">저장</button>
        	<button type="submit" class="btn btn-outline-primary"><a href="${pageContext.request.contextPath}/users/pwd_updateform.do">비밀번호 수정</a></button>
        	</form>
        
          	<form action="${pageContext.request.contextPath}/users/ajax_profile_upload.do" method="post" 
				id="imageForm" enctype="multipart/form-data">
			<input type="file" name="image" id="image"
			accept=".jpg, .jpeg, .png, .JPG, .JPEG, .gif"/>
			</form>
			 </div>
         </div>
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
			document.querySelector("input[name=profile]").value=data.imagePath;
		});
	});
</script>
</body>
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</html>
