<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>

<body id="page-top">
<div id="wrapper">

    <!-- Sidebar -->
    <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>

            <!-- Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="h3 mb-0 text-gray-800">QnA</h1>
                </div>

                <!-- Search -->
                <c:import url="/WEB-INF/views/template/search.jsp"></c:import>


                <!-- QnA Table -->
                <div class="row justify-content-center">
                    <div class="col-lg-10 col-md-11">
                        <table class="table table-hover table-striped mt-4">

                            <thead class="thead-dark text-center">
                                <tr>
                                    <th>Num</th>
                                    <th>Title</th>
                                    <th>Writer</th>
                                    <th>Date</th>
                                    <th>Hit</th>
                                    <th>Ref</th>
                                    <th>Step</th>
                                    <th>Depth</th>
                                </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${list}" var="dto">
                                    <tr>
                                        <td class="text-center">${dto.boardNum}</td>

                                        <!-- QnA Depth 들여쓰기 -->
                                        <td>
                                            <c:forEach begin="1" end="${dto.boardDepth}">
                                                &nbsp;&nbsp;&nbsp;└
                                            </c:forEach>

                                            <a href="./detail?boardNum=${dto.boardNum}" class="text-primary">
                                                ${dto.boardTitle}
                                            </a>
                                        </td>

                                        <td class="text-center">${dto.boardWriter}</td>
                                        <td class="text-center">${dto.boardDate}</td>
                                        <td class="text-center">${dto.boardHit}</td>
                                        <td class="text-center">${dto.boardRef}</td>
                                        <td class="text-center">${dto.boardStep}</td>
                                        <td class="text-center">${dto.boardDepth}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Pagination + Write Button -->
                <div class="row justify-content-center mt-4 mb-5">
                    <div class="col-auto">

                        <!-- Pagination -->
                        <nav>
                            <ul class="pagination justify-content-center">

                                <li class="page-item">
                                    <a class="page-link"
                                       href="./list?page=${pager.begin-1}&kind=${pager.kind}&search=${pager.search}">
                                        &laquo;
                                    </a>
                                </li>

                                <c:forEach begin="${pager.begin}" end="${pager.end}" var="i">
                                    <li class="page-item ${pager.page == i ? 'active' : ''}">
                                        <a class="page-link"
                                           href="./list?page=${i}&kind=${pager.kind}&search=${pager.search}">
                                            ${i}
                                        </a>
                                    </li>
                                </c:forEach>

                                <li class="page-item">
                                    <a class="page-link"
                                       href="./list?page=${pager.end+1}&kind=${pager.kind}&search=${pager.search}">
                                        &raquo;
                                    </a>
                                </li>
                            </ul>
                        </nav>

                        <!-- Write Button -->
                        <div class="text-center mt-3">
                            <a href="./add" class="btn btn-primary btn-sm">글쓰기</a>
                        </div>

                    </div>
                </div>

            </div>
            <!-- /container-fluid -->

        </div>
        <!-- /content -->

        <!-- Footer -->
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
