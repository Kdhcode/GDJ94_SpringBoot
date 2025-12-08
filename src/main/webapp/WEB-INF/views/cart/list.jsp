<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>
<body id="page-top">
<div id="wrapper">
  <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>
  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>

      <div class="container-fluid">
        <h1 class="h3 mb-4 text-gray-800">장바구니</h1>

        <div class="card shadow-sm">
          <div class="card-body p-3">
            <c:choose>
              <c:when test="${empty items}">
                <div class="text-muted">담긴 상품이 없습니다.</div>
              </c:when>
              
            </c:choose>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<c:import url="/WEB-INF/views/template/foot.jsp"></c:import>

</body>
</html>
