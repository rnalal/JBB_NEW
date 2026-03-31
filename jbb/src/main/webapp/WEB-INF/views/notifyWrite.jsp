<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
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

	body{
	    min-width:1080px;
	}

	*{
	    box-sizing:border-box;
	}

	.content-container {
		display:flex;
		gap:20px;
		align-items:stretch;
		min-height:100vh;
	}

	.menu-container {
		flex-shrink:0;
		width:250px;
	}

	.top-bar{
		display:flex;
		align-items:center;
		justify-content:space-between;
		background-color:#5a5a5a;
		height:70px;
		padding:0 20px;
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

	.write-header{
		width:760px;
		display:flex;
		align-items:center;
		justify-content:flex-start;
		gap:12px;
	}

	.info-title{
		font-size:25px;
		font-weight:bold;
		color:#333;
		display:inline-block;
		margin-bottom:10px;
	}

	.submit{
		width:110px;
		height:44px;
		font-size:16px;
		font-weight:bold;
		color:#FF8C00;
		background-color:white;
		border:2px solid #FF8C00;
		border-radius:8px;
		cursor:pointer;
		transition:all 0.2s ease;
	}

	.submit:hover{
		background-color:#FF8C00;
		color:white;
	}

	.notifywrite{
		width:760px;
		display:flex;
		flex-direction:column;
		gap:18px;
		margin-top:30px;
		padding:28px 32px;
		background-color:#ffffff;
		border-radius:14px;
	}

	.input-group{
		display:flex;
		align-items:flex-start;
		padding:16px 18px;
		background-color:#fafafa;
		border:1px solid #e2e2e2;
		border-radius:10px;
	}

	label{
		font-size:17px;
		font-weight:700;
		color:#444;
		display:inline-block;
		min-width:150px;
		padding-top:10px;
	}

	.input-group input,
	.input-group textarea{
		width:100%;
		border:1px solid #d6d6d6;
		border-radius:8px;
		background-color:#fff;
		font-size:15px;
		color:#222;
		outline:none;
	}

	.input-group input{
		height:42px;
		padding:0 14px;
	}

	.input-group textarea{
		min-height:260px;
		padding:14px;
		line-height:1.7;
		resize:none;
	}

	.input-group input:focus,
	.input-group textarea:focus{
		border-color:#FF8C00;
		box-shadow:0 0 0 3px rgba(255,140,0,0.12);
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
		<div class="write-header">
			<span class="info-title">공지사항 작성</span>
			<button type="submit" class="submit" form="form">등록하기</button>
		</div>

		<form action="<c:url value='/admin/notifywrite'/>" method="post" id="form" onsubmit="return validateForm()">
			<input type="hidden" name="nno" value="${notifyDto.nno}">

			<div class="notifywrite">
				<div class="input-group">
					<label for="ntitle">제목</label>
					<input type="text" name="ntitle" id="ntitle" placeholder="제목을 입력하세요">
				</div>

				<div class="input-group">
					<label for="ncontent">내용</label>
					<textarea name="ncontent" id="ncontent" rows="1" placeholder="자유롭게 내용을 입력하세요"></textarea>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	function validateForm(){
		let ntitle = $("#ntitle").val();
		let ncontent = $("#ncontent").val();

		if(ntitle=="" && ncontent==""){
			alert("게시글 제목과 내용을 입력해주세요");
			return false;
		} else if(ntitle==""){
			alert("게시글 제목을 입력해주세요");
			return false;
		} else if(ncontent==""){
			alert("게시글 내용을 입력해주세요");
			return false;
		}
	}
</script>

<script>
	let msg = "${msg}";
	if(msg=="WRT_ERR") alert("공지사항 등록을 실패했습니다.");
</script>
</body>
</html>