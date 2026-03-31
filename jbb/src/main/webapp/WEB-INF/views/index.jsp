<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>JBB</title>

  <link rel="stylesheet" as="style" crossorigin
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@latest/dist/web/static/pretendard.css" />

  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

  <style>
    :root{
      /* White + Orange theme */
      --bg: #fffaf5;
      --bg2:#fff3e6;
      --panel:#ffffff;
      --panel2:#fff7ef;
      --text:#1f2937;     /* slate-800 */
      --muted:#6b7280;    /* gray-500 */
      --line: rgba(17,24,39,.10);
      --brand:#ff8c00;
      --brand2:#ffb15a;
      --shadow: 0 14px 40px rgba(17,24,39,.10);
      --shadow2: 0 10px 24px rgba(17,24,39,.08);
      --r: 18px;
      --max: 1100px;
    }

    *{ margin:0; padding:0; box-sizing:border-box; }
    html, body{ height:100%; }
    body{
      font-family: Pretendard, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Noto Sans KR", Arial, sans-serif;
        min-height: 100vh;
        background:
          radial-gradient(circle at top left, rgba(255,140,0,.14), transparent 32%),
          radial-gradient(circle at top right, rgba(255,177,90,.12), transparent 30%),
          linear-gradient(180deg, #fff8f1 0%, #fffaf6 28%, #fffdfb 62%, #fffaf5 100%);
        background-attachment: fixed;
        color: var(--text);
    }
    a{ color:inherit; text-decoration:none; }

    /* ===== Layout ===== */
    .container{
      max-width: var(--max);
      margin: 0 auto;
      padding: 22px 16px 96px;
    }

    .hero{
      margin-top: 8px;
      padding: 18px 16px;
      border-radius: var(--r);
      border: 1px solid var(--line);
      background: linear-gradient(180deg, rgba(255,255,255,.92), rgba(255,247,239,.9));
      box-shadow: var(--shadow2);
      display:flex;
      align-items:flex-start;
      justify-content:space-between;
      gap:16px;
      flex-wrap:wrap;
    }
    .hero-title{
      font-size: 22px;
      font-weight: 900;
      line-height:1.2;
    }
    .hero-desc{
      margin-top: 6px;
      color: var(--muted);
      font-size: 14px;
      line-height: 1.5;
    }

    /* ===== Section ===== */
    .section{ margin-top: 22px; }
    .section-head{
      display:flex;
      align-items:flex-end;
      justify-content:space-between;
      gap:12px;
      margin-bottom: 12px;
    }
    .section-title{
      font-size: 18px;
      font-weight: 900;
      letter-spacing: .2px;
    }
    .section-sub{
      margin-top: 6px;
      color: var(--muted);
      font-size: 13px;
    }

    /* ===== Carousel (scroll-snap) ===== */
    .carousel{
      position: relative;
      border-radius: var(--r);
      border: 1px solid var(--line);
      background: rgba(255,255,255,.75);
      overflow: hidden;
      box-shadow: 0 10px 24px rgba(17,24,39,.06);
    }
    .track{
      display:flex;
      gap: 14px;
      padding: 14px;
      overflow-x: auto;
      scroll-snap-type: x mandatory;
      -webkit-overflow-scrolling: touch;
      scrollbar-width: none;
    }
    .track::-webkit-scrollbar{ display:none; }

    .card{
      scroll-snap-align: start;
      min-width: 280px;
      max-width: 280px;
      border-radius: 16px;
      overflow:hidden;
      background: #fff;
      border: 1px solid rgba(17,24,39,.10);
      box-shadow: 0 10px 24px rgba(17,24,39,.08);
      transition: transform .15s ease, border-color .15s ease, box-shadow .15s ease;
    }
    .card:hover{
      transform: translateY(-3px);
      border-color: rgba(255,140,0,.35);
      box-shadow: 0 18px 36px rgba(17,24,39,.12);
    }

    .thumb{
      width:100%;
      aspect-ratio: 16/10;
      background: #f3f4f6;
      display:block;
      object-fit: cover;
    }

    .card-body{
      padding: 12px 12px 14px;
      display:flex;
      flex-direction:column;
      gap: 8px;
    }
    .meta{
      display:flex;
      align-items:center;
      gap: 8px;
      color: var(--muted);
      font-size: 12px;
      font-weight: 700;
    }
    .rank{
      display:inline-flex;
      align-items:center;
      gap:6px;
      padding: 6px 10px;
      border-radius: 999px;
      background: rgba(255,140,0,.12);
      border: 1px solid rgba(255,140,0,.25);
      color: #9a4b00;
      font-weight: 900;
      font-size: 12px;
      width: fit-content;
    }
    .title{
      font-weight: 900;
      font-size: 14px;
      line-height: 1.35;
      color: var(--text);
      display:-webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow:hidden;
      min-height: 38px;
    }

    .hero-main{
      display:grid;
      grid-template-columns: 1.3fr .9fr;
      gap:16px;
      align-items:stretch;
    }

    .hero-copy{
      display:flex;
      flex-direction:column;
      justify-content:center;
    }

    .hero-actions{
      margin-top:16px;
      display:flex;
      gap:10px;
      flex-wrap:wrap;
    }

    .hero-btn{
      display:inline-flex;
      align-items:center;
      justify-content:center;
      padding:12px 16px;
      border-radius:14px;
      border:1px solid var(--line);
      background:#fff;
      font-size:14px;
      font-weight:900;
      transition: all .15s ease;
    }

    .hero-btn.primary{
      background: rgba(255,140,0,.12);
      border-color: rgba(255,140,0,.26);
      color:#9a4b00;
    }

    .hero-btn:hover{
      transform: translateY(-1px);
      box-shadow: 0 10px 20px rgba(17,24,39,.08);
    }

    .hero-highlight{
      border-radius:16px;
      border:1px solid rgba(255,140,0,.18);
      background: linear-gradient(180deg, rgba(255,255,255,.96), rgba(255,244,232,.96));
      padding:18px;
      display:flex;
      flex-direction:column;
      justify-content:center;
    }

    .highlight-badge{
      display:inline-flex;
      width:fit-content;
      padding:6px 10px;
      border-radius:999px;
      font-size:12px;
      font-weight:900;
      background: rgba(255,140,0,.12);
      color:#9a4b00;
      margin-bottom:10px;
    }

    .highlight-title{
      font-size:18px;
      font-weight:900;
      line-height:1.35;
    }

    .highlight-desc{
      margin-top:8px;
      font-size:13px;
      color:var(--muted);
      line-height:1.55;
    }

    .category-chips{
      display:flex;
      flex-wrap:wrap;
      gap:10px;
    }

    .chip{
      padding:10px 14px;
      border-radius:999px;
      border:1px solid var(--line);
      background: rgba(255,255,255,.92);
      font-size:13px;
      font-weight:800;
      transition: all .15s ease;
    }

    .chip:hover{
      transform: translateY(-1px);
      border-color: rgba(255,140,0,.28);
      box-shadow: 0 10px 20px rgba(17,24,39,.06);
    }

    .chip-accent{
      background: rgba(255,140,0,.12);
      border-color: rgba(255,140,0,.24);
      color:#9a4b00;
    }

    .spotlight-grid{
      display:grid;
      grid-template-columns: 1.1fr .9fr;
      gap:16px;
    }

    .spotlight-card{
      border-radius:18px;
      border:1px solid var(--line);
      background: rgba(255,255,255,.86);
      box-shadow: 0 10px 24px rgba(17,24,39,.06);
      padding:18px;
    }

    .spotlight-label{
      font-size:12px;
      font-weight:900;
      color:#9a4b00;
      margin-bottom:10px;
    }

    .spotlight-title{
      font-size:18px;
      font-weight:900;
      line-height:1.35;
    }

    .spotlight-desc{
      margin-top:8px;
      color:var(--muted);
      font-size:13px;
      line-height:1.55;
    }

    .feature-links{
      margin-top:16px;
      display:flex;
      flex-direction:column;
      gap:10px;
    }

    .feature-link{
      padding:12px 14px;
      border-radius:14px;
      border:1px solid rgba(17,24,39,.08);
      background:#fff;
      font-weight:800;
      transition: all .15s ease;
    }

    .feature-link:hover{
      transform: translateY(-1px);
      border-color: rgba(255,140,0,.28);
    }

    .mini-list{
      display:flex;
      flex-direction:column;
      gap:10px;
      margin-top:10px;
    }

    .mini-item{
      display:flex;
      align-items:center;
      gap:12px;
      padding:12px 14px;
      border-radius:14px;
      background:#fff;
      border:1px solid rgba(17,24,39,.08);
      transition: all .15s ease;
    }

    .mini-item:hover{
      transform: translateY(-1px);
      border-color: rgba(255,140,0,.28);
    }

    .mini-rank{
      width:24px;
      height:24px;
      border-radius:999px;
      display:grid;
      place-items:center;
      font-size:12px;
      font-weight:900;
      background: rgba(255,140,0,.12);
      color:#9a4b00;
      flex-shrink:0;
    }

    .mini-text{
      font-size:14px;
      font-weight:800;
      line-height:1.4;
      overflow:hidden;
      display:-webkit-box;
      -webkit-line-clamp:1;
      -webkit-box-orient:vertical;
    }

    .feed-tabs{
      display:flex;
      gap:8px;
    }

    .feed-tab{
      padding:10px 14px;
      border-radius:999px;
      border:1px solid var(--line);
      background: rgba(255,255,255,.92);
      font-size:13px;
      font-weight:900;
      cursor:pointer;
    }

    .feed-tab.active{
      background: rgba(255,140,0,.12);
      border-color: rgba(255,140,0,.26);
      color:#9a4b00;
    }

    .feed-pane{
      display:none;
    }

    .feed-pane.active{
      display:block;
    }

    .empty-box{
      padding:24px;
      text-align:center;
      color:var(--muted);
    }

    @media (max-width: 860px){
      .hero-main,
      .spotlight-grid{
        grid-template-columns: 1fr;
      }
    }

    .carousel-shell{
      display:grid;
      grid-template-columns: 48px 1fr 48px;
      gap:12px;
      align-items:center;
    }

    .side-nav-btn{
      width:44px;
      height:44px;
      border-radius:14px;
      border:1px solid var(--line);
      background: rgba(255,255,255,.92);
      color: var(--text);
      cursor:pointer;
      font-size:22px;
      font-weight:900;
      transition: transform .15s ease, background .15s ease, box-shadow .15s ease;
    }

    .side-nav-btn:hover{
      transform: translateY(-1px);
      background:#fff;
      box-shadow: 0 10px 20px rgba(17,24,39,.08);
    }

    @media (max-width: 860px){
      .carousel-shell{
        grid-template-columns: 36px 1fr 36px;
        gap: 8px;
        align-items: center;
      }

      .side-nav-btn{
        display: flex;
        align-items: center;
        justify-content: center;
        width: 36px;
        height: 36px;
        border-radius: 12px;
        font-size: 18px;
      }

      .track{
        padding: 10px;
        gap: 10px;
      }

      .card{
        min-width: 220px;
        max-width: 220px;
      }
    }

    .mixed-chips .chip{
      min-height: 42px;
      display:inline-flex;
      align-items:center;
      justify-content:center;
    }

    .mixed-chips .chip:nth-child(2),
    .mixed-chips .chip:nth-child(3),
    .mixed-chips .chip:nth-child(4){
      background: rgba(255,255,255,.96);
    }

    .mixed-chips .chip:nth-child(5),
    .mixed-chips .chip:nth-child(6){
      background: rgba(255,248,240,.96);
    }
  </style>
</head>

<body>
<!-- Header -->
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>

<!-- Content -->
<div class="container">
  <!-- Hero -->
  <section class="hero hero-main">
    <div class="hero-copy">
      <div class="hero-title">베이킹 커뮤니티, JBB에 오신걸 환영합니다!</div>
      <div class="hero-desc">
        지금 올라온 글부터 많이 보는 글, 관심 있는 주제까지 한 번에 둘러보세요.
      </div>

      <div class="hero-actions">
        <a class="hero-btn primary" href="<c:url value='/board/list'/>">커뮤니티 둘러보기</a>
        <a class="hero-btn" href="<c:url value='/board/write'/>">글 작성하기</a>
      </div>
    </div>

    <div class="hero-highlight">
      <div class="highlight-badge">TODAY PICK</div>
      <div class="highlight-title">처음 방문했다면 인기 글부터 보는 걸 추천해요</div>
      <div class="highlight-desc">커뮤니티에서 반응 좋은 글을 먼저 보고 분위기를 빠르게 파악해보세요.</div>
    </div>
  </section>

  <!-- Popular Topics + Quick Menu -->
  <section class="section">
    <div class="section-head">
      <div>
        <div class="section-title">인기 주제 둘러보기</div>
        <div class="section-sub">관심 있는 베이킹 이야기와 자주 찾는 메뉴를 바로 둘러보세요.</div>
      </div>
    </div>

    <div class="category-chips mixed-chips">
      <a href="<c:url value='/board/list'/>" class="chip chip-accent">전체 게시글</a>
      <a href="<c:url value='/board/list?keyword=케이크&option=T'/>" class="chip">케이크</a>
      <a href="<c:url value='/board/list?keyword=쿠키&option=T'/>" class="chip">쿠키</a>
      <a href="<c:url value='/board/list?keyword=마카롱&option=T'/>" class="chip">마카롱</a>
      <a href="<c:url value='/qna/list'/>" class="chip">고객센터</a>
      <a href="<c:url value='/notify/list'/>" class="chip">공지사항</a>
    </div>
  </section>

  <!-- Main Highlights -->
  <section class="section spotlight-grid">
    <div class="spotlight-card feature-card">
      <div class="spotlight-label">추천 / 공지</div>
      <div class="spotlight-title">커뮤니티 이용 전 꼭 확인해보세요</div>
      <div class="spotlight-desc">공지사항, 운영 안내, 자주 찾는 메뉴를 먼저 모아봤어요.</div>

      <div class="feature-links">
        <a href="<c:url value='/notify/list'/>" class="feature-link">📢 공지사항 보기</a>
        <a href="<c:url value='/faq/user_faqlist'/>" class="feature-link">❓ 자주 묻는 질문</a>
        <a href="<c:url value='/board/list'/>" class="feature-link">📝 전체 게시글 보기</a>
      </div>
    </div>

    <div class="spotlight-card mini-list-card">
      <div class="spotlight-label">지금 많이 보는 글</div>

      <c:choose>
        <c:when test="${empty popularPosts}">
          <div class="empty-box">아직 인기 게시글이 없습니다.</div>
        </c:when>
        <c:otherwise>
          <div class="mini-list">
            <c:forEach var="boardDto" items="${popularPosts}" begin="0" end="2" varStatus="status">
              <a class="mini-item" href="<c:url value='/board/read?bno=${boardDto.bno}'/>">
                <span class="mini-rank">${status.index + 1}</span>
                <span class="mini-text">${boardDto.title}</span>
              </a>
            </c:forEach>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </section>

  <!-- Feed Tabs -->
  <section class="section">
    <div class="section-head">
      <div>
        <div class="section-title">게시글 둘러보기</div>
        <div class="section-sub">최신 글과 인기 글을 보기 쉽게 정리했어요</div>
      </div>
      <div class="feed-tabs">
        <button type="button" class="feed-tab active" data-feed="latestPane">최신글</button>
        <button type="button" class="feed-tab" data-feed="popularPane">인기글</button>
      </div>
    </div>

    <div class="feed-pane active" id="latestPane">
      <div class="carousel-shell">
        <button type="button" class="side-nav-btn left" data-target="latest" aria-label="prev">‹</button>

        <div class="carousel">
          <c:choose>
            <c:when test="${empty latestPosts}">
              <div class="empty-box">아직 최신 게시글이 없습니다.</div>
            </c:when>
            <c:otherwise>
              <div class="track" id="latestTrack">
                <c:forEach var="boardDto" items="${latestPosts}" varStatus="status">
                  <a class="card" href="<c:url value='/board/read?bno=${boardDto.bno}'/>">
                    <c:choose>
                      <c:when test="${not empty boardDto.img1}">
                        <img class="thumb" src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지">
                      </c:when>
                      <c:otherwise>
                        <img class="thumb" src="${data_path}/img/default_img.png" alt="기본 이미지">
                      </c:otherwise>
                    </c:choose>

                    <div class="card-body">
                      <div class="rank">NEW ${status.index + 1}</div>
                      <div class="title">${boardDto.title}</div>
                      <div class="meta">
                        <span>최신</span>
                        <span>•</span>
                        <span>바로 보기</span>
                      </div>
                    </div>
                  </a>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
        </div>

        <button type="button" class="side-nav-btn right" data-target="latest" aria-label="next">›</button>
      </div>
    </div>

    <div class="feed-pane" id="popularPane">
      <div class="carousel-shell">
        <button type="button" class="side-nav-btn left" data-target="popular" aria-label="prev">‹</button>

        <div class="carousel">
          <c:choose>
            <c:when test="${empty popularPosts}">
              <div class="empty-box">아직 인기 게시글이 없습니다.</div>
            </c:when>
            <c:otherwise>
              <div class="track" id="popularTrack">
                <c:forEach var="boardDto" items="${popularPosts}" varStatus="status">
                  <a class="card" href="<c:url value='/board/read?bno=${boardDto.bno}'/>">
                    <c:choose>
                      <c:when test="${not empty boardDto.img1}">
                        <img class="thumb" src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지">
                      </c:when>
                      <c:otherwise>
                        <img class="thumb" src="${data_path}/img/default_img.png" alt="기본 이미지">
                      </c:otherwise>
                    </c:choose>

                    <div class="card-body">
                      <div class="rank">HOT ${status.index + 1}</div>
                      <div class="title">${boardDto.title}</div>
                      <div class="meta">
                        <span>인기</span>
                        <span>•</span>
                        <span>바로 보기</span>
                      </div>
                    </div>
                  </a>
                </c:forEach>
              </div>
            </c:otherwise>
          </c:choose>
        </div>

        <button type="button" class="side-nav-btn right" data-target="popular" aria-label="next">›</button>
      </div>
    </div>
  </section>
</div>
  <script>
    // Carousel navigation
    (function(){
      const latest = document.getElementById("latestTrack");
      const popular = document.getElementById("popularTrack");

      function scrollByCard(track, dir){
        if(!track) return;
        const card = track.querySelector(".card");
        const amount = card ? (card.getBoundingClientRect().width + 14) : 300;
        track.scrollBy({ left: dir * amount, behavior: "smooth" });
      }

      document.querySelectorAll(".side-nav-btn").forEach(btn=>{
        btn.addEventListener("click", ()=>{
          const target = btn.dataset.target;
          const isNext = btn.getAttribute("aria-label")==="next";
          const dir = isNext ? 1 : -1;
          if(target==="latest") scrollByCard(latest, dir);
          if(target==="popular") scrollByCard(popular, dir);
        });
      });
    })();

    // Alert msg
    (function(){
      var msg = "${msg}";
      if(msg==="MOD_OK") alert("회원정보가 수정되었습니다.");
      if(msg==="JOIN_OK") alert("회원가입에 성공했습니다.");
      if(msg==="DEL_OK") alert("탈퇴되었습니다.");
    })();

    // Feed Tabs
      (function(){
        const tabs = document.querySelectorAll(".feed-tab");
        const panes = document.querySelectorAll(".feed-pane");

        tabs.forEach(tab=>{
          tab.addEventListener("click", function(){
            const targetId = this.dataset.feed;

            tabs.forEach(t=>t.classList.remove("active"));
            panes.forEach(p=>p.classList.remove("active"));

            this.classList.add("active");
            document.getElementById(targetId).classList.add("active");
          });
        });
      })();
  </script>
</body>
</html>