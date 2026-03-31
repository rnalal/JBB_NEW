<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!-- 최상위경로 -->
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="data_path" value="${pageContext.request.contextPath }/resources" />
<!DOCTYPE html>
<html>
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
  html, body{ min-height:100%; }

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
    padding: 28px 16px 110px;
  }

  .page-hero{
    margin-top: 22px;
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

  .comment-card{
    margin-top: 14px;
    padding: 16px;
    border: 1px solid rgba(17,24,39,.08);
    border-radius: 20px;
    background: rgba(255,255,255,.88);
    box-shadow: 0 8px 22px rgba(17,24,39,.06);
    transition: border-color .15s ease, box-shadow .15s ease, transform .15s ease;
  }

  .comment-card:hover{
    border-color: rgba(255,140,0,.22);
    box-shadow: 0 12px 28px rgba(17,24,39,.08);
    transform: translateY(-1px);
  }

  .comment-card-top{
    display:flex;
    align-items:center;
    gap:14px;
  }

  .comment-thumb{
    width:72px;
    height:72px;
    border-radius:16px;
    overflow:hidden;
    flex-shrink:0;
    background:#f3f4f6;
    border:1px solid rgba(17,24,39,.08);
  }

  .comment-thumb img{
    width:100%;
    height:100%;
    object-fit:cover;
    display:block;
  }

  .comment-meta{
    min-width:0;
    flex:1;
  }

  .comment-category{
    display:inline-flex;
    align-items:center;
    height:28px;
    padding:0 10px;
    border-radius:999px;
    background: rgba(255,140,0,.10);
    border:1px solid rgba(255,140,0,.18);
    color:#9a4b00;
    font-size:12px;
    font-weight:800;
  }

  .comment-title{
    margin-top:8px;
    font-size:17px;
    font-weight:800;
    color:var(--text);
    line-height:1.45;
    overflow:hidden;
    text-overflow:ellipsis;
    display:-webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient:vertical;
  }

  .comment-body{
    margin-top:14px;
    padding:14px 16px;
    border-radius:16px;
    background:#fffaf5;
    border:1px solid rgba(255,140,0,.12);
    color:var(--text);
    font-size:15px;
    line-height:1.65;
    word-break:break-word;
    position:relative;
  }

  .comment-body::before{
    content:"내 댓글";
    display:inline-block;
    margin-bottom:8px;
    font-size:12px;
    font-weight:800;
    color:#9a4b00;
  }

  .bottom-bar{
    position: fixed;
    left: 50%;
    transform: translateX(-50%);
    bottom: 16px;
    z-index: 60;
    width: min(var(--max), calc(100% - 24px));
    padding: 10px;
    border-radius: 22px;
    background: rgba(255,255,255,.78);
    border: 1px solid var(--line);
    backdrop-filter: blur(14px);
    box-shadow: var(--shadow);
    display:flex;
    gap: 10px;
    justify-content: space-between;
  }

  .bottom-bar a{
    flex:1;
    display:flex;
    align-items:center;
    justify-content:center;
    gap:8px;
    padding: 12px 10px;
    border-radius: 16px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.95);
    font-size: 13px;
    font-weight: 900;
    color: var(--text);
    transition: transform .15s ease, background .15s ease, border-color .15s ease, box-shadow .15s ease;
    white-space: nowrap;
  }

  .bottom-bar a:hover{
    transform: translateY(-2px);
    background: #fff;
    border-color: rgba(255,140,0,.30);
    box-shadow: 0 12px 24px rgba(17,24,39,.10);
  }

  .loading-text{
    margin-top: 18px;
    text-align: center;
    color: var(--muted);
    font-size: 14px;
    font-weight: 700;
  }

  #scroll-trigger{
    height: 20px;
  }

  @media (max-width: 720px){
    .container{
      padding: 18px 12px 110px;
    }

    .hero-title{
      font-size: 20px;
    }

    .comment-card{
        padding:14px;
        border-radius:18px;
      }

      .comment-card-top{
        gap:12px;
        align-items:flex-start;
      }

      .comment-thumb{
        width:64px;
        height:64px;
        border-radius:14px;
      }

      .comment-title{
        font-size:15px;
      }

      .comment-body{
        font-size:14px;
        line-height:1.6;
        padding:13px 14px;
      }

    .bottom-bar{
      width: calc(100% - 16px);
      bottom: 8px;
      padding: 8px;
      gap: 8px;
      flex-direction: column;
    }

    .bottom-bar a{
      font-size: 12px;
    }
  }
</style>
</head>
<body>
<!-- Header -->
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>

<div class="container">
	<div class="page-hero">
      <div>
        <div class="hero-title">내가 남긴 댓글들을 다시 확인해보세요</div>
        <div class="hero-desc">댓글을 작성한 게시글과 함께 내가 남긴 내용을 한 번에 볼 수 있어요.</div>
      </div>
      <div class="hero-pill">💬 내 댓글 모아보기</div>
    </div>

    <div id="commentListWrap">
        <c:forEach var="boardDto" items="${list}">
            <div class="comment-card">
                <a href="<c:url value='/board/view?bno=${boardDto.bno}'/>" class="comment-card-top">
                    <div class="comment-thumb">
                        <c:choose>
                            <c:when test="${not empty boardDto.img1}">
                                <img src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지">
                            </c:when>
                            <c:otherwise>
                                <img src="${data_path}/img/default_img.png" alt="기본 이미지">
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="comment-meta">
                        <span class="comment-category">🏷️${boardDto.bc_name}</span>
                        <div class="comment-title">
                            <c:choose>
                                <c:when test="${fn:length(boardDto.title) > 24}">
                                    ${fn:substring(boardDto.title, 0, 24)}...
                                </c:when>
                                <c:otherwise>
                                    ${boardDto.title}
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </a>

                <div class="comment-body">
                    ${boardDto.comment}
                </div>
            </div>
        </c:forEach>
	</div>
	<div id="scroll-trigger"></div>
    <div id="loading" class="loading-text" style="display:none;">댓글을 불러오는 중...</div>
    <div id="end-message" class="loading-text" style="display:none;">마지막 댓글까지 다 봤어요</div>
</div>

<!-- 무한스크롤 페이징 -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    const commentListWrap = document.getElementById("commentListWrap");
    const trigger = document.getElementById("scroll-trigger");
    const loading = document.getElementById("loading");
    const endMessage = document.getElementById("end-message");

    let offset = 3;
    const size = 3;
    let isLoading = false;
    let hasNext = true;

    function escapeHtml(str) {
        if (!str) return "";
        return str
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#39;");
    }

    function shortenTitle(title) {
        if (!title) return "";
        return title.length > 10 ? title.substring(0, 10) + "..." : title;
    }

    function createCommentItem(item) {
        const safeCategory = escapeHtml(item.bc_name || "");
        const safeComment = escapeHtml(item.comment || "");
        const safeTitle = escapeHtml(item.title || "");

        const titleText = safeTitle.length > 24
            ? safeTitle.substring(0, 24) + "..."
            : safeTitle;

        const imagePath = item.img1
            ? "${data_path}/upload/" + item.img1
            : "${data_path}/img/default_img.png";

        const detailUrl = "${path}/board/view?bno=" + item.bno;

        return ''
            + '<div class="comment-card">'
                + '<a href="' + detailUrl + '" class="comment-card-top">'
                    + '<div class="comment-thumb">'
                        + '<img src="' + imagePath + '" alt="대표 이미지">'
                    + '</div>'
                    + '<div class="comment-meta">'
                        + '<span class="comment-category">🏷️' + safeCategory + '</span>'
                        + '<div class="comment-title">' + titleText + '</div>'
                    + '</div>'
                + '</a>'
                + '<div class="comment-body">' + safeComment + '</div>'
            + '</div>';
    }

    function loadMoreComments() {
        if (isLoading || !hasNext) return;

        isLoading = true;
        loading.style.display = "block";

        $.ajax({
            url: "${path}/board/mycommentlist/more",
            type: "GET",
            data: {
                offset: offset,
                size: size
            },
            success: function (data) {
                if (!data || data.length === 0) {
                    hasNext = false;
                    endMessage.style.display = "block";
                    return;
                }

                let html = "";
                data.forEach(function (item) {
                    html += createCommentItem(item);
                });

                commentListWrap.insertAdjacentHTML("beforeend", html);
                offset += data.length;

                if (data.length < size) {
                    hasNext = false;
                    endMessage.style.display = "block";
                }
            },
            error: function () {
                console.error("추가 댓글 로딩 실패");
            },
            complete: function () {
                isLoading = false;
                loading.style.display = "none";
            }
        });
    }

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
            if (entry.isIntersecting) {
                loadMoreComments();
            }
        });
    }, {
        root: null,
        rootMargin: "120px",
        threshold: 0.1
    });

    observer.observe(trigger);
});
</script>
</body>
</html>