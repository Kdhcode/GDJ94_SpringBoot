<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<div class="row justify-content-center">
  <div class="col-12 col-lg-10 col-xl-8">
    <table class="table">
      <c:forEach items="${list}" var="v">
        <tr>
          <td class="col-1">${v.username}</td>

          <!-- 내용은 XSS 방지용 이스케이프 -->
          <td class="col-6">${fn:escapeXml(v.boardContents)}</td>

          <td class="col-2 small text-muted">${v.boardDate}</td>

          <!-- 본인 글만 수정/삭제 노출 -->
          <c:if test="${not empty user and v.username eq user.username}">
            <td class="col-3">
              <!-- 수정/삭제 버튼에 클래스 + data-* 필수 -->
              <button type="button"
                      class="btn btn-warning btn-sm py-0 px-2 btn-edit-comment"
                      data-id="${v.boardNum}"
                      data-contents="${fn:escapeXml(v.boardContents)}">수정</button>

              <button type="button"
                      class="btn btn-danger btn-sm py-0 px-2 btn-delete-comment"
                      data-id="${v.boardNum}">삭제</button>
            </td>
          </c:if>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

<div class="row justify-content-between col-sm-5 offset-sm-5">
  <nav aria-label="Page navigation example">
    <ul class="pagination">
      <li class="page-item">
        <button class="page-link" data-pager-num="${pager.page-1}">&laquo;</button>
      </li>

      <c:forEach begin="${pager.begin}" end="${pager.end}" var="i">
        <li class="page-item ${i == pager.page ? 'active' : ''}">
          <button class="page-link" data-pager-num="${i}">${i}</button>
        </li>
      </c:forEach>

      <li class="page-item">
        <button class="page-link" data-pager-num="${pager.page+1}">&raquo;</button>
      </li>
    </ul>
  </nav>
</div>
