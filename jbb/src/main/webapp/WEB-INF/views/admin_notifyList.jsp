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
	    font-size:20px;
	    color: #5a5a5a;
	    border-left: none;
  		border-right: none;
	}
	
	.user-table th {
	    background-color: #E2E2E2;
	    color: gray;
	    border-bottom: 2px solid #5a5a5a;
	    font-weight:bold;
	    padding:20px;
	}
	
	.user-table td{
		padding:30px;
	}
	
	.th1, .td1{
		width: 100px;
	}
	
	.th2, .td2{
		width: 500px;
	}
	
	.th3, .td3{
		width: 200px;
	} 
	
    .board-row {
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .board-row:hover {
        background-color: #fff7ef;
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
      font-size: 20px;
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
      font-size: 20px;
      padding: 0 10px;
    }

	.search-input placeholder {
    	color:#D3D3D3;
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
      font-size: 20px;
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
	
	.no_board{
		display:flex;
		font-size:25px;
		color: #5a5a5a;
		align-items: center;
      	justify-content: center;
      	font-weight:bold;  
	}
	
	.pending {
	    color: #FF8C00;
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
		<form action="<c:url value="/admin/notifylist"/>" class="search-form" method="get">
	     <select class="search-option" name="option">
	         <option value="A" ${sc.option == 'A' ? "selected" : ""}>제목+내용</option>
	         <option value="T" ${sc.option == 'T' ? "selected" : ""}>제목</option>
	     </select>
	     <input type="text" name="keyword" class="search-input" value="${sc.keyword}" placeholder="검색어를 입력해주세요">
	     <input type="submit" class="search-button" value="검색">
		</form>
	</div>
</div>
<div class="content-container">	
	<%@ include file="side-menu.jsp" %>
	<div class="user-table-container">
		<c:if test="${not empty list}">
		    <span class="alluser">전체 공지사항 ( ${totalCnt} )</span>
			<table class="user-table">
				<thead>
				    <tr>
			            <th class="th1">번호</th>
			            <th class="th2">제목</th>
			            <th class="th3">작성일</th>
			        </tr>
				 </thead>
				 <tbody>
					<c:forEach var="notifyDto" items="${list}">
			            <tr class="board-row" onclick="location.href='<c:url value='/admin/notifydetail?nno=${notifyDto.nno}&page=${param.page}&pageSize=${param.pageSize}'/>'">
			                <td class="td1">${notifyDto.nno}</td>
			                <td class="td2">
				                <c:choose>
									<c:when test="${fn:length(notifyDto.ntitle) > 20}">
										${fn:substring(notifyDto.ntitle, 0, 20)}...
									</c:when>	
									<c:otherwise>
										${notifyDto.ntitle}
									</c:otherwise>
								</c:choose>
			                </td>
			                <td class="td3"><fmt:formatDate value="${notifyDto.n_date}" pattern="yyyy.MM.dd" /></td>
			            </tr>
		        	</c:forEach>
				  </tbody>
			</table>
		</c:if>
		<c:if test="${empty list}">
		    <span class="no_board">공지사항이 없습니다.</span>
		</c:if>
		<div class="paging">		
			<c:if test="${ph.showPrev}">
				 <a class="page" href="<c:url value='/admin/notifylist?page=${ph.beginPage-1}&pageSize=${ph.sc.pageSize}&option=${ph.sc.option}&keyword=${ph.sc.keyword}'/>">&lt;</a>
			</c:if>
			<c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
				 <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value='/admin/notifylist?page=${i}&pageSize=${ph.sc.pageSize}&option=${ph.sc.option}&keyword=${ph.sc.keyword}'/>">${i}</a>
			</c:forEach>
			<c:if test="${ph.showNext}">
				<a class="page" href="<c:url value='/admin/notifylist?page=${ph.endPage+1}&pageSize=${ph.sc.pageSize}&option=${ph.sc.option}&keyword=${ph.sc.keyword}'/>">&gt;</a>
			</c:if>
		</div>
	</div>
<button type="button" class="writebtn "id="writeBtn" onclick="location.href='<c:url value="/admin/notifywrite"/>'">+</button>
</div>
<script>
  let msg = "${msg}";
  if(msg=="WRT_OK") alert("공지사항을 등록했습니다.");
  if(msg=="MOD_OK") alert("공지사항이 수정되었습니다.");
</script>
</body>
</html>