<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>myPage</title>
  <c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>
<body id="page-top">
<div id="wrapper">

  <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>

  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">

      <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>

      <div class="container-fluid py-4">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800">myPage</h1>
        </div>

        <div class="row justify-content-center">
          <div class="col-12 col-md-10 col-lg-8 col-xl-7">

            <div class="card shadow-sm border-0 mb-4">
              <div class="card-header bg-white border-0 py-3">
                <h6 class="m-0 fw-bold text-primary">내 정보</h6>
              </div>

              <div class="card-body">
                <!-- Bootstrap 5: g-0 / Bootstrap 4: no-gutters (SB Admin2가 보통 BS4) -->
                <div class="row no-gutters align-items-center">
                  <div class="col-12 col-md-5 mb-3 mr-4 mb-md-0 text-center">
                    <!-- 이미지 경로는 일단 기존처럼. 나중에 dto 필드로 연결 -->
                    <img src="/files/${category}/${user.userFileDTO.fileName}" class="img-fluid rounded shadow-sm " alt="profile">
                  </div>

                  <div class="col-12 col-md-6">
                    <div class="ps-md-3">

                      <div class="d-flex justify-content-between border-bottom py-2">
                        <span class="text-muted">아이디</span>
                        <span class="fw-bold">${user.username}</span>
                      </div>

                      <div class="d-flex justify-content-between border-bottom py-2">
                        <span class="text-muted">이름</span>
                        <span class="fw-bold">${user.name}</span>
                      </div>

                      <div class="d-flex justify-content-between border-bottom py-2">
                        <span class="text-muted">이메일</span>
                        <span class="fw-bold">${user.email}</span>
                      </div>

                      <div class="d-flex justify-content-between border-bottom py-2">
                        <span class="text-muted">전화번호</span>
                        <span class="fw-bold">${user.phone}</span>
                      </div>

                      <div class="d-flex justify-content-between py-2">
                        <span class="text-muted">생일</span>
                        <span class="fw-bold">${user.birth}</span>
                      </div>

                      <div class="mt-3 d-flex gap-2 justify-content-end">
                        <a href="./update" class="btn btn-primary btn-sm mr-2">정보수정</a>
                        <a href="./change" class="btn btn-outline-secondary btn-sm">비밀번호 변경</a>
                      </div>

                    </div>
                  </div>
                </div>
              </div>

              <div class="card-footer bg-white border-0">
                <small class="text-muted">마이페이지</small>
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
