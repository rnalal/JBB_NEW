<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

  form{
    width: 100%;
    max-width: 900px;
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .container label{
    font-size: 16px;
    font-weight: 800;
    color: var(--text);
    width: 120px;
    text-align: left;
    margin: 0;
    margin-right: 16px;
    flex-shrink: 0;
  }

  .input-group{
    display: flex;
    align-items: center;
    justify-content: flex-start;
    gap: 16px;
    width: 100%;
    margin-top: 8px;
    margin-bottom: 0;
  }

  .error_msg{
    min-height: 18px;
    font-size:14px;
    color:red;
    margin-top: -4px;
    text-align: center;
    padding-right: 4px;
  }

  input[type=text], input[type=password]{
    flex: 1;
    width: calc(100% - 120px - 16px);
    padding: 18px 20px;
    border: 1px solid rgba(17,24,39,.12);
    border-radius: 18px;
    font-size: 17px;
    font-weight: 600;
    box-sizing: border-box;
    background: rgba(255,255,255,.96);
    color: var(--text);
    outline: none;
    transition: border-color .15s ease, box-shadow .15s ease;
  }

  input[type=text]::placeholder,
  input[type=password]::placeholder{
    color:#9ca3af;
    font-weight:600;
  }

  input[type=text]:focus,
  input[type=password]:focus{
    border-color: rgba(255,140,0,.45);
    box-shadow: 0 0 0 4px rgba(255,140,0,.10);
  }

  .signupBtn{
    width: 100%;
    min-height: 62px;
    padding: 16px 20px;
    margin-top: 18px;
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

  .signupBtn:hover{
    transform: translateY(-2px);
    box-shadow: 0 18px 30px rgba(255,140,0,.28);
  }

  @media (max-width: 720px){
    .container{
      max-width: 94%;
      margin: 14px auto 0;
      padding: 16px 12px;
      border-radius: 16px;
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
        margin-top: 6px;
        font-size: 12px;
        line-height: 1.45;
    }

    .hero-pill{
        padding: 7px 10px;
        font-size: 11px;
    }

    form{
        gap: 8px;
    }

    .input-group{
      flex-direction: column;
      align-items: stretch;
      gap: 6px;
      margin-top: 4px;
    }

    .container label{
      width: 100%;
      font-size: 13px;
      margin-right: 0;
    }

    input[type=text], input[type=password]{
      width: 100%;
      padding: 12px 14px;
      border-radius: 14px;
      font-size: 14px;
    }

    .error_msg{
      min-height: 16px;
      font-size: 12px;
      margin-top: -2px;
      text-align: left;
      padding-left: 2px;
      padding-right: 0;
    }

    .signupBtn{
      min-height: 50px;
      padding: 12px 16px;
      margin-top: 10px;
      font-size: 15px;
      border-radius: 14px;
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
          <h3>JBB 회원가입을 시작해보세요</h3>
          <p>기본 정보를 입력하고 아이디 중복 여부를 확인한 뒤 바로 가입할 수 있어요.</p>
        </div>
        <div class="hero-pill">🧡 새로운 회원 가입</div>
      </div>

	  <form action="<c:url value='/user/join'/>" method="post" onsubmit="return validateForm()">
	   <div class="input-group">
	    	<label>아이디</label>
	    	<input type="text" id="id" name="id" oninput = "checkId()" placeholder="아이디를 입력하세요" >
	    </div>
	    <div class="error_msg"><span id="result_checkId"></span></div>

	    <div class="input-group">
	    	<label>비밀번호</label>
	   	 	<input type="password" id="pwd" name="pwd" oninput="pwCheck()" placeholder="비밀번호를 입력해주세요">
	   	</div>
	    <div class="error_msg"><span id="result_checkpass"></span></div>

	    <div class="input-group">
	      <label>비밀번호확인</label>
	      <input type="password" id="pwd2" name="pwd2" onkeyup = "passwordCheck()" placeholder="비밀번호를 다시 입력해주세요">
	    </div>
	    <div class="error_msg"><span id="passMsg"></span></div>

	    <div class="input-group">
	      <label>이름</label>
	      <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
	    </div>

	    <div class="input-group">
	      <label>이메일</label>
    	  <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요">
    	</div>

    	<div class="input-group">
    	  <label>전화번호</label>
    	  <input type="text" id="tel" name="tel" placeholder="000-0000-0000">
		</div>

    	<button type="submit" class="signupBtn">회원가입</button>
	  </form>
    </div>
  </div>
</div>

<!-- 에러 msg -->
<script>
	let msg = "${msg}";
	if(msg=="JOIN_ERR") alert("회원가입에 실패했습니다. 다시 시도해주세요.")
</script>
<!-- 중복 아이디 체크 여부 변수 -->
<script>
	let isIdValid = false;
</script>
<!-- 아이디 중복확인 Ajax -->
<script>
function checkId(){
		let id = $("#id").val();
		
		if(id=='' || id.length == 0){
			result = "아이디를 입력해주세요";
			$("#result_checkId").html(result).css("color", "red");
			isIdValid = false;
			return;
		} else if (id.length < 3){
			result = "아이디는 3자리 이상 10자리 이하여야 합니다";
			$("#result_checkId").html(result).css("color", "red");
			isIdValid = false;
			return;
		} else if (id.length > 10){
			result = "아이디는 3자리 이상 10자리 이하여야 합니다";
			$("#result_checkId").html(result).css("color", "red");
			$("#id").val("").trigger("focus");
			isIdValid = false;
			return;
		}
		
		$.ajax({
			type:'post',
			url:'checkid',
			data:{"id":id},
			success: function(data){
				if(data == "N"){
					result = "사용 가능한 아이디입니다";
					$("#result_checkId").html(result).css("color", "green");
					isIdValid = true;
				} else {
					 result="이미 사용중인 아이디입니다";
                     $("#result_checkId").html(result).css("color","red");
                     isIdValid = false;
				}
			},
			error : function(error){alert(error);
				isValid = false;
			}
		});
};
</script>

<!-- pwd, pwd2 일치 확인 -->
<script>
function passwordCheck(){
	let pwd = $("#pwd").val();
	let pwd2 = $("#pwd2").val();
	
	if (pwd != pwd2){
		res = "비밀번호가 일치하지 않습니다";
		$("#passMsg").html(res).css("color", "red");
		return false;
	} else {
		res = "비밀번호가 일치합니다";
		$("#passMsg").html(res).css("color", "green");
		return true;
	}
}
</script>

<!-- 비밀번호 길이 제한 -->
<script>
	function pwCheck(){
		let pwd = $("#pwd").val();
		
		if(pwd.length < 4 ){
			res = "비밀번호는 4자리 이상 10자리 이하여야 합니다"
			$("#result_checkpass").html(res).css("color", "red");
			return false;
		} else if(pwd.length > 10){
			res = "비밀번호는 4자리 이상 10자리 이하여야 합니다";
			$("#result_checkpass").html(res).css("color", "red");
			$("#pwd").val("").trigger("focus");
			return false;
		}
		else {
			res = "사용가능한 비밀번호입니다";
			$("#result_checkpass").html(res).css("color", "green");
		}
	}
</script>

<!-- 유효성 검사 -->
<script>
	function validateForm(){
		let id = $("#id").val();
		let pwd = $("#pwd").val();
		let pwd2 = $("#pwd2").val();
		let name = $("#name").val();
		let email = $("#email").val();
		let tel = $("#tel").val();
		
		if(id=="" || id.length<3 || id.length>10){
			alert("아이디를 다시 확인해주세요");
			return false;
		}
		
		if(!isIdValid){
			alert("이미 사용중인 아이디입니다. 다른 아이디를 입력해주세요.");
			return false;
		}
		
		if(pwd=="" || pwd.length<4 || pwd.length>10){
			alert("비밀번호를 다시 확인해주세요");
			return false;
		} else if(pwd2=="" || pwd!=pwd2 ){
			alert("비밀번호 확인란을 다시 확인해주세요");
			return false;
		} else if(name==""){
			alert("이름을 입력해주세요");
			return false;
		} else if(email==""){
			alert("이메일을 입력해주세요");
			return false;
		} else if(tel==""){
			alert("전화번호를 입력해주세요");
			return false;
		}
		return true;
	}
</script>

</body>
</html>