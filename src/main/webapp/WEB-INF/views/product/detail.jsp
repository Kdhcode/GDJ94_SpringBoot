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
				<div class="card shadow mb-4">
					<div class="card-header py-3 d-flex align-items-center justify-content-between">
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

					<div class="card-body">
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

						<hr>

						<div class="alert alert-light border mb-0">
							${dto.productName} 상품에 대한 정보입니다.
						</div>
					</div>
				</div>

				

				<!-- 댓글 카드 (중요: container-fluid 내부) -->
				<div class="card shadow mb-4">
					<div class="card-header py-3 d-flex align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">댓글</h6>
					</div>

					<div class="card-body">
						<div id="list" data-product-num="${dto.productNum}">
							
						</div>

					</div>
				</div>

			</div><!-- /container-fluid -->
			
			<!-- 액션 버튼 -->
				<div class="d-flex justify-content-end mb-4">
					<button type="button" class="btn btn-primary mr-2 " data-toggle="modal" data-target="#commentModal">댓글등록</button>
					<a href="./update?productNum=${dto.productNum}" class="btn btn-primary mr-2">수정하기</a>
					<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">삭제하기</button>
					<a href="javascript:history.back()" class="btn btn-secondary mx-2">목록으로</a>
				</div>
		</div><!-- /content -->
	</div><!-- /content-wrapper -->

</div><!-- /wrapper -->

<!-- 댓글 Modal -->
<div class="modal fade " id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form method="post">
      		<input type="hidden" value="dto.productNum">
      		<textarea rows="5" cols="50" name="boardContents"></textarea>
      	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" id="commentAdd" class="btn btn-primary">댓글 등록</button>
      </div>
    </div>
  </div>
</div>
<!-- 삭제 모달 -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-labelledby="deleteModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="deleteModalLabel">정말 삭제하시겠습니까?</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">${dto.productNum}번 상품을 삭제합니다.</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<form action="./delete" method="post">
					<input type="hidden" name="productNum" value="${dto.productNum}">
					<button type="submit" class="btn btn-danger">삭제하기</button>
				</form>
			</div>
		</div>
	</div>
	
</div>

<c:import url="/WEB-INF/views/template/foot.jsp"></c:import>
<script type="text/javascript" src="/js/product/product_comment.js"></script>
</body>
</html>
