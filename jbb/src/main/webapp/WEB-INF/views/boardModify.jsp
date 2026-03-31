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
:root{
  --bg: #fffaf5;
  --bg2:#fff3e6;
  --panel:#ffffff;
  --panel2:#fff7ef;
  --text:#1f2937;
  --muted:#6b7280;
  --line: rgba(17,24,39,.10);
  --brand:#ff8c00;
  --brand2:#ffb15a;
  --shadow: 0 14px 40px rgba(17,24,39,.10);
  --shadow2: 0 10px 24px rgba(17,24,39,.08);
  --r: 18px;
  --max: 1100px;
}

*{ margin:0; padding:0; box-sizing:border-box; }
html, body{ min-height:100%; }

body{
  font-family: Pretendard, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Noto Sans KR", Arial, sans-serif;
  background:
    radial-gradient(900px 500px at 10% -10%, rgba(255,140,0,.18), transparent 55%),
    radial-gradient(800px 480px at 100% 0%, rgba(255,177,90,.16), transparent 55%),
    linear-gradient(180deg, var(--bg2), var(--bg));
  color: var(--text);
}

a{ color:inherit; text-decoration:none; }

.body{
  min-height:100vh;
}

.container{
  max-width: 920px;
  width: calc(100% - 32px);
  margin: 22px auto 0;
  padding: 26px;
  border-radius: 24px;
  border: 1px solid var(--line);
  background: linear-gradient(180deg, rgba(255,255,255,.94), rgba(255,247,239,.92));
  box-shadow: var(--shadow);
}

form{
  width: 100%;
  display:flex;
  flex-direction:column;
  gap: 18px;
}

.input-group{
  display:flex;
  flex-direction:column;
  width:100%;
  margin: 0;
}

input[type="text"]{
  width:100%;
  padding: 18px 20px;
  border: 1px solid rgba(17,24,39,.12);
  border-radius: 18px;
  background: rgba(255,255,255,.96);
  color: var(--text);
  font-size: 18px;
  font-weight: 600;
  outline:none;
  transition: border-color .15s ease, box-shadow .15s ease;
}

input[type="text"]::placeholder{
  color:#9ca3af;
  font-weight:600;
}

input[type="text"]:focus{
  border-color: rgba(255,140,0,.45);
  box-shadow: 0 0 0 4px rgba(255,140,0,.10);
}

textarea{
  width:100%;
  min-height: 360px;
  padding: 20px;
  border: 1px solid rgba(17,24,39,.12);
  border-radius: 20px;
  background: rgba(255,255,255,.96);
  color: var(--text);
  font-size: 17px;
  line-height: 1.7;
  resize: none;
  outline:none;
  transition: border-color .15s ease, box-shadow .15s ease;
  overflow: hidden;
}

textarea::placeholder{
  color:#9ca3af;
  font-weight:600;
}

textarea:focus{
  border-color: rgba(255,140,0,.45);
  box-shadow: 0 0 0 4px rgba(255,140,0,.10);
}

.image-upload-container{
  display:flex;
  flex-direction:column;
  gap:12px;
}

.image-upload-group{
  display:grid;
  grid-template-columns: 1fr auto 1fr 1fr;
  align-items:center;
  gap: 16px;
  width: 100%;
}

.image-upload{
  display:flex;
  justify-content:center;
  align-items:center;
  width:100%;
  aspect-ratio: 1 / 1;
  min-height: 220px;
  background: linear-gradient(180deg, rgba(255,247,239,.95), rgba(255,255,255,.98));
  border: 1px dashed rgba(255,140,0,.35);
  border-radius: 24px;
  position: relative;
  overflow: hidden;
  cursor: pointer;
  transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease;
}

.image-upload:hover{
  transform: translateY(-2px);
  box-shadow: 0 14px 28px rgba(17,24,39,.08);
  border-color: rgba(255,140,0,.55);
}

.image-upload img,
.preview-image{
  width:100%;
  height:100%;
  object-fit:cover;
  display:block;
}

.upload-circle{
  display:flex;
  justify-content:center;
  align-items:center;
  width:100%;
  height:100%;
  position:relative;
}

.upload-circle > img{
  width:100%;
  height:100%;
  object-fit:cover;
  display:block;
}

.upload-circle > img:not([src=""]),
.upload-circle > img[src]:not([src=""]){
  position:absolute;
  inset:0;
}

.plus-sign{
  width:62px;
  height:62px;
  border-radius: 50%;
  display:flex;
  justify-content:center;
  align-items:center;
  background: rgba(255,140,0,.14);
  border: 1px solid rgba(255,140,0,.25);
  color: var(--brand);
  font-size: 36px;
  font-weight: 500;
}

.preview-image{
  display:none;
}

input[type="file"]{
  display:none;
}

.divider{
  width:1px;
  height: 140px;
  background: linear-gradient(180deg, transparent, rgba(17,24,39,.18), transparent);
  margin: 0;
}

.btn{
  display:grid;
  grid-template-columns: 1fr;
  gap: 12px;
  margin-top: 6px;
  width: 100%;
}

.subBtn{
  width:100%;
  min-height: 62px;
  padding: 16px 20px;
  border-radius: 18px;
  cursor:pointer;
  font-size: 18px;
  font-weight: 900;
  color: #fff;
  background: linear-gradient(135deg, var(--brand), var(--brand2));
  border: none;
  box-shadow: 0 14px 24px rgba(255,140,0,.22);
  transition: transform .15s ease, box-shadow .15s ease;
}

.subBtn:hover{
  transform: translateY(-2px);
  box-shadow: 0 18px 30px rgba(255,140,0,.28);
}

@media (max-width: 920px){
  .image-upload-group{
    grid-template-columns: 1fr;
  }

  .divider{
    display:none;
  }
}

@media (max-width: 680px){
  .container{
    width: calc(100% - 20px);
    padding: 18px;
    border-radius: 20px;
  }

  input[type="text"]{
    font-size: 16px;
  }

  textarea{
    min-height: 300px;
    font-size: 16px;
  }
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/common_header.jsp" %>
<div class="body">
<div class="container">
<form action="<c:url value='/board/modify'/>" method="post" id="form" onsubmit="return validateForm()" enctype="multipart/form-data">
	<input type="hidden" name="bno" value="${boardDto.bno}">
	<input type="hidden" name="img1_hidden" value="${boardDto.img1}">
	<input type="hidden" name="img2_hidden" value="${boardDto.img2}">
	<input type="hidden" name="img3_hidden" value="${boardDto.img3}">
	<input type="hidden" name="page" value="${page}">
	<input type="hidden" name="pageSize" value="${pageSize}">
	<div class="input-group">
		<input type="text" name="title" id="title" value="${boardDto.title}">
	</div>
	<div class="input-group">
		<textarea name="content" id="content" rows="1">${boardDto.content}</textarea>
	</div>
	<div class="image-upload-container">
	    <div class="image-upload-group">
	     	<!-- 대표 이미지 -->
	        <label class="image-upload" for="file1">
	             <input type="file" name="file1" id="file1" hidden onchange="previewImage(this, 'preview1', 'file-name1')">
	                <div class="upload-circle">
	                    <span class="plus-sign">+</span>
	                    <c:choose>
							<c:when test="${not empty boardDto.img1}">
								<img class="preview-image existing-image" src="${data_path}/upload/${boardDto.img1}" alt="">
							</c:when>
							<c:otherwise>
								<img id="preview1" class="preview-image" alt="">
							</c:otherwise>
						</c:choose>
	                </div>
	         </label>
	         <span class="divider"></span>
	         <!-- 추가 이미지 1 -->
	         <label class="image-upload" for="file2">
	                <input type="file" name="file2" id="file2" hidden onchange="previewImage(this, 'preview2', 'file-name2')">
	                <div class="upload-circle">
	                    <span class="plus-sign">+</span>
	                    <c:choose>
							<c:when test="${not empty boardDto.img2}">
								<img class="preview-image existing-image" src="${data_path}/upload/${boardDto.img2}" alt="">
							</c:when>
							<c:otherwise>
								<img id="preview2" class="preview-image" alt="">
							</c:otherwise>
						</c:choose>
	                </div>
	         </label>
	          <!-- 추가 이미지 2 -->
	          <label class="image-upload" for="file3">
	                <input type="file" name="file3" id="file3" hidden onchange="previewImage(this, 'preview3', 'file-name3')">
	                <div class="upload-circle">
	                    <span class="plus-sign">+</span>
	                    <c:choose>
							<c:when test="${not empty boardDto.img3}">
								<img class="preview-image existing-image" src="${data_path}/upload/${boardDto.img3}" alt="">
							</c:when>
							<c:otherwise>
								<img id="preview3" class="preview-image" alt="">
							</c:otherwise>
						</c:choose>	                    
	                </div>
	          </label>
	    </div>
	</div>
	<div class="btn">
		<button type="submit" class="subBtn">수정</button>
	</div>
</form>
</div>
</div>
<!-- 유효성 검사 -->
<script>
	function validateForm(){
		let title = $("#title").val();
		let content = $("#content").val();
		
		if(title==""&&content==""){
			alert("게시글 제목과 내용을 입력해주세요");
			return false;
		} else if(title==""){
			alert("게시글 제목을 입력해주세요");
			return false;
		} else if(content==""){
			alert("게시글 내용을 입력해주세요");
			return false;
		}
	}
</script>
<script>
  let msg = "${msg}";
  if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<script>
//목록버튼
$(document).ready(function(){ //main()함수
	$('#listBtn').on("click", function(){
		location.href = "<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";
	})
})
</script>
<!-- 이미지 미리보기 기능 -->
<script>
function previewImage(input, previewId) {
    var file = input.files[0];
    var reader = new FileReader();
    
    reader.onload = function(e) {
        let preview = $('#' + previewId);
        preview.attr('src', e.target.result);
        preview.show();
        preview.closest('.image-upload').find('.plus-sign').hide();
    };

    if (file) {
        reader.readAsDataURL(file);
    }
}

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".image-upload").forEach(function(uploadBox){
        const img = uploadBox.querySelector("img");
        const plus = uploadBox.querySelector(".plus-sign");

        if (!img || !plus) return;

        const src = img.getAttribute("src");

        if (src && src.trim() !== "") {
            plus.style.display = "none";
        } else {
            plus.style.display = "flex";
        }
    });
});
</script>

<!-- 이미지 용량 검사-->
<script>
document.addEventListener("DOMContentLoaded", function () {
    const fileInputs = document.querySelectorAll("input[type='file']");
    const maxSize = 10 * 1024 * 1024; // 10MB

    fileInputs.forEach(function(input) {
        input.addEventListener("change", function() {
            for (let i = 0; i < this.files.length; i++) {
                const file = this.files[i];

                if (file.size > maxSize) {
                    alert("사진 용량이 너무 큽니다. 10MB 이하 파일만 업로드해주세요.");
                    this.value = "";
                    return;
                }
            }
        });
    });
});
</script>
</body>
</html>