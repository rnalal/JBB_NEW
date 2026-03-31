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

	.user-table-container{
		flex-grow:1;
		margin-right:20px;
		margin-top:20px;
	}

	.user-table {
	    width: 100%;
	    border-collapse: collapse;
	    margin-top: 20px;
	}

	.user-table th, .user-table td {
	    border: 1px solid #ddd;
	    text-align: center;
	    font-size:16px;
	    color: #5a5a5a;
	    border-left: none;
  		border-right: none;
	}

	.user-table th {
		padding: 16px;
	    background-color: #E2E2E2;
	    color: gray;
	    border-bottom: 2px solid #5a5a5a;
	    font-weight:bold;
	}

	.user-table td{
		padding: 20px 16px;
	}

	.search-container {
      width: 500px;
      height: 40px;
      border: none;
      display: flex;
      align-items: center;
      margin-right:20px;
    }

    .search-form {
      height: 45px;
      display: flex;
    }

    .search-option {
      width: 200px;
      height: 40px;
      outline: none;
      margin-right: 5px;
      border: 1px solid #ccc;
      color: gray;
      font-size: 16px;
    }

    .search-option > option {
      text-align: center;
    }

    .search-input {
      color: gray;
      background-color: #E0E0E0;
      border: none;
      height: 40px;
      width: 250px;
      font-size: 16px;
      padding: 0 10px;
    }

	.search-input placeholder {
    	color:gray;
    }

    .search-input::placeholder{
        color:#b3b3b3;
    }

    .search-button {
      border:none;
      width: 40%;
      height: 40px;
      background-color: #FF8C00;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 16px;
    }

    .paging {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    margin-top: 20px;
	}

	.paging a {
		text-decoration: none;
	    font-size: 20px;
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
		font-size: 30px;
		margin-top:150px;
		width: 932px;
		text-align:center;
		color:#5a5a5a;
		font-weight:bold;
	}

	.alluser{
		font-size: 25px;
		font-weight: bold;
		color: #5a5a5a;
	}

	.boardcount a,
    .userid a{
    	display:inline-block;
    	color:#5a5a5a;
    	text-decoration:underline;
    	font-weight:500;
    	padding:2px 4px;
    	border-radius:4px;
    	transition:all 0.2s ease;
    }

    .boardcount a:hover,
    .userid a:hover{
    	color:#FF8C00;
    	background-color:#fff3e6;
    	text-decoration: underline;
    }

	button.writebtn {
	    position: fixed;
	    bottom: 10vh;
	    right: 2vw;
	    background-color: #FF8C00;
	    color: white;
	    padding: 10px 20px;
	    border: none;
	    border-radius: 50px;
	    font-size: 40px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	    cursor: pointer;
	    z-index: 1000;
	    transition: all 0.3s ease-in-out;
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
		<form action="<c:url value="/admin/userlist"/>" class="search-form" method="get">
			<select name="option" class="search-option">
          		<option class="option" value="N" ${ph.sc.option=='N' ? "selected" : ""}>아이디</option>
          		<option class="option" value="E" ${ph.sc.option=='E' ? "selected" : ""}>이메일</option>
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
		<span class="alluser">전체 사용자 ( ${totalUsers} )</span>
		<table class="user-table">
			<thead>
			    <tr>
			        <th>ID</th>
			        <th>이메일</th>
			        <th>가입일</th>
			        <th>작성한 글</th>
			     </tr>
			 </thead>
			 <tbody>
			 <c:forEach var="userDto" items="${userDto}">
			      <tr>
			          <td class="userid">
			          	<a href="${path}/admin/userdetail?id=${userDto.id}&page=${param.page}&pageSize=${param.pageSize}">
						    ${userDto.id}
						</a>
			          </td>
			          <td>${userDto.email}</td>
			          <td><fmt:formatDate pattern = "yyyy. MM. dd" value="${userDto.reg_date}"/></td>
				      <td class="boardcount">
						<a href="${path}/admin/userboard?writer=${userDto.id}">
					        ${userDto.boardCount}
					    </a>
					  </td>
			       </tr>
			  </c:forEach>
			  </tbody>
		</table>
		<div class="paging">
			<c:if test="${totalUsers==null || totalUsers==0}">
			      <div class="nolist"> 사용자가 없습니다. </div>
			</c:if>
			<c:if test="${totalUsers!=null && totalUsers!=0}">
				<c:if test="${ph.showPrev}">
				    <a class="page" href="<c:url value="/admin/userlist${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
				</c:if>
				<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
				    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/userlist${ph.sc.getQueryString(i)}"/>">${i}</a>
				</c:forEach>
				<c:if test="${ph.showNext}">
				    <a class="page" href="<c:url value="/admin/userlist${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
				</c:if>
			</c:if>
		</div>
	</div>
</div>
<button type="button" class="writebtn "id="writeBtn" onclick="location.href='<c:url value="/admin/userinsert"/>'">+</button>
<script>
	let msg = "${msg}";
	if(msg=="DEL_OK") alert("사용자가 삭제되었습니다.");
	if(msg=="INSERT_OK") alert("사용자가 등록되었습니다.");
</script>
</body>
</html>