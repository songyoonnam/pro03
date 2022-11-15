<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path2" value="${pageContext.request.contextPath }" /> 
    
    <style>
    a:link { color: rgb(0, 0, 0); text-decoration:none !important}	
    a:visited { color: #000; text-decoration:none !important}	

    a:active { color: rgb(0, 0, 0); text-decoration:none !important}
    </style>

<nav class="navbar navbar is-white" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="<%=request.getContextPath() %>/">
      <img src="./WebContent/data/green.jpg" alt="마포 문화관광" width="112" height="28">
    </a>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start" id="gnb">

      <div class="navbar-item has-dropdown is-hoverable" id="A">
        <a class="navbar-link is-arrowless">
         	 자연속힐링
        </a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        
              <div class="navbar-item has-dropdown is-hoverable" id="B">
        <a class="navbar-link is-arrowless">
          	체험관/전시장
        </a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        
              <div class="navbar-item has-dropdown is-hoverable" id="C">
        <a class="navbar-link is-arrowless">
          	공연장
        </a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        
              <div class="navbar-item has-dropdown is-hoverable" id="D">
        <a class="navbar-link is-arrowless">
          	전통시장
        </a>
      </div>
    </div>




	<div class="navbar-end" id="tnb">
	  <div class="navbar-item">
	  	<c:if test="${empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/user/agree.jsp" class="button is-success is-outlined">
	     	회원가입
	   </a>
	   <a href="${path2 }/user/login.jsp" class="button is-success is-outlined">
	    	로그인
	   </a>
	 </div>
	</c:if>
	<c:if test="${not empty sid }">
	 <div class="buttons">
	   <a href="${path2 }/UserInfoCtrl.do" class="button is-success is-outlined">
	     	회원정보
	   </a>
	   <a href="${path2 }/UserLogoutCtrl.do" class="button is-success is-outlined">
	     	로그아웃
	   </a>
		<c:if test='${sid.equals("admin")}'>
		   <a href="${path2 }/AdminCtrl.do" class="button is-success is-outlined">
		   	  관리자
		   </a>
		 </c:if>
	 </div>
	</c:if>
  </div>
</div>
  </div>
</nav>