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
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>JBB</title>

<link rel="stylesheet" as="style" crossorigin
      href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@latest/dist/web/static/pretendard.css" />

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

  .form-card-top{
    display:flex;
    align-items:flex-start;
    justify-content:space-between;
    gap:16px;
    margin-bottom: 20px;
    flex-wrap: wrap;
  }

  .form-title-box h3{
    font-size: 24px;
    font-weight: 900;
    line-height: 1.2;
  }

  .form-title-box p{
    margin-top: 8px;
    color: var(--muted);
    font-size: 14px;
    line-height: 1.5;
  }

  .hero-pill{
    display:flex;
    gap:8px;
    align-items:center;
    padding: 10px 12px;
    border: 1px solid rgba(255,140,0,.25);
    background: rgba(255,140,0,.10);
    border-radius: 999px;
    color: #9a4b00;
    font-size: 13px;
    font-weight: 800;
    white-space: nowrap;
  }

  form{
    width: 100%;
    display:flex;
    flex-direction:column;
    gap: 18px;
  }

  .select{
    display:grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
  }

  .category-select{
    width: 100%;
    height: 58px;
    padding: 0 16px;
    border: 1px solid rgba(17,24,39,.12);
    border-radius: 16px;
    background: rgba(255,255,255,.96);
    color: var(--text);
    font-size: 16px;
    font-weight: 700;
    outline: none;
    transition: border-color .15s ease, box-shadow .15s ease;
  }

  .category-select:focus{
    border-color: rgba(255,140,0,.45);
    box-shadow: 0 0 0 4px rgba(255,140,0,.10);
  }

  .input-group{
    display:flex;
    flex-direction:column;
    width:100%;
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

  .image-guide{
    color: var(--muted);
    font-size: 13px;
    font-weight: 700;
    padding-left: 4px;
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

  .upload-circle{
    display:flex;
    justify-content:center;
    align-items:center;
    width:100%;
    height:100%;
    position:relative;
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
    width:100%;
    height:100%;
    object-fit:cover;
    display:none;
  }

  input[type="file"]{
    display:none;
  }

  .divider{
    width:1px;
    height: 140px;
    background: linear-gradient(180deg, transparent, rgba(17,24,39,.18), transparent);
  }

  .btn{
    display:grid;
    grid-template-columns: 1fr 1fr;
    gap: 12px;
    margin-top: 6px;
  }

  .draftBtn,
  .subBtn{
    width:100%;
    min-height: 62px;
    padding: 16px 20px;
    border-radius: 18px;
    cursor:pointer;
    font-size: 18px;
    font-weight: 900;
    transition: transform .15s ease, box-shadow .15s ease, border-color .15s ease, background .15s ease;
  }

  .draftBtn{
    color: var(--brand);
    background: rgba(255,255,255,.96);
    border: 1.5px solid rgba(255,140,0,.45);
  }

  .draftBtn:hover{
    transform: translateY(-2px);
    box-shadow: 0 12px 24px rgba(17,24,39,.08);
    background: #fff;
  }

  .subBtn{
    color: #fff;
    background: linear-gradient(135deg, var(--brand), var(--brand2));
    border: none;
    box-shadow: 0 14px 24px rgba(255,140,0,.22);
  }

  .subBtn:hover{
    transform: translateY(-2px);
    box-shadow: 0 18px 30px rgba(255,140,0,.28);
  }

  @media (max-width: 920px){
    .title-left,
    .title-right{
      min-width: auto;
    }

    .image-upload-group{
      grid-template-columns: repeat(3, 1fr);
      gap: 10px;
    }

    .divider{
      display:none;
    }

    .image-upload{
        min-height: 120px;
        border-radius: 18px;
    }

    .plus-sign{
        width: 42px;
        height: 42px;
        font-size: 28px;
    }
  }

  @media (max-width: 680px){
    .container{
      padding: 18px;
      border-radius: 20px;
    }

    .select{
      grid-template-columns: 1fr 1fr;
      gap: 8px;
    }

    .category-select{
        height: 50px;
        padding: 0 10px;
        font-size: 14px;
        border-radius: 14px;
    }

    .btn{
      grid-template-columns: 1fr;
    }

    .form-title-box h3{
      font-size: 21px;
    }

    input[type="text"]{
      font-size: 16px;
    }

    textarea{
      min-height: 300px;
      font-size: 16px;
    }
  }

  @media (max-width: 480px){
    .image-upload-group{
      grid-template-columns: repeat(2, 1fr);
      gap: 10px;
    }

    .image-upload{
      min-height: 110px;
    }

    .plus-sign{
      width: 38px;
      height: 38px;
      font-size: 24px;
    }

    .select{
        grid-template-columns: 1fr 1fr;
        gap: 8px;
    }

    .category-select{
        height: 46px;
        padding: 0 8px;
        font-size: 13px;
    }
  }
</style>
</head>
<body>

<!-- category 리스트에서 draft.b_bc_code의 부모 코드를 찾아 draftParent에 저장 -->
<c:if test="${not empty draft}">
  <c:forEach var="cat" items="${categories}">
    <c:if test="${cat.bc_code == draft.b_bc_code}">
      <c:set var="draftParent" value="${cat.bc_code_ref_mn}" />
    </c:if>
  </c:forEach>
</c:if>

<script>
  var draftMainCategory = '${not empty draftParent ? draftParent : ""}';
  var draftSubCategory = '${not empty draft ? draft.b_bc_code : ""}';
  var hasDraft = ${not empty draft ? "true" : "false"};
  var shouldLoadDraft = false;
</script>

<%@ include file="/WEB-INF/views/common/common_header.jsp" %>

<div class="body">
    <div class="container">
      <div class="form-card-top">
        <div class="form-title-box">
          <h3>새 게시물을 작성해보세요</h3>
          <p>카테고리를 고르고, 제목과 내용을 입력한 뒤 이미지를 함께 올릴 수 있어요.</p>
        </div>
        <div class="hero-pill">✍️ 지금 바로 글 작성하기</div>
      </div>

      <!-- 임시저장된 글이 있으면 불러오기 -->
      <c:if test="${not empty draft}">
        <script>
          document.addEventListener('DOMContentLoaded', function() {
              if (confirm('임시저장된 글이 있습니다. 불러오시겠습니까?')) {
                shouldLoadDraft = true;

                $('#title').val('${fn:escapeXml(draft.title)}');
                $('#content').val('${fn:escapeXml(draft.content)}');
                $('input[name="draft_id"]').val('${draft.draft_id}');

                <c:if test="${not empty draft.img1}">
                  $('#preview1')
                    .attr('src','${data_path}/upload/draft/${draft.img1}')
                    .show()
                    .closest('.image-upload').find('.plus-sign').hide();
                </c:if>
                <c:if test="${not empty draft.img2}">
                  $('#preview2')
                    .attr('src','${data_path}/upload/draft/${draft.img2}')
                    .show()
                    .closest('.image-upload').find('.plus-sign').hide();
                </c:if>
                <c:if test="${not empty draft.img3}">
                  $('#preview3')
                    .attr('src','${data_path}/upload/draft/${draft.img3}')
                    .show()
                    .closest('.image-upload').find('.plus-sign').hide();
                </c:if>
              }
            });
        </script>
      </c:if>

      <form action="<c:url value='/board/write'/>" method="post" id="form" onsubmit="return validateForm()" enctype="multipart/form-data">
        <div class="select">
          <!-- 대분류 선택 -->
          <select id="mainCategory" name="mainCategory" class="category-select">
            <option value="">대분류 선택</option>
            <c:forEach var="category" items="${categories}">
              <c:if test="${category.bc_code_ref_mn == null}">
                <option value="${category.bc_code}">${category.bc_name}</option>
              </c:if>
            </c:forEach>
          </select>

          <!-- 중분류 선택 -->
          <select id="subCategory" name="b_bc_code" class="category-select">
            <option value="">중분류 선택</option>
          </select>
        </div>

        <input type="hidden" name="draft_id" value="${draft.draft_id}">
        <input type="hidden" name="bno" value="${boardDto.bno}">

        <div class="input-group">
          <input type="text" name="title" id="title" placeholder="제목을 입력하세요">
        </div>

        <div class="input-group">
          <textarea name="content" id="content" rows="1" placeholder="자유롭게 내용을 입력하세요"></textarea>
        </div>

        <div class="image-upload-container">
          <div class="image-guide">대표 이미지 1장과 추가 이미지 2장까지 업로드할 수 있어요.</div>

          <div class="image-upload-group">
            <!-- 대표 이미지 -->
            <label class="image-upload" for="file1">
              <input type="file" name="file1" id="file1" hidden onchange="previewImage(this, 'preview1', 'file-name1')">
              <div class="upload-circle">
                <span class="plus-sign">+</span>
                <img id="preview1" class="preview-image" src="" alt="대표 이미지">
              </div>
            </label>

            <span class="divider"></span>

            <!-- 추가 이미지 1 -->
            <label class="image-upload" for="file2">
              <input type="file" name="file2" id="file2" hidden onchange="previewImage(this, 'preview2', 'file-name2')">
              <div class="upload-circle">
                <span class="plus-sign">+</span>
                <img id="preview2" class="preview-image" src="" alt="추가 이미지 1">
              </div>
            </label>

            <!-- 추가 이미지 2 -->
            <label class="image-upload" for="file3">
              <input type="file" name="file3" id="file3" hidden onchange="previewImage(this, 'preview3', 'file-name3')">
              <div class="upload-circle">
                <span class="plus-sign">+</span>
                <img id="preview3" class="preview-image" src="" alt="추가 이미지 2">
              </div>
            </label>
          </div>
        </div>

        <div class="btn">
          <button type="button" id="saveDraftBtn" class="draftBtn">임시저장</button>
          <button type="submit" class="subBtn">등록</button>
        </div>
      </form>
    </div>
  </div>
</div>

<script>
function previewImage(input, previewId, fileNameId) {
    const file = input.files[0];
    const preview = document.getElementById(previewId);
    const plusSign = input.closest('.image-upload').querySelector('.plus-sign');

    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = 'block';  // 이미지 미리보기 표시
            plusSign.style.display = 'none';  // + 기호 숨기기
        }
        reader.readAsDataURL(file);
    }
}

document.querySelectorAll('.image-upload img').forEach(function(img) {
    img.addEventListener('click', function() {
        const input = img.closest('.image-upload').querySelector('input[type="file"]');
        input.click(); // 이미지를 클릭하면 input 파일 선택창 열기
    });
});
</script>

<script>
$(document).ready(function () {
    const contextPath = "${pageContext.request.contextPath}";

    function loadSubCategories(mainCategory, selectedSubCategory) {
        $("#subCategory").html('<option value="">중분류 선택</option>');

        if (!mainCategory) return;

        $.ajax({
            url: contextPath + "/board/getSubCategories",
            type: "GET",
            data: { mainCategory: mainCategory },
            success: function (data) {
                $(data).each(function (index, item) {
                    $("#subCategory").append(
                        '<option value="' + item.bc_code + '">' + item.bc_name + '</option>'
                    );
                });

                if (selectedSubCategory) {
                    $("#subCategory").val(String(selectedSubCategory).trim());
                }
            },
            error: function () {
                alert("중분류 불러오기 실패!");
            }
        });
    }

    // 사용자가 직접 대분류 선택했을 때
    $("#mainCategory").on("change", function () {
        const mainCategory = $(this).val();
        loadSubCategories(mainCategory, "");
    });

    // 임시저장 복원
    if (hasDraft && shouldLoadDraft && draftMainCategory) {
        $("#mainCategory").val(String(draftMainCategory).trim());
        loadSubCategories(draftMainCategory, draftSubCategory);
    }
});
</script>

<!-- 유효성 검사 -->
<script>
	function validateForm(){
		let mainCategory = $("#mainCategory").val();
        let subCategory = $("#subCategory").val();
        let title = $("#title").val();
        let content = $("#content").val();

		if(mainCategory==""){
             alert("대분류를 선택해주세요");
             return false;
        } else if(subCategory==""){
             alert("중분류를 선택해주세요");
             return false;
        } else if(title==""){
             alert("게시글 제목을 입력해주세요");
             return false;
        } else if(content==""){
             alert("게시글 내용을 입력해주세요");
             return false;
        }
        return true;
	}
</script>

<script>
  let msg = "${msg}";
  if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
</script>

<script>
//목록버튼
$(document).ready(function(){ //main()함수
	$('#listBtn').on("click", function(){
		location.href = "<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";
	})
})
</script>

<!-- 게시글 임시저장 -->
<script>
$('#saveDraftBtn').click(function(){
  const formData = new FormData($('#form')[0]);
  $.ajax({
    url:    '${path}/board/draft',
    type:   'POST',
    data:   formData,
    processData: false,
    contentType: false,
    success:  ()=> alert('저장 완료'),
    error:    ()=> alert('저장 실패'),
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