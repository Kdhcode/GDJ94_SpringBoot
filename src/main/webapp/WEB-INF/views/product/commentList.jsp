<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div>
	<table class="table">
		<c:forEach items="${list}" var="v">
			<tr>
				<td class="col-2">${v.username}</td>
				<td class="col-7">${v.boardContents}</td>
				<td class="col-3">${v.boardDate}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<div class="row justify-content-between col-sm-5 offset-sm-5">
    <nav aria-label="Page navigation example">
        <ul class="pagination ">
            <li class="page-item">
                <button class="page-link" data-pager-num="${pager.page-1}">&laquo;</button>
                    
                </a>
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