<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>
<body id="page-top">
  <div id="wrapper">
    <!-- side bar -->
    <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>
    <!-- side bar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">

        <!-- topbar -->
        <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>
        <!-- topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid py-4">
          <!-- Page Heading -->
          <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-between gap-2 mb-4">
            <div>
              <h1 class="h3 mb-1 text-gray-800">${category} register</h1>
              <div class="small text-muted">게시글 상세</div>
            </div>
            <a href="#" class="btn btn-sm btn-primary shadow-sm">
              <i class="fas fa-download fa-sm text-white-50 me-1"></i> Generate Report
            </a>
          </div>

          <!-- Content Row -->
          <div class="row justify-content-center">
            <div class="col-12 col-lg-8 col-xl-7">

              <div class="card shadow-sm border-0 mb-4">
                <div class="card-header bg-white border-0 py-3 d-flex align-items-center justify-content-between">
                  <h6 class="m-0 fw-bold text-primary">Board Contents</h6>
                  <span class="badge bg-light text-secondary">#${dto.boardNum}</span>
                </div>

                <div class="card-body">
                  <!-- 본문 -->
                  <div class="p-3 bg-light rounded-3">
                    ${dto.boardContents}
                  </div>

                  <!-- 첨부파일 -->
                  <c:if test="${not empty dto.fileDTOs}">
                    <hr class="my-4">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                      <div class="fw-semibold">첨부파일</div>
                      <span class="badge bg-secondary">${dto.fileDTOs.size()}</span>
                    </div>

                    <div class="list-group">
                      <c:forEach items="${dto.fileDTOs}" var="file">
                        <%-- <a class="list-group-item list-group-item-action d-flex align-items-center justify-content-between"
                           href="/files/${category}/${file.fileName}">
                          <div class="d-flex align-items-center gap-2">
                            <i class="fas fa-paperclip text-muted"></i>
                            <span class="text-truncate" style="max-width: 420px;">${file.fileOrigin}</span>
                          </div>
                          <span class="badge bg-light text-secondary">download</span>
                        </a> --%>
                        <a href="./fileDown?fileNum=${file.fileNum}">${file.fileOrigin}</a>
                      </c:forEach>
                    </div>
                  </c:if>
                </div>

                <div class="card-footer bg-white border-0 d-flex flex-wrap gap-2 justify-content-end py-3">
                  <c:if test="${category ne 'notice'}">
                    <a href="./reply?boardNum=${dto.boardNum}" class="btn btn-outline-danger">
                      <i class="fas fa-reply me-1"></i> 답글
                    </a>
                  </c:if>

                  <a href="./update?boardNum=${dto.boardNum}" class="btn btn-primary">
                    <i class="fas fa-edit me-1"></i> Update
                  </a>

                  <form action="./delete" method="post" class="m-0">
                    <input type="hidden" name="boardNum" value="${dto.boardNum}">
                    <button id="del" type="submit" class="btn btn-danger">
                      <i class="fas fa-trash me-1"></i> Delete
                    </button>
                  </form>
                </div>
              </div>

            </div>
          </div>

        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2021</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->
    </div>
  </div>

  <c:import url="/WEB-INF/views/template/foot.jsp"></c:import>
</body>
</html>
