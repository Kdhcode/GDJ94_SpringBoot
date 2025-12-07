<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
<c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>

<body id="page-top">
<div id="wrapper">
    <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>

    <div id="content-wrapper" class="d-flex flex-column">
        <div id="content">
            <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>

            <div class="container-fluid">
                <h1 class="h3 mb-4 text-gray-800">상품 상세</h1>

                <!-- 상품 상세 카드 -->
                <div class="card shadow-sm mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between py-2">
                        <h6 class="m-0 font-weight-bold text-primary">
                            상품 번호: ${dto.productNum} - ${dto.productName}
                        </h6>
                        <c:choose>
                            <c:when test="${dto.productSale}">
                                <span class="badge badge-success">판매중</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-secondary">판매중지</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="card-body p-3">
                        <div class="row">
                            <div class="col-lg-6">
                                <p class="mb-2"><strong>상품 이름:</strong> ${dto.productName}</p>
                                <p class="mb-0"><strong>카테고리:</strong> ${dto.productCategory}</p>
                            </div>
                            <div class="col-lg-6">
                                <p class="mb-2"><strong>금리:</strong> ${dto.productRate}%</p>
                                <p class="mb-0">
                                    <strong>판매 여부:</strong>
                                    <c:choose>
                                        <c:when test="${dto.productSale}">판매 중</c:when>
                                        <c:otherwise>판매 중지</c:otherwise>
                                    </c:choose>
                                </p>
                            </div>
                        </div>

                        <div class="alert alert-light border mb-0 mt-3">
                            ${dto.productName} 상품에 대한 정보입니다.
                        </div>
                    </div>
                </div>

                <!-- 댓글 카드 -->
                <div class="card shadow-sm mb-3">
                    <div class="card-header d-flex align-items-center justify-content-between py-2">
                        <h6 class="m-0 font-weight-bold text-primary">댓글</h6>
                        <small class="text-muted">최신순</small>
                    </div>

                    <div class="card-body p-3">
                        <div id="list" data-product-num="${dto.productNum}"></div>
                    </div>
                </div>

                <!-- 액션 버튼 툴바 -->
                <div class="btn-toolbar justify-content-end flex-wrap mt-3 mb-4" role="toolbar" aria-label="상품 액션">
                    <div class="btn-group mr-2 mb-2" role="group" aria-label="장바구니">
                        <!-- ★ id, data-product-num 추가 -->
                        <button type="button" class="btn btn-outline-primary"
                                id="btnAddCart"
                                data-product-num="${dto.productNum}">
                            장바구니
                        </button>
                    </div>
                    <div class="btn-group mr-2 mb-2" role="group" aria-label="댓글">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#commentModal">
                            댓글등록
                        </button>
                    </div>
                    <div class="btn-group mr-2 mb-2" role="group" aria-label="수정">
                        <a href="./update?productNum=${dto.productNum}" class="btn btn-warning text-white">수정하기</a>
                    </div>
                    <div class="btn-group mr-2 mb-2" role="group" aria-label="삭제">
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">
                            삭제하기
                        </button>
                    </div>
                    <div class="btn-group mb-2" role="group" aria-label="목록">
                        <a href="javascript:history.back()" class="btn btn-secondary">목록으로</a>
                    </div>
                </div>
            </div><!-- /container-fluid -->
        </div><!-- /content -->
    </div><!-- /content-wrapper -->
</div><!-- /wrapper -->

<!-- 댓글 Modal (등록/수정 겸용) -->
<div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="commentModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header py-2">
        <h5 class="modal-title" id="commentModalLabel">댓글 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body pt-3 pb-2">
        <form id="commentForm" class="mb-0">
          <input type="hidden" name="productNum" id="productNum" value="${dto.productNum}">
          <input type="hidden" name="commentId" id="commentId" value="">
          <label for="contents" class="sr-only">댓글 내용</label>
          <textarea rows="5" name="boardContents" id="contents" class="form-control" placeholder="댓글을 입력하세요"></textarea>
        </form>
      </div>
      <div class="modal-footer py-2">
        <button type="button" class="btn btn-light border" id="close" data-dismiss="modal">취소</button>
        <button type="button" id="commentAdd" class="btn btn-primary">댓글 등록</button>
      </div>
    </div>
  </div>
</div>

<!-- 삭제 모달 (상품 삭제) -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
    aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header py-2">
        <h5 class="modal-title" id="deleteModalLabel">정말 삭제하시겠습니까?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">
        ${dto.productNum}번 상품을 삭제합니다.
      </div>
      <div class="modal-footer py-2">
        <button class="btn btn-light border" type="button" data-dismiss="modal">취소</button>
        <form action="./delete" method="post" class="mb-0">
          <input type="hidden" name="productNum" value="${dto.productNum}">
          <button type="submit" class="btn btn-danger">삭제하기</button>
        </form>
      </div>
    </div>
  </div>
</div>

<c:import url="/WEB-INF/views/template/foot.jsp"></c:import>

<!-- 댓글 JS -->
<script type="text/javascript" src="/js/product/product_comment.js"></script>

<!-- 등록 모드 초기화 (Bootstrap 4 이벤트만 사용) -->
<script>
  (function(){
    var modal = document.getElementById('commentModal');
    var contents = document.getElementById('contents');
    var commentId = document.getElementById('commentId');
    var commentAddBtn = document.getElementById('commentAdd');
    var title = document.getElementById('commentModalLabel');

    modal.addEventListener('show.bs.modal', function (e) {
      var opener = e.relatedTarget;
      if (opener && opener.matches('[data-toggle="modal"][data-target="#commentModal"]')) {
        commentId.value = '';
        contents.value = '';
        commentAddBtn.textContent = '댓글 등록';
        if (title) title.textContent = '댓글 등록';
      }
    });
  })();
</script>
<script>
(function(){
  const btn = document.getElementById('btnAddCart');
  if (!btn) return;

  btn.addEventListener('click', function(){
    if (btn.dataset.loading === '1') return;
    btn.dataset.loading = '1';
    const originalText = btn.textContent;
    btn.textContent = '처리 중...';
    btn.disabled = true;

    const productNum = btn.getAttribute('data-product-num') || '';
    const body = new URLSearchParams({ productNum });

    // ★ 컨텍스트패스/서블릿패스 자동 반영
    const url = '<c:url value="/cart/add"/>';
    fetch(url, {
      method: 'POST',
      headers: { 'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8' },
      body
    })
    .then(r => {
      if (!r.ok) { alert('요청 실패: ' + r.status + ' ' + r.statusText); throw new Error(); }
      return r.text();
    })
    .then(t => {
      const n = Number(t);
      if (n === 1) {
        if (confirm('장바구니에 담았습니다. 장바구니로 이동할까요?')) {
          location.href = '<c:url value="/cart/list"/>';
        }
      } else {
        alert('이미 장바구니에 있거나 로그인 필요합니다.');
      }
    })
    .catch(e => { console.error(e); alert('장바구니 처리 중 오류'); })
    .finally(() => { btn.dataset.loading = '0'; btn.textContent = originalText; btn.disabled = false; });
  });
})();
</script>




</body>
</html>
