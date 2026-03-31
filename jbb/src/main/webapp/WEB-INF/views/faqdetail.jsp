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

	body{
	    min-width:1080px;
	}

	*{
	    box-sizing:border-box;
	}

	.content-container {
		display:flex;
		align-items:stretch;
		gap:20px;
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
		flex:1;
		text-align:left;
		margin-top:50px;
		margin-left:150px;
	}

	.detail-header{
		width:760px;
		display:flex;
		align-items:center;
		justify-content:space-between;
		gap:20px;
	}

	.info-title{
		font-size:25px;
		font-weight:bold;
		color:#5a5a5a;
	}

	.name{
		color:#FF8C00;
	}

	.faqdetail{
		width:760px;
		display:flex;
		flex-direction:column;
		gap:16px;
		font-size:18px;
		color:#5a5a5a;
		margin-top:30px;
		padding:28px 30px;
		background-color:#ffffff;
		border-radius:14px;
	}

	.faqdetail > div{
		display:flex;
		align-items:flex-start;
		padding:16px 18px;
		border:1px solid #e7e7e7;
		border-radius:10px;
		background-color:#fafafa;
	}

	.info-name{
		display:inline-block;
		min-width:150px;
		font-size:17px;
		font-weight:bold;
		color:#444;
		padding-top:8px;
		flex-shrink:0;
	}

	.info,
	.info-question,
	.info-answer{
		display:inline-block;
		width:100%;
		margin-left:24px;
		padding:10px 0 10px 18px;
		font-size:16px;
		color:#222;
		line-height:1.7;
		white-space:pre-wrap;
		word-break:break-word;
		text-decoration:none;
		border:none;
		border-left:1px solid #d6d6d6;
		background:none;
	}

	.info-question,
	.info-answer{
		max-height:260px;
		overflow-y:auto;
		padding-right:8px;
	}

	.bottom{
		display:flex;
		gap:12px;
		align-items:center;
	}

	.bottom form{
		margin:0;
	}

	.removeBtn,
	.modifyBtn{
		width:110px;
		height:44px;
		font-size:16px;
		font-weight:bold;
		border-radius:8px;
		cursor:pointer;
		transition:all 0.2s ease;
	}

	.removeBtn{
		color:#FF8C00;
		background-color:white;
		border:2px solid #FF8C00;
	}

	.removeBtn:hover{
		background-color:#FF8C00;
		color:white;
	}

	.modifyBtn{
		background-color:#FF8C00;
		color:white;
		border:none;
	}

	.modifyBtn:hover{
		opacity:0.9;
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
		<div class="detail-header">
			<span class="info-title"><span class="name">${faqDto.fno}</span>번 FAQ</span>

			<div class="bottom">
				<button type="button" id="removeBtn" class="removeBtn">FAQ삭제</button>
				<form action="${path}/admin/faqmodify?page=${param.page}&pageSize=${param.pageSize}" method="get">
					<input type="hidden" name="fno" value="${faqDto.fno}">
					<button type="submit" class="modifyBtn">FAQ수정</button>
				</form>
			</div>
		</div>

		<div class="faqdetail">
			<div>
				<span class="info-name">질문</span>
				<span class="info-question">${faqDto.f_question}</span>
			</div>
			<div>
				<span class="info-name">답변</span>
				<span class="info-answer">${faqDto.f_answer}</span>
			</div>
			<div>
				<span class="info-name">작성일</span>
				<span class="info"><fmt:formatDate pattern="yyyy.MM.dd" value="${faqDto.f_date}"/></span>
			</div>
		</div>
	</div>
</div>

<script>
$('#removeBtn').on("click", function(){
	if(!confirm("정말로 삭제하시겠습니까?")) return;

	$.ajax({
		url:"<c:url value='/admin/faqdelete'/>",
		type:"POST",
		data: {fno: "${faqDto.fno}"},
		success: function(response){
			alert("삭제되었습니다.");
			window.location.href = "<c:url value='/admin/admin_faqlist'/>";
		},
		error: function(xhr, status, error){
			alert("삭제 실패:" + error);
		}
	});
});
</script>
</body>
</html>