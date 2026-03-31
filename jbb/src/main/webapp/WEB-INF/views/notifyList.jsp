<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>JBB</title>

  <link rel="stylesheet" as="style" crossorigin
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@latest/dist/web/static/pretendard.css" />

  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>

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

  *{ margin:0; padding:0; box-sizing:border-box; }
  html, body{ height:100%; }
  body{
    font-family: Pretendard, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Noto Sans KR", Arial, sans-serif;
    background:
      radial-gradient(900px 500px at 10% -10%, rgba(255,140,0,.18), transparent 55%),
      radial-gradient(800px 480px at 100% 0%, rgba(255,177,90,.16), transparent 55%),
      linear-gradient(180deg, var(--bg2), var(--bg));
    color: var(--text);
  }
  a{ color:inherit; text-decoration:none; }

  .container{
    max-width: var(--max);
    margin: 0 auto;
    padding: 18px 16px 56px;
  }

  .page-hero{
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
  .hero-pill{
    display:flex;
    gap:8px;
    align-items:center;
    padding: 10px 12px;
    border: 1px solid rgba(255,140,0,.25);
    background: rgba(255,140,0,.10);
    border-radius: 999px;
    color: #9a4b00;
    font-size: 13px;
    font-weight: 800;
    white-space: nowrap;
  }

  .search-container{
    width: 100%;
    margin-top: 14px;
    margin-bottom: 14px;
    display:flex;
    justify-content:center;
    align-items:center;
  }
  .search-form{
    width: 100%;
    display:flex;
    gap: 10px;
    align-items:center;
  }
  .search-option{
    width: 180px;
    height: 44px;
    border-radius: 14px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.92);
    font-size: 13px;
    font-weight: 900;
    color: var(--text);
    padding: 0 10px;
    outline:none;
  }
  .search-input{
    flex: 1;
    height: 44px;
    border-radius: 14px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.92);
    font-size: 13px;
    font-weight: 700;
    color: var(--text);
    padding: 0 12px;
    outline:none;
  }
  .search-input::placeholder{
    color: var(--muted);
    font-weight: 700;
  }
  .search-input:focus{
    border-color: rgba(255,140,0,.35);
    box-shadow: 0 10px 20px rgba(255,140,0,.10);
  }
  .search-button{
    height: 44px;
    padding: 0 16px;
    border-radius: 14px;
    border: 1px solid rgba(255,140,0,.30);
    background: rgba(255,140,0,.92);
    color: white;
    font-size: 13px;
    font-weight: 900;
    cursor:pointer;
    transition: transform .15s ease, box-shadow .15s ease;
  }
  .search-button:hover{
    transform: translateY(-1px);
    box-shadow: 0 12px 24px rgba(255,140,0,.18);
  }

  .grid-container{
    width: 100%;
    margin: 14px auto 16px;
    display:flex;
    flex-direction: column;
    gap: 12px;
  }

  .board-item{
    display:flex;
    gap: 14px;
    align-items:center;
    padding: 14px;
    border-radius: var(--r);
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.88);
    box-shadow: 0 10px 24px rgba(17,24,39,.06);
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease;
  }
  .board-item:hover{
    transform: translateY(-2px);
    box-shadow: 0 18px 36px rgba(17,24,39,.10);
    border-color: rgba(255,140,0,.25);
  }

  .main_img{
    flex: 0 0 120px;
  }
  .main_img img{
    width:120px;
    height:120px;
    border-radius: 16px;
    object-fit: cover;
    border: 1px solid rgba(17,24,39,.10);
    background:#fff;
  }

  .board-content-wrapper{
    flex:1;
    min-width: 0;
    display:flex;
    flex-direction: column;
    gap: 8px;
    text-align:left;
  }

  .category-label{
    width: fit-content;
    background: rgba(255,140,0,.12);
    border: 1px solid rgba(255,140,0,.25);
    color: #9a4b00;
    font-size: 12px;
    padding: 6px 10px;
    border-radius: 999px;
    font-weight: 900;
  }

  .board-title{
    display:block;
    font-size: 15px;
    font-weight: 900;
    color: var(--text);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .board-content{
    font-size: 13px;
    font-weight: 700;
    color: var(--muted);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .board-bottom{
    display:flex;
    flex-wrap: wrap;
    gap: 6px;
    align-items:center;
    font-size: 12px;
    font-weight: 800;
    color: var(--muted);
  }
  .b-b{
    display:flex;
    align-items:center;
    gap: 6px;
  }
  .b-b::after{
    content:"·";
    margin-left: 6px;
    color: rgba(107,114,128,.8);
  }
  .b-b:last-child::after{
    content:"";
    margin:0;
  }

  .toggle-icon{
    flex-shrink: 0;
    font-size: 20px;
    font-weight: 900;
    color: var(--brand);
    cursor: pointer;
    margin-left: 12px;
    transition: transform .2s ease;
  }

  .notify-detail{
    display: none;
    margin-top: -4px;
    margin-bottom: 8px;
    padding: 20px 22px;
    border-radius: 0 0 var(--r) var(--r);
    border: 1px solid rgba(17,24,39,.10);
    border-top: none;
    background: rgba(255,255,255,.82);
    box-shadow: 0 10px 24px rgba(17,24,39,.05);
  }

  .notify-detail pre{
    margin: 0;
    white-space: pre-wrap;
    word-break: break-word;
    overflow-wrap: break-word;
    font-family: inherit;
    font-size: 14px;
    line-height: 1.7;
    color: var(--text);
  }

  .notify-date{
    display: block;
    margin-top: 14px;
    text-align: right;
    font-size: 12px;
    font-weight: 800;
    color: var(--muted);
  }

  .board-item.notice-toggle{
    cursor: default;
  }

  .board-item.notice-toggle .board-content-wrapper{
    cursor: pointer;
  }

  .nolist{
    width:100%;
    text-align:center;
    color: var(--brand);
    font-weight: 900;
    font-size: 14px;
    padding: 28px 10px;
    border-radius: var(--r);
    border: 1px dashed rgba(255,140,0,.35);
    background: rgba(255,140,0,.06);
  }

  .paging{
    display:flex;
    justify-content:center;
    align-items:center;
    gap: 8px;
    margin: 18px auto 0;
    flex-wrap: wrap;
  }

  .paging a{
    text-decoration:none;
    font-size: 13px;
    font-weight: 900;
    color: var(--text);
    padding: 8px 12px;
    border-radius: 14px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.92);
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease, background .15s ease;
  }

  .paging a:hover{
    transform: translateY(-1px);
    box-shadow: 0 10px 20px rgba(17,24,39,.08);
    border-color: rgba(255,140,0,.25);
    background:#fff;
  }

  .paging a.paging-active{
    color: #9a4b00;
    border-color: rgba(255,140,0,.30);
    background: rgba(255,140,0,.10);
  }

  @media (max-width: 560px){
    .main_img{ flex: 0 0 92px; }
    .main_img img{ width:92px; height:92px; border-radius: 14px; }
    .search-option{ width: 120px; }
  }
</style>
</head>
<body>
<!-- Header -->
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>

<div class="container">
  <div class="page-hero">
    <div>
      <div class="hero-title">중요한 공지사항을 빠르게 확인해보세요</div>
      <div class="hero-desc">필요한 공지를 검색하고, 바로 목록에서 확인할 수 있어요.</div>
    </div>
    <div class="hero-pill">📢 공지 모아보기</div>
  </div>

  <!-- 검색 기능 -->
  <div class="search-container">
    <form action="<c:url value='/notify/list'/>" class="search-form" method="get">
      <input type="hidden" name="page" value="1">
      <input type="hidden" name="pageSize" value="${sc.pageSize}">
      <select class="search-option" name="option">
        <option value="A" ${sc.option == 'A' ? "selected" : ""}>제목+내용</option>
        <option value="T" ${sc.option == 'T' ? "selected" : ""}>제목</option>
      </select>
      <input type="text" name="keyword" class="search-input" value="${sc.keyword}" placeholder="검색어를 입력해주세요">
      <input type="submit" class="search-button" value="검색">
    </form>
  </div>

  <!-- 게시글 목록형 공지 리스트 -->
  <div class="grid-container">
    <c:choose>
      <c:when test="${empty list}">
        <div class="nolist">해당하는 공지사항이 없습니다.</div>
      </c:when>
      <c:otherwise>
        <c:forEach var="notifyDto" items="${list}">
          <div class="board-item notice-toggle">
            <div class="main_img">
              <img src="${data_path}/img/default_img.png" alt="기본 이미지">
            </div>

            <div class="board-content-wrapper">
              <span class="category-label">공지사항</span>

              <div class="board-title">
                <c:choose>
                  <c:when test="${fn:length(notifyDto.ntitle) > 20}">
                    ${fn:substring(notifyDto.ntitle, 0, 20)}...
                  </c:when>
                  <c:otherwise>
                    ${notifyDto.ntitle}
                  </c:otherwise>
                </c:choose>
              </div>

              <p class="board-content">
                <c:choose>
                  <c:when test="${fn:length(notifyDto.ncontent) > 25}">
                    ${fn:substring(notifyDto.ncontent, 0, 25)}...
                  </c:when>
                  <c:otherwise>
                    ${notifyDto.ncontent}
                  </c:otherwise>
                </c:choose>
              </p>

              <div class="board-bottom">
                <p class="b-b"><fmt:formatDate value="${notifyDto.n_date}" pattern="yyyy. M. dd"/></p>
              </div>
            </div>

            <span class="toggle-icon">▼</span>
          </div>

          <div class="notify-detail">
              <pre>${notifyDto.ncontent}</pre>
              <span class="notify-date">
                 <fmt:formatDate value="${notifyDto.n_date}" pattern="yyyy. M. dd"/>
              </span>
          </div>
        </c:forEach>
      </c:otherwise>
    </c:choose>
  </div>
  <div class="paging">
    <c:if test="${totalCnt != null && totalCnt != 0}">
      <c:if test="${ph.showPrev}">
        <a class="page" href="<c:url value='/notify/list${ph.sc.getQueryString(ph.beginPage-1)}'/>">&lt;</a>
      </c:if>

      <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a class="page ${i==ph.sc.page ? 'paging-active' : ''}"
           href="<c:url value='/notify/list${ph.sc.getQueryString(i)}'/>">${i}</a>
      </c:forEach>

      <c:if test="${ph.showNext}">
        <a class="page" href="<c:url value='/notify/list${ph.sc.getQueryString(ph.endPage+1)}'/>">&gt;</a>
      </c:if>
    </c:if>
  </div>
</div>
<script>
$(document).ready(function () {
  $(".board-item.notice-toggle").click(function (e) {
    if (!$(e.target).hasClass("toggle-icon") && !$(e.target).closest(".toggle-icon").length) {
      $(this).find(".toggle-icon").trigger("click");
    }
  });

  $(".toggle-icon").click(function (e) {
    e.stopPropagation();

    var content = $(this).closest(".board-item").next(".notify-detail");
    var icon = $(this);

    content.slideToggle(250, function () {
      if (content.is(":visible")) {
        icon.text("▲");
      } else {
        icon.text("▼");
      }
    });
  });
});
</script>
</body>
</html>