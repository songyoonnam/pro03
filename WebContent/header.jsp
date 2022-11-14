<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar is-white" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a class="navbar-item" href="<%=request.getContextPath() %>/">
      <img src="/data/green.jpg" width="112" height="28">
    </a>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">

      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
         	 소통과 참여
        </a>

        <div class="navbar-dropdown">
          <a class="navbar-item">
           	 구민참여
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
           	 온라인 예약/신청
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
                                협치마포 둘러보기
          </a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        
              <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          	열린행정
        </a>

        <div class="navbar-dropdown">
          <a class="navbar-item">
           	 코로나19
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
                                회의공개
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
                                법률/계약정보 공개
          </a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        
              <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          	마포구 소개
        </a>

        <div class="navbar-dropdown">
          <a class="navbar-item">
         	   마포구 소개
          </a>
		<hr class="navbar-divider">
          <a class="navbar-item">
          	  청사안내
          </a>
		<hr class="navbar-divider">
          <a class="navbar-item">
                                 행정조직
          </a>
        </div>&nbsp;&nbsp;&nbsp;&nbsp;
        
              <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          	분야별 정보
        </a>

        <div class="navbar-dropdown">
          <a class="navbar-item">
            	안전마포
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
            	일자리/경제
          </a>
          <hr class="navbar-divider">
          <a class="navbar-item">
            	교통/주차
          </a>
        </div>
      </div>
    </div>

    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
          <a class="button is-success is-outlined">
          		  회원가입
          </a>
          <a class="button is-success is-outlined">
           		 로그인
          </a>
        </div>
      </div>
    </div>
  </div>
</nav>