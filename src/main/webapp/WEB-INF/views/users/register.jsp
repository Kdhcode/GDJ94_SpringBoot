<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Register</title>
  <c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>
<body id="page-top">
<div id="wrapper">

  <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>

  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">

      <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>

      <div class="container-fluid py-4">
        <div class="d-flex flex-column flex-sm-row align-items-sm-center justify-content-between mb-4">
          <div>
            <h1 class="h3 mb-1 text-gray-800">Register</h1>
            <div class="small text-muted">회원가입 정보를 입력해 주세요.</div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-12 col-lg-8 col-xl-7">

            <div class="card shadow-sm border-0 mb-4">
              <div class="card-header bg-white border-0 py-3 d-flex align-items-center justify-content-between">
                <h6 class="m-0 fw-bold text-primary">회원가입</h6>
                <span class="badge bg-light text-secondary">Form</span>
              </div>

              <div class="card-body">
                <form method="post" enctype="multipart/form-data">
                  <div class="row g-3">

                    <div class="col-12 col-md-6">
                      <label class="form-label">Username</label>
                      <input type="text" class="form-control" name="username" placeholder="아이디" autocomplete="username">
                    </div>

                    <div class="col-12 col-md-6">
                      <label class="form-label">Password</label>
                      <input type="password" class="form-control" name="password" placeholder="비밀번호" autocomplete="new-password">
                    </div>

                    <div class="col-12">
                      <label class="form-label">Name</label>
                      <input type="text" class="form-control" name="name" placeholder="이름" autocomplete="name">
                    </div>

                    <div class="col-12 col-md-6">
                      <label class="form-label">Email</label>
                      <input type="email" class="form-control" name="email" placeholder="example@email.com" autocomplete="email">
                    </div>

                    <div class="col-12 col-md-6">
                      <label class="form-label">Phone</label>
                      <input type="text" class="form-control" name="phone" placeholder="010-0000-0000" autocomplete="tel">
                    </div>

                    <div class="col-12">
                      <label class="form-label">Birth</label>
                      <input type="text" class="form-control" name="birth" placeholder="YYYY-MM-DD" autocomplete="bday">
                      <div class="form-text">예: 1999-12-31</div>
                    </div>

                    <div class="col-12">
                      <label class="form-label">프로필 이미지</label>
                      <input type="file" class="form-control" name="attach" accept="image/*">
                      <div class="form-text">jpg, png 등 이미지 파일을 업로드하세요.</div>
                    </div>

                  </div>

                  <hr class="my-4">

                  <div class="d-flex gap-2 justify-content-end">
                    <button type="reset" class="btn btn-outline-secondary">Reset</button>
                    <button type="submit" class="btn btn-primary">회원가입</button>
                  </div>
                </form>
              </div>
            </div>

          </div>
        </div>

      </div>
    </div>

    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; Your Website 2025</span>
        </div>
      </div>
    </footer>
  </div>
</div>

<c:import url="/WEB-INF/views/template/foot.jsp"></c:import>
</body>
</html>
