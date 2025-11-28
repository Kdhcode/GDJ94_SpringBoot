<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<c:import url="/WEB-INF/views/template/head.jsp"></c:import>
</head>

<body id="page-top">
<div id="wrapper">

    <!-- Sidebar -->
    <c:import url="/WEB-INF/views/template/sidebar.jsp"></c:import>
    <!-- Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <c:import url="/WEB-INF/views/template/topbar.jsp"></c:import>
            <!-- Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h1 class="h3 mb-0 text-gray-800">
                        <a href="./list" class="text-dark text-decoration-none">공지사항</a>
                    </h1>
                    <a href="./add" class="btn btn-primary btn-sm">
                        글쓰기
                    </a>
                </div>

                <!-- Search -->
               <c:import url="/WEB-INF/views/template/search.jsp"></c:import>


                <!-- Table -->
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="card shadow-sm">
                            <div class="card-body p-0">
                                <table class="table table-hover mb-0">

                                    <thead class="thead-light">
                                        <tr>
                                            <th>Num</th>
                                            <th>Title</th>
                                            <th>Writer</th>
                                            <th>Date</th>
                                            <th>Hit</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach items="${list}" var="dto">
                                            <tr>
                                                <td>${dto.boardNum}</td>
                                                <td>
                                                    <a href="./detail?boardNum=${dto.boardNum}" class="text-primary">
                                                        ${dto.boardTitle}
                                                    </a>
                                                </td>
                                                <td>${dto.boardWriter}</td>
                                                <td>${dto.boardDate}</td>
                                                <td>${dto.boardHit}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pagination -->
                <div class="row justify-content-center mt-4">
                    <nav>
                        <ul class="pagination">

                            <li class="page-item">
                                <a class="page-link" href="./list?page=${pager.begin-1}&kind=${pager.kind}&search=${pager.search}">
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
                                <a class="page-link" href="./list?page=${pager.end+1}&kind=${pager.kind}&search=${pager.search}">
                                    &raquo;
                                </a>
                            </li>

                        </ul>
                    </nav>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

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
