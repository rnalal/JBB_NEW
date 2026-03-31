<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

  .body{
    min-height:100vh;
  }

  .result-box{
    max-width: 760px;
    margin: 24px auto 0;
    padding: 36px 28px;
    border-radius: 24px;
    border: 1px solid var(--line);
    background: linear-gradient(180deg, rgba(255,255,255,.94), rgba(255,247,239,.92));
    box-shadow: var(--shadow);
    display:flex;
    flex-direction:column;
    align-items:center;
    justify-content:center;
    text-align:center;
  }

  .card-top{
    display:flex;
    align-items:flex-start;
    justify-content:space-between;
    gap:16px;
    width:100%;
    margin-bottom: 28px;
    flex-wrap:wrap;
  }

  .card-title-box{
    text-align:left;
  }

  .card-title-box h3{
    font-size: 24px;
    font-weight: 900;
    line-height: 1.2;
  }

  .card-title-box p{
    margin-top: 8px;
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

  .result-message{
    width:100%;
    padding: 28px 24px;
    border-radius: 22px;
    border: 1px solid rgba(17,24,39,.08);
    background: rgba(255,255,255,.88);
    box-shadow: var(--shadow2);
  }

  .result-box p{
    font-size: 28px;
    line-height: 1.6;
    color: var(--text);
  }

  .id-letter{
    font-size: 28px;
    font-weight: 700;
  }

  .id-letter a{
    font-size: 34px;
    font-weight: 900;
    color: var(--brand);
    text-decoration: underline;
    text-underline-offset: 6px;
  }

  .inquiry{
    font-weight: 800;
  }

  a.bottom{
    display: inline-flex;
    align-items:center;
    justify-content:center;
    text-decoration: none;
    width: 100%;
    min-height: 62px;
    padding: 16px 20px;
    margin-top: 22px;
    font-size: 18px;
    font-weight: 900;
    color: #fff;
    background: linear-gradient(135deg, var(--brand), var(--brand2));
    border: none;
    border-radius: 18px;
    cursor: pointer;
    box-shadow: 0 14px 24px rgba(255,140,0,.22);
    transition: transform .15s ease, box-shadow .15s ease;
  }

  a.bottom:hover{
    transform: translateY(-2px);
    box-shadow: 0 18px 30px rgba(255,140,0,.28);
  }

  @media (max-width: 720px){
    .result-box{
      max-width: 94%;
      margin: 14px auto 0;
      padding: 18px 14px;
      border-radius: 18px;
    }

    .card-top{
      gap: 10px;
      margin-bottom: 16px;
    }

    .card-title-box h3{
      font-size: 18px;
      line-height: 1.3;
    }

    .card-title-box p{
      font-size: 12px;
      line-height: 1.45;
    }

    .hero-pill{
      padding: 7px 10px;
      font-size: 11px;
    }

    .result-message{
      padding: 20px 14px;
      border-radius: 16px;
    }

    .result-box p,
    .id-letter{
      font-size: 19px;
      line-height: 1.5;
    }

    .id-letter a{
      font-size: 24px;
      text-underline-offset: 4px;
    }

    a.bottom{
      min-height: 48px;
      padding: 12px 14px;
      margin-top: 14px;
      font-size: 15px;
      border-radius: 14px;
    }
  }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>
<div class="body">
    <div class="result-box">
      <div class="card-top">
        <div class="card-title-box">
          <h3>조회 결과를 확인해주세요</h3>
        </div>
        <div class="hero-pill">📄 아이디 조회 결과</div>
      </div>

      <div class="result-message">
        <c:choose>
          <c:when test="${empty findId}">
            <p class="inquiry">조회결과가 없습니다.</p>
            <a href="<c:url value='/user/join'/>" class="bottom">회원가입</a>
          </c:when>
          <c:otherwise>
            <p class="id-letter">회원님의 아이디는 <a>${findId.id}</a> 입니다.</p>
            <a href="<c:url value='/user/login'/>" class="bottom">로그인</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</div>

</body>
</html>