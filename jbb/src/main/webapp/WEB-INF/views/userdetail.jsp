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

	.userdetail{
    	width: 760px;
    	display:flex;
    	flex-direction: column;
    	gap:16px;
    	font-size:18px;
    	color:#5a5a5a;
    	margin-top:30px;
    	padding:28px 30px;
    	background-color:#ffffff;
    	border-radius:14px;
    }

    .userdetail > div{
    	display:flex;
    	align-items:center;
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
    }

	.info{
    	display:inline-block;
    	text-decoration:none;
    	width:100%;
    	margin-left:24px;
    	padding:10px 0 10px 18px;
    	border-bottom:none;
    	border-left:1px solid #d6d6d6;
    	font-size:16px;
    	color:#222;
    	word-break:break-all;
    }

	.info-title{
    	font-size:25px;
    	font-weight:bold;
    	color:#5a5a5a;
    }

	.removeBtn {
    	width:110px;
    	height:44px;
    	font-size:16px;
    	font-weight:bold;
    	color:#FF8C00;
    	background-color:white;
    	border:2px solid #FF8C00;
    	border-radius:8px;
    	margin-left:20px;
    	cursor:pointer;
    	transition:all 0.2s ease;
    }

    .removeBtn:hover{
    	background-color:#FF8C00;
    	color:white;
    }

	.name{
    	color:#FF8C00;
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
	<span class="info-title"><a class="name">${userDto.name}</a> 님의 정보</span>
	<button type="button" id="removeBtn" class="removeBtn">회원삭제</button>
		<div class="userdetail">
			<div><span class="info-name">아이디</span><a class="info">${userDto.id}</a></div>
			<div><span class="info-name">비밀번호</span><a class="info">${userDto.pwd}</a></div>
			<div><span class="info-name">이름</span><a class="info">${userDto.name}</a></div>
			<div><span class="info-name">전화번호</span><a class="info">${userDto.tel}</a></div>
			<div><span class="info-name">이메일</span><a class="info">${userDto.email}</a></div>
			<div><span class="info-name">가입일</span><a class="info"><fmt:formatDate pattern = "yyyy.MM.dd" value="${userDto.reg_date}"/></a></div>
		</div>
	</div>
</div>
<script>
//삭제버튼
$('#removeBtn').on("click", function(){
	if(!confirm("정말로 삭제하시겠습니까?")) return;

	$.ajax({
		url:"<c:url value='/admin/userdelete'/>",
		type:"POST",
		data: {id: "${userDto.id}"},
		success: function(response){
			alert("삭제되었습니다.");
			window.location.href = "<c:url value='/admin/userlist'/>"; //삭제 후 리스트 페이지로 이동
		},
		error: function(xhr, status, error){
			alert("삭제 실패:" + error);
		}
	});
});
</script>
<script>
	let msg = "${msg}";
	if(msg=="DEL_ERR") alert("삭제에 실패했습니다.");
</script>
</body>
</html>