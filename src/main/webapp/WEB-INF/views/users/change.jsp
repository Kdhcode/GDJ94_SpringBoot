<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <div class="small text-muted">비밀번호 입력해 주세요.</div>
          </div>
        </div>

        <div class="row justify-content-center">
          <div class="col-12 col-lg-8 col-xl-7">

            <div class="card shadow-sm border-0 mb-4">
              <div class="card-header bg-white border-0 py-3 d-flex align-items-center justify-content-between">
                <h6 class="m-0 fw-bold text-primary">비밀번호 변경</h6>
                <span class="badge bg-light text-secondary">Form</span>
              </div>

              <div class="card-body">
                <form:form modelAttribute="user" method="post" enctype="multipart/form-data">
                  <div class="row g-3">

                   
                    <div class="col-12">
                      <label class="form-label">Password</label>
                      <input type="password" name="exist" class="form-control">
                    </div>

                    <div class="col-12 ">
                      <label class="form-label">new Password</label>
                      <form:password path="password" cssClass="form-control"/>
                      <form:errors path="password"></form:errors>
                    </div>
                    
                    <div class="col-12">
                      <label class="form-label">new Password Check</label>
                      <form:password path="passwordCheck" cssClass="form-control"/>
                      <form:errors path="passwordCheck"></form:errors>
                    </div>
					</div>
                  <hr class="my-4">

                  <div class="d-flex gap-2 justify-content-end">
                    <button type="reset" class="btn btn-outline-secondary mr-2">Reset</button>
                    <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                  </div>
                </form:form>
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
