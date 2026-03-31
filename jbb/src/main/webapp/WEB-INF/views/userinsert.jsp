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
<title>JBB</title>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style>
	html, body {
	    height: 100%;
	    margin: 0;
	    padding: 0;
	}

	body {
    	min-width: 1080px;
    }

	.content-container {
		display:flex;
		align-items:flex-start;
		gap:20px;
		align-items: stretch;
		min-height: 100vh;
	}

	.menu-container {
		flex-shrink: 0;
		width: 250px;
	}

	.top-bar{
		display:flex;
		align-items: center;
		justify-content: space-between;
		background-color:#5a5a5a;
		height:70px;
		margin-top: 0;
		padding: 0 20px;
	}

	.main-title{
		font-size:30px;
		font-weight:bold;
		color:#FF8C00;
		margin-right:10px;
		margin-left:10px;
	}

	.side-title{
		font-size:20px;
		font-weight:bold;
		color:#ddd;
	}

	.detail-container{
		flex-grow:1;
		text-align:left;
		margin-top:50px;
		margin-left:150px;
	}

	.userinsert{
		width: 760px;
        display: flex;
        flex-direction: column;
        gap: 18px;
        margin-top: 30px;
        padding: 28px 32px;
        background-color: #ffffff;
        border-radius: 14px;
	}

	.info-title{
		font-size: 25px;
        font-weight: bold;
        color: #333;
        display: inline-block;
        margin-bottom: 10px;
	}

	.signupbtn{
		width: 110px;
        height: 44px;
        font-size: 16px;
        font-weight: bold;
        color: #FF8C00;
        background-color: white;
        border: 2px solid #FF8C00;
        border-radius: 8px;
        margin-left: 20px;
        cursor: pointer;
        transition: all 0.2s ease;
	}

	.signupbtn:hover{
    	background-color: #FF8C00;
    	color: white;
    }

    .input-group{
    	display: flex;
    	align-items: center;
    	padding: 16px 18px;
    	background-color: #fafafa;
    	border: 1px solid #e2e2e2;
    	border-radius: 10px;
    }

	label {
    	font-size: 17px;
    	font-weight: 700;
    	color: #444;
    	display: inline-block;
    	min-width: 150px;
    }

	.input-group input{
    	width: 100%;
    	height: 42px;
    	border: 1px solid #d6d6d6;
    	border-radius: 8px;
    	background-color: #fff;
    	padding: 0 14px;
    	font-size: 15px;
    	color: #222;
    	outline: none;
    }

    .input-group input:focus{
    	border-color: #FF8C00;
    	box-shadow: 0 0 0 3px rgba(255,140,0,0.12);
    }

    .error_msg{
    	padding-left: 168px;
    	margin-top: -8px;
    	font-size: 14px;
    	font-weight: 500;
    }
</style>
</head>
<body>
<div class="top-bar">
	<div class="title">
		<span class="main-title">JBB</span>
		<span class="side-title">for admin only</span>
	</div>
</div>
<div class="content-container">
	<%@ include file="side-menu.jsp" %>
	<div class="detail-container">
	<form action="<c:url value='/admin/userinsert'/>" method="post" onsubmit="return validateForm()">
	   <span class="info-title">사용자 등록</span>
	   <button type="submit" class="signupbtn">등록하기</button>
	   <div class="userinsert">
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
		</div>
	</form>
	</div>
<!-- msg -->
<script>
	let msg = "${msg}";
	if(msg=="INSERT_ERR") alert("사용자등록에 실패했습니다. 다시 시도해주세요.")
</script>
<!-- 아이디 중복확인 Ajax -->
<script>
function checkId(){

		let id = $("#id").val();

		if(id=='' || id.length == 0){
			result = "아이디를 입력해주세요";
			$("#result_checkId").html(result).css("color", "red");
			return false;
		} else if (id.length < 3){
			result = "아이디는 3자리 이상 10자리 이하여야 합니다";
			$("#result_checkId").html(result).css("color", "red");
			return false;
		} else if (id.length > 10){
			result = "아이디는 3자리 이상 10자리 이하여야 합니다";
			$("#result_checkId").html(result).css("color", "red");
			$("#id").val("").trigger("focus");
			return false;
		}

		$.ajax({
			type:'post',
			url:'checkuserId',
			data:{"id":id},
			success: function(data){
				if(data == "N"){
					result = "사용 가능한 아이디입니다";
					$("#result_checkId").html(result).css("color", "green");
				} else {
					 result="이미 사용중인 아이디입니다";
                     $("#result_checkId").html(result).css("color","red");
				}
			},
			error : function(error){alert(error);}
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
		} else if(pwd=="" || pwd.length<4 || pwd.length>10){
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
	}
</script>
</div>
</body>
</html>