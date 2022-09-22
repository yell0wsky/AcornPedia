<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/users/info.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/info.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navbar.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/2e01103920.js" crossorigin="anonymous"></script>
</head>
<body>
  <div id="wrap">
     <div id="container">
     <h3>회원 정보</h3>
        <div id="top-a">
          <img src="../images/watcha.png" alt="pedia" />
          <br>
          <form>
            <label for="name">이름</label>
            <input type="text" name="name" id="name" placeholder=" ">
            
            <label for="id">아이디</label>
            <input type="text" name="id" id="id" placeholder="${id } ">

            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="${dto.email }">
            
            <label for="regdate">가입일</label>
            <input type="text" name="regdate" id="regdate" placeholder="${dto.regdate } ">
           
            <a href="${pageContext.request.contextPath}/users/updateform.do">개인정보 수정</a>
			<a href="javascript:deleteConfirm()">회원탈퇴</a>
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
</html>

