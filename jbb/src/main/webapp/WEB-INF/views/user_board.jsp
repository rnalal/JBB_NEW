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
    	min-height:70px;
    	margin-top: 0;
    	padding: 0 20px;
    	gap: 16px;
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

    .user-table-container{
    	flex-grow:1;
    	margin-right:20px;
    	margin-top:20px;
    	min-width:0;
    }

    .user-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        table-layout: fixed;
    }

    .user-table th, .user-table td {
        border: 1px solid #ddd;
        padding: 16px 12px;
        text-align: center;
        font-size:16px;
        color: #5a5a5a;
        border-left: none;
    	border-right: none;
        word-break: break-word;
        vertical-align: middle;
    }

    .user-table th {
        background-color: #E2E2E2;
        color: gray;
        border-bottom: 2px solid #5a5a5a;
        font-weight:bold;
    }

    .th1, .td1{
    	width: 110px;
    }

    .th2, .td2{
    	width: 140px;
    }

    .th3, .td3{
    	width: auto;
    }

    .th4, .td4{
    	width: 160px;
    }

    .search-container {
    	width: 500px;
    	height: 40px;
    	border: none;
    	display: flex;
    	align-items: center;
    	margin-right:20px;
    	flex-shrink: 0;
    }

    .search-form {
    	height: 45px;
    	display: flex;
    	align-items:center;
    	gap:6px;
    	width:100%;
    }

    .search-option {
    	width: 140px;
    	height: 40px;
    	outline: none;
    	border: 1px solid #ccc;
    	color: gray;
    	font-size: 16px;
    	background-color:#fff;
    }

    .search-option > option {
    	text-align: center;
    }

    .search-input {
    	color: gray;
    	background-color: #E0E0E0;
    	border: none;
    	height: 40px;
    	width: 220px;
    	font-size: 16px;
    	padding: 0 10px;
    	min-width:0;
    }

    .search-input::placeholder {
    	color:#B3B3B3;
    }

    .search-button {
    	border:none;
    	min-width:72px;
    	height:40px;
    	background-color:#FF8C00;
    	color:white;
    	display:flex;
    	align-items:center;
    	justify-content:center;
    	font-size:16px;
    	padding:0 16px;
    	cursor:pointer;
    }

    .paging {
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	margin-top: 20px;
    	flex-wrap: wrap;
    	gap: 4px;
    }

    .paging a {
    	text-decoration: none;
    	font-size: 18px;
    	color: #333;
    	padding: 5px 10px;
    	border-radius: 4px;
    	transition: background-color 0.3s ease;
    }

    .paging a:hover {
    	background-color: #f0f0f0;
    }

    .paging a.paging-active {
    	background-color: #f0f0f0;
    	color: #333;
    	border-radius: 20%;
    	padding: 5px 10px;
    	border: 1px solid #ccc;
    	font-weight: bold;
    }

    .paging a.paging-active:hover {
    	background-color: #e0e0e0;
    }

    .nolist{
    	font-size: 26px;
    	margin-top:100px;
    	width: 100%;
    	text-align:center;
    	color:#5a5a5a;
    	font-weight:bold;
    }

    .alluser{
    	font-size: 24px;
    	font-weight: bold;
    	color: #5a5a5a;
    }

    .writer{
    	color: #FF8C00;
    }

    .no_board{
    	display:flex;
    	font-size:24px;
    	color: #5a5a5a;
    	align-items: center;
      	justify-content: center;
      	font-weight:bold;
      	margin-top: 100px;
      	text-align:center;
    }

    .img{
    	width:90px;
    	height:90px;
    	border-radius: 8px;
    	object-fit: cover;
    }

    .board-row {
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .board-row:hover {
        background-color: #fff7ef;
    }
</style>
</head>
<body>
<div class="top-bar">
	<div class="title">
		<span class="main-title">JBB</span>
		<span class="side-title">for admin only</span>
	</div>
	<div class="search-container">
		<form action="<c:url value="/admin/userboard"/>" class="search-form" method="get">
			<input type="hidden" name="writer" value="${writer}">
			<select name="option" class="search-option">
          		<option class="option" value="B" ${ph.sc.option=='B' ? "selected" : ""}>번호</option>
          		<option class="option" value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목</option>
		    </select>
		    <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
        	<input type="submit" class="search-button" value="검색">
		</form>
	</div>
</div>
<div class="content-container">
	<%@ include file="side-menu.jsp" %>
	<!-- 사용자 목록 테이블 -->
	<div class="user-table-container">
		<c:if test="${not empty userboard}">
		    <span class="alluser"><a class="writer">${writer}</a> 님의 게시물 ( ${totalCount} )</span>
			<table class="user-table">
				<thead>
				    <tr>
			            <th class="th1">번호</th>
			            <th class="th2">썸네일</th>
			            <th class="th3">제목</th>
			            <th class="th4">작성일</th>
			        </tr>
				 </thead>
				 <tbody>
					<c:forEach var="boardDto" items="${userboard}">
			            <tr class="board-row" onclick="location.href='<c:url value='/admin/admin_boarddetail?bno=${boardDto.bno}'/>'">
			                <td class="td1">${boardDto.bno}</td>
			                <td class="td2">
			                <c:choose>
								<c:when test="${not empty boardDto.img1}">
									<img src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지" class="img">
								</c:when>
								<c:otherwise>
									<img src="${data_path}/img/default_img.png" alt="기본 이미지" class="img">
								</c:otherwise>
							</c:choose>
			                </td>
			                <td class="td3">
			                	<c:choose>
									<c:when test="${fn:length(boardDto.title) > 20}">
										${fn:substring(boardDto.title, 0, 20)}...
									</c:when>
									<c:otherwise>
										${boardDto.title}
									</c:otherwise>
								</c:choose>
			                </td>
			                <td class="td4"><fmt:formatDate pattern = "yyyy. MM. dd" value="${boardDto.reg_date}"/></td>
			            </tr>
		        	</c:forEach>
				  </tbody>
			</table>
		</c:if>
		<c:if test="${empty userboard}">
		    <span class="no_board"><a class="writer">${writer}</a> 님의 게시물이 없습니다.</span>
		</c:if>
		<div class="paging">
			<c:if test="${ph.showPrev}">
				 <a class="page" href="<c:url value='/admin/userboard?writer=${writer}&page=${ph.beginPage-1}&pageSize=${ph.sc.pageSize}&option=${ph.sc.option}&keyword=${ph.sc.keyword}'/>">&lt;</a>
			</c:if>
			<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
				 <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value='/admin/userboard?writer=${writer}&page=${i}&pageSize=${ph.sc.pageSize}&option=${ph.sc.option}&keyword=${ph.sc.keyword}'/>">${i}</a>
			</c:forEach>
			<c:if test="${ph.showNext}">
				<a class="page" href="<c:url value='/admin/userboard?writer=${writer}&page=${ph.endPage+1}&pageSize=${ph.sc.pageSize}&option=${ph.sc.option}&keyword=${ph.sc.keyword}'/>">&gt;</a>
			</c:if>
		</div>
	</div>
</div>
</body>
</html>