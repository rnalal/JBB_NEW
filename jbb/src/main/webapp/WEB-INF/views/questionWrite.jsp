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
    margin: 0 auto !important;
    padding: 0px 16px 56px !important;
  }

  .page-hero{
    margin-top: 0px !important;
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

  form{
    width:100%;
    max-width: none;
    margin: 18px 0 0;
    padding: 28px;
    border-radius: 24px;
    border: 1px solid var(--line);
    background: linear-gradient(180deg, rgba(255,255,255,.94), rgba(255,247,239,.92));
    box-shadow: var(--shadow);
    display:flex;
    flex-direction:column;
    gap: 16px;
  }

  .input-group{
    display:flex;
    width:100%;
    margin-top: 0;
    margin-bottom: 0;
  }

  textarea{
    border: 1px solid rgba(17,24,39,.12);
    width:100%;
    min-height: 360px;
    border-radius: 20px;
    padding: 20px;
    resize: none;
    font-size:17px;
    line-height:1.7;
    overflow: hidden;
    background: rgba(255,255,255,.96);
    color: var(--text);
    outline:none;
    transition: border-color .15s ease, box-shadow .15s ease;
    font-family: inherit;
  }

  textarea:focus{
    border-color: rgba(255,140,0,.45);
    box-shadow: 0 0 0 4px rgba(255,140,0,.10);
  }

  textarea::placeholder{
    font-size: 16px;
    color: #9ca3af;
    font-weight: 600;
  }

  button[type="submit"]{
    width:100%;
    min-height: 62px;
    padding: 16px 20px;
    margin-top: 4px;
    margin-bottom: 0;
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

  button[type="submit"]:hover{
    transform: translateY(-2px);
    box-shadow: 0 18px 30px rgba(255,140,0,.28);
  }

  @media (max-width: 720px){
    .container{
      padding: 0px 12px 40px !important;
    }

    .page-hero{
        margin-top: 0 !important;
    }

    .hero-title{
      font-size: 20px;
    }

    form{
      margin-top: 14px;
      padding: 18px 16px;
      border-radius: 20px;
    }

    textarea{
      min-height: 300px;
      font-size:16px;
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
        <div class="hero-title">궁금한 점이나 불편한 점을 남겨주세요</div>
        <div class="hero-desc">문의 내용을 자세히 작성해주시면 확인 후 답변을 등록해드려요.</div>
      </div>
      <div class="hero-pill">✍️ 문의 작성하기</div>
    </div>

	<form action="<c:url value='/qna/qwrite'/>" method="post" id="form" onsubmit="return validateForm()">
		<input type="hidden" name="qno" value="${qnaDto.qno}">
		<div class="input-group">
			<textarea name="q_content" id="q_content" rows="1" placeholder="문의사항을 입력하세요"></textarea>
		</div>
		<button type="submit">등록</button>
	</form>
</div>

<!-- 유효성 검사 -->
<script>
	function validateForm() {
	    let q_content = $("#q_content").val().trim(); // 공백 제거
	
	    if (q_content === "") {
	        alert("질문을 입력해주세요.");
	        return false;
	    }
	    return true;
	}
</script>
<script>
  let msg = "${msg}";
  if(msg=="QWRT_ERR") alert("문의를 등록하지 못했습니다. 다시 시도해 주세요.");
</script>
</body>
</html>