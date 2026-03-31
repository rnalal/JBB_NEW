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

  .body{
    min-height:100vh;
  }

  .findid{
    max-width: 760px;
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

  form{
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 14px;
  }

  input[type=text]{
    width: 100%;
    padding: 18px 20px;
    border: 1px solid rgba(17,24,39,.12);
    border-radius: 18px;
    background: rgba(255,255,255,.96);
    color: var(--text);
    font-size: 18px;
    font-weight: 600;
    box-sizing: border-box;
    outline: none;
    transition: border-color .15s ease, box-shadow .15s ease;
  }

  input[type=text]::placeholder{
    color:#9ca3af;
    font-weight:600;
  }

  input[type=text]:focus{
    border-color: rgba(255,140,0,.45);
    box-shadow: 0 0 0 4px rgba(255,140,0,.10);
  }

  .findBtn {
    width: 100%;
    min-height: 62px;
    padding: 16px 20px;
    margin-top: 8px;
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

  .findBtn:hover{
    transform: translateY(-2px);
    box-shadow: 0 18px 30px rgba(255,140,0,.28);
  }

  @media (max-width: 720px){
    .findid{
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
      font-size: 19px;
      line-height: 1.3;
    }

    .card-title-box p{
      margin-top: 6px;
      font-size: 12px;
      line-height: 1.45;
    }

    .hero-pill{
      padding: 7px 10px;
      font-size: 11px;
    }

    form{
      gap: 10px;
    }

    input[type=text]{
      padding: 13px 14px;
      border-radius: 14px;
      font-size: 14px;
    }

    .findBtn{
      min-height: 48px;
      padding: 12px 14px;
      margin-top: 6px;
      font-size: 15px;
      border-radius: 14px;
    }
  }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>
<div class="body">
    <div class="findid">
      <div class="card-top">
        <div class="card-title-box">
          <h3>가입한 아이디를 찾아보세요</h3>
          <p>이름과 전화번호를 입력하면 등록된 아이디를 확인할 수 있어요.</p>
        </div>
        <div class="hero-pill">🔎 회원 정보 확인</div>
      </div>

      <form id="findForm" action="<c:url value='/user/findIdCheck'/>" method="post" onsubmit="return validateForm()">
        <input type="text" name="name" id="name" placeholder="이름">
        <input type="text" name="tel" id="tel" placeholder="전화번호 010-0000-0000">

        <button type="submit" class="findBtn" id="id-find" onclick="findSubmit(); return false;">아이디 찾기</button>
      </form>
    </div>
  </div>
</div>

<!-- 유효성 검사 -->
<script>
	function validateForm(){
		let name = $("#name").val();
		let tel = $("#tel").val();
		
		if(name==""&&tel==""){
			alert("이름과 전화번호을 입력해주세요");
			return false;
		} else if(tel==""){
			alert("전화번호를 입력해주세요");
			return false;
		} else if(name==""){
			alert("이름을 입력해주세요");
			return false;
		}
	}
</script>

</body>
</html>