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
	
	.board-title{
		width:100%;
		display:flex;
		align-items: center;
		justify-content: space-between;
		gap: 20px;
	}
	
	.name{
		font-size:28px;
		font-weight:800;
		color:#333;
	}
	
	.name_answer{
		font-size:25px;
		font-weight:bold;
		color:#FF8C00;
	}
	
	.board-table-container{
		margin-top:40px;
		margin-left:40px;
		padding-right:40px;
		width:calc(100% - 80px);
		max-width:none;
		box-sizing:border-box;
	}
	
	.boarddetail{
    	width:100%;
    	display:flex;
    	flex-direction:row;
    	gap:40px;
    	font-size:18px;
    	color:#5a5a5a;
    	margin-top:32px;
    	align-items:stretch;
    }
	
	.board-details{
    	display:flex;
    	flex-direction:column;
    	gap:20px;
    	flex:1 1 auto;
    	min-width:0;
    	width:100%;
    	background:#fff;
    	border:1px solid #f0f0f0;
    	border-radius:18px;
    	padding:32px 36px;
    	box-shadow:0 6px 18px rgba(0,0,0,0.05);
    	min-height:500px;
    	box-sizing:border-box;
    }

    .board-details > div{
    	display:flex;
    	align-items:flex-start;
    	gap:22px;
    	padding:18px 20px;
    	background:#fafafa;
    	border-radius:12px;
    	border:1px solid #f1f1f1;
    	width:100%;
    	box-sizing:border-box;
    }
	
	.info-name{
    	display:inline-block;
    	min-width:88px;
    	font-weight:700;
    	color:#FF8C00;
    	flex-shrink:0;
    	padding-top:2px;
    	font-size:17px;
    }
	
	.info{
    	display:block;
    	flex:1;
    	width:auto;
    	margin-left:0;
    	border-bottom:none;
    	color:#444;
    	line-height:1.8;
    	white-space:pre-wrap;
    	word-break:break-word;
    	font-size:17px;
    }

    .info.content{
    	min-height:150px;
    	max-height:260px;
    	overflow-y:auto;
    	padding-right:8px;
    }

    .delete-form{
        margin:0;
        flex-shrink:0;
    }
	
	.delBtn {
		width: auto;
		min-width:110px;
		padding: 10px 18px;
		background-color: white;
		color: #FF8C00;
		border: 2px solid #FF8C00;
		border-radius: 10px;
		cursor: pointer;
		font-size:17px;
		font-weight:600;
		margin-top:0;
		transition: all 0.2s ease;
	}

	.delBtn:hover{
    	background:#fff3e6;
    }
	
	.img_wrap{
    	position:relative;
    	flex:0 0 500px;
    	width:500px;
    }
	
	.slider{
		position: relative;
		display:flex;
		width:500px;
		height:500px;
		overflow:hidden;
		border-radius:18px;
		background:#f8f8f8;
		box-shadow:0 6px 18px rgba(0,0,0,0.08);
	}
	
	.img img {
	    width: 500px; 
		height:500px;
		object-fit:cover;
	    display: block;
	}
	
	.slider-wrapper {
	    display: flex;
	    position: relative;
	    transition: transform 0.5s ease-in-out;
	    width: 100%;
	}

	.arrow{
	    position:absolute;
	    top:0;
	    left:0;
	    width:100%;
	    height:100%;
	    pointer-events:none;
	}
	
	.arrow button{
		position: absolute;
	    top: 50%;
	    transform: translateY(-50%);
	    background:rgba(255,255,255,0.85);
	    color: #5a5a5a;
	    border: none;
	    width:42px;
        height:42px;
        border-radius:50%;
        cursor:pointer;
        font-size:22px;
        z-index:10;
        box-shadow:0 2px 8px rgba(0,0,0,0.12);
        transition:all 0.2s ease;
        pointer-events:auto;
	}

	.arrow button:hover{
    	background:#fff3e6;
    	color:#FF8C00;
    }
	
	.prev {
	    left: 14px;
	}
	
	.next {
	    right: 14px;
	}
	
	.number{
		color: #FF8C00;
	}

	.vertical-line{
    	display:none;
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
    <div class="board-table-container">
        <div class="board-title">
            <span class="name"><span class="number">${boardDto.bno}</span> 번 게시물</span>

            <form action="<c:url value='/admin/admin_boardremove'/>" method="post" class="delete-form">
            	<input type="hidden" name="bno" value="${boardDto.bno}">
            	<button type="submit" onclick="return confirm('정말 삭제하시겠습니까?');" class="delBtn">삭제</button>
           </form>
        </div>
        <div class="boarddetail">
            <div class="img_wrap">            
                <div class="slider">
                    <div class="slider-wrapper">
                        <c:set var="img_cnt" value="1" />

                        <div class="img">
                        	<c:choose>
                        		<c:when test="${not empty boardDto.img1}">
                        			<img src="${data_path}/upload/${boardDto.img1}" alt="대표 이미지">
                        		</c:when>
                        		<c:otherwise>
                        			<img src="${data_path}/img/default_img.png" alt="기본 이미지">
                        		</c:otherwise>
                        	</c:choose>
                        </div>

                        <c:if test="${not empty boardDto.img2}">
                        	<c:set var="img_cnt" value="${img_cnt + 1}" />
                        	<div class="img">
                        		<img src="${data_path}/upload/${boardDto.img2}" alt="추가 이미지 2">
                        	</div>
                        </c:if>

                        <c:if test="${not empty boardDto.img3}">
                        	<c:set var="img_cnt" value="${img_cnt + 1}" />
                        	<div class="img">
                        		<img src="${data_path}/upload/${boardDto.img3}" alt="추가 이미지 3">
                        	</div>
                        </c:if>
                    </div>
                </div>
                <!-- 화살표는 이미지가 2개 이상일 때만 표시 -->
                <c:if test="${img_cnt > 1}">
	                <div class="arrow">
	                    <button class="prev">&lt;</button>
	                    <button class="next">&gt;</button>
	                </div>
                </c:if>
            </div>
			<hr class="vertical-line">
			<div class="board-details">
					<div><span class="info-name">번호</span><span class="info">${boardDto.bno}</span></div>
					<div><span class="info-name">제목</span><span class="info">${boardDto.title}</span></div>
					<div><span class="info-name">내용</span><span class="info content">${boardDto.content}</span></div>
					<div><span class="info-name">작성자</span><span class="info">${boardDto.writer}</span></div>
					<div><span class="info-name">작성일</span><span class="info"><fmt:formatDate pattern = "yyyy.MM.dd" value="${boardDto.reg_date}"/></span></div>
			</div>
		</div>
	</div>
</div>
<!-- 이미지 슬라이드 -->
<script>
$(document).ready(function(){
	var imgCount = ${img_cnt};   // 실제 이미지 개수
	var imgWidth = 500;          // 각 이미지 너비
	var currentIndex = 0;

	$(".slider-wrapper").css({
		width: imgWidth * imgCount,
		left: 0
	});

	function imgMove(){
		$(".slider-wrapper").stop().animate({
			left: -(currentIndex * imgWidth)
		}, 300);
	}

	$(".next").click(function(){
		currentIndex++;
		if(currentIndex >= imgCount){
			currentIndex = 0;
		}
		imgMove();
	});

	$(".prev").click(function(){
		currentIndex--;
		if(currentIndex < 0){
			currentIndex = imgCount - 1;
		}
		imgMove();
	});
});
</script>
<script>
	let msg = "${msg}";
	if(msg=="AMDEL_ERR") alert("게시물 삭제에 실패했습니다. 다시 시도해주세요.");
</script>
</body>
</html>