<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<c:import url="/WEB-INF/views/template/head.jsp"></c:import>
<style>
  .text-truncate-2{
    display:-webkit-box;
    -webkit-line-clamp:2;
    -webkit-box-orient:vertical;
    overflow:hidden;
  }
</style>
</head>
<body id="page-top">
<div id="wrapper">
  <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>
  <div id="content-wrapper" class="d-flex flex-column">
    <div id="content">
      <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>

      <div class="container-fluid">

        <div class="d-sm-flex align-items-center justify-content-between mb-3">
          <h1 class="h3 mb-0 text-gray-800">상품 목록</h1>
          <div>
            <a href="./add" class="btn btn-primary">상품 등록</a>
          </div>
        </div>

        <div class="card shadow mb-4">
          <div class="card-body">

            <!-- 검색 UI는 컨트롤러에서 처리하지 않아도 표시 자체는 가능 -->
            <form class="form-inline mb-3" method="get" action="./list">
              <select name="kind" class="form-control mr-2">
                <option value="k1" ${param.kind eq 'k1' ? 'selected="selected"' : ''}>상품명</option>
                <option value="k2" ${param.kind eq 'k2' ? 'selected="selected"' : ''}>카테고리</option>
                <option value="k3" ${param.kind eq 'k3' ? 'selected="selected"' : ''}>내용</option>
              </select>
              <input placeholder="검색어" type="text" name="search" class="form-control mr-2" value="${param.search}">
              <button class="btn btn-outline-primary" type="submit">검색</button>
            </form>

            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="thead-light">
                  <tr>
                    <th style="width:90px;">번호</th>
                    <th>상품명</th>
                    <th style="width:160px;">카테고리</th>
                    <th style="width:120px;" class="text-right">금리</th>
                    <th style="width:120px;">판매상태</th>
                    <th style="width:160px;">등록일</th>
                  </tr>
                </thead>
                <tbody>

                  <!-- 컨트롤러에서 List<ProductDTO>를 dto라는 이름으로 넘기므로 dto를 순회 -->
                  <c:forEach items="${dto}" var="p">
                    <tr>
                      <td class="text-muted">${p.productNum}</td>

                      <td>
                        <div class="font-weight-bold">
                          <a href="./detail?productNum=${p.productNum}">
                            ${p.productName}
                          </a>
                        </div>
                        <div class="small text-muted text-truncate-2">
                          ${p.productContents}
                        </div>
                      </td>

                      <td>${p.productCategory}</td>

                      <td class="text-right">
                        ${p.productRate}%
                      </td>

                      <td>
                        <c:choose>
                          <c:when test="${p.productSale}">
                            <span class="badge badge-success">판매중</span>
                          </c:when>
                          <c:otherwise>
                            <span class="badge badge-secondary">판매중지</span>
                          </c:otherwise>
                        </c:choose>
                      </td>

                    </tr>
                  </c:forEach>

                  <c:if test="${empty dto}">
                    <tr>
                      <td colspan="6" class="text-center text-muted py-4">등록된 상품이 없습니다.</td>
                    </tr>
                  </c:if>

                </tbody>
              </table>
            </div>

            <!-- 컨트롤러에서 pager를 안 넘기므로, 있을 때만 페이징 표시 -->
            <c:if test="${not empty pager}">
              <div class="d-flex justify-content-end">
                <nav aria-label="Page navigation">
                  <ul class="pagination mb-0">
                    <li class="page-item">
                      <a class="page-link" href="./list?page=${pager.begin-1}&kind=${param.kind}&search=${param.search}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>

                    <c:forEach begin="${pager.begin}" end="${pager.end}" var="i">
                      <li class="page-item ${i == pager.page ? 'active' : ''}">
                        <a class="page-link" href="./list?page=${i}&kind=${param.kind}&search=${param.search}">${i}</a>
                      </li>
                    </c:forEach>

                    <li class="page-item">
                      <a class="page-link" href="./list?page=${pager.end+1}&kind=${param.kind}&search=${param.search}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div>
            </c:if>

          </div>
        </div>

      </div>
    </div>

    <footer class="sticky-footer bg-white">
      <div class="container my-auto">
        <div class="copyright text-center my-auto">
          <span>Copyright &copy; Your Website 2021</span>
        </div>
      </div>
    </footer>
  </div>
</div>

<c:import url="/WEB-INF/views/template/foot.jsp"></c:import>
</body>
</html>
