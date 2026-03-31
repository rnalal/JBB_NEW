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

    .container{
      max-width: 820px;
      margin: 24px auto 0;
      padding: 32px 28px;
      border-radius: 24px;
      border: 1px solid var(--line);
      background: linear-gradient(180deg, rgba(255,255,255,.94), rgba(255,247,239,.92));
      box-shadow: var(--shadow);
    }

    .card-top{
      display:flex;
      align-items:flex-start;
      justify-content:space-between;
      gap:16px;
      margin-bottom: 24px;
      flex-wrap:wrap;
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

    .notification-list {
      list-style: none;
      margin: 0;
      padding: 0;
      display:flex;
      flex-direction:column;
      gap:14px;
    }

    .notification-item {
      display: flex;
      align-items: flex-start;
      gap:14px;
      padding: 18px;
      border-radius: 20px;
      border: 1px solid rgba(17,24,39,.08);
      background: rgba(255,255,255,.92);
      box-shadow: var(--shadow2);
      transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease, background .15s ease;
    }

    .notification-item:hover{
      transform: translateY(-2px);
      box-shadow: 0 14px 28px rgba(17,24,39,.08);
      border-color: rgba(255,140,0,.22);
    }

    .notification-item.unread {
      background: rgba(255,247,239,.96);
      border: 1px solid rgba(255,140,0,.18);
    }

    .notification-item.read {
      background: rgba(255,255,255,.82);
      color: #9ca3af;
    }

    .notification-icon {
      width: 52px;
      height: 52px;
      flex-shrink:0;
      display:flex;
      align-items:center;
      justify-content:center;
      font-size: 24px;
      border-radius: 16px;
      background: rgba(255,140,0,.10);
      border: 1px solid rgba(255,140,0,.18);
    }

    .notification-content {
      flex: 1;
      min-width:0;
      text-align:left;
    }

    .notification-message {
      display: block;
      margin: 0 0 8px;
      font-size: 17px;
      font-weight: 800;
      text-decoration: none;
      color: inherit;
      line-height: 1.6;
      word-break:break-word;
    }

    .notification-timestamp {
      font-size: 13px;
      color: var(--muted);
      font-weight:700;
    }

    .empty {
      padding: 36px 20px;
      text-align: center;
      color: var(--muted);
      font-size: 18px;
      font-weight: 700;
      border-radius: 20px;
      border: 1px dashed rgba(17,24,39,.12);
      background: rgba(255,255,255,.76);
    }

    @media (max-width: 720px){
      .container{
        padding: 20px 16px;
        border-radius: 20px;
      }

      .card-title-box h3{
        font-size: 21px;
      }

      .notification-item{
        padding: 16px;
      }

      .notification-icon{
        width: 46px;
        height: 46px;
        font-size: 21px;
      }

      .notification-message{
        font-size: 16px;
      }
    }
  </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>
<div class="body">
    <div class="container">
      <div class="card-top">
        <div class="card-title-box">
          <h3>받은 알림을 한눈에 확인해보세요</h3>
          <p>댓글, 좋아요 등 최근에 도착한 알림을 이곳에서 모아볼 수 있어요.</p>
        </div>
        <div class="hero-pill">🔔 알림 모아보기</div>
      </div>

      <c:if test="${empty notifications}">
        <div class="empty">받은 알림이 없습니다.</div>
      </c:if>

      <ul class="notification-list">
        <c:forEach var="n" items="${notifications}">
          <li class="notification-item ${n.read ? 'read' : 'unread'}">
            <span class="notification-icon">
              <c:choose>
                <c:when test="${n.type=='COMMENT'}">&#x1F4AC;</c:when>
                <c:when test="${n.type=='LIKE'}">❤️</c:when>
                <c:otherwise>🔔</c:otherwise>
              </c:choose>
            </span>
            <div class="notification-content">
              <a href="${ctx}${n.url}" class="notification-message">
                ${n.message}
              </a>
              <div class="notification-timestamp">
                <fmt:formatDate value="${n.created_at}" pattern="yyyy.MM.dd HH:mm:ss"/>
              </div>
            </div>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>
</div>
</body>
</html>