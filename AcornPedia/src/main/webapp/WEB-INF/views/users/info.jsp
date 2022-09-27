<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/info.jsp</title>
<style>
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
        <a id="profileLink" href="javascript:">
          <c:choose>
				<c:when test="${empty dto.profile }">
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16 " >
					  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				</c:when>
				<c:otherwise>
					<img id="profileImage" 
						src="${pageContext.request.contextPath}${dto.profile}"/>
				</c:otherwise>
			</c:choose>
			</a>
			<br />
	
          <form>
            <label for="name">이름</label>
            <input type="text" name="name" id="name" style="height:20px;" value="${dto.name }" readonly/>
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" style="height:20px;" value="${id }" readonly/>
            <label for="email">Email</label>
            <input type="email" name="email" id="email" style="height:20px;" value="${dto.email }" readonly/>
            <label for="regdate">가입일</label>
            <input type="text" name="regdate" id="regdate" style="height:20px;" value="${dto.regdate }" readonly/ >
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>       
			<button class="btn btn-primary" type="submit" onclick="javascript:deleteConfirm()">회원탈퇴</button>
         </form>
        </div>         
      </div>
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
<jsp:include page="/WEB-INF/component/footer.jsp"></jsp:include>
</html>

