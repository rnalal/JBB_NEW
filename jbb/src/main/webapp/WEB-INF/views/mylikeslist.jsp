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

  .board-list{
    display:grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
    margin-top: 22px;
  }

  .board-item{
    background: rgba(255,255,255,.92);
    border: 1px solid rgba(17,24,39,.10);
    border-radius: 22px;
    padding: 16px;
    text-align: left;
    box-shadow: 0 10px 24px rgba(17,24,39,.08);
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease;
  }

  .board-item:hover{
    transform: translateY(-3px);
    box-shadow: 0 18px 36px rgba(17,24,39,.12);
    border-color: rgba(255,140,0,.28);
  }

  .imgtop{
    display:flex;
    align-items:center;
    justify-content:flex-start;
    margin-bottom: 12px;
  }

  .bname{
    display:inline-flex;
    align-items:center;
    gap:8px;
    color:#9a4b00;
    font-size:14px;
    font-weight:900;
    padding: 8px 12px;
    border-radius:999px;
    background: rgba(255,140,0,.10);
    border: 1px solid rgba(255,140,0,.22);
  }

  .icon{
    font-size:18px;
    line-height:1;
  }

  .thumb-link{
    display:block;
  }

  .board-item img{
    width:100%;
    height: 320px;
    object-fit: cover;
    border-radius: 18px;
    display:block;
  }

  .title-text{
    margin: 14px 0 10px;
    font-size: 22px;
    color: var(--text);
    font-weight: 900;
    line-height: 1.35;
    min-height: 60px;
    display:-webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow:hidden;
  }

  .date{
    color: var(--muted);
    font-size: 14px;
    text-align:right;
    font-weight:700;
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

  @media (max-width: 900px){
    .board-list{
          grid-template-columns: repeat(2, minmax(0, 1fr));
          gap: 12px;
        }

        .board-item{
            padding: 12px;
            border-radius: 18px;
        }

        .board-item img{
          height: 220px;
          border-radius: 14px;
        }

        .title-text{
           margin: 10px 0 8px;
           font-size: 17px;
           line-height: 1.4;
           min-height: auto;
        }

        .date{
            font-size: 12px;
        }

        .bname{
            font-size: 12px;
            padding: 6px 10px;
        }
  }

  @media (max-width: 720px){
    .container{
      padding: 18px 12px 110px;
    }

    .hero-title{
      font-size: 20px;
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
        <div class="hero-title">좋아요 했던 글들을 다시 모아봤어요</div>
        <div class="hero-desc">마음에 들었던 게시글을 한 번에 보고, 다시 읽고 싶은 글로 바로 들어가보세요.</div>
      </div>
      <div class="hero-pill">❤️ 좋아요한 글 모아보기</div>
    </div>

	<!-- 게시글 리스트 (그리드 레이아웃 적용) -->
    <div class="board-list" id="boardList">
        <c:forEach var="boardDto" items="${list}">
            <div class="board-item">
            	<div class="imgtop">
            		<span class="bname"><span class="icon">🏷️</span>${boardDto.bc_name}</span>
            	</div>

            	<a class="thumb-link" href="<c:url value='/board/view?bno=${boardDto.bno}'/>">
                	<c:choose>
						<c:when test="${not empty boardDto.img1}">
							<img src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지">
						</c:when>
						<c:otherwise>
							<img src="${data_path}/img/default_img.png" alt="기본 이미지">
						</c:otherwise>
					</c:choose>
                </a>

                <p class="title-text">
	                <c:choose>
						<c:when test="${fn:length(boardDto.title) > 10}">
							${fn:substring(boardDto.title, 0, 10)}...
						</c:when>
						<c:otherwise>
							${boardDto.title}
						</c:otherwise>
					</c:choose>
				</p>

                <p class="date"><fmt:formatDate pattern = "yyyy. M. dd" value="${boardDto.reg_date}"/></p>
            </div>
        </c:forEach>
    </div>
    <div id="scroll-trigger"></div>
    <div id="loading" class="loading-text" style="display:none;">게시글을 불러오는 중...</div>
    <div id="end-message" class="loading-text" style="display:none;">마지막 글까지 다 봤어요</div>
</div>

<!-- 무한스크롤 페이징 -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    const boardList = document.getElementById("boardList");
    const trigger = document.getElementById("scroll-trigger");
    const loading = document.getElementById("loading");
    const endMessage = document.getElementById("end-message");

    let offset = 3;   // 처음 3개는 이미 JSP에서 렌더링
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

    function formatDate(dateValue) {
        const date = new Date(dateValue);
        if (isNaN(date.getTime())) return "";

        const year = date.getFullYear();
        const month = date.getMonth() + 1;
        const day = String(date.getDate()).padStart(2, "0");

        return year + ". " + month + ". " + day;
    }

    function shortenTitle(title) {
        if (!title) return "";
        return title.length > 10 ? title.substring(0, 10) + "..." : title;
    }

    function createBoardItem(item) {
        const title = shortenTitle(item.title);
        const safeTitle = escapeHtml(title);
        const safeCategory = escapeHtml(item.bc_name || "");
        const dateText = formatDate(item.reg_date);

        const imagePath = item.img1
            ? "${data_path}/upload/" + item.img1
            : "${data_path}/img/default_img.png";

        const detailUrl = "${path}/board/view?bno=" + item.bno;

        return ''
            + '<div class="board-item">'
                + '<div class="imgtop">'
                    + '<span class="bname"><span class="icon">🏷️</span>' + safeCategory + '</span>'
                + '</div>'
                + '<a class="thumb-link" href="' + detailUrl + '">'
                    + '<img src="' + imagePath + '" alt="대표 이미지">'
                + '</a>'
                + '<p class="title-text">' + safeTitle + '</p>'
                + '<p class="date">' + dateText + '</p>'
            + '</div>';
    }

    function loadMoreBoards() {
        if (isLoading || !hasNext) return;

        isLoading = true;
        loading.style.display = "block";

        $.ajax({
            url: "${path}/board/mylikeslist/more",
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
                    html += createBoardItem(item);
                });

                boardList.insertAdjacentHTML("beforeend", html);
                offset += data.length;

                if (data.length < size) {
                    hasNext = false;
                    endMessage.style.display = "block";
                }
            },
            error: function () {
                console.error("추가 좋아요 게시글 로딩 실패");
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
                loadMoreBoards();
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