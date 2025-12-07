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
              <c:otherwise>
                <table class="table table-sm">
                  <thead>
                    <tr>
                      <th>상품번호</th><th>상품명</th><th>카테고리</th><th>금리</th><th>담은시각</th><th></th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${items}" var="i">
                      <tr>
                        <td>${i.productNum}</td>
                        <td>${i.productName}</td>
                        <td>${i.productCategory}</td>
                        <td>${i.productRate}%</td>
                        <td>${i.addedAt}</td>
                        <td>
                          <button class="btn btn-sm btn-outline-danger btn-remove" data-id="${i.productNum}">빼기</button>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<c:import url="/WEB-INF/views/template/foot.jsp"></c:import>
<script>
  document.addEventListener('click', function(e){
    var btn = e.target.closest('.btn-remove');
    if (!btn) return;
    var id = btn.getAttribute('data-id');
    if (!confirm('장바구니에서 제거할까요?')) return;

    fetch('${pageContext.request.contextPath}/cart/remove', {
      method: 'POST',
      headers: {'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'},
      body: new URLSearchParams({productNum: id})
    })
    .then(r => r.text())
    .then(t => {
      if (Number(t) > 0) location.reload();
      else alert('제거 실패');
    })
    .catch(console.error);
  });
</script>
</body>
</html>
