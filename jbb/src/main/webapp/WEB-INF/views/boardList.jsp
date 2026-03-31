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
    padding: 18px 16px 120px;
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

  .category-buttons{
    margin-top: 10px;
    margin-bottom: 10px;
  }
  .chip-row{
    display:flex;
    flex-wrap: wrap;
    gap: 8px;
    align-items:center;
  }
  .main-category-button,
  .category-button{
    padding: 10px 12px;
    border-radius: 999px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.92);
    font-size: 12px;
    font-weight: 900;
    cursor:pointer;
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease, background .15s ease;
    color: var(--text);
  }
  .main-category-button:hover,
  .category-button:hover{
    transform: translateY(-1px);
    box-shadow: 0 10px 20px rgba(17,24,39,.08);
    border-color: rgba(255,140,0,.25);
    background: #fff;
  }
  .main-category-button:disabled,
  .category-button:disabled{
    cursor: default;
    opacity: 1;
    color: #9a4b00;
    border-color: rgba(255,140,0,.30);
    background: rgba(255,140,0,.10);
    box-shadow: none;
    transform: none;
  }
  #sub-category-container{
    display:none;
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

  hr{
    border: none;
    border-top: 1px solid rgba(17,24,39,.08);
    width: 100%;
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

  .writeBtn{
    position: fixed;
    left: 50%;
    transform: translateX(-50%);
    bottom: 16px;
    z-index: 60;
    width: min(var(--max), calc(100% - 24px));
    padding: 12px 14px;
    border-radius: 22px;
    background: rgba(255,255,255,.78);
    border: 1px solid var(--line);
    backdrop-filter: blur(14px);
    box-shadow: var(--shadow);
    cursor:pointer;
    font-weight: 900;
    font-size: 14px;
    color: var(--text);
    display:flex;
    align-items:center;
    justify-content:center;
    gap: 8px;
  }
  .writeBtn::before{
    content:"+";
    display:inline-grid;
    place-items:center;
    width: 26px;
    height: 26px;
    border-radius: 10px;
    background: rgba(255,140,0,.12);
    border: 1px solid rgba(255,140,0,.25);
    color: #9a4b00;
    font-weight: 900;
  }
  .writeBtn:hover{
    box-shadow: 0 18px 36px rgba(17,24,39,.12);
    border-color: rgba(255,140,0,.25);
  }

  @media (max-width: 560px){
    .main_img{ flex: 0 0 92px; }
    .main_img img{ width:92px; height:92px; border-radius: 14px; }
    .search-option{ width: 120px; }
  }
</style>
</head>

<body>
<c:if test="${not empty alertMsg}">
  <script type="text/javascript">
    alert("${fn:escapeXml(alertMsg)}");
  </script>
</c:if>

<%@ include file="/WEB-INF/views/common/common_header.jsp" %>

<div class="container">
  <!-- 검색 기능 -->
  <div class="search-container">
    <form action="<c:url value='/board/list'/>" class="search-form" method="get">
      <select class="search-option" name="option">
        <option class="option" value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
        <option class="option" value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
        <option class="option" value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
      </select>
      <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
      <input type="submit" class="search-button" value="검색">
    </form>
  </div>

  <!-- 대분류 버튼 -->
  <div class="category-buttons">
    <div id="mainCategory" class="chip-row">
      <button class="main-category-button" id="allCategoryBtn" data-category-id="" disabled>전체글보기</button>
      <c:forEach var="category" items="${categories}">
        <c:if test="${empty category.bc_code_ref_mn or category.bc_code_ref_mn == 0}">
          <button class="main-category-button" data-category-id="${category.bc_code}">
            ${category.bc_name}
          </button>
        </c:if>
      </c:forEach>
    </div>
  </div>

  <!-- 중분류 버튼 -->
  <div class="category-buttons">
    <div id="sub-category-container" class="chip-row">
    </div>
  </div>

  <!-- 게시글 목록 -->
  <div id="boardListContainer" class="grid-container">
    <c:forEach var="boardDto" items="${list}">
      <div class="board-item" onclick="location.href='<c:url value="/board/view${ph.sc.queryString}&bno=${boardDto.bno}"/>'">
        <div class="main_img">
          <c:choose>
            <c:when test="${not empty boardDto.img1}">
              <img src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지">
            </c:when>
            <c:otherwise>
              <img src="${data_path}/img/default_img.png" alt="기본 이미지">
            </c:otherwise>
          </c:choose>
        </div>

        <div class="board-content-wrapper">
          <span class="category-label">${boardDto.bc_name}</span>

          <div class="board-title">
            <c:choose>
              <c:when test="${fn:length(boardDto.title) > 20}">
                ${fn:substring(boardDto.title, 0, 20)}...
              </c:when>
              <c:otherwise>
                ${boardDto.title}
              </c:otherwise>
            </c:choose>
          </div>

          <p class="board-content">
            <c:choose>
              <c:when test="${fn:length(boardDto.content) > 25}">
                ${fn:substring(boardDto.content, 0, 25)}...
              </c:when>
              <c:otherwise>
                ${boardDto.content}
              </c:otherwise>
            </c:choose>
          </p>

          <div class="board-bottom">
            <p class="b-b"><fmt:formatDate pattern="yyyy. M. dd" value="${boardDto.reg_date}"/></p>
            <p class="b-b">조회 ${boardDto.view_cnt }</p>
            <p class="b-b">댓글 ${boardDto.comment_cnt }</p>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>

  <!-- 페이징 -->
  <div class="paging">
    <c:if test="${totalCnt==null || totalCnt==0}">
      <div class="nolist"> 해당하는 게시물이 없습니다. </div>
    </c:if>

    <c:if test="${totalCnt!=null && totalCnt!=0}">
      <c:if test="${ph.showPrev}">
        <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
      </c:if>

      <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a>
      </c:forEach>

      <c:if test="${ph.showNext}">
        <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
      </c:if>
    </c:if>
  </div>
</div>

<button type="button" class="writeBtn" id="writeBtn" onclick="location.href='<c:url value="/board/write"/>'">글쓰기</button>

<script>
let currentSubCategory = null;
const categoryPageSize = 3;
</script>

<script>
function renderBoardList(list) {
  const boardListContainer = $("#boardListContainer");
  boardListContainer.html("");

  if (!list || list.length === 0) {
    boardListContainer.append("<div class='nolist'>게시물이 없습니다.</div>");
    return;
  }

  $(list).each(function(index, item) {
    let title = item.title ? (item.title.length > 20 ? item.title.substring(0, 20) + "..." : item.title) : "제목 없음";
    let content = item.content ? (item.content.length > 25 ? item.content.substring(0, 25) + "..." : item.content) : "내용 없음";
    let regDate = item.reg_date ? new Date(item.reg_date).toLocaleDateString("ko-KR") : "-";
    let viewCnt = item.view_cnt ? item.view_cnt : "0";
    let commentCnt = item.comment_cnt ? item.comment_cnt : "0";
    let imgSrc = item.img1
      ? contextPath + "/resources/upload/" + item.img1
      : contextPath + "/resources/img/default_img.png";

    let html = "";
    html += "<div class='board-item'>";
    html += "  <div class='main_img'>";
    html += "    <img src='" + imgSrc + "' alt='게시글 이미지'>";
    html += "  </div>";
    html += "  <div class='board-content-wrapper'>";
    html += "    <span class='category-label'>" + item.bc_name + "</span>";
    html += "    <a href='" + contextPath + "/board/read?bno=" + item.bno + "' class='board-title'>" + title + "</a>";
    html += "    <p class='board-content'>" + content + "</p>";
    html += "    <div class='board-bottom'>";
    html += "      <p class='b-b'>" + regDate + "</p>";
    html += "      <p class='b-b'>조회 " + viewCnt + "</p>";
    html += "      <p class='b-b'>댓글 " + commentCnt + "</p>";
    html += "    </div>";
    html += "  </div>";
    html += "</div>";

    boardListContainer.append(html);
  });
}

function renderCategoryPaging(ph, subCategory) {
  const pagingContainer = $(".paging");
  pagingContainer.html("");

  if (!ph || ph.totalCnt === 0) {
    pagingContainer.hide();
    return;
  }

  pagingContainer.show();

  if (ph.showPrev) {
    pagingContainer.append(
      '<a href="#" class="category-page-link" data-page="' + (ph.beginPage - 1) + '" data-subcategory="' + subCategory + '">&lt;</a>'
    );
  }

  for (let i = ph.beginPage; i <= ph.endPage; i++) {
    let activeClass = (i === ph.sc.page) ? "paging-active" : "";
    pagingContainer.append(
      '<a href="#" class="category-page-link ' + activeClass + '" data-page="' + i + '" data-subcategory="' + subCategory + '">' + i + '</a>'
    );
  }

  if (ph.showNext) {
    pagingContainer.append(
      '<a href="#" class="category-page-link" data-page="' + (ph.endPage + 1) + '" data-subcategory="' + subCategory + '">&gt;</a>'
    );
  }
}

function loadCategoryPosts(subCategory, page) {
  $.ajax({
    url: contextPath + "/board/getPostsByCategory",
    type: "GET",
    data: {
      subCategory: subCategory,
      page: page,
      pageSize: categoryPageSize
    },
    success: function(res) {
      currentSubCategory = subCategory;
      renderBoardList(res.list);
      renderCategoryPaging(res.ph, res.subCategory);
    },
    error: function() {
      alert("게시글을 불러오는 데 실패했습니다.");
    }
  });
}
</script>

<script>
$(document).ready(function () {
  $("#allCategoryBtn").click(function () {
    location.reload();
  });
});
</script>

<script>
$(document).ready(function () {
  $(".main-category-button[data-category-id]").click(function () {
    let mainCategory = $(this).data("category-id");

    $(".main-category-button").prop("disabled", false);
    $(this).prop("disabled", true);

    $("#sub-category-container").html("").hide();

    if (mainCategory) {
      $.ajax({
        url: contextPath + "/board/getSubCategories",
        type: "GET",
        data: { mainCategory: mainCategory },
        success: function (data) {
          $(data).each(function (index, item) {
            $("#sub-category-container").append(
              '<button class="category-button" data-category-id="' + item.bc_code + '">' + item.bc_name + '</button>'
            );
          });
          $("#sub-category-container").show();
        },
        error: function () {
          alert("중분류 불러오기 실패!");
        }
      });
    }
  });
});
</script>

<script>
$(document).on("click", ".category-button", function () {
  let subCategory = $(this).data("category-id");

  $(".category-button").prop("disabled", false);
  $(this).prop("disabled", true);

  loadCategoryPosts(subCategory, 1);
});
</script>

<script>
$(document).on("click", ".paging a", function (e) {
  // 카테고리 선택 안 한 상태면 기존 전체글보기 페이징 그대로 사용
  if (!currentSubCategory) {
    return;
  }

  e.preventDefault();

  let page = $(this).data("page");

  //서버사이드 .page 링크가 남아 있으면 href에서 page 추출
  if (!page) {
    let href = $(this).attr("href");
    let match = href ? href.match(/page=(\d+)/) : null;
    page = match ? parseInt(match[1], 10) : 1;
  }

  loadCategoryPosts(currentSubCategory, page);
});
</script>

<script>
let msg = "${msg}";
if(msg=="WRT_OK") alert("게시물이 등록되었습니다.");
if(msg=="DEL_OK") alert("게시물이 성공적으로 삭제되었습니다.");
if(msg=="MOD_OK") alert("게시물이 수정되었습니다.");
</script>

</body>
</html>