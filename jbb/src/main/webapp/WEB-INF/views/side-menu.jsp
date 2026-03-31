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
	.sidemenu{
    	display:flex;
    	flex-direction:column;
    	width:250px;
    	min-height:100vh;
    	background-color:#e3e3e3;
    	padding:18px 14px 24px;
    	margin-left:0;
    	text-align:center;
    	border-right:1px solid #cfcfcf;
    	box-sizing:border-box;
    }

    .hr{
    	border:none;
    	border-top:1px solid #8a8a8a;
    	width:100%;
    	margin:18px 0;
    }

    .sidemenu_name{
    	margin-top:24px;
    	display:flex;
    	flex-direction:column;
    	gap:12px;
    }

    .name1{
    	font-size:18px;
    	font-weight:700;
    	color:#333;
    	margin-top:4px;
    	margin-bottom:2px;
    	letter-spacing:-0.2px;
    }

    .name2{
    	font-size:16px;
    	color:#666;
    	border-radius:8px;
    	transition:all 0.2s ease;
    }

    .name2 a {
    	display:block;
    	width:100%;
    	padding:10px 12px;
    	text-decoration:none;
    	color:inherit;
    	border-radius:8px;
    	box-sizing:border-box;
    }

    .name2:hover{
    	background-color:#f5f5f5;
    	color:#222;
    }

    .name2.active{
    	background-color:#fff3e6;
    }

    .name2.active a {
    	color:#FF8C00;
    	font-weight:700;
    }

    .title-left {
    	display:flex;
    	align-items:center;
    	justify-content:flex-start;
    	gap:10px;
    	padding-left:4px;
    }

    .home-icon {
    	width:28px;
    	height:28px;
    	cursor:pointer;
    	filter:brightness(0) saturate(100%) invert(28%) sepia(0%) saturate(0%) hue-rotate(173deg) brightness(94%) contrast(90%);
    	margin-left:8px;
    	margin-top:6px;
    	transition:transform 0.2s ease, opacity 0.2s ease;
    }

    .home-icon:hover{
    	transform:scale(1.08);
    	opacity:0.85;
    }

    /* timeout.jsp 내부에 있거나 외부 스타일에 추가 */
    .session-wrapper {
    	position:static !important;
    	float:none !important;
    	margin:0 auto 8px !important;
    	width:100%;
    }

    #session-container {
    	background-color:#f8f8f8 !important;
    	border:1px solid #d5d5d5 !important;
    	border-radius:10px !important;
    	padding:10px 12px !important;
    	font-size:13px !important;
    	color:#333 !important;
    	display:flex !important;
    	align-items:center !important;
    	justify-content:center !important;
    	gap:8px !important;
    	box-sizing:border-box !important;
    }

    #extend-session-btn {
    	background-color:#FF8C00 !important;
    	color:white !important;
    	border:none !important;
    	padding:6px 10px !important;
    	border-radius:6px !important;
    	cursor:pointer !important;
    	display:none;
    	font-size:12px !important;
    	font-weight:700 !important;
    }

    #extend-session-btn:hover{
    	background-color:#e67e00 !important;
    }
</style>
</head>
<body>
<div class="sidemenu">
    <%@ include file="/WEB-INF/views/timeout.jsp" %>
	<div class="title-left">
		<img id="home-icon" class="home-icon" src="${data_path}/img/home.png" alt="홈">
	</div>
	<div class="sidemenu_name">
		<span class="name1">회원관리</span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/userlist">사용자</a></span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/qnalist">문의내역</a></span>
		<hr class="hr">
		<span class="name1">콘텐츠관리</span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/admin_boardlist">게시판</a></span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/notifylist">공지사항</a></span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/admin_faqlist">FAQ</a></span>
		<hr class="hr">
		<span class="name1">인사이트 분석</span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/user-stats">일,주,월별 가입자수</a></span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/user-activity">사용자 활동빈도</a></span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/user-board-category">게시판 사용량 분석</a></span>
		<span class="name2" onclick="setActive(this)"><a href="${path}/admin/dailyPostStats">일별 게시글 작성 수</a></span>
		<hr class="hr">
		<span class="name2"><a href="${path}/adminlogout">로그아웃</a></span>
	</div>
</div>
	<script>
		$(document).ready(function () {
	        let currentPath = window.location.pathname; // 현재 페이지의 URL 경로

	        $(".name2 a").each(function () {
	            let menuPath = $(this).attr("href"); // 각 메뉴의 href 값

	            if (currentPath.includes(menuPath)) { // 현재 페이지가 해당 메뉴 경로를 포함하면
	                $(this).parent().addClass("active"); // 부모 요소에 active 클래스 추가
	            }
	        });

	        $(".name2").click(function () {
	            $(".name2").removeClass("active"); // 모든 항목에서 active 제거
	            $(this).addClass("active"); // 클릭한 항목에 active 추가
	        });
	    });
	</script>	
	<!-- 홈으로 이동 -->
	<script>
	    document.addEventListener("DOMContentLoaded", function () {
	        const homeIcon = document.getElementById("home-icon");
	        
	        // 집 아이콘 클릭 시 index.jsp로 이동
	        homeIcon.addEventListener("click", function () {
	            window.location.href = "<c:url value='/' />";
	        });
	    });
	</script>
</body>
</html>