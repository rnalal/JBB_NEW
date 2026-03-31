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

	*{
    	box-sizing: border-box;
    }

    body {
        min-width: 1080px;
    }
	
	.content-container {
		display:flex;
        align-items: stretch;
        gap:20px;
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

    .qna-table-container{
    	flex-grow: 1;
        margin: 24px;
        padding: 28px 32px 34px;
        background-color: #fff;
        border-radius: 14px;
    }
	
	.qna-title{
    	width:100%;
    	display:flex;
    	align-items:center;
    	justify-content:space-between;
    	gap:20px;
    	padding-bottom:16px;
    	border-bottom:2px solid #efefef;
    }
	
	.name{
    	font-size:26px;
    	font-weight:bold;
    	color:#444;
    }
	
	.name_answer{
    	font-size:24px;
    	font-weight:bold;
    	color:#FF8C00;
    }
	
	.qnadetail{
    	width:100%;
    	display:flex;
    	align-items:stretch;
    	gap:0;
    	font-size:18px;
    	color:#5a5a5a;
    	margin-top:28px;
    }
	
	.question-details{
    	width:50%;
        display:flex;
        flex-direction:column;
        gap:16px;
        padding:0 36px 0 0;
    }

    .question-details > div{
    	display:flex;
    	align-items:flex-start;
    	width:100%;
    	padding:18px 20px;
    	border:1px solid #e7e7e7;
    	border-radius:10px;
    	background-color:#fafafa;
    }
	
	.info-name{
    	display:inline-block;
    	width:110px;
    	flex-shrink:0;
    	font-size:16px;
    	font-weight:700;
    	color:#444;
    	padding-top:8px;
    }
	
	.info{
    	display:block;
    	width:100%;
    	margin-left:20px;
    	padding:8px 0 8px 16px;
    	border-left:1px solid #d5d5d5;
    	font-size:16px;
    	color:#222;
    	line-height:1.6;
    	text-decoration:none;
    	white-space:pre-wrap;
    	word-break:break-word;
    }

	.vertical-line{
    	width:1px;
    	background-color:#dcdcdc;
    	border:none;
    	margin:0 6px;
    	flex-shrink:0;
    	align-self:stretch;
    }

    .answer-form{
    	width:50%;
    	display:flex;
    	flex-direction:column;
    	padding:0 0 0 36px;
    }

    .answer-form form{
    	display:flex;
    	flex-direction:column;
    	height:100%;
    	flex:1;
    }
	
	.answer-form textarea {
    	width:100%;
    	flex:1;
    	min-height:0;
    	padding:16px;
    	border:1px solid #d7d7d7;
    	border-radius:10px;
    	font-size:16px;
    	color:#333;
    	background-color:#fcfcfc;
    	resize:none;
    	outline:none;
    	line-height:1.6;
    }

    .answer-form textarea:focus{
    	border-color:#FF8C00;
    	background-color:#fff;
    	box-shadow:0 0 0 3px rgba(255,140,0,0.10);
    }

    .answer-form textarea::placeholder{
    	color:#b7b7b7;
    }
	
	.answer-form button {
    	width:100%;
    	height:48px;
    	padding:10px;
    	background-color:#FF8C00;
    	color:white;
    	border:none;
    	border-radius:8px;
    	cursor:pointer;
    	margin-top:12px;
    	font-size:16px;
    	font-weight:bold;
    	transition:background-color 0.2s ease;
    }

    .answer-form button:hover {
    	background-color:#e67e00;
    }
	
	.delBtn {
    	width:100%;
    	height:46px;
    	padding:10px;
    	background-color:white;
    	color:#FF8C00;
    	border:2px solid #FF8C00;
    	border-radius:8px;
    	cursor:pointer;
    	margin-top:4px;
    	font-size:16px;
    	font-weight:bold;
    	transition:all 0.2s ease;
    }

    .delBtn:hover{
    	background-color:#FF8C00;
    	color:white;
    }
	
	.answer-section {
    	width:350px;
    	padding:16px;
    	border:1px solid #ddd;
    	border-radius:10px;
    	background-color:#f9f9f9;
    }
	
	.answer-section h3 {
    	margin-top:0;
    	font-size:20px;
    	font-weight:bold;
    	color:#FF8C00;
    }

    .answer-section p {
    	font-size:16px;
    	line-height:1.6;
    }

    .answer-details{
       width:50%;
       padding:0 0 0 28px;
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
	<div class="qna-table-container">
		<c:if test="${not empty qnaDto}">
			<div class="qna-title">
			    <span class="name">${qnaDto.question_id} 번 문의내용</span>
			    <label for="a_content" class="name_answer">답변</label>
		    </div>
		    <div class="qnadetail">
			    <div class="question-details answer-details">
					<div><span class="info-name">번호</span><a class="info">${qnaDto.question_id}</a></div>
					<div><span class="info-name">문의내용</span><a class="info">${qnaDto.q_content}</a></div>
					<div><span class="info-name">작성자</span><a class="info">${qnaDto.question_writer}</a></div>
					<div><span class="info-name">작성일</span><a class="info"><fmt:formatDate pattern = "yyyy.MM.dd" value="${qnaDto.question_date}"/></a></div>
					<form action="<c:url value='/admin/qnadelete?page=${param.page}&pageSize=${param.pageSize}'/>" method="post">
				        <input type="hidden" name="qno" value="${qnaDto.question_id}">
				        <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="delBtn">질문 삭제</button>
				    </form>
				</div>
				<hr class="vertical-line">
				<!-- 답변 입력 폼 -->
				<c:if test="${empty qnaDto.a_content}">
					<div class="answer-form">
						<form action="${path}/admin/qnaAnswer" method="post">
							<input type="hidden" name="parent_id" value="${qnaDto.question_id}"> <!-- 질문의 qno를 parent_id로 넘김 -->
							<input type="hidden" name="writer" value="관리자">														
							<textarea id="a_content" name="a_content" rows="4" cols="50" required placeholder="답변을 입력해주세요"></textarea>							
							<button type="submit">답변등록</button>
						</form>
					</div>
				</c:if>
				<!-- 답변이 있으면 표시 -->
				<c:if test="${not empty qnaDto.a_content}">
					<div class="question-details">
						<div><span class="info-name">번호</span><a class="info">${qnaDto.answer_id}</a></div>
						<div><span class="info-name">답변내용</span><a class="info">${qnaDto.a_content}</a></div>
						<div><span class="info-name">작성자</span><a class="info">${qnaDto.answer_writer}</a></div>
						<div><span class="info-name">작성일</span><a class="info"><fmt:formatDate pattern = "yyyy.MM.dd" value="${qnaDto.answer_date}"/></a></div>
						<form action="<c:url value='/admin/answerdelete'/>" method="post">
					        <input type="hidden" name="parent_id" value="${qnaDto.parent_id}">
					        <input type="hidden" name="qno" value="${qnaDto.question_id}">
					        <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="delBtn">답변 삭제</button>
					    </form>
					</div>
				</c:if>
			</div>
		</c:if>
	</div>
<script>
	let msg = "${msg}";
	if(msg=="ANSWER_OK") alert("답변이 등록되었습니다.");
	if(msg=="ANSWER_ERR") alert("답변등록에 실패했습니다. 다시 시도해주세요.");
	if(msg=="QNADEL_ERR") alert("문의삭제에 실패했습니다. 다시 시도해주세요.");
	if(msg=="ANWDEL_OK") alert("답변 삭제에 성공했습니다.");
	if(msg=="ANWDEL_ERR") alert("답변 삭제에 실패했습니다. 다시 시도해주세요.");
</script>
</div>
</body>
</html>