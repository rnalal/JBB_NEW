<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />

<style>
  :root{
    --bg: #fffaf5;
    --bg2:#fff3e6;
    --panel:#ffffff;
    --panel2:#fff7ef;
    --text:#1f2937;
    --muted:#6b7280;
    --line: rgba(17,24,39,.10);
    --brand:#ff8c00;
    --brand2:#ffb15a;
    --shadow: 0 14px 40px rgba(17,24,39,.10);
    --shadow2: 0 10px 24px rgba(17,24,39,.08);
    --r: 18px;
    --max: 1100px;
  }

  .header-wrap{
    position: sticky;
    top: 0;
    z-index: 100;
    backdrop-filter: blur(12px);
    background: rgba(255,255,255,.72);
    border-bottom: 1px solid var(--line);
  }

  .header{
    max-width: var(--max);
    margin: 0 auto;
    padding: 0 16px;
  }

  .header-top{
    position: relative;
    height: 64px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:12px;
  }

  .header-left{
    display:flex;
    align-items:center;
    gap:10px;
  }

  .header-icon-btn{
    width:44px;
    height:44px;
    display:grid;
    place-items:center;
    border:1px solid var(--line);
    border-radius: 14px;
    cursor:pointer;
    user-select:none;
    background: rgba(255,255,255,.9);
    color: var(--text);
    font-size: 18px;
    transition: transform .15s ease, background .15s ease, box-shadow .15s ease;
  }

  .header-icon-btn:hover{
    background: #fff;
    transform: translateY(-1px);
    box-shadow: 0 10px 20px rgba(17,24,39,.08);
  }

  .logo{
    font-weight: 900;
    letter-spacing: .2px;
    font-size: 22px;
    color: var(--text);
    display:flex;
    align-items:center;
    gap:10px;
    text-decoration: none;
  }

  .logo-badge{
    width:34px;
    height:34px;
    border-radius: 12px;
    display:grid;
    place-items:center;
    background: rgba(255,140,0,.12);
    border: 1px solid rgba(255,140,0,.28);
    color: var(--brand);
    font-weight: 900;
  }

  .logo-center{
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
  }

  .header-right{
    display:flex;
    align-items:center;
    gap:10px;
    min-width:44px;
    justify-content:flex-end;
  }

  .home-btn{
    padding:0;
  }

  .home-icon{
    width: 22px;
    height: 22px;
    object-fit: contain;
    display: block;
  }

  /* 로그인 시간 바 */
  .login-timer-bar{
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:12px;
    padding: 10px 0 12px;
    border-top: 1px solid rgba(17,24,39,.06);
  }

  .login-timer-box{
    width:100%;
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:12px;
    padding: 10px 14px;
    border-radius: 14px;
    background: linear-gradient(180deg, rgba(255,247,239,.95), rgba(255,243,230,.95));
    border: 1px solid rgba(255,140,0,.20);
  }

  .login-timer-left{
    display:flex;
    align-items:center;
    gap:8px;
    min-width:0;
  }

  .login-timer-label{
    font-size: 13px;
    font-weight: 900;
    color: #9a4b00;
    white-space: nowrap;
  }

  .login-timer-time{
    font-size: 13px;
    font-weight: 800;
    color: var(--text);
  }

  .extend-btn{
    flex-shrink: 0;
    padding: 8px 12px;
    border-radius: 10px;
    border: 1px solid rgba(255,140,0,.25);
    background: #fff;
    color: var(--brand);
    font-size: 12px;
    font-weight: 900;
    cursor: pointer;
    transition: transform .15s ease, box-shadow .15s ease, background .15s ease;
  }

  .extend-btn:hover{
    transform: translateY(-1px);
    box-shadow: 0 8px 18px rgba(17,24,39,.08);
    background: #fffaf3;
  }

  /* Sidebar */
  .overlay{
    position: fixed;
    inset:0;
    background: rgba(17,24,39,.35);
    opacity:0;
    pointer-events:none;
    transition: opacity .2s ease;
    z-index: 190;
  }

  .overlay.active{
    opacity:1;
    pointer-events:auto;
  }

  .sidebar{
    position: fixed;
    top:0;
    left:0;
    width:320px;
    max-width:86vw;
    height:100vh;
    transform: translateX(-105%);
    transition: transform .25s ease;
    z-index: 200;
    background: rgba(255,255,255,.92);
    backdrop-filter: blur(14px);
    border-right: 1px solid var(--line);
    box-shadow: var(--shadow);
    padding: 16px;
    display:flex;
    flex-direction:column;
    gap:14px;
    color: var(--text);
  }

  .sidebar.active{
    transform: translateX(0);
  }

  .side-top{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding-bottom:10px;
    border-bottom: 1px solid var(--line);
  }

  .side-title{
    display:flex;
    align-items:center;
    gap:10px;
    font-weight: 900;
  }

  .close-btn{
    width:40px;
    height:40px;
    display:grid;
    place-items:center;
    border-radius:14px;
    border:1px solid var(--line);
    cursor:pointer;
    background: rgba(255,255,255,.95);
    transition: box-shadow .15s ease, transform .15s ease;
  }

  .close-btn:hover{
    transform: translateY(-1px);
    box-shadow: 0 10px 20px rgba(17,24,39,.08);
  }

  .profile{
    display:flex;
    align-items:center;
    gap:12px;
    padding:12px;
    border-radius:16px;
    border:1px solid var(--line);
    background: rgba(255,247,239,.65);
  }

  .avatar{
    width:52px;
    height:52px;
    border-radius:16px;
    object-fit:cover;
    background:#f3f4f6;
    border:1px solid rgba(17,24,39,.10);
  }

  .profile .links{
    display:flex;
    flex-direction:column;
    gap:6px;
  }

  .profile-info{
    display:flex;
    flex-direction:column;
    gap:6px;
  }

  .username{
    font-size:14px;
    font-weight:900;
    color: var(--text);
  }

  .link-row{
    display:flex;
    gap:10px;
    align-items:center;
    flex-wrap:wrap;
  }

  .link{
    display:inline-flex;
    align-items:center;
    gap:6px;
    padding:8px 10px;
    border-radius:999px;
    border:1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.95);
    font-size:12px;
    font-weight:900;
    color: var(--text);
    text-decoration:none;
    transition: border-color .15s ease, transform .15s ease;
  }

  .link:hover{
    transform: translateY(-1px);
    border-color: rgba(255,140,0,.30);
  }

  .side-menu{
    display:flex;
    flex-direction:column;
    gap:8px;
  }

  .menu-item{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:12px 12px;
    border-radius:16px;
    border:1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.92);
    font-weight:900;
    color: var(--text);
    text-decoration:none;
    transition: background .15s ease, transform .15s ease, border-color .15s ease, box-shadow .15s ease;
  }

  .menu-item:hover{
    background:#fff;
    transform: translateY(-1px);
    border-color: rgba(255,140,0,.30);
    box-shadow: 0 12px 24px rgba(17,24,39,.08);
  }

  .menu-item small{
    color: var(--muted);
    font-weight:800;
  }

  .login-guide{
    color: var(--muted);
    font-size:12px;
    font-weight:800;
  }

  .my-menu-section{
    margin-top: 6px;
    padding-top: 14px;
    border-top: 1px dashed rgba(255,140,0,.25);
    display:flex;
    flex-direction:column;
    gap:10px;
  }

  .my-menu-title{
    font-size: 12px;
    font-weight: 900;
    color: #9a4b00;
    padding: 0 2px;
  }

  .my-menu-list{
    display:flex;
    flex-direction:column;
    gap:8px;
  }

  .my-menu-item{
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:12px 12px;
    border-radius:16px;
    border:1px solid rgba(255,140,0,.18);
    background: rgba(255,247,239,.75);
    font-weight:900;
    color: var(--text);
    text-decoration:none;
    transition: background .15s ease, transform .15s ease, border-color .15s ease, box-shadow .15s ease;
  }

  .my-menu-item:hover{
    background:#fffaf3;
    transform: translateY(-1px);
    border-color: rgba(255,140,0,.32);
    box-shadow: 0 12px 24px rgba(17,24,39,.08);
  }

  .my-menu-item small{
    color: var(--muted);
    font-weight:800;
  }

  @media (max-width: 560px){
    .logo{
      font-size: 20px;
    }

    .login-timer-box{
      padding: 10px 12px;
      gap: 8px;
    }

    .login-timer-label,
    .login-timer-time{
      font-size: 12px;
    }

    .extend-btn{
      padding: 7px 10px;
      font-size: 11px;
    }
  }
</style>

<div class="header-wrap">
  <div class="header">
    <div class="header-top">
      <div class="header-left">
        <button type="button" id="hamburger" class="header-icon-btn" aria-label="menu">☰</button>
        <a href="<c:url value='/'/>" class="header-icon-btn home-btn" aria-label="home">
            <img class="home-icon" src="${data_path}/img/home.png" alt="홈">
        </a>
      </div>

      <a href="<c:url value='/'/>" class="logo logo-center" aria-label="JBB logo">
        <div class="logo-badge">J</div>
        JBB
      </a>

      <div class="header-right">
        <%@ include file="/WEB-INF/views/common_notification.jsp" %>
      </div>
    </div>

    <c:if test="${not empty id}">
      <div class="login-timer-bar">
        <div class="login-timer-box">
          <div class="login-timer-left">
            <span class="login-timer-label">⏰ 남은 로그인 시간</span>
            <span class="login-timer-time" id="loginRemainTime">확인 중...</span>
          </div>

          <button type="button" class="extend-btn" id="extendSessionBtn">연장</button>
        </div>
      </div>
    </c:if>
  </div>
</div>

<div id="overlay" class="overlay"></div>

<div class="sidebar" id="sidebar">
  <div class="side-top">
    <div class="side-title">
      <span style="color:var(--brand)">●</span> Menu
    </div>
    <button type="button" id="close-btn" class="close-btn" aria-label="close">✖</button>
  </div>

  <c:choose>
    <c:when test="${empty id}">
      <div class="profile">
        <img class="avatar" src="${data_path}/img/user_default.png" alt="기본사진">
            <div class="links">
              <div class="link-row">
                <a class="link" href="<c:url value='/user/login'/>">로그인</a>
                <a class="link" href="<c:url value='/user/join'/>">회원가입</a>
              </div>
              <span style="color:var(--muted); font-size:12px; font-weight:800;">로그인하면 더 많은 기능을 쓸 수 있어요</span>
            </div>
      </div>

      <div class="side-menu">
        <a class="menu-item" href="<c:url value='/board/list'/>">커뮤니티 <small>Community</small></a>
        <a class="menu-item" href="<c:url value='/notify/list'/>">공지사항 <small>Notice</small></a>
        <a class="menu-item" href="<c:url value='/faq/user_faqlist'/>">FAQ <small>Help</small></a>
      </div>
    </c:when>

    <c:otherwise>
      <div class="profile">
        <img class="avatar" src="${data_path}/img/user_default.png" alt="프로필">
        <div class="profile-info">
           <div class="username"> ${id}님👋 </div>
            <div class="links">
              <div class="link-row">
                <a class="link" href="<c:url value='/user/logout'/>">로그아웃</a>
                <a class="link" href="<c:url value='/user/mypage'/>">마이페이지</a>
              </div>
            </div>
        </div>
      </div>

      <div class="side-menu">
        <a class="menu-item" href="<c:url value='/board/list'/>">커뮤니티 <small>Community</small></a>
        <a class="menu-item" href="<c:url value='/notify/list'/>">공지사항 <small>Notice</small></a>
        <a class="menu-item" href="<c:url value='/faq/user_faqlist'/>">FAQ <small>Help</small></a>
        <a class="menu-item" href="<c:url value='/qna/list'/>">문의 <small>QnA</small></a>
      </div>

      <div class="my-menu-section">
          <div class="my-menu-title">내 활동</div>

          <div class="my-menu-list">
            <a class="my-menu-item" href="<c:url value='/board/myboardlist'/>">내 글 <small>My Posts</small></a>
            <a class="my-menu-item" href="<c:url value='/board/mycommentlist'/>">내 댓글 <small>My Comments</small></a>
            <a class="my-menu-item" href="<c:url value='/board/mylikeslist'/>">좋아요 <small>Likes</small></a>
          </div>
      </div>
    </c:otherwise>
  </c:choose>
</div>

<script>
  let contextPath = "${pageContext.request.contextPath}";

  // 사이드바 열기/닫기
  (function(){
    const sidebar = document.getElementById("sidebar");
    const overlay = document.getElementById("overlay");
    const hamburger = document.getElementById("hamburger");
    const closeBtn = document.getElementById("close-btn");

    if(!sidebar || !overlay || !hamburger || !closeBtn) return;

    function openSide(){
      sidebar.classList.add("active");
      overlay.classList.add("active");
    }

    function closeSide(){
      sidebar.classList.remove("active");
      overlay.classList.remove("active");
    }

    hamburger.addEventListener("click", openSide);
    closeBtn.addEventListener("click", closeSide);
    overlay.addEventListener("click", closeSide);

    document.addEventListener("keydown", function(e){
      if(e.key === "Escape") closeSide();
    });
  })();

  // 남은 로그인 시간 표시
  (function(){
    const timerEl = document.getElementById("loginRemainTime");
    const extendBtn = document.getElementById("extendSessionBtn");

    if (!timerEl || !extendBtn) return;

    const extendURL = contextPath + "/user/extend-session";
    const logoutURL = contextPath + "/user/logout";
    const loginTime = <%= session.getAttribute("loginTime") != null ? session.getAttribute("loginTime") : "null" %>;

    if (loginTime === null) return;

    const sessionDuration = 30 * 60 * 1000; // 30분
    let sessionEndTime = parseInt(loginTime) + sessionDuration;
    let alertShown = false;

    function updateTimer() {
      const now = new Date().getTime();
      const remaining = sessionEndTime - now;

      if (remaining <= 0) {
        timerEl.textContent = "세션이 만료되었습니다.";
        alert("세션이 만료되어 로그아웃됩니다.");
        location.href = logoutURL;
        return;
      }

      const min = Math.floor(remaining / 60000);
      const sec = Math.floor((remaining % 60000) / 1000);

      timerEl.textContent = min + "분 " + (sec < 10 ? "0" + sec : sec) + "초";

      if (remaining <= 60 * 1000 && !alertShown) {
        alert("세션이 1분 뒤 만료됩니다. 연장하지 않으면 자동 로그아웃됩니다.");
        alertShown = true;
      }

      setTimeout(updateTimer, 1000);
    }

    extendBtn.addEventListener("click", function() {
      fetch(extendURL, { method: "POST" })
        .then(res => res.text())
        .then(data => {
          if (data === "ok") {
            alert("세션이 연장되었습니다.");
            location.reload();
          } else {
            alert("세션 연장에 실패했습니다.");
          }
        })
        .catch(() => {
          alert("세션 연장 중 오류가 발생했습니다.");
        });
    });

    updateTimer();
  })();
</script>