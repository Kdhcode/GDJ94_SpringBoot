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
          <h1 class="h3 mb-0 text-gray-800">myPage</h1>
        </div>

        <!-- Content Row -->
        <div class="row">
          <!-- 등록 폼 등 실제 컨텐츠 -->
          <div class="card mb-3" style="max-width: 540px;">
			  <div class="row no-gutters">
			    <div class="col-md-4">
			      <img src="..." alt="...">
			    </div>
			    <div class="col-md-8">
			      <div class="card-body">
			        <h5 class="card-title">아이디: ${dto.username}</h5>
			        <h5 class="card-title">이름: ${dto.name}</h5>
			        <h5 class="card-title">이메일: ${dto.email}</h5>
			        <h5 class="card-title">전화번호: ${dto.phone}</h5>
			        <h5 class="card-title">생일: ${dto.birth}</h5>
			        <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
			      </div>
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
