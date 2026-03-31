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
    padding: 28px 16px 96px;
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

  .table-wrap{
    margin-top: 22px;
    border-radius: 24px;
    overflow: hidden;
    border: none;
    background: rgba(255,255,255,.88);
    box-shadow: var(--shadow);
  }

  .qna-table{
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
  }

  .qna-table col.content-col{
    width: auto;
  }

  .qna-table col.status-col{
    width: 130px;
  }

  .qna-table tbody td{
    padding: 18px 20px;
    border: none;
    background: transparent;
    border-bottom: 1px solid rgba(17, 24, 39, .08);
  }

  .qna-table tbody td:first-child{
    border-radius: 0;
  }

  .qna-table tbody tr:last-child td{
    border-bottom: none;
  }

  .qna-table tbody tr{
    position: relative;
    cursor: pointer;
    transition: background .15s ease, transform .15s ease;
  }

  .qna-table tbody tr:hover{
    background: rgba(255, 247, 239, .72);
    transform: translateY(-2px);
  }

  .qna-content-box{
    display:flex;
    flex-direction:column;
    gap: 6px;
  }

  .qna-content-text{
    font-size: 18px;
    font-weight: 800;
    color: var(--text);
    line-height: 1.5;
    word-break: break-word;
    white-space: normal;
  }

  .qna-date{
    color: var(--muted);
    font-size: 12px;
    font-weight: 700;
  }

  .status-cell{
    text-align: right;
    border-right: none;
  }

  .status{
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 92px;
    padding: 9px 12px;
    border-radius: 999px;
    font-size: 13px;
    font-weight: 900;
    white-space: nowrap;
  }

  .answered{
    background: rgba(34,197,94,.10);
    color: #15803d;
    border: 1px solid rgba(34,197,94,.18);
  }

  .pending{
    background: rgba(255,140,0,.10);
    color: #c76a00;
    border: 1px solid rgba(255,140,0,.18);
  }

  .empty-row td{
    padding: 0;
    border-bottom: none;
  }

  .nolist{
    width:100%;
    text-align:center;
    color: var(--brand);
    font-weight: 900;
    font-size: 14px;
    padding: 28px 10px;
    border-radius: 0;
    border: none;
    background: rgba(255,140,0,.06);
  }

  button.writebtn{
    position: fixed;
    right: 22px;
    bottom: 22px;
    width: 72px;
    height: 72px;
    border-radius: 50%;
    background: linear-gradient(135deg, var(--brand), var(--brand2));
    color: white;
    border: none;
    font-size: 42px;
    line-height: 1;
    cursor: pointer;
    z-index: 1000;
    box-shadow: 0 18px 30px rgba(255,140,0,.28);
    transition: transform .15s ease, box-shadow .15s ease;
  }

  button.writebtn:hover{
    transform: translateY(-2px) scale(1.02);
    box-shadow: 0 22px 36px rgba(255,140,0,.32);
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

  @media (max-width: 720px){
    .container{
      padding: 18px 12px 96px;
    }

    .hero-title{
      font-size: 20px;
    }

    .qna-table col.status-col{
        width: 120px;
      }

      .qna-table tbody td{
        padding: 40px 32px;
      }

      .qna-content-text{
        font-size: 14px;
      }

      .status{
        min-width: 82px;
        font-size: 12px;
        padding: 8px 10px;
      }

    button.writebtn{
      width: 62px;
      height: 62px;
      font-size: 36px;
      right: 14px;
      bottom: 14px;
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
        <div class="hero-title">내 문의 내역을 한눈에 확인해보세요</div>
        <div class="hero-desc">등록한 문의 내용과 답변 상태를 쉽게 확인하고 새 문의도 바로 작성할 수 있어요.</div>
      </div>
      <div class="hero-pill">📩 문의 내역 보기</div>
    </div>

    <div class="table-wrap">
      <table class="qna-table">
          <tbody>
              <c:choose>
                  <c:when test="${empty list}">
                    <tr class="empty-row">
                      <td colspan="2">
                        <div class="nolist">문의 내역이 없습니다.</div>
                      </td>
                    </tr>
                  </c:when>
              <c:otherwise>
              <c:forEach var="qnaDto" items="${list}">
  	                <tr onclick="location.href='${path}/qna/detail?qno=${qnaDto.qno}'">
  	                    <td>
                          <div class="qna-content-box">
    			                <div class="qna-content-text">
    			                <c:choose>
  									<c:when test="${fn:length(qnaDto.q_content) > 20}">
  										${fn:substring(qnaDto.q_content, 0, 30)}...
  									</c:when>
  									<c:otherwise>
  										${qnaDto.q_content}
  									</c:otherwise>
  								</c:choose>
                              </div>
  						        <span class="qna-date">
  						            <fmt:formatDate pattern="yyyy. M. dd" value="${qnaDto.qna_date}"/>
  						        </span>
                          </div>
  	                    </td>
  	                    <td class="status-cell">
  	                       <c:choose>
  							    <c:when test="${qnaDto.is_answered}">
  							        <span class="status answered">답변 완료</span>
  							    </c:when>
  							    <c:otherwise>
  							        <span class="status pending">답변 대기</span>
  							    </c:otherwise>
  							</c:choose>
  	                    </td>
  	                </tr>
              </c:forEach>
             </c:otherwise>
            </c:choose>
          </tbody>
      </table>
    </div>
    <div class="paging">
      <c:if test="${totalCnt != null && totalCnt != 0}">
        <c:if test="${ph.showPrev}">
          <a class="page" href="<c:url value='/qna/list${ph.sc.getQueryString(ph.beginPage-1)}'/>">&lt;</a>
        </c:if>

        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
          <a class="page ${i==ph.sc.page ? 'paging-active' : ''}"
             href="<c:url value='/qna/list${ph.sc.getQueryString(i)}'/>">${i}</a>
        </c:forEach>

        <c:if test="${ph.showNext}">
          <a class="page" href="<c:url value='/qna/list${ph.sc.getQueryString(ph.endPage+1)}'/>">&gt;</a>
        </c:if>
      </c:if>
    </div>
</div>

<!-- 글쓰기 버튼 -->
<button type="button" class="writebtn" id="writeBtn" onclick="location.href='<c:url value="/qna/qwrite"/>'">+</button>
<script>
  let msg = "${msg}";
  if(msg=="QWRT_OK") alert("문의가 성공적으로 등록되었습니다.");
  if(msg=="DEL_OK") alert("문의가 성공적으로 삭제되었습니다.");
</script>
</body>
</html>