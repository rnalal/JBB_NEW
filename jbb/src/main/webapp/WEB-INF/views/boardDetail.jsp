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
    /* White + Orange theme (index.jsp 동일) */
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

  .card{
    border-radius: var(--r);
    border: 1px solid var(--line);
    background: rgba(255,255,255,.88);
    box-shadow: 0 10px 24px rgba(17,24,39,.06);
    overflow: hidden;
  }

  .post-head{
    display:flex;
    justify-content: space-between;
    align-items:center;
    padding: 14px 14px 10px;
  }

  .user-info{
    display:flex;
    align-items:center;
    gap: 12px;
    min-width: 0;
  }
  .user-info img{
    width: 44px;
    height: 44px;
    border-radius: 16px;
    object-fit: cover;
    background:#f3f4f6;
    border: 1px solid rgba(17,24,39,.10);
  }
  .info{
    display:flex;
    flex-direction: column;
    gap: 4px;
    min-width: 0;
  }
  .writer{
    font-weight: 900;
    font-size: 14px;
    color: var(--text);
    overflow:hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    max-width: 360px;
  }
  .reg{
    font-weight: 700;
    font-size: 12px;
    color: var(--muted);
  }

  /* dropdown */
  .dropdown-container{ position: relative; }
  .dropdown-btn{
    width:44px; height:44px;
    border-radius: 14px;
    border:1px solid var(--line);
    background: rgba(255,255,255,.9);
    cursor:pointer;
    color: var(--muted);
    font-size: 20px;
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease;
  }
  .dropdown-btn:hover{
    transform: translateY(-1px);
    box-shadow: 0 10px 20px rgba(17,24,39,.08);
    border-color: rgba(255,140,0,.25);
  }
  .dropdown-menu{
    position: absolute;
    right: 0;
    top: 52px;
    background: #fff;
    border: 1px solid rgba(17,24,39,.12);
    border-radius: 14px;
    display: none;
    width: 180px;
    box-shadow: 0 18px 36px rgba(17,24,39,.12);
    list-style: none;
    padding: 8px;
    z-index: 30;
  }
  .dropdown-menu li{
    height: auto;
    padding: 0;
  }
  .dropdown-menu hr{
    border:none;
    border-top: 1px solid rgba(17,24,39,.10);
    margin: 6px 0;
  }
  .modifyBtn{
    display:block;
    width:100%;
    text-align:left;
    padding: 10px 12px;
    border-radius: 12px;
    font-weight: 900;
    font-size: 13px;
    color: var(--text);
  }
  .modifyBtn:hover{
    background: rgba(255,140,0,.08);
  }
  .removeBtn{
    width:100%;
    text-align:left;
    padding: 10px 12px;
    border-radius: 12px;
    font-weight: 900;
    font-size: 13px;
    color: var(--brand);
    background: transparent;
    border: none;
    cursor: pointer;
  }
  .removeBtn:hover{
    background: rgba(255,140,0,.08);
  }

  /* content area */
  .post-body{
    padding: 0 14px 14px;
  }
  .input-group{
    width:100%;
    margin-top: 10px;
  }

  input[type="text"]{
    width: 100%;
    padding: 8px 0;
    font-size: 18px;
    font-weight: 900;
    border:none;
    background: transparent;
    color: var(--text);
  }

  textarea{
    width: 100%;
    padding: 10px 0 0;
    border:none;
    background: transparent;
    color: #374151;
    font-size: 14px;
    line-height: 1.7;
    resize: none;
    overflow: hidden;
    white-space: pre-line;
    word-wrap: break-word;
  }

  input:focus, textarea:focus{ outline: none; }

  .image-container{
    display:flex;
    flex-direction: column;
    gap: 12px;
    margin-top: 14px;
  }
  .image-container img{
    width:100%;
    height: 420px;
    object-fit: cover;
    display: block;
    border-radius: 18px;
    border: 1px solid rgba(17,24,39,.10);
    box-shadow: 0 10px 24px rgba(17,24,39,.08);
    background: #fff;
  }

  /* stats */
  .stats-actions{
    display:flex;
    justify-content: space-between;
    align-items:center;
    padding: 10px 14px 14px;
    border-top: 1px solid rgba(17,24,39,.08);
  }

  .like-btn{
    display:flex;
    align-items:center;
    gap: 8px;
    font-size: 14px;
    background: none;
    border: none;
    cursor: pointer;
    color: var(--text);
    padding: 8px 10px;
    border-radius: 999px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.92);
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease;
  }
  .like-btn:hover{
    transform: translateY(-1px);
    box-shadow: 0 10px 20px rgba(17,24,39,.08);
    border-color: rgba(255,140,0,.25);
  }
  .heart{ font-size: 16px; }
  .likeCount{
    font-size: 13px;
    font-weight: 900;
    color: var(--text);
  }

  .view_cnt{
    font-size: 12px;
    font-weight: 800;
    color: var(--muted);
  }

  /* comments */
  #commentList ul{
    list-style: none;
    padding: 0;
    margin: 0;
  }
  #commentList li{
    padding: 16px 0;
    border-bottom: 1px solid rgba(17,24,39,.08);
  }
  #commentList li:first-child{
    padding-top: 14px;
  }
  #commentList li:last-child{
    border-bottom: none;
    padding-bottom: 0;
  }
  .comments{
    border-top: 1px solid rgba(17,24,39,.10);
    margin-top: 0;
    padding: 14px;
    padding-bottom: 90px;
  }
  .cmt_size{
    font-size: 14px;
    font-weight: 900;
  }
  #commentCount{
    font-size: 14px;
    font-weight: 900;
    color: var(--brand);
    margin-left: 4px;
  }

  .comment-header{
    display:flex;
    align-items:center;
    gap: 10px;
    margin-top: 14px;
  }
  .comment-header img{
    width: 36px;
    height: 36px;
    border-radius: 14px;
    object-fit: cover;
    background:#f3f4f6;
    border: 1px solid rgba(17,24,39,.10);
  }
  .comment-author{
    font-weight: 900;
    font-size: 13px;
  }
  .comment-date{
    font-size: 12px;
    color: var(--muted);
    font-weight: 700;
  }
  .comment-text{
    width: 100%;
    border:none;
    background: transparent;
    font-size: 13px;
    color: #374151;
    line-height: 1.6;
    height: auto;
    overflow: hidden;
    resize: none;
    word-break: break-word;
    white-space: pre-wrap;
    margin-top: 8px;
  }

  .buttons{
    display:flex;
    justify-content: flex-end;
    gap: 8px;
    margin-top: 10px;
  }
  .modBtn, .delBtn{
    padding: 8px 10px;
    border-radius: 12px;
    font-size: 12px;
    font-weight: 900;
    cursor: pointer;
  }
  .modBtn{
    border: 1px solid rgba(255,140,0,.28);
    background: rgba(255,140,0,.10);
    color: #9a4b00;
  }
  .delBtn{
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.9);
    color: var(--text);
  }
  .modBtn:hover, .delBtn:hover{
    box-shadow: 0 10px 20px rgba(17,24,39,.08);
    transform: translateY(-1px);
  }

  /* add comment fixed */
  .add-comment{
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
    align-items:center;
  }
  .add-comment input{
    flex: 1;
    padding: 12px 14px;
    border-radius: 16px;
    border: 1px solid rgba(17,24,39,.10);
    background: rgba(255,255,255,.95);
    font-size: 13px;
    font-weight: 700;
    color: var(--text);
  }
  .add-comment input::placeholder{
    color: var(--muted);
    font-weight: 700;
  }
  .add-comment input:focus{
    border-color: rgba(255,140,0,.35);
    box-shadow: 0 10px 20px rgba(255,140,0,.10);
  }
  .add-comment button{
    padding: 12px 14px;
    border-radius: 16px;
    border: 1px solid rgba(255,140,0,.30);
    background: rgba(255,140,0,.92);
    color: #fff;
    cursor: pointer;
    font-size: 13px;
    font-weight: 900;
    transition: transform .15s ease, box-shadow .15s ease;
    white-space: nowrap;
  }
  .add-comment button:hover{
    transform: translateY(-1px);
    box-shadow: 0 12px 24px rgba(255,140,0,.18);
  }

  /* page wrapper */
  .page-wrap{
    max-width: var(--max);
    margin: 0 auto;
    padding: 0 16px;
  }
</style>
</head>

<body>
  <!-- Header -->
  <%@ include file="/WEB-INF/views/common/common_header.jsp" %>

  <div class="container">
    <div class="card">
      <div class="post-head">
        <div class="user-info">
          <img src="${data_path }/img/user_default.png" alt="User">
          <div class="info">
            <span class="writer"><c:out value="${boardDto.writer}"/></span>
            <span class="reg"><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy.MM.dd"/></span>
          </div>
        </div>

        <c:if test="${sessionScope.id eq boardDto.writer}">
          <div class="dropdown-container">
            <button class="dropdown-btn" aria-label="more">⋮</button>
            <ul class="dropdown-menu">
              <li>
                <a href="<c:url value='/board/modify?bno=${boardDto.bno}&page=${page}&pageSize=${pageSize}'/>"
                   class="modifyBtn">수정</a>
              </li>
              <hr>
              <li><button type="button" id="removeBtn" class="removeBtn">삭제</button></li>
            </ul>
          </div>
        </c:if>
      </div>

      <form id="form" enctype="multipart/form-data">
        <input type="hidden" name="bno" value="${boardDto.bno}">
        <input type="hidden" name="cno" value="${commentDto.cno}">

        <div class="post-body">
          <div class="input-group">
            <input type="text" name="title" class="editable"
                   value="<c:out value='${boardDto.title}'/>" readonly="readonly">
          </div>

          <div class="input-group">
            <textarea name="content" id="content" class="editable" readonly="readonly"><c:out value="${boardDto.content}"/></textarea>
          </div>

          <div class="image-container">
            <!-- img1 -->
            <c:choose>
              <c:when test="${not empty boardDto.img1}">
                <img src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지">
              </c:when>
              <c:otherwise>
                <img src="${data_path}/img/default_img.png" alt="기본 이미지">
              </c:otherwise>
            </c:choose>

            <!-- img2 -->
            <c:choose>
              <c:when test="${not empty boardDto.img2}">
                <img src="${data_path}/upload/${boardDto.img2}" alt="이미지 2">
              </c:when>
              <c:otherwise>
              </c:otherwise>
            </c:choose>

            <!-- img3 -->
            <c:choose>
              <c:when test="${not empty boardDto.img3}">
                <img src="${data_path}/upload/${boardDto.img3}" alt="이미지 3">
              </c:when>
              <c:otherwise>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </form>

      <div class="stats-actions">
        <button class="like-btn" data-board-bno="${boardDto.bno}">
          <span class="likeCount">${likeCount}</span>
        </button>
        <div class="view_cnt">조회 ${boardDto.view_cnt}</div>
      </div>

      <div class="comments">
        <div class="comment">
          <p class="cmt_size">댓글 <span id="commentCount">${boardDto.comment_cnt}</span></p>
          <div id="commentList"></div>
        </div>
      </div>
    </div>
  </div>

  <c:if test="${not empty sessionScope.id}">
    <div class="add-comment">
      <input type="text" name="comment" placeholder="${id}(으)로 댓글 남기기" >
      <button id="sendBtn" type="button">댓글등록</button>
    </div>
  </c:if>

<!-- 전역변수 -->
<script>
  var contextPath = "${pageContext.request.contextPath}";
</script>

<!-- textarea 크기 자동 조절 -->
<script>
$(window).on("load resize", function () {
    setTimeout(adjustTextareaHeight, 100);
});
$(".image-container img").on("load", function () {
    setTimeout(adjustTextareaHeight, 50);
});

function adjustTextareaHeight() {
    let $textarea = $(".input-group textarea");
    $textarea.css("height", "auto");
    $textarea.css("height", ($textarea.prop("scrollHeight") + "px"));

    let $imageContainer = $(".image-container");

    if ($imageContainer.length > 0) {
        let textareaBottom = $textarea.offset().top + $textarea.outerHeight();
        let imageContainerTop = $imageContainer.offset()?.top;

        if (imageContainerTop !== undefined) {
            let gap = imageContainerTop - textareaBottom;

            if (gap !== 20) {
                let newMargin = 20 - gap;
                if (newMargin < 0) newMargin = 0;
                $textarea.css("margin-bottom", `${newMargin}px`);
            }
        }
    }
}
</script>

<!-- 헤더메뉴 -->
<script>
$(document).ready(function () {
    $(".dropdown-btn").click(function (event) {
        event.stopPropagation();
        $(".dropdown-menu").not($(this).next()).hide();
        $(this).next(".dropdown-menu").toggle();
    });

    $(document).click(function () {
        $(".dropdown-menu").hide();
    });

    $(".dropdown-menu").click(function (event) {
        event.stopPropagation();
    });
});
</script>

<!-- 좋아요 -->
<script>
$(document).ready(function () {
    let boardBno = "${boardDto.bno}";
    let $likeButton = $(".like-btn");

    $.ajax({
        type: "GET",
        url: contextPath + "/likes/isLiked/" + boardBno,
        success: function (response) {
            if (response.error) {
                console.error(response.error);
                return;
            }
            updateLikeButton(response.isLiked, response.likeCount);
        },
        error: function () {
            console.error("좋아요 상태 및 개수 가져오기 실패");
        }
    });

    $likeButton.click(function () {
        let userId = "<c:out value='${sessionScope.id}'/>";
        if (!userId) {
            alert("로그인이 필요합니다!");
            return;
        }

        $.ajax({
            type: "POST",
            url: contextPath + "/likes",
            contentType: "application/json",
            data: JSON.stringify({ user_id: userId, board_bno: boardBno }),
            success: function (response) {
                if (response.error) {
                    alert("오류 발생");
                    return;
                }
                updateLikeButton(response.liked, response.likeCount);
            },
            error: function () {
                console.error("좋아요 요청 실패");
            }
        });
    });

    function updateLikeButton(isLiked, likeCount) {
        if (isLiked) {
            $likeButton.html("<span class='heart'>❤️</span><span class='likeCount'>" + likeCount + "</span>");
        } else {
            $likeButton.html("<span class='heart'>🤍</span><span class='likeCount'>" + likeCount + "</span>");
        }
    }
});
</script>

<!-- 홈으로 이동 -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    const homeBtn = document.getElementById("home-btn");
    homeBtn.addEventListener("click", function () {
        window.location.href = "<c:url value='/' />";
    });
});
</script>

<!-- 메세지출력 -->
<script>
let msg = "${msg}";
if(msg=="DEL_ERR") alert("삭제에 실패했습니다.");
</script>

<!-- 댓글 -->
<script>
const loggedInUser = "<c:out value='${sessionScope.id}'/>";
const bno = $("input[name='bno']").val();
const cno = $("input[name='cno']").val();

function showList() {
  $.ajax({
    type: "GET",
    url: contextPath + "/comments",
    data: { bno: bno },
    success: function (result) {
      $("#commentList").html(toHtml(result));
    },
    error: function () {
      alert("댓글 목록 불러오기 오류");
    }
  });
}

$(document).ready(function () {
  showList();

  $("#sendBtn").click(function () {
    const comment = $("input[name=comment]").val();

    if (!comment || comment.trim() === "") {
      alert("댓글을 입력해주세요.");
      $("input[name=comment]").focus();
      return;
    }

    $.ajax({
      type: "POST",
      url: contextPath + "/comments?bno=" + bno,
      contentType: "application/json",
      dataType: "text",
      data: JSON.stringify({ comment: comment }),
      success: function () {
        alert("댓글이 등록되었습니다.");
        $("input[name=comment]").val("");
        showList();
      },
      error: function () {
        alert("댓글 등록 중 오류 발생");
      }
    });
  });

  $("#commentList").on("click", ".modBtn", function () {
    const li = $(this).closest("li");
    const cno = li.attr("data-cno");
    const inputField = li.find(".comment-text");
    const modBtn = $(this);

    const isReadonly = inputField.prop("readonly");

    if (isReadonly) {
      inputField.prop("readonly", false);
      modBtn.text("등록");
      inputField.css({
        width: "100%",
        height: "auto",
        border: "1px solid rgba(17,24,39,.12)",
        "background-color": "rgba(255,247,239,.55)",
        "border-radius": "12px",
        padding: "10px 12px"
      });
    } else {
      const updatedComment = inputField.val();

      $.ajax({
        type: "PATCH",
        url: contextPath + "/comments/" + cno,
        contentType: "application/json",
        dataType: "text",
        data: JSON.stringify({ comment: updatedComment }),
        success: function () {
          alert("댓글이 수정되었습니다.");
          showList();
        },
        error: function () {
          alert("댓글 수정 중 오류 발생");
        }
      });
    }
  });

  $("#commentList").on("click", ".delBtn", function () {
    const li = $(this).closest("li");
    const cno = li.attr("data-cno");

    if (!confirm("댓글을 삭제하시겠습니까?")) return;

    $.ajax({
      type: "DELETE",
      url: contextPath + "/comments/" + cno,
      data: { bno: bno },
      dataType: "text",
      success: function () {
        alert("댓글이 삭제되었습니다.");
        showList();
      },
      error: function () {
        alert("댓글 삭제 중 오류 발생");
      }
    });
  });
});

function formatDate(dateString) {
  if (!dateString) return "";
  const date = new Date(dateString);
  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");
  return year + "." + month + "." + day;
}

function toHtml(comments) {
  let tmp = "<ul>";

  comments.forEach(function (comment) {
    tmp += '<li data-cno="' + comment.cno + '" data-bno="' + comment.bno + '">';
    tmp += '<div class="comment-header">';
    tmp += '<img src="${data_path }/img/user_default.png" alt="User">';
    tmp += '<p class="comment-author">' + (comment.commenter || "") + "</p>";
    tmp += '<p class="comment-date">' + formatDate(comment.up_date) + "</p>";
    tmp += "</div>";
    tmp += '<textarea class="comment-text" readonly>' + (comment.comment || "") + "</textarea>";

    if (comment.commenter === loggedInUser) {
      tmp += '<div class="buttons">';
      tmp += '<button class="modBtn">수정</button>';
      tmp += '<button class="delBtn">삭제</button>';
      tmp += "</div>";
    }

    tmp += "</li>";
  });

  tmp += "</ul>";
  return tmp;
}
</script>

<script>
$('#removeBtn').on("click", function(){
  if(!confirm("정말로 삭제하시겠습니까?")) return;
  let form = $('#form');
  form.attr("action", "<c:url value='/board/remove?page=${page}&pageSize=${pageSize}'/>");
  form.attr("method", "post");
  form.submit();
})
</script>

</body>
</html>