<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>Register</title>
  <%-- 반드시 head.jsp를 import: 부트스트랩/SB Admin 2 CSS 포함 --%>
  <c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>
<body id="page-top">
<div id="wrapper">

  <%-- Sidebar (fragment에는 html/body/page 지시어 없어야 함) --%>
  <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>

  <!-- Content Wrapper -->
  <div id="content-wrapper" class="d-flex flex-column">
    <!-- Main Content -->
    <div id="content">

      <%-- Topbar: 여기서 한 번만 import --%>
      <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>

      <!-- Begin Page Content -->
      <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
          <h1 class="h3 mb-0 text-gray-800">Register</h1>
        </div>

        <!-- Content Row -->
        <div class="row">
          <!-- 등록 폼 등 실제 컨텐츠 -->
          <form method="post">
			  <div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail4">username</label>
			      <input type="text" class="form-control" name="username">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputPassword4">Password</label>
			      <input type="password" class="form-control" name="password">
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputAddress">name</label>
			    <input type="text" class="form-control" name="name">
			  </div>
			  <div class="form-group">
			    <label for="inputAddress2">email</label>
			    <input type="text" class="form-control" name="email">
			  </div>
			  <div class="form-group">
			    <label for="inputAddress2">phone</label>
			    <input type="text" class="form-control" name="phone">
			  </div>
			  <div class="form-group">
			    <label for="inputAddress2">birth</label>
			    <input type="text" class="form-control" name="birth">
			  </div>
			   <div class="form-group">
			    <label for="exampleFormControlFile1">프로필 이미지</label>
			    <input type="file" class="form-control-file" name="attach">
			  </div>
			  <button type="submit" class="btn btn-primary">회원가입</button>
			</form>
        </div>
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; Your Website 2025</span>
        </div>
      </div>
    </footer>
    <!-- End of Footer -->
  </div>
</div>

<%-- 반드시 foot.jsp를 import: jQuery/Bootstrap/플러그인 스크립트 포함 --%>
<c:import url="/WEB-INF/views/template/foot.jsp"></c:import>
</body>
</html>
