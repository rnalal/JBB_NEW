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
    padding: 28px 16px 56px;
  }

  .title-actions{
    display:flex;
    align-items:center;
    gap:10px;
  }

  .detail-top-actions{
    display: flex;
    justify-content: flex-end;
    margin-top: 22px;
  }

  .delBtn{
    min-width: 88px;
    height: 46px;
    padding: 0 16px;
    font-size:16px;
    font-weight:900;
    color: var(--brand);
    background: rgba(255,255,255,.96);
    border: 1.5px solid rgba(255,140,0,.45);
    border-radius: 14px;
    cursor:pointer;
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease, background .15s ease;
  }

  .delBtn:hover{
    transform: translateY(-1px);
    box-shadow: 0 12px 24px rgba(17,24,39,.08);
    background: #fff;
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

  .qna-detail{
    width:100%;
    margin-top: 22px;
  }

  .question-box,
  .answer-box{
    width:100%;
    font-size:17px;
    display:flex;
    flex-direction:column;
    justify-content:space-between;
    padding: 24px 22px;
    border-radius: 22px;
    border: none;
    box-shadow: 0 8px 18px rgba(17,24,39,.06);
    min-height: 180px;
    height: auto;
    overflow: hidden;
  }

  .question-box{
    background: rgba(255,255,255,.92);
  }

  .answer-box{
    margin-top:18px;
    background: rgba(255,247,239,.96);
    border-color: rgba(255,140,0,.18);
  }

  .question-box p,
  .answer-box p{
    margin: 0;
    white-space: pre-line;
    font-size: 18px;
    line-height: 1.9;
    color: var(--text);
  }

  .bottom{
    font-size:14px !important;
    text-align: right;
    margin-top: 18px;
    color: var(--muted) !important;
    font-weight:700;
  }

  .no-answer{
    margin-top: 18px;
    font-size: 18px;
    text-align: center;
    color: var(--muted);
    padding: 28px;
    border-radius: 20px;
    border: 1px dashed rgba(17,24,39,.12);
    background: rgba(255,255,255,.78);
    font-weight: 700;
  }

  @media (max-width: 720px){
    .container{
      padding: 18px 12px 40px;
    }

    .jbb-title{
      padding: 12px;
      gap: 10px;
      align-items:flex-start;
    }

    .title-left,
    .title-right{
      min-width: auto;
    }

    .title-center h2{
      font-size: 20px;
    }

    .title-actions{
      flex-wrap:wrap;
      justify-content:flex-end;
    }

    .hero-title{
      font-size: 20px;
    }

    .question-box,
    .answer-box{
      padding: 18px 16px;
      min-height: 150px;
    }

    .question-box p,
    .answer-box p{
      font-size: 16px;
    }

    .no-answer{
      font-size: 16px;
      padding: 22px 16px;
    }
  }
</style>
</head>
<body>
<!-- Header -->
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>

<%-- 질문 작성자와 현재 로그인한 사용자를 비교 --%>
<c:choose>
    <c:when test="${loggedInUser eq qnaDetail.question_writer}">
        <div class="container">
            <div class="page-hero">
              <div>
                <div class="hero-title">내가 남긴 문의와 답변을 확인해보세요</div>
                <div class="hero-desc">문의 내용과 답변 등록 여부를 한눈에 확인할 수 있어요.</div>
              </div>
              <div class="hero-pill">💬 문의 상세보기</div>
            </div>

            <div class="qna-detail">
                <!-- 질문 내용 -->
                <div class="question-box">
                    <p>${qnaDetail.q_content}</p>
                    <p class="bottom"><fmt:formatDate pattern="yyyy. M. dd" value="${qnaDetail.question_date}"/></p>
                </div>

                <!-- 답변이 있을 경우 출력 -->
                <c:if test="${not empty qnaDetail.a_content}">
                    <div class="answer-box">
                        <p>${qnaDetail.a_content}</p>
                        <p class="bottom"><fmt:formatDate pattern="yyyy. M. dd" value="${qnaDetail.answer_date}"/></p>
                    </div>
                </c:if>

                <!-- 답변이 없을 경우 -->
                <c:if test="${empty qnaDetail.a_content}">
                    <p class="no-answer">아직 답변이 등록되지 않았습니다.</p>
                </c:if>
            </div>

            <div class="detail-top-actions">
                 <div class="title-actions">
                      <c:if test="${loggedInUser eq qnaDetail.question_writer}">
                        <form action="<c:url value='/qna/delete'/>" method="post">
                        	<input type="hidden" name="qno" value="${qnaDetail.question_id}">
                        	<button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="delBtn">삭제</button>
                        </form>
                      </c:if>
                 </div>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <%-- 본인이 작성한 문의가 아닌 경우 --%>
        <script>
            alert("본인이 작성한 문의만 확인할 수 있습니다.");
            window.location.href = "<c:url value='/qna/list'/>";
        </script>
    </c:otherwise>
</c:choose>

<script>
  let msg = "${msg}";
  if(msg=="DEL_ERR") alert("문의를 삭제하지 못했습니다. 다시 시도해 주세요.");
</script>
</body>
</html>